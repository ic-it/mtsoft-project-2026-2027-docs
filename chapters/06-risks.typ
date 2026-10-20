// Source: reference/MTSOFT-original.pdf, pp. 9–11.
#import "../template.typ": report-table

= 6 Risk Register

Risk Register slúži na identifikáciu, hodnotenie a riadenie rizík, ktoré môžu ovplyvniť kvalitu aplikácie Správa bytového domu alebo úspešné dokončenie Release 1. Riziká vychádzajú z funkčnej špecifikácie aplikácie, analýzy User Stories, projektových obmedzení a identifikovaných nejasností v požiadavkách.

Všetky riziká sú evidované v systéme DTS. Celkovo Risk Register obsahuje 15 rizík, z toho 12 produktových a 3 projektové.

Na hodnotenie rizík používame pravdepodobnosť výskytu (Likelihood) a závažnosť dopadu (Impact). Obe veličiny sú hodnotené na stupnici od 1 do 5.

Celkové skóre rizika vypočítame podľa vzorca: Risk Score = Likelihood × Impact

Na základe výsledného skóre rozlišujeme tri úrovne rizika.

#report-table((0.8fr, 1fr, 2.2fr),
  ([Risk Score], [Úroveň rizika], [Význam]), (
    ([1 - 5], [Low], [Nízke riziko, postačuje základné testovanie a priebežné sledovanie.]),
    ([6 - 14], [Medium], [Stredné riziko, vyžaduje cielené testovacie scenáre a pravidelné monitorovanie.]),
    ([15 - 25], [High], [Vysoké riziko, vyžaduje prioritné riešenie, dôkladné testovanie a aktívne riadenie.]),
  ), size: 9.5pt)

== 6.1 Prehľad produktových rizík

Produktové riziká boli identifikované na základe ôsmich User Stories zahrnutých do Release 1. Zameriavajú sa predovšetkým na registráciu, autentifikáciu, ochranu osobných údajov, správu faktúr a spracovanie sťažností.

#report-table((51pt, 1fr, 48pt, 37pt, 40pt, 48pt, 65pt),
  ([ID], [Produktové riziko], [Likelihood], [Impact], [Risk Score], [Risk Level], [Vlastník]), (
    ([REQ-597], [Nesprávne zvolené číslo bytu počas registrácie], [2], [4], [8], [Medium], [Vývojový tím]),
    ([REQ-605], [Prihlásenie neschváleného alebo neregistrovaného používateľa], [2], [4], [8], [Medium], [Vývojový tím]),
    ([REQ-620], [Neoprávnený únik osobných údajov pri zlyhaní nastavenia súhlasu], [2], [5], [10], [Medium], [Vývojový tím]),
    ([REQ-622], [Nesprávne farebné označenie a stav faktúry], [2], [3], [6], [Medium], [Vývojový tím]),
    ([REQ-684], [Neoprávnené stiahnutie cudzej faktúry alebo stiahnutie poškodeného súboru], [2], [4], [8], [Medium], [Vývojový tím]),
    ([REQ-626], [Odoslanie pripomienky o nezaplatených faktúrach nesprávnemu vlastníkovi], [2], [4], [8], [Medium], [Vývojový tím]),
    ([REQ-686], [Zlyhanie pridania novej faktúry, duplicita čísla alebo nahrávanie neplatných súborov], [3], [4], [12], [Medium], [Vývojový tím]),
    ([REQ-229], [Zlyhanie nahrávania prílohy sťažnosti], [3], [3], [9], [Medium], [Vývojový tím]),
    ([REQ-228], [Nezobrazenie všetkých sťažností vybraného bytu], [3], [4], [12], [Medium], [Vývojový tím]),
    ([REQ-238], [Nesprávne uloženie, odoslanie alebo priradenie odpovede správcu], [3], [4], [12], [Medium], [Vývojový tím]),
    ([REQ-227], [Správca môže vidieť sťažnosti iného bytu], [3], [5], [15], [High], [Vývojový tím]),
    ([REQ-237], [Nie je možné upraviť alebo stiahnuť odoslanú sťažnosť], [3], [2], [6], [Medium], [Product Owner]),
  ))

#block(breakable: false)[
== 6.2 Prehľad projektových rizík

Okrem produktových rizík sme identifikovali tri projektové riziká, ktoré môžu negatívne ovplyvniť priebeh testovania a pripravenosť Release 1.

#report-table((51pt, 1fr, 48pt, 37pt, 40pt, 48pt, 65pt),
  ([ID], [Projektové riziko], [Likelihood], [Impact], [Risk Score], [Risk Level], [Vlastník]), (
    ([REQ-718], [Nedostupnosť alebo nestabilita testovacích prostredí TEST/UAT], [4], [4], [16], [High], [IT Správca]),
    ([REQ-719], [Oneskorené rozhodnutia o nejasných akceptačných kritériách], [4], [4], [16], [High], [Product Owner]),
    ([REQ-720], [Nedostatočná kapacita na retesty a regresiu pred Release 1], [4], [5], [20], [High], [Test Manager]),
  ))
]

== 6.3 Riadenie a monitorovanie rizík

Za priebežné riadenie Risk Registera zodpovedá Test Manager v spolupráci s vlastníkmi jednotlivých rizík.

Produktové riziká sú primárne priradené vývojovému tímu alebo Product Ownerovi podľa charakteru možného problému. Projektové riziká sú priradené rolám, ktoré dokážu ovplyvniť ich príčiny alebo zabezpečiť potrebné opatrenia.

Stav rizík sa pravidelne vyhodnocuje počas jednotlivých sprintov. Pri monitorovaní sledujeme najmä dostupnosť testovacích prostredí, počet blokovaných testov, otvorené otázky v požiadavkách, stav kritických defektov a dostupné kapacity testovacieho tímu.

Pri identifikácii nového rizika alebo zmene jeho úrovne Test Manager aktualizuje Risk Register a podľa potreby upraví prioritu, poradie alebo rozsah testovania.

Vysoké riziká majú prednosť pri plánovaní testovacích aktivít. Ich aktuálny stav a zostávajúce riziká vstupujú do záverečného testovacieho reportu a podporujú Go/No-Go rozhodnutie o pripravenosti Release 1.

*Link na uložený filter v DTS: #link("https://dts.fiit.bencor.sk/32")*
