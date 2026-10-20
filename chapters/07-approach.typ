// Constraints: reference/Projekt1_zadanie_pre_studentov_v2.1.docx,
// sections 1.1, 1.3, 1.5 and 3.6. Local US/risks: chapters 3, 5 and 6.
#import "../template.typ": report-table, caption

= 7 Testovací prístup

Testovanie Release 1 rozdelíme do troch Inkrementov. Rozsah zostáva podľa kapitoly 1: registrácia vrátane schválenia a zamietnutia, prístup podľa rolí, profil, faktúry a sťažnosti. Verejné stránky Home, Správy domu, Detail správy a Kontakty tvoria regresný základ. Funkcie mimo rozsahu v kapitole 1 netestujeme samostatne; ich prípadný vplyv na vybrané toky posúdi TM. Penetračné testovanie nenahrádzame bežnými negatívnymi kontrolami oprávnení.

Používame označenia US01 až US08 z kapitoly 3, nie odlišné číslovanie odporúčaného backlogu v zadaní. Výsledkom Projektu 1 je tento plán a rozsah Test Conditions. Konkrétne testovacie prípady a výsledky vykonania vzniknú až pri realizácii plánu.

== 7.1 Úrovne a typy testovania

#report-table((1.15fr, 3.5fr, 1.2fr),
  ([Úroveň], [Účel a rozsah], [Zodpovednosť]), (
    ([Komponentná], [Vývoj overí zmenené validácie, prideľovanie identity a ukladanie pred odovzdaním buildu. Neplánujeme prácu vývoja nad rámec jeho podpornej kapacity.], [Vývoj]),
    ([Integračná], [TA1 preverí väzby aplikácie na databázu, testovací e-mail a súbory: správny záznam, príjemca, obsah, uloženie a následné načítanie. Vývoj pomáha s diagnostikou.], [TA1; vývoj]),
    ([Systémová], [TA1 a TA2 overia funkcie z pohľadu rolí vrátane negatívnych vstupov, cudzieho ID a priamej adresy, kompatibility, responzívnosti, prerušenej siete a regresie.], [TA1, TA2; riadi TM]),
    ([Akceptačná], [PO posúdi vybrané obchodné toky priebežne na TEST. Formálne UAT na D13–D15 overí správca s podporou TA2; PO rozhodne o akceptácii.], [PO, zástupca správcu; TA2]),
  ), size: 9.2pt)
#caption(7)[Úrovne testovania a zodpovednosti]

Pri registrácii overíme celý tok žiadosť → rozhodnutie správcu → prihlásenie. Pri faktúrach pridanie → zobrazenie vlastníkom → zmena platby → pripomienka a stiahnutie. Pri sťažnostiach podanie s prílohou → správny zoznam → stav → odpoveď správnemu odosielateľovi → jej prečítanie. V každom toku porovnáme obe roly aj zachovanie údajov po obnovení stránky.

Na vstupy použijeme ekvivalenčné triedy a hraničné hodnoty; na roly a výbery rozhodovacie tabuľky; na registráciu, platby a sťažnosti prechody stavov podľa potvrdených pravidiel. Chybové scenáre pokryjú nedostupný súbor, prerušené odoslanie a opakovanie akcie bez nechcených duplicít. Nejasné očakávané výsledky z kapitoly 4 najprv potvrdí PO, nevymýšľame ich pri vykonaní.

Responzívnosť a kompatibilitu overíme podľa kapitoly 9. Použiteľnosť Q4 a základnú odozvu Q5 meriame podľa kapitoly 11; nejde o záťažové ani penetračné testovanie. Komponentné opravy, integračné a systémové kontroly sa môžu prekrývať na rôznych pripravených častiach. Akceptácia na TEST začne po úspešnom systémovom overení príslušného toku, aj keď systémové testovanie iných tokov ešte pokračuje.

== 7.2 Riziko určuje hĺbku a poradie

Skóre L × I a úrovne Low, Medium a High preberáme z kapitoly 6. Pri návrhu konkrétnych testov použijeme nasledujúce pravidlo. Priorita testu bude aspoň taká vysoká ako priorita jeho Story v kapitole 5; vysoké riziko alebo ochrana pred neoprávneným prístupom ju môžu zvýšiť. Priorita Story a priorita testu preto nie sú totožné.

#report-table((1fr, 1.35fr, 3.5fr),
  ([Riziko], [Priorita testu], [Hĺbka a regresia]), (
    ([High 15–25], [P0], [Pozitívne aj negatívne vetvy, relevantné hranice, stavy, identity a obnova po chybe. Po zmene zopakovať dotknutý tok aj kontroly oddelenia údajov.]),
    ([Medium 6–14], [Najmenej P1], [Základný tok, relevantné neplatné triedy, hranice a integračné väzby. Regresia zmenenej funkcie a jej odberateľov.]),
    ([Low 1–5], [Najmenej P2], [Reprezentatívny tok a najdôležitejšia negatívna kontrola. Regresia pri zmene alebo zistenej závislosti.]),
  ), size: 9.2pt)
#caption(8)[Pravidlo priority konkrétnych testov podľa rizika]

Priame porušenie oprávnení alebo únik osobných údajov má P0 aj pri Medium skóre. Pri rovnakej priorite idú najprv vyššie skóre, potom závislosti a zmenené funkcie. Blokovaný test neobchádzame označením za úspešný: vykonáme pripravené nezávislé testy a eskalujeme príčinu.

Napríklad US08 zostáva v Traceability P2, ale kontrolu rizika REQ-227 (15, High) vykonáme ako P0 ako prvú kontrolu filtrácie po dostupnosti modulu na D11. Návrh tejto kontroly začne už v Sprinte 1. Pri REQ-686 (12) použijeme hranice súboru a duplicitu čísla faktúry; P0 zdedíme z US05. REQ-229 (9) vedie k P1 testom príloh napriek P2 pri US06. Tieto pravidlá nemenia pôvodné hodnoty matice ani záznamy v DTS.

Po každom builde vykonáme smoke: prihlásenie oboch rolí, základné menu a otvorenie dostupných zoznamov. Po oprave nasleduje retest defektu a dopadová regresia. Na konci sprintu overíme aj predchádzajúce Inkrementy; pred Release 1 všetky plánované P0/P1 testy a vybrané end-to-end toky. Zníženie rozsahu P2 musí mať dôvod, vlastníka zostávajúceho rizika a súhlas PO.

_Zdroj: [01], §1.1, §1.3 a §3.6. Výber techník a pravidlo priority testov sú plánovacími rozhodnutiami tímu; hodnotenia rizík a priority Stories vychádzajú z kapitol 5–6._
