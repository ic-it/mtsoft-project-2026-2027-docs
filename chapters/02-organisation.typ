// Source: reference/MTSOFT-original.pdf, pp. 4–5.
#import "../template.typ": report-table, caption

= 2 Organizácia kapacity a komunikácia

Celé testovanie riadi Test Manager (TM), Test Analyst 1 (TA1) sa sústreďuje hlavne na analýzu požiadaviek, návrh a overenie spolupráce jednotlivých komponentov. Test Analyst 2 (TA2) pripravuje dáta, vykonáva testy a zabezpečuje regresné testovanie. Analytici si návrhy navzájom kontrolujú, aby očakávané výsledky vedel správne posúdiť aj niekto iný než autor testu. Vývoj (V) zabezpečuje testovanie jednotlivých častí aplikácie, opravy a buildy. Product Owner (PO) rozhoduje o požiadavkách a prioritách, potvrdzuje navrhované pravidlá a rozhoduje o pripravenosti vydania na nasadenie. Zástupca správcu počas používateľského akceptačného testovania (UAT) overuje, či kľúčové administrátorské funkcie spĺňajú potreby správcu v praxi.

== 2.1 Rozdelenie zodpovedností

Legenda matica RACI: R = vykonávateľ, A = zodpovedná / schvaľujúca rola, C = konzultovaná rola, I =´informatívna rola. Každá činnosť má práve jednu rolu A.

#report-table((2.7fr, 0.65fr, 0.65fr, 0.65fr, 0.65fr, 0.65fr, 0.65fr),
  ([Činnosť], [TM], [TA1], [TA2], [V], [PO], [UAT]), (
    ([Plánovanie a kapacity], [A/R], [C], [C], [C], [C], [I]),
    ([Analýza a návrh testov], [A], [R], [C], [C], [C], [C]),
    ([Príprava dát a obnova TEST], [A], [C], [R], [C], [I], [I]),
    ([Systémové testy a regresia], [A], [R], [R], [C], [I], [I]),
    ([Evidencia a triage defektov], [A], [R], [R], [R], [C], [I]),
    ([Opravy a komponentné testy], [C], [C], [I], [A/R], [I], [I]),
    ([Retesty a zaznamenanie dôkazov], [A], [R], [R], [C], [I], [I]),
    ([UAT a akceptácia], [C], [C], [R], [C], [A], [R]),
    ([Reporting a odporúčania releasu], [A/R], [C], [C], [C], [C], [C]),
    ([Rozhodnutie Go/No-Go], [R], [C], [C], [C], [A], [C]),
  ))
#caption(3)[Rozdelenie zodpovedností jednotlivých rolí podľa RACI matice]

== 2.2 Dostupné kapacity

Zvolené kapacity vychádzajú z limitov zadania. FTE označuje podiel pracovného času dostupného pre projekt, 1,0 FTE predstavuje plnú kapacitu jednej osoby.

#report-table((1.3fr, 1.7fr, 2fr),
  ([Rola], [Dostupnosť], [Plánované využitie]), (
    ([*Test Manager*], [0,3 FTE počas všetkých troch sprintov], [Plánovanie, riadenie rizík, monitoring, koordinácia a reporting.]),
    ([*Test Analyst 1*], [1,0 FTE počas všetkých troch sprintov], [Analýza požiadaviek, návrh testov, funkčné a integračné testovanie.]),
    ([*Test Analyst 2*], [1,0 FTE počas všetkých troch sprintov], [Príprava dát, vykonanie testov, regresia a evidencia defektov.]),
    ([*Vývojový tím*], [Spolu 0,3 FTE na podporu testovania], [Analýza a oprava defektov, príprava buildov a technické konzultácie.]),
    ([*Product Owner*], [0,1 FTE počas všetkých troch sprintov], [Rozhodovanie o požiadavkách, prioritách a potvrdenie navrhovaných pravidiel.]),
    ([*Zástupca správcu pre UAT*], [0,1 FTE počas Sprintu 3], [Akceptačné overenie kľúčových administrátorských funkcií.]),
  ))
#caption(4)[Prehľad dostupných kapacít a plánovaného využitia jednotlivých rolí]

#pagebreak(weak: true)
== 2.3 Komunikácia a eskalácia

Závažný problém sa hneď zapíše do DTS a cez tímový chat sa o ňom informuje Test Manager a vývojový tím. Správa obsahuje ID záznamu, verziu aplikácie, prostredie, opis problému, jeho dopad a kroky na zopakovanie. Počas pracovného času očakávame potvrdenie prijatia do 30 minút a dohodnutie ďalšieho postupu do dvoch hodín.

Ostatné defekty vyhodnocujeme na dennom 15-minútovom stretnutí, kde určíme ich prioritu a zodpovednosť za riešenie. TA2 priebežne zaznamenáva výsledky do DTS a Test Manager na konci každého pracovného dňa stručne informuje Product Ownera, vývojový a testovací tím o aktuálnom stave.

Nejasné požiadavky predkladáme Product Ownerovi s očakávanou odpoveďou do nasledujúceho pracovného dňa. Ak oneskorenie bráni testovaniu, Test Manager upraví poradie úloh a posúdi riziko. Schválené zmeny sa následne zapracujú do matice pokrytia, odhadov a časového plánu.
