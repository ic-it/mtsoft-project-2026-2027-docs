// Source: assignment [01], sections 1.3–1.5, 3.2 and 3.6.
// Q1–Q5 and authority: unchanged document chapters 1 and 2.
#import "../template.typ": checks

= 11 Pripravenosť dokončenie a Release 1

Pripravenosť Story, vstup do vykonávania, dokončenie Inkrementu a Release 1 posúdime oddelene, vždy oproti označenému rozsahu, buildu a dátam. Chýbajúci dôkaz neznamená splnenie kritéria.

== 11.1 Definition of Ready pre Story

Pred prijatím do sprintu TA1 s TM preveria rolu, účel, zdroj, testovateľné AC, riziko, prioritu, podmienky, dáta, závislosti a odhad. PO potvrdí potrebné pravidlá z kapitoly 4. P0/P1 Story musí mať aspoň jedno riziko a dve relevantné Test Conditions podľa zadania §3.4. Nepokryté AC a chýbajúce väzby evidujeme.

Nejasné kontroly nevykonávame; TM môže plánovať analýzu alebo pripravenú nezávislú časť. Otvorený bod dostane vlastníka a termín. Q4/Q5 potvrdí PO pred návrhom meraní, plánovane na D1.

== 11.2 Vstup do systémových testov a UAT

Pred systémovým testom sú dostupné funkcie, označený build, release notes, úspešný smoke, overené dáta a očakávaný výsledok. Test nemá blokujúci defekt; nezávislé kontroly môžu pokračovať.

Pred UAT TM a PO posúdia kandidáta: 100 % vybraných scenárov je pripravených, príslušné systémové kontroly úspešné, 0 otvorených Critical/High, anonymizované dáta, úspešný smoke a dohodnutý čas správcu. D12 preveríme predpoklady na TEST; UAT prostredie až D13. Nesplnený vstup znamená blokované UAT a eskaláciu termínu.

== 11.3 Definition of Done pre Inkrement

Inkrement vyhodnotíme na D5, D10 alebo D15. Jeho plánované P0/P1 kontroly sú na platnom builde 100 % vykonané a úspešné podľa Q1; relevantná regresia predchádzajúcich častí je dokončená. Nie sú otvorené Critical/High defekty Inkrementu. Výsledky majú dôkazy, defekty úspešný retest a pokrytie zodpovedá schválenému rozsahu; nevykonané P2 majú dôvod a vyhodnotené riziko.

TM odovzdá sprint report s Traceability, rizikami, zmenami rozsahu a zostatkom kapacity. Nesplnená podmienka znamená nedokončený Inkrement so zoznamom zostávajúcej práce. Sprint review nie je povolením produkčného releasu.

== 11.4 Kritériá Release 1 a rozhodnutie

Na konci D15 TM predloží PO dôkazy o splnení nasledujúcich podmienok:

#checks(
  [*Defekty:* 0 otvorených Critical a 0 otvorených High v rozsahu Release 1. Opravy sú retestované a príslušná regresia úspešná. Zvyšné Medium/Low majú zdôvodnené rozhodnutie PO, vlastníka a dohodnutý ďalší postup.],
  [*Rozsah a Q1:* 100 % všetkých plánovaných P0/P1 kontrol Release 1 je vykonaných a úspešných, vrátane kontrol zvýšených podľa rizika v kapitole 7. Systémové a vybrané end-to-end regresné toky sú úspešné. Zmeny rozsahu a nepokryté AC sú viditeľné a schválené, nie vydávané za 100 % pokrytie požiadaviek.],
  [*Q2 a Q3:* v plánovaných negatívnych kontrolách nenastal neoprávnený prístup ani akcia; všetky kontrolované záznamy, prílohy, odpovede a príjemcovia sa zhodujú s referenčnými dátami.],
  [*UAT a Q4:* PO akceptuje vybrané toky; správca overí registráciu, faktúru a vybavenie sťažnosti. Pri Q4 vykoná PO ako vlastník podanie a prečítanie odpovede; správca spracovanie a odpoveď. TA2 meria bez poskytovania pomoci; každá z troch úloh trvá najviac 120 s. Výber vykonávateľov potvrdí PO; nejde o štúdiu reprezentatívnej vzorky vlastníkov.],
  [*Q5:* TA1 na D11–D12 pred UAT vykoná 30 meraní každého zoznamu (faktúry a sťažnosti), rozdelených do troch relácií po 10. Čas od vyvolania otvorenia po zobrazenie použiteľného zoznamu meria na uvedenom builde, dátach a štandardnej sieti. Aspoň 29 z 30 meraní každého zoznamu musí byť ≤ 3 s. Prahy Q4/Q5 platia po schválení PO; bez schválenia alebo merania ich neoznačíme za splnené.],
  [*Rozhodovací podklad:* existuje záverečný report, vyhodnotenie všetkých gates, UAT záznam, verzie buildu a dát, aktuálne pokrytie a zostávajúce riziká s vlastníkmi. PO má informáciu aj o vynechaných P2 a rozsahu emulovaných platforiem.],
)

PO rozhodne Go/No-Go na odporúčanie TM. Nesplnené povinné kritérium znamená No-Go a plán ďalšej práce; podmienka 0 Critical/High nemá výnimku. Zmena kandidáta po meraní alebo UAT vyžaduje posúdenie dopadu a nové dôkazy dotknutých kritérií. Nedostatok času nie je dôvodom na uznanie neovereného výsledku.

_Zdroj: [01], §1.3–1.5, §3.2, §3.4 a §3.6; ciele a roly: kapitoly 1–2. Podrobné gates a spôsob merania sú plánom tímu, nie vykázanými výsledkami._
