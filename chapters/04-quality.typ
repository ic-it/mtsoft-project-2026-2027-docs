// Source: reference/MTSOFT-original.pdf, pp. 6–8, original table 6.
#import "../template.typ": report-table, caption

= 4 Kvalita požiadaviek a otvorené otázky

Každú z ôsmich User Stories hodnotíme podľa *zrozumiteľnosti, úplnosti, konzistentnosti, jednoznačnosti a testovateľnosti.* Pri každom hodnotení uvádzame stručné odôvodnenie. Hodnotenie „Čiastočne vyhovuje“ znamená, že základné správanie je opísané, ale niektoré pravidlá alebo očakávané výsledky treba upresniť. Otvorené body zaznamenáva TA1 pri príslušných stories v DTS. Produktové pravidlá potvrdzuje Product Owner, podľa potreby po konzultácii s vývojovým tímom. Navrhnuté doplnenia zostávajú oddelené od potvrdených akceptačných kritérií až do ich schválenia.

#report-table((0.7fr, 1.45fr, 1.45fr, 1.5fr, 1.5fr, 1.5fr),
  ([Story], [Zrozumiteľnosť], [Úplnosť], [Konzistentnosť], [Jednoznačnosť], [Testovateľnosť]), (
    (
      [*Story-1*],
      [*Vyhovuje:* žiadateľ, registrácia k bytu a účel získania prístupu sú jasné.],
      [*Čiastočne vyhovuje:* Chýbajú pravidlá súbežných žiadostí, opakovania a zlyhania odoslania.],
      [*Vyhovuje:* Registrácia nadväzuje na rozhodnutie správcu a následné prihlásenie.],
      [*Čiastočne vyhovuje:* Formát telefónu a okamih rezervácie bytu nie sú presne určené.],
      [*Čiastočne vyhovuje:* Základný tok možno overiť; pri súbehu a chybách treba potvrdiť výsledky.],
    ),
    (
      [*Story-2*],
      [*Vyhovuje:* prihlásenie a sprístupnenie funkcií podľa roly majú jasný účel.],
      [*Čiastočne vyhovuje:* Chýbajú pravidlá relácie, neúspešného prihlásenia a priameho prístupu.],
      [*Vyhovuje:* Prihlásenie, menu rolí a odhlásenie cez Profil na seba nadväzujú.],
      [*Čiastočne vyhovuje:* Nie je určená platnosť relácie ani presná reakcia na neoprávnený prístup.],
      [*Čiastočne vyhovuje:* Menu a prihlásenie možno overiť; negatívne scenáre potrebujú spresnenie.],
    ),
    (
      [*Story-3*],
      [*Vyhovuje:* úprava vlastných údajov, fotografie a súhlasu je zrozumiteľná.],
      [*Čiastočne vyhovuje:* Chýbajú limity fotografie a pravidlá zlyhania či odvolania súhlasu.],
      [*Vyhovuje:* Uloženie osobných údajov a automatické nahratie fotografie sú odlíšené podľa špecifikácie.],
      [*Čiastočne vyhovuje:* Validácia polí a okamih účinnosti odvolania súhlasu nie sú presné.],
      [*Čiastočne vyhovuje:* Bežnú úpravu možno overiť; hranice súborov a chybové scenáre treba doplniť.],
    ),
    (
      [*Story-4*],
      [*Vyhovuje:* prehľad faktúr, splatnosti a stiahnutie súboru majú jasný účel.],
      [*Čiastočne vyhovuje:* Chýbajú pravidlá nedostupného súboru, prázdneho zoznamu a určovania stavu.],
      [*Čiastočne vyhovuje:* Účel stránky uvádza dva stavy, podrobný opis štyri.],
      [*Vyhovuje:* Farby sú konkrétne, ale hranice oneskorenej a očakávajúcej platby nie sú určené.],
      [*Čiastočne vyhovuje:* Údaje a farby možno porovnať; prechody stavov potrebujú potvrdené pravidlá.],
    ),
    (
      [*Story-5*],
      [*Vyhovuje:* výber bytu, pridanie faktúry, označenie platby a pripomienka sú jasné.],
      [*Čiastočne vyhovuje:* Chýbajú pravidlá duplicít, zlyhania uloženia alebo emailu a opakovania.],
      [*Čiastočne vyhovuje:* Správca pracuje s označením zaplatenia, vlastník vidí štyri stavy. Ich vzťah treba spresniť.],
      [*Čiastočne vyhovuje:* Nie je určený rozsah jedinečnosti čísla, presná jednotka MB ani pripomínanie zaplatených faktúr.],
      [*Čiastočne vyhovuje:* Bežné akcie možno overiť; chybové a súbežné operácie potrebujú očakávané výsledky.],
    ),
    (
      [*REQ-80*],
      [*Vyhovuje:* story rozlišuje odosielateľa a cieľový byt.],
      [*Čiastočne vyhovuje:* Chýbajú pravidlá typov súborov, chýb odoslania a súbežných podaní.],
      [*Vyhovuje:* Povinné polia, limity, N/A a formát čísla zodpovedajú uvedeným zdrojom.],
      [*Čiastočne vyhovuje:* Počítanie znakov, jednotka MB a prideľovanie čísla pri súbehu nie sú presné.],
      [*Čiastočne vyhovuje:* Bežné podanie a hranice možno overiť; chyby a opakovanie treba spresniť.],
    ),
    (
      [*REQ-81*],
      [*Vyhovuje:* zoznam podaní, ich stav a odpoveď správcu majú jasný účel.],
      [*Čiastočne vyhovuje:* Chýba zobrazenie čakajúceho stavu a pravidlo označenia odpovede za prečítanú.],
      [*Vyhovuje:*Farby stavov a otvorenie odpovede zodpovedajú uvedeným zdrojom.],
      [*Čiastočne vyhovuje:* Nie je určený okamih odstránenia výkričníka ani zobrazenie čakajúcej sťažnosti.],
      [*Čiastočne vyhovuje:* Zoznam a odpoveď možno overiť; prečítanie a čakajúci stav potrebujú doplnenie.],
    ),
    (
      [*REQ-77*],
      [*Vyhovuje:* výber podaní, zmena stavu a odpoveď správcu sú jasné.],
      [*Čiastočne vyhovuje:* Chýbajú pravidlá zlyhania uloženia alebo odoslania odpovede a opakovania.],
      [*Vyhovuje:* Filter podľa odosielateľa a odpoveď vlastníkovi sú v súlade s uvedenými zdrojmi.],
      [*Čiastočne vyhovuje:* Úprava odpovede, ďalšia odpoveď a obmedzenia prechodov stavov zostávajú otvorené.],
      [*Čiastočne vyhovuje:* Základné akcie možno overiť; pre chybové scenáre treba doplniť výsledky.],
    ),
  ), size: 8.3pt)
