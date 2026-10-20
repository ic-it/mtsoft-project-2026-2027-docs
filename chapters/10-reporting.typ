// Source: assignment [01], sections 1.5 and 3.6; document chapters 2, 5 and 6.
#import "../template.typ": report-table, caption

= 10 Monitoring reporting a defekty

TA1 a TA2 pri realizácii vedú register vykonania: ID kontroly a väzbu na Test Condition, AC a riziko, prioritu, build, prostredie, dáta, výsledok a dôkaz. Pre daný report má každá plánovaná kontrola práve jeden aktuálny stav Passed, Failed, Blocked alebo Not Run. Opakovania zachováme v histórii, nepočítame ich ako nové testy. Výsledky staršieho buildu prevezmeme len po zdokumentovanom posúdení dopadu TM; inak čakajú na nové overenie.

Nasledujúce metriky sú definíciou budúceho reportovania, nie tvrdením, že testy už prebehli. Rozsah a menovatele sa určia pri plánovaní sprintu. Zmeny rozsahu evidujeme s dôvodom, aby sa ukazovatele nezlepšovali len odstraňovaním neúspešných testov. Pri nulovom menovateli uvádzame N/A a dôvod, nie 100 %.

== 10.1 Ukazovatele a rozhodnutia

#report-table((1fr, 2.5fr, 2.45fr),
  ([Ukazovateľ], [Výpočet a zdroj], [Kedy komu a na čo]), (
    ([Pripravenosť], [Počet pripravených plánovaných kontrol / všetky plánované kontroly × 100 %. Pripravenosť znamená potvrdený očakávaný výsledok, dáta, build a prostredie. Zdroj: kontrolný zoznam entry a register.], [Denne TM a TA: odstrániť prekážku alebo zmeniť poradie. Pred UAT TM a PO: 100 % vybraného UAT rozsahu pripravených.]),
    ([Vykonanie], [(Passed + Failed) / všetky plánované kontroly × 100 %. Samostatne podľa priority a sprintu. Zdroj: register vykonania.], [Denne TM, vývoj, PO: porovnať zostávajúci odhad s kapacitou. Na D5/D10/D15: stav Inkrementu.]),
    ([Pass rate], [Passed / (Passed + Failed) × 100 %. Blocked a Not Run sa nezapočítajú, ale vykazujú sa vedľa. Zdroj: platné aktuálne výsledky.], [Denne TM; v sprint reporte PO: odlíšiť úspešnosť od množstva práce. Q1 vyžaduje aj 100 % vykonanie P0/P1, nielen vysoký pass rate.]),
    ([Blokované], [Počet Blocked a Blocked / všetky plánované kontroly × 100 %; príčina, vlastník a vek blokácie. Zdroj: register + DTS.], [Ihneď pri P0; inak denne TM a vývoj: odblokovať závislosť. Nejasné pravidlo dlhšie než pracovný deň eskalovať PO podľa REQ-719.]),
    ([Defekty], [Počet otvorených podľa Critical/High/Medium/Low, vek, opätovne otvorené a čakajúce na retest. Zdroj: DTS a väzby na kontroly.], [Denne triage; Critical/High ihneď TM a vývoj. Na D15 PO: povinné 0 otvorených Critical a 0 High.]),
    ([Pokrytie AC], [Plánované: jedinečné AC prepojené na overujúce podmienky / relevantné AC × 100 %. Vykonané: jedinečné AC s vykonanou kontrolou / rovnaký základ × 100 %. Zdroj: AC baseline, matica a register; vždy aj počty.], [D1/D6/D11 a pri zmene TA1 → TM a PO: nájsť medzery. V sprint reporte odlíšiť plán od vykonania a úspechu.]),
    ([Top riziká a kapacita], [Aktuálne L × I, stav opatrenia, dôkazy a zostávajúce riziko; odhad retestov/regresie oproti zostávajúcej MD kapacite vrátane rezervy. Zdroj: Risk Register a plán práce.], [Denne TM s vlastníkmi; na D5/D10/D15 PO: riadiť REQ-227, REQ-718/719/720 a rozhodnúť o zásahu alebo No-Go.]),
  ), size: 9pt)
#caption(14)[Metriky ich zdroje a rozhodovacie použitie]

Plánované percentá v kapitole 5 neoznačujú vykonané ani úspešné testy a nie sú automaticky úplným pokrytím Story. TA1 pri stanovení baseline preverí väzby na jedinečné AC, odstráni dvojité započítanie a zdokumentuje nepokryté AC pre rozhodnutie PO. Identifikátory a hodnoty existujúcej matice sa týmto plánom spätne neprepisujú.

TM pošle na konci každého dňa krátky stav cez tímový kanál PO, vývoju a analytikom: build, rozsah a jeho zmeny, uvedené metriky, blokácie, top riziká, využitie rezervy a nasledujúci krok. Sprint report vydá na D5, D10 a D15. Záverečný D15 report doplní vyhodnotenie všetkých release kritérií, zostávajúce chyby a riziká, UAT rozhodnutie a odôvodnené odporúčanie Go/No-Go.

== 10.2 Životný cyklus defektu

Defekt v DTS obsahuje názov, kroky, očakávaný a skutočný výsledok, build, prostredie, závažnosť, prioritu, prílohu a väzbu na požiadavku alebo test. Závažnosť vyjadruje dopad; priorita poradie opravy. Zníženie priority nesmie skryť Critical alebo High pred release gate.

Použijeme pracovný tok nahlásený → posúdený → pridelený → opravený/čaká na retest → uzavretý; neúspešný retest znamená opätovné otvorenie. Ide o procesné stavy, ktoré priradíme existujúcim možnostiam DTS, nie o požiadavku meniť jeho konfiguráciu. Odloženie alebo zamietnutie musí mať dôvod a rozhodujúcu rolu. Vývoj neuzatvára opravu namiesto nezávislého retestu analytikom.

Blokujúci problém aj Critical/High hlásime bezodkladne TM a vývoju cez chat s odkazom do DTS; reakčné lehoty platia podľa kapitoly 2. Ostatné prípady rieši denný 15-minútový triage. TM koordinuje, vývoj odhaduje opravu, PO rozhoduje o obchodnom dopade a zmene rozsahu. Po oprave analytik zopakuje pôvodný problém a dopadovú regresiu na označenom builde a priloží dôkaz.

_Zdroj povinných polí a riadenia defektov: [01], §1.5; požadovaných oblastí monitoringu: §3.6. Vzorce, stavy registra a forma reportu sú návrhom realizácie tímu._
