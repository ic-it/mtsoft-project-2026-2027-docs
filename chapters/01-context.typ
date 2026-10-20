// Source: reference/MTSOFT-original.pdf, p. 3. Preserve content, not old line breaks.
#import "../template.typ": report-table, caption

= 1 Kontext projektu a kvalitatívne ciele

Aplikácia Správa bytového domu umožňuje vlastníkom a správcovi jednoducho riešiť a vybavovať bežné záležitosti týkajúce sa bytového domu elektronicky. Prvý release zahŕňa registráciu a prístup do systému, správu profilu, faktúry a vybavovanie sťažností. Naším cieľom je pripraviť testovanie tak, aby sme pred nasadením vedeli posúdiť správnosť hlavných funkcií, ochranu údajov a spoľahlivú komunikáciu.

Overovať budeme celý priebeh od registrácie a rozhodnutia správcu až po využívanie aplikácie schváleným vlastníkom. Pri sťažnostiach sledujeme podanie, jej zobrazenie, zmenu stavu a odpoveď správcu. Do registrácie zahrnieme verejné stránky: Home, Správy domu, Detail správy a Kontakty.

Mimo rozsahu sú kamery, parkovanie, prenájom skladov, neplatiči, hlasovania ani zobrazovanie a úprava výsledkov schôdzí. Plán nezahŕňa ani penetračné testovanie, monitorovanie produkčného prostredia a prenos údajov z predchádzajúceho systému.

== 1.2 Stakeholderi a ich očakávania

#report-table((1.15fr, 1.15fr, 4fr),
  ([Stakeholderi], [Vplyv / záujem], [Očakávanie]), (
    ([*Vlastník bytu*], [stredný / vysoký], [Faktúry a sťažnosti vlastníka sa zobrazujú správne, odpovede sú dostupné a zdieľanie údajov prebieha na základe udeleného súhlasu.]),
    ([*Správca*], [vysoký / vysoký], [Registrácie, platby a sťažnosti sú správne priradené k jednotlivým bytom a všetky úkony sa vykonávajú nad príslušnými záznamami.]),
    ([*Product Owner*], [vysoký / vysoký], [Release zahŕňa všetky dohodnuté procesy, pričom nevyriešené pravidlá a zostávajúce riziká majú stanovený spôsob riešenia.]),
    ([*Vývojoví tím*], [vysoký / vysoký], [Požiadavky sú jasne definované, chyby je možné opakovane vyvolať a jednotlivé verzie aplikácie aj ich závislosti sú známe.]),
    ([*Testovací tím*], [stredný / vysoký], [Stabilné testovacie prostredie, kontrolované údaje a jasne stanovené očakávané výsledky umožňujú spoľahlivé vyhodnotenie testovania.]),
    ([*IT Správca*], [vysoký / vysoký], [Oddelené prostredia, riadený prístup, možnosť obnovy a evidencia verzií zabezpečujú bezpečné nasadenie aplikácie.]),
  ))
#caption(1)[Prehľad stakeholderov, ich vplyvu, záujmu a očakávaní]

== 1.3 Merateľné ciele a kvality

#report-table((1.7fr, 1.7fr, 1.9fr),
  ([Cieľ a ukazovateľ], [Cieľová hodnota], [Meranie a termín]), (
    ([*Q1 Správnosť hlavných tokov*], [100 % naplánovaných P0/P1 testov je vykonaných a úspešných.], [Výsledky testov konkrétneho buildu; na konci každého sprintu a Sprintu 3.]),
    ([*Q2 Ochrana údajov*], [Žiadny úspešný neoprávnený prístup ani akcia v plánovaných negatívnych testoch.], [Kontrola rolí, cudzích ID a priamych adries; po zmene oprávnení a na konci Sprintu 3.]),
    ([*Q3 Zachovanie údajov a príjemcu*], [Všetky kontrolované záznamy, prílohy a odpovede sú v súlade s referenčnými údajmi.], [Porovnanie záznamov, príloh a správ; na konci Sprintov 2 a 3.]),
    ([*Q4 Použiteľnosť (usability)*], [Tri vybrané úlohy sa dajú dokončiť bez pomoci, každá do 120 sekúnd.], [Podanie a vybavenie sťažnosti vrátane odpovede; počas UAT v Sprinte 3. .]),
    ([*Q5 Odozva zoznamov*], [95 % meraní otvorenia zoznamu faktúr a sťažností nepresiahne 3 sekundy.], [30 meraní načítania každého zoznamu v troch reláciách; počas Sprintu 3 pred UAT.]),
  ))
#caption(2)[Prehľad merateľných cieľov kvality, cieľových hodnôt a spôsobov ich overenia]

Stanovené hodnoty Q4 a Q5 sú predbežne navrhnuté a pred samotným testovaním ich musí schváliť Product Owner. Kvalitný produkt zabezpečuje správne fungovanie kľúčových procesov, ochranu údajov, spoľahlivé uchovávanie dát a záznamov a jednoduché vykonávanie bežných úloh. Pripravenosť na release dokladajú merania a kritériá v kapitole 11.
