// Source: assignment [01], sections 1.4, 1.5 and 3.6.
// Functional file/field limits: this document, chapter 3; ambiguities: chapter 4.
#import "../template.typ": report-table, caption

= 9 Prostredia platformy a testovacie dáta

TEST využijeme počas D1–D15 na integračné a systémové kontroly, regresiu aj skoršie akceptačné overenie podľa dohody s PO. Formálne UAT prostredie je dostupné iba D13–D15 so stabilným kandidátom a anonymizovanými referenčnými dátami. TEST a UAT majú oddelené údaje aj súbory; deštruktívne a chybové testy nepatria do prebiehajúceho UAT.

Testovacia e-mailová schránka zachytí registračné, fakturačné a sťažnostné správy. Overíme správneho príjemcu, obsah a väzbu na konkrétny záznam; skutočné e-maily sa neposielajú. Faktúry, profilové fotografie a prílohy sťažností uložíme iba do oddeleného testovacieho úložiska.

== 9.1 Minimálna platformová matica

#report-table((1.35fr, 1.45fr, 3fr),
  ([Platforma], [Konfigurácia], [Plánované overenie]), (
    ([Desktop], [Windows 11, stabilný Chrome], [Hlavná konfigurácia: všetky plánované funkčné, integračné a rizikové kontroly, Q4/Q5 a UAT.]),
    ([Desktop], [Windows 11, stabilný Edge], [Prihlásenie, menu rolí, hlavné toky, formuláre, prílohy a sťahovanie; najmä odlišné správanie prehliadača.]),
    ([Mobil], [Chrome Android alebo emulácia 390 × 844 px], [Menu, čitateľnosť zoznamov, formuláre, validácie, tlačidlá a okná odpovedí vo všetkých moduloch; bez prekrytia ovládacích prvkov.]),
    ([Tablet], [Viewport 768 × 1024 px], [Rovnaký responzívny rozsah ako mobil, najmä tabuľky, navigácia a dialógy.]),
    ([Sieť], [Štandardná firemná; riadené prerušenie], [Bežná odozva a samostatné prerušenie spojenia aspoň pri odoslaní formulára a súboru; zachovanie údajov a bezpečné opakovanie.]),
  ), size: 9.2pt)
#caption(13)[Platformy a minimálny rozsah kontrol]

TA2 na D1 zaznamená presné verzie OS a prehliadačov a drží ich počas porovnávacích meraní. Emulácia je kontrolou rozloženia, nie dôkazom kompatibility so všetkými reálnymi zariadeniami. Výsledok označíme skutočne použitou konfiguráciou. Automatický update alebo nový build znamená posúdenie dopadu na platnosť výsledkov.

== 9.2 Referenčný balík a obnova

TA2 pripraví balík R1-BASE-v1: 1 správcu, 3 schválených vlastníkov a 2 neschválené registračné žiadosti; 12 bytov, z toho 4 voľné, 6 pridelených a 2 pre hraničné alebo konfliktné scenáre. Obsahuje faktúry v stavoch zaplatená, nezaplatená, zaplatená s omeškaním a očakávajúca platba; sťažnosti v stavoch Očakáva sa, Spracováva sa, Vyriešená a Zamietnutá.

Pre foto, faktúru a sťažnosť budú pripravené platné aj neplatné súbory a ich kontrolné veľkosti. Hraničné hodnoty odvodíme z potvrdených AC kapitoly 3; nejasnú jednotku MB alebo povolený formát najprv potvrdí PO. Súbory ani účty neobsahujú produkčné osobné údaje. V dátach rozlíšime odosielateľa sťažnosti od cieľového bytu „Na byt“, aby sa chyba filtra nedala prehliadnuť.

Každý záznam dostane prefix prostredia, sprintu a autora testu, napríklad TEST-S3-TA1-001. Manifest balíka eviduje identifikátory, očakávaný vlastník/byty, stavy, príjemcov a súbory; zmena obsahu vytvorí novú verziu. Heslá sa neukladajú do reportu ani do verejného repozitára.

Obnova TEST je možná na začiatku týždňa po dohode TM, TA2 a technického správcu. TA2 najprv uchová dôkazy, zoznam otvorených defektov a verziu balíka; potom overí účty, väzby a smoke. Reset sa nerobí uprostred práce iného testujúceho. Technická podpora závisí od dohodnutej dostupnosti, nepredpokladáme ďalšiu nezapočítanú FTE kapacitu.

Pred D13 TA2 pripraví samostatnú UAT kópiu, TA1 skontroluje väzby a TM potvrdí pripravenosť. UAT referenčný základ nemeníme bez záznamu dopadu; opakovanie scenára používa označenú pracovnú kópiu. Pri nedostupnosti prostredia alebo neúspešnom smoke TA2 ihneď informuje TM. Výpadok nad dve hodiny vedie k preplánovaniu a posúdeniu rizika REQ-718; kritériá kvality sa tým neznižujú.

_Zdroj požadovaných prostredí, platforiem a dát: [01], §1.4–1.5. Názvy balíkov, rozdelenie kontrol, dvojhodinový prah a postup obnovy sú organizačné pravidlá tohto plánu._
