// Source: reference/MTSOFT-original.pdf, pp. 5–6, original table 5.
#import "../template.typ": report-table, caption, story, checks, conditions

= 3 User Stories

Pre Release 1 sme vybrali osem User Stories, ktoré pokrývajú registráciu, prihlásenie a prístup podľa rolí, správu profilu, faktúry a správu sťažností. Schválenie a zamietnutie registrácie sú zahrnuté do registračného príbehu US01. Označenia US01 až US08 slúžia na orientáciu v dokumente. V zátvorkách uvádzame príslušné identifikátory z DTS. Tabuľka obsahuje zhrnutie akceptačných kritérií a súvisiace testovacie podmienky. Podrobné znenie a prepojenia položiek sa udržiavajú v DTS.

#report-table((1.5fr, 3.3fr, 1.45fr),
  ([Používateľský príbeh], [Prehľad akceptačných kritérií], [Podmienky overenia]), (
    (
      story([US01: Registrácia (Story-1)])[Ako neregistrovaný používateľ sa chcem zaregistrovať k voľnému bytu, aby som po schválení mohol používať systém.],
      checks(
        [Vyberať možno iba dostupné byty bez existujúcej registrácie.],
        [Povinné údaje a heslo sa validujú podľa funkčnej špecifikácie.],
        [Odoslanie žiadosti potvrdí zelené hlásenie a správca dostane notifikáciu.],
        [Používateľ čakajúci na schválenie sa nemôže prihlásiť.],
        [Správca potvrdí alebo zamietne iba označené žiadosti. Bez výberu sú príslušné akcie neaktívne.],
        [Schválený používateľ získa prístup a informačný email.],
      ),
      [*TC01 až TC04 \[\]*],
    ),
    (
      story([US02: Prihlásenie a prístup podľa rolí (Story-2)])[Ako používateľ chcem pristupovať iba k funkciám a údajom svojej roly, aby som systém používal bezpečne.],
      checks(
        [Používateľ s oprávneným účtom sa môže prihlásiť.],
        [Heslo je pri zadávaní skryté.],
        [Menu a dostupné funkcie zodpovedajú role prihláseného používateľa.],
        [Používateľ sa môže odhlásiť cez Profil.],
      ),
      [*TC05 a TC06 \[\]*],
    ),
    (
      story([US03: Úprava profilu a zdieľania údajov (Story-3)])[Ako vlastník bytu chcem upraviť svoje údaje, fotografiu a súhlas so zdieľaním, aby bol môj profil aktuálny a mohol som rozhodovať o zdieľaní svojich údajov.],
      checks(
        [Profil zobrazuje údaje príslušného vlastníka a jeho bytu.],
        [Uložené zmeny zostanú zachované aj po obnovení stránky.],
        [Vybraná fotografia sa automaticky nahrá a zobrazí.],
        [Vlastník môže zmeniť súhlas so zdieľaním údajov.],
      ),
      [*TC07 a TC08 \[\]*],
    ),
    (
      story([US04: Zobrazenie faktúr vlastníkom (Story-4)])[Ako vlastník bytu chcem vidieť stav svojich faktúr a stiahnuť ich, aby som mal prehľad o svojich záväzkoch.],
      checks(
        [Zobrazujú sa faktúry príslušného bytu.],
        [Kliknutie na číslo faktúry stiahne správny súbor.],
        [Štyri stavy faktúr majú farby určené vo funkčnej špecifikácii.],
        [Farba dátumu splatnosti zodpovedá stavu faktúry.],
      ),
      [*TC09 a TC10 \[\]*],
    ),
    (
      story([US05: Správa faktúr správcom (Story-5)])[Ako správca chcem pridávať faktúry, označovať platby a posielať pripomienky, aby bola evidencia faktúr aktuálna.],
      checks(
        [Výber bytu zobrazí jeho faktúry.],
        [Nová faktúra obsahuje jedinečné číslo, dátum splatnosti a povinný súbor s veľkosťou najviac 2 MB.],
        [Označenie zaplatenia sa zmení iba pri príslušnej faktúre.],
        [Pripomienka vybraných faktúr sa odošle správnemu vlastníkovi. Bez výberu faktúr je táto akcia neaktívna.],
      ),
      [*TC11 a TC12 \[\]*],
    ),
    (
      story([US06: Podanie sťažnosti vlastníkom bytu (REQ-80)])[Ako vlastník bytu chcem podať sťažnosť s témou, textom a prílohami, aby správca mohol problém posúdiť a vybaviť.],
      checks(
        [Odosielateľom je prihlásený vlastník. Cieľový byt má predvolenú hodnotu N/A a vybrať možno iba byty zaregistrovaných vlastníkov.],
        [Číslo sťažnosti vo formáte RRRR/MM/poradové číslo v danom mesiaci sa vytvorí automaticky a nie je editovateľné.],
        [Téma a text sú povinné, s limitmi 50 a 1000 znakov. Chýbajúce povinné pole sa zvýrazní červenou a zobrazí sa „Pole je povinné“.],
        [Možno pridať najviac tri prílohy s celkovou veľkosťou najviac 3 MB. Bez príloh sa zobrazuje „Nie je vybraný žiadny súbor“.],
        [Úspešné odoslanie potvrdí modré hlásenie „Sťažnosť bola odoslaná“, ktoré zmizne po piatich sekundách alebo po zatvorení cez X.],
        [Tlačidlo Späť a šípka umožnia návrat bez vytvorenia podanej sťažnosti.],
        [Tlačidlo „Poslať novú sťažnosť“ otvorí formulár na podanie sťažnosti.],
      ),
      conditions(
        [*REQ-255* \ Validácia polí],
        [*REQ-256* \ Prílohy],
        [*REQ-363* \ Podanie, identita a návrat],
      ),
    ),
    (
      story([US07: Sledovanie sťažností a odpovedí správcu (REQ-81)])[Ako vlastník bytu chcem vidieť svoje podané sťažnosti, ich stav a odpoveď správcu, aby som poznal priebeh riešenia problému.],
      checks(
        [Zoznam obsahuje podania prihláseného vlastníka a správne zobrazuje číslo, cieľový byt „Na byt“, tému, dátum podania, stav a dostupnosť odpovede.],
        [Stav Spracováva sa je žltý, Vyriešená zelený a Zamietnutá červený.],
        [Nová neprečítaná odpoveď má pri príslušnej sťažnosti červený výkričník.],
        [„Prečítať odpoveď“ otvorí správnu odpoveď v samostatnom okne. „Zavrieť“ vráti používateľa na zoznam.],
        [Pri údaji „Na byt“ sa zobrazí odkaz na profil cieľového vlastníka, ak tento vlastník povolil zdieľanie svojich údajov.],
      ),
      conditions(
        [*REQ-260* \ Nová odpoveď a jej prečítanie],
        [*REQ-362* \ Stavy a ich konzistentnosť],
        [*TC13* \ Zoznam a odkaz na profil \ \[doplniť ID z DTS\]],
      ),
    ),
    (
      story([US08: Spracovanie sťažnosti správcom (REQ-77)])[Ako správca chcem zobraziť podané sťažnosti, meniť ich stav a odpovedať na ne, aby som ich mohol vybaviť a informovať správneho odosielateľa.],
      checks(
        [Výber bytu zobrazí všetky sťažnosti podané jeho vlastníkom a žiadne podania iného odosielateľa. Filter sa neviaže na cieľový byt „Na byt“.],
        [Zoznam správne zobrazuje číslo sťažnosti, „Na byt“, tému, dátum podania, stav a informáciu o odpovedi.],
        [Správca môže zvoliť stav Očakáva sa, Spracováva sa, Vyriešená alebo Zamietnutá. Zmena sa uloží pri správnej sťažnosti a zostane zachovaná po obnovení zoznamu.],
        [Detail zobrazuje text príslušnej sťažnosti a umožňuje stiahnuť jej prílohu.],
        [„Uložiť“ zaznamená odpoveď a odošle ju odosielateľovi sťažnosti. „Zavrieť“ zatvorí okno bez uloženia novej odpovede.],
        [Tlačidlo Späť vráti správcu na stránku s údajmi majiteľov bytov.],
      ),
      conditions(
        [*REQ-257 a REQ-258* \ Zoznam a identita podania],
        [*REQ-259* \ Uloženie a doručenie odpovede],
        [*REQ-362* \ Zmena stavu],
        [*REQ-256* \ Stiahnutie prílohy],
      ),
    ),
  ), size: 9.3pt)
#caption(5)[Prehľad používateľských príbehov, akceptačných kritérií a podmienok overenia]
