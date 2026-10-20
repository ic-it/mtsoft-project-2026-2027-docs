"""Read-only fidelity checks. Does not generate or modify Typst/PDF content.

The retained PDF is the user's fixed reference, not an authoring input.
Requires pdfplumber and pypdf; neither is needed for ordinary Typst builds.
"""
from collections import Counter
from hashlib import sha256
from pathlib import Path
import re
import unicodedata

import pdfplumber
from pypdf import PdfReader

ROOT = Path(__file__).resolve().parent
SOURCE = ROOT / "reference/MTSOFT-original.pdf"
OUTPUT = ROOT / "MTSOFT.pdf"
SOURCE_HASH = "c578af15b8906f68d33d23af699412a472a9c02720f1869fb13ec4b6b3bbfded"


def compact(value):
    return re.sub(r"\s+", "", value or "")


def canonical(rows):
    """Fill only actual merged-cell continuations, preserving row relationships."""
    result = []
    for row in rows:
        result.append([
            compact(value) if value is not None else result[-1][column]
            for column, value in enumerate(row)
        ])
    return result


def body_text(pdf, source):
    parts = []
    for index, page in enumerate(pdf.pages):
        if index == 1:  # The regenerated TOC intentionally has current page values.
            continue
        crop = (0, 60 if source else 50, page.width, page.height if source else 795)
        parts.append(page.crop(crop).extract_text(layout=False))
    return unicodedata.normalize("NFKC", " ".join(parts))


def main():
    assert sha256(SOURCE.read_bytes()).hexdigest() == SOURCE_HASH, "Reference changed"
    with pdfplumber.open(SOURCE) as source, pdfplumber.open(OUTPUT) as target:
        assert len(source.pages) == len(target.pages) == 12
        st = {i + 1: [t.extract() for t in p.find_tables()] for i, p in enumerate(source.pages)}
        tt = {i + 1: [t.extract() for t in p.find_tables()] for i, p in enumerate(target.pages)}

        # Source table fragments are joined only across their original page break.
        trace = [row[:] for row in st[8][0]]
        trace[-1] = [(a or "") + (b or "") for a, b in zip(trace[-1], st[9][0][0])]
        trace += st[9][0][1:]
        cases = (
            ("Stakeholders", st[3][0], tt[3][0]),
            ("Quality goals", st[3][1], tt[3][1]),
            ("RACI", st[4][0], tt[4][0]),
            ("Capacity", st[4][1], tt[4][1]),
            ("Stories and all AC", st[5][0] + st[6][0], tt[5][0] + tt[6][0][1:]),
            ("Requirements quality", st[6][1] + st[7][0], tt[7][0]),
            ("Traceability with merged relationships", trace, tt[9][0]),
            ("Risk scoring", st[9][1], tt[10][0]),
            ("12 product risks", st[10][0], tt[10][1]),
            ("3 project risks", st[10][1], tt[11][0]),
        )
        cells = 0
        for name, before, after in cases:
            assert canonical(before) == canonical(after), f"Table differs: {name}"
            cells += sum(len(row) for row in before)
            print(f"PASS {name}")
        assert cells == 414

        original, rendered = body_text(source, True), body_text(target, False)
        patterns = (
            r"\d+(?:[.,/]\d+)*", r"REQ-\d+", r"US\d+", r"Story-\d+",
            r"TC\d+", r"P[012]", r"\d+\s*%", r"\d+,\d+\s*FTE",
        )
        for pattern in patterns:
            values = [Counter(re.sub(r"\s+", " ", v) for v in re.findall(pattern, t))
                      for t in (original, rendered)]
            assert values[0] == values[1], f"Values differ: {pattern}"

        words = [Counter(re.findall(r"[^\W\d_]+", t)) for t in (original, rendered)]
        # The original visibly breaks these words inside narrow cells/headings.
        words[0].subtract({"Likeli": 1, "hood": 1, "Impa": 1, "ct": 1,
                           "Likeliho": 1, "od": 1, "ri": 1, "zík": 1})
        words[0].update({"Likelihood": 2, "Impact": 1, "rizík": 1})
        # New layout repeats this table header on the continuation page.
        words[1].subtract(Counter(
            "Používateľský príbeh Prehľad akceptačných kritérií Podmienky overenia".split()))
        assert not (words[0] - words[1]), f"Missing words: {words[0] - words[1]}"
        assert not (words[1] - words[0]), f"Extra words: {words[1] - words[0]}"
        assert sum(words[0].values()) == 3509

        # Coordinates are checked for overflow, not used to author the document.
        for index, page in enumerate(target.pages):
            for char in page.chars:
                assert 0 <= char["x0"] <= char["x1"] <= page.width + 0.1, (
                    f"Horizontal overflow on page {index + 1}: {char['text']}"
                )
                assert 0 <= char["top"] <= char["bottom"] <= page.height + 0.1
                assert char["text"] != "\ufffd", f"Missing glyph on page {index + 1}"

    def uris(path):
        links = set()
        for page in PdfReader(path).pages:
            for ref in page.get("/Annots", []):
                uri = ref.get_object().get("/A", {}).get("/URI")
                if uri:
                    links.add(uri)
        return links

    assert uris(SOURCE) <= uris(OUTPUT), "An original hyperlink was lost"
    assert "https://dts.fiit.bencor.sk/32" in uris(OUTPUT)
    print("PASS unchanged reference, 12 pages, 414 table-cell positions, 3509 words")
    print("PASS all numbers, IDs, priorities, percentages, FTE, links and page bounds")


if __name__ == "__main__":
    main()