#caption(6)[Hodnotenie kvality používateľských príbehov podľa vybraných kritérií]

#pagebreak(weak: true)
== 4.1 Otvorené otázky

Otvorené body dopĺňajú analýzu jednotlivých stories a určujú, ktoré pravidlá treba potvrdiť pred návrhom príslušných testov:

- *Story-1:* Rezervácia bytu pri súbežných registráciách, presná validácia údajov a správanie pri opakovaní alebo zlyhaní odoslania žiadosti.
- *Story-2:* Neúspešné prihlásenie, platnosť relácie, odhlásenie a priamy prístup k chráneným adresám.
- *Story-3:* Validácia osobných údajov, limity fotografie, chyby ukladania a účinnosť odvolania súhlasu so zdieľaním.
- *Story-4:* Pravidlá štyroch stavov faktúr, hranice dátumu splatnosti a reakcia pri nedostupnom súbore.
- *US05:* Rozsah jedinečnosti čísla faktúry, pravidlá súborov, súlad stavov s vlastníkom a zlyhanie či opakovanie pripomienky.
- *REQ-80:* Počítanie znakov a medzier, presný limit príloh, povolené formáty, opakovanie odoslania a číslovanie pri súbehu.
- *REQ-81:* Zobrazenie stavu „Očakáva sa“, okamih označenia odpovede za prečítanú a sprístupnenie profilu pri nepovolenom zdieľaní.
- *REQ-77:* Povolené prechody stavov, úprava alebo pridanie ďalšej odpovede a správanie pri chybe uloženia či odoslania.

*Potvrdzuje:* Product Owner po konzultácii s vývojovým tímom. \
*Stav:* Otvorené do potvrdenia príslušného pravidla.

== 4.2 Vybrané návrhy doplnenia akceptačných kritérií

Nasledujúce návrhy konkretizujú očakávané výsledky troch otvorených situácií zo správy sťažností:

- *REQ-80:* Téma alebo text tvorené iba medzerami sa považujú za prázdne. Príslušné pole sa zvýrazní červenou, zobrazí sa „Pole je povinné“ a sťažnosť sa neodošle.
- *REQ-81:* Otvorenie okna s odpoveďou označí odpoveď ako prečítanú. Po zatvorení okna a obnovení zoznamu sa pri príslušnej sťažnosti červený výkričník už nezobrazuje.
- *REQ-77:* Ak uloženie novej odpovede zlyhá, systém zobrazí „Odpoveď sa nepodarilo uložiť“. Nová odpoveď sa neuloží, neodošle ani nezobrazí vlastníkovi. Zadaný text zostane vo formulári na opakovanie uloženia.

*Potvrdzuje:* Product Owner po konzultácii s vývojovým tímom. \
*Stav:* Návrhy na potvrdenie.
