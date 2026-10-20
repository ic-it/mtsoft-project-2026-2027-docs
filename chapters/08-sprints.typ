// Source constraints: assignment [01], sections 1.2, 1.3 and 3.6.
// Allocation, estimates and reserve are team planning decisions, not FS facts.
#import "../template.typ": report-table, caption
#import "../data/capacity.typ": budget, activities, uat-days, md, sum

= 8 Sprinty harmonogram a kapacity

Plán má 15 pracovných dní: Sprint 1 = D1–D5, Sprint 2 = D6–D10 a Sprint 3 = D11–D15. Ide o modelový harmonogram, nie o tri produkčné vydania. Jeden Release 1 posúdime na konci D15. Označenie MD predstavuje osobodeň; na účely odhadov používame 1 MD = 8 hodín. Dostupnosť počítame ako FTE × počet pracovných dní.

== 8.1 Rozdelenie funkcionality a závislosti

- *Sprint 1:* US01 registrácia a rozhodnutie správcu, US02 prístup podľa rolí, verejné stránky. Prístup a identity sú predpokladom ostatných tokov a Stories majú P0/P1. Súčasne analyzujeme hranice zdieľania profilu a High-riziko REQ-227, aby ich pravidlá nečakali na posledný sprint. Míľnik D5: vyhodnotený Inkrement 1.
- *Sprint 2:* US04 a US05 faktúry, US03 profil a súhlas so zdieľaním; regresia registrácie a rolí. Faktúry majú P0 a závisia od účtu, bytu a oprávnení. Profil doplníme aj napriek P2, pretože jeho zdieľanie ovplyvňuje odkazy pri sťažnostiach. Míľnik D10: vyhodnotený Inkrement 2 a potvrdený rozsah UAT.
- *Sprint 3:* US06–US08 sťažnosti, úplné dohodnuté toky Release 1, riziková regresia a UAT. D11 začíname kontrolou REQ-227, aby zostal čas na opravu a retest. D12: posúdenie kandidáta a pripravenosti UAT. D13–D15: formálne UAT. D15: záverečný report a Go/No-Go.

Závislosti sú účet a rozhodnutie správcu → prihlásenie → príslušný byt → faktúry alebo sťažnosti; odpoveď závisí od existujúceho podania a správneho príjemcu. Nepripravený tok nepresunieme do UAT bez vstupnej kontroly. Ak oprava nezapadne do kapacity alebo termínu, TM eskaluje dopad PO a navrhne presun rozsahu alebo No-Go, nie predĺženie dostupnosti UAT.

== 8.2 Testovací proces v každom sprinte

#report-table((1.8fr, 1fr, 1fr, 1.35fr),
  ([Aktivita], [Sprint 1], [Sprint 2], [Sprint 3]), (
    ([Plánovanie, analýza a návrh], [D1–D3], [D6–D8], [D11–D12]),
    ([Príprava dát a implementácia testov], [D1–D3], [D6–D8], [D11–D12]),
    ([Systémové testovanie], [D2–D5], [D7–D10], [D11–D15]),
    ([Akceptačné overenie], [D3–D5 na TEST], [D8–D10 na TEST], [D12 na TEST; D13–D15 UAT]),
    ([Retesty a regresia], [D3–D5], [D8–D10], [D12–D15]),
    ([Monitoring a riadenie], [D1–D5], [D6–D10], [D11–D15]),
    ([Vyhodnotenie a sprint report], [D5], [D10], [D15 + release report]),
  ), size: 9.2pt)
#caption(9)[Prekrytie aktivít v troch sprintoch]

Okná sa prekrývajú, ale nejde o súbežné pridelenie celej kapacity tým istým ľuďom. TA1 vedie analýzu a integračné overenie, TA2 dáta, vykonávanie a regresiu; návrhy si kontrolujú navzájom. Plánovanie aj úpravy testov pokračujú priebežne podľa zistení. V UAT okne TA2 podporuje správcu, zatiaľ čo TA1 vykonáva nezávislé retesty a regresiu na TEST.

Východiskový build je na TEST na D1, D6 a D11. Nový bežný build možno nasadiť najviac raz denne do 10:00; potom TA2 overí smoke a zaznamená verziu. Kritická oprava mimo okna vyžaduje dohodu TM a vývoja. UAT používa stabilného kandidáta. Jeho výmena vyžaduje nový smoke, posúdenie dopadu a zopakovanie dotknutých akceptačných kontrol, nie tiché prevzatie starých výsledkov.

