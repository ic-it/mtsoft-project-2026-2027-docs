// Source: reference/MTSOFT-original.pdf, pp. 8–9.
// Original IDs, percentages, priorities and vertical relationships are intentional.
#import "../template.typ": report-matrix, matrix-cell

= 5 Traceability

Traceability matica predstavuje prepojenie User Stories na produktové riziká a testovacie podmienky, ktoré vyplynuli z akceptačných kritérií. Rozhodli sme sa, že registrácia a prihlásenie sú kľúčovou funkcionalitou, preto majú vysokú prioritu (P0/P1). Modul faktúr priamo vplýva na platby a financie, preto ho taktiež považujeme za kritický (P0). Naopak, modul sťažností vnímame ako sekundárny, keďže nie je priamo spojený s financiami, a preto má prioritu P2. Pokrytie sme vypočítali tak, že sme zrátali, koľko akceptačných kritérií pokrýva daný test (alebo testy dohromady) zo všetkých kritérií rozpísaných v danej User Story.

#report-matrix((1.65fr, 1.75fr, 2.1fr, 0.65fr, 1fr),
  ([User story], [Riziko], [Testovacia podmienka], [Priorita], [Pokrytie]), (
    // US01: one risk, two test conditions, one shared priority/coverage value.
    matrix-cell(0, 1, rowspan: 2)[*US01:* Registrácia *(Sekcia: Registrácia)*],
    matrix-cell(1, 1, rowspan: 2)[*REQ-597:* Nesprávne zvolené číslo bytu počas registrácie],
    matrix-cell(2, 1)[*REQ-600:* Overenie filtrovania a zobrazenia iba voľných bytov v ponuke],
    matrix-cell(2, 2)[*REQ-688:* Overenie zamedzenia registrácie na obsadený byt a validácie neplatných údajov],
    matrix-cell(3, 1, rowspan: 2)[*P1*],
    matrix-cell(4, 1, rowspan: 2)[*16%, 2 test*],

    // US02.
    matrix-cell(0, 3, rowspan: 2, shade: true)[*US02:* Prihlásenie a prístup podľa rolí *(Sekcia: Registrácia)*],
    matrix-cell(1, 3, rowspan: 2, shade: true)[*REQ-605:* Prihlásenie neschváleného alebo neregistrovaného používateľa],
    matrix-cell(2, 3, shade: true)[*REQ-606:* Blokovanie prihlásenia neschváleného používateľa],
    matrix-cell(2, 4, shade: true)[*REQ-689:* Overenie úspešného prihlásenia schváleného používateľa a presmerovanie na správnu rolu],
    matrix-cell(3, 3, rowspan: 2, shade: true)[*P0*],
    matrix-cell(4, 3, rowspan: 2, shade: true)[*75%, 2 test*],

    // US03.
    matrix-cell(0, 5)[*US03: Úprava profilu a zdieľania údajov (Sekcia: Údaje majiteľa bytu)*],
    matrix-cell(1, 5)[*REQ-620:* Neoprávnený únik osobných údajov pri zlyhaní nastavenia súhlasu],
    matrix-cell(2, 5)[*REQ-621:* Overenie nastavenia súhlasu a viditeľnosti osobných údajov],
    matrix-cell(3, 5)[*P2*],
    matrix-cell(4, 5)[*25%, 1 test*],

    // US04: both risk/condition pairs stay separate; story and priority are shared.
    matrix-cell(0, 6, rowspan: 2, shade: true)[*US04: Zobrazenie faktúr vlastníkom (Sekcia:Faktúry)*],
    matrix-cell(1, 6, shade: true)[*REQ-622:* Nesprávne farebné označenie a stav faktúry],
    matrix-cell(2, 6, shade: true)[*REQ-623:* Overenie zobrazenia stavov a farebného označenia faktúr],
    matrix-cell(3, 6, rowspan: 2, shade: true)[*P0*],
    matrix-cell(4, 6, shade: true)[*50%, 1 test*],
    matrix-cell(1, 7, shade: true)[*REQ-684:* Neoprávnené stiahnutie cudzej faktúry alebo stiahnutie poškodeného súboru],
    matrix-cell(2, 7, shade: true)[*REQ-685:* Overenie stiahnutia súboru faktúry a zabezpečenie oddelenia údajov medzi rôznymi bytmi],
    matrix-cell(4, 7, shade: true)[*25%, 1 test*],

    // US05. "Odeslanie/odeslania" are spelled as in this source matrix.
    matrix-cell(0, 8, rowspan: 2)[*US05: Správa faktúr správcom (Sekcia: Faktúry pre byt)*],
    matrix-cell(1, 8)[*REQ-626:* Odeslanie pripomienky o nezaplatených faktúrach nesprávnemu vlastníkovi],
    matrix-cell(2, 8)[*REQ-628:* Overenie odeslania pripomienok a správnosti správy faktúr správcom],
    matrix-cell(3, 8, rowspan: 2)[*P0*],
    matrix-cell(4, 8)[*25%, 1 test*],
    matrix-cell(1, 9)[*REQ-686:* Zlyhanie pridania novej faktúry, duplicita čísla alebo nahrávanie neplatných súborov],
    matrix-cell(2, 9)[*REQ-687:* Overenie pridávania novej faktúry a validácie limitov súborov],
    matrix-cell(4, 9)[*25%, 1 test*],

    // US06–US08.
    matrix-cell(0, 10, shade: true)[*US06: Podanie sťažnosti vlastníkom bytu (Sekcia: Podanie novej sťažnosti)*],
    matrix-cell(1, 10, shade: true)[*REQ-229:* Nahrávanie prílohy zlyhá],
    matrix-cell(2, 10, shade: true)[*REQ-256:* Nahratie a validácia príloh sťažnosti],
    matrix-cell(3, 10, shade: true)[*P2*],
    matrix-cell(4, 10, shade: true)[*16%, 1 test*],
    matrix-cell(0, 11, shade: true)[*US07: Sledovanie sťažností a odpovedí správcu (Sekcia: Spracovanie sťažností od bytu)*],
    matrix-cell(1, 11, shade: true)[*REQ-228:* Nezobrazia sa všetky sťažnosti vybraného bytu],
    matrix-cell(2, 11, shade: true)[*REQ-357:* Zobrazenie sťažností vybraného bytu],
    matrix-cell(3, 11, shade: true)[*P2*],
    matrix-cell(4, 11, shade: true)[*25%, 1 test*],
    matrix-cell(0, 12, shade: true)[*US08: Spracovanie sťažnosti správcom (Sekcia: Spracovanie sťažností od bytu)*],
    matrix-cell(1, 12, shade: true)[*REQ-238 :* Odpoveď správcu sa neuloží, neodošle alebo sa priradí nesprávnemu vlastníkovi],
    matrix-cell(2, 12, shade: true)[*REQ-259 :* Správne uloženie a doručenie odpovede],
    matrix-cell(3, 12, shade: true)[*P2*],
    matrix-cell(4, 12, shade: true)[*50%, 1 test*],
  ))