== 8.3 Rozpočet rolí a rezerva

V bunkách je plánovaná práca + rezerva v MD. Rezerva je súčasťou dostupnosti, nie dodatočná kapacita. Vývoj má 0,3 FTE spolu, nie na každého vývojára.

#report-table((1.5fr, 0.5fr, 1fr, 1fr, 1fr, 1.35fr),
  ([Rola], [FTE], [S1 práca + rez.], [S2 práca + rez.], [S3 práca + rez.], [Spolu práca + rez.]),
  budget.map(r => (
    r.role, [#md(r.fte)],
    [#md(r.work.at(0)) + #md(r.reserve.at(0))],
    [#md(r.work.at(1)) + #md(r.reserve.at(1))],
    [#md(r.work.at(2)) + #md(r.reserve.at(2))],
    [#md(sum(r.work)) + #md(sum(r.reserve)) = #md(r.fte * r.days)],
  )), size: 9pt)
#caption(10)[Kapacity rolí vrátane rezervy]

TM rozdelí svojich 4,05 MD práce medzi plánovanie a kontrolu kapacít, triage, riziká a reporty. Vývoj použije 4,05 MD na diagnostiku, opravy, komponentné kontroly a buildy. PO má 1,35 MD na triage, potvrdenie pravidiel, priebežnú akceptáciu a rozhodnutie. Rovnomerný denný rozpočet práce je pre TM a vývoj 0,27 MD, pre PO 0,09 MD; zvyšok ich denného limitu tvorí rezerva. Tieto malé kapacity nepovažujeme za plnohodnotný vývojový tím.

#report-table((2.3fr, 0.7fr, 0.7fr, 0.7fr, 0.7fr, 0.7fr, 0.7fr),
  ([Činnosť v MD], [TA1 S1], [TA2 S1], [TA1 S2], [TA2 S2], [TA1 S3], [TA2 S3]),
  activities.map(a => (a.name, ..a.values.map(v => [#md(v)]))) + (
    ([*Práca spolu*], ..range(6).map(i => [*#md(sum(activities.map(a => a.values.at(i))))*])),
    ([Rezerva], ..range(6).map(_ => [0,5])),
    ([*Dostupnosť spolu*], ..range(6).map(_ => [*5*])),
  ), size: 9pt)
#caption(11)[Rozdelenie práce analytikov bez dvojitého započítania]

Analytici majú spolu 27 MD plánovanej práce a 3 MD rezervy. Denný limit každého je 0,9 MD plánovanej práce + 0,1 MD rezervy. Denný 15-minútový triage stojí každého účastníka 0,03125 MD, teda 0,15625 MD za sprint; je už započítaný do práce TA1, TA2, TM, vývoja a PO. Správca sa ho pravidelne nezúčastňuje. Reporting, príprava UAT, Q4/Q5 aj evidencia výsledkov sú zahrnuté v uvedených činnostiach.

Kapacita zástupcu správcu je len 0,5 MD v treťom týždni. Rozdelíme ju takto; príprava na D11–D12 prebehne na TEST alebo nad scenármi, nie v ešte nedostupnom UAT prostredí.

#report-table((1fr, 1.6fr, 1.6fr, 1fr),
  ([Deň], [Príprava MD], [Formálne UAT MD], [Rezerva MD]),
  uat-days.map(d => ([D#d.day], [#md(d.preparation)], [#md(d.execution)], [#md(d.reserve)])),
  size: 9.2pt)
#caption(12)[Denná dostupnosť zástupcu správcu]

TM uvoľní rezervu len na pomenovaný problém a priebežne prepočíta zostávajúci odhad. Ak plánované retesty a regresia prekročia dostupný zostatok, rieši REQ-720 ešte pred D13. Rezervu správcu z D11 nemožno preniesť ako dodatočný čas nad jeho limit 0,1 MD v dňoch UAT. Úspech nemožno nahradiť neplánovaným nadčasom ani znížením release gate.

_Zdroj limitov: [01], §1.2–1.3 a §3.6. Rozdelenie Stories, aktivít, rezervy a jednotka MD sú odhadom tímu. Súčty kapacít, rozdelenie práce TA a denné limity správcu sa kontrolujú pri kompilácii._
