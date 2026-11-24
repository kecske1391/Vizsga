# Online könyvtár / könyvesbolt – adatbázis dokumentáció

Ezt az adatbázist hárman készítettük. Ez a dokumentum egy online könyvtár és könyvesbolt adatbázisát mutatja be egyszerűen, hétköznapi nyelven. Az adatbázis neve: **book\_review**.

## 1. Miről szól a projekt?

Az ötlet az, hogy egy weboldalon a felhasználók könyveket tölthessenek fel, böngészhessenek közöttük, és műfaj szerint is kereshessenek. Az adatbázis ennek a „háttérraktára”: itt tároljuk, hogy kik a felhasználók, milyen könyvek vannak az oldalon, melyik könyv milyen műfajú, és hogy ki mikor lépett be vagy ki az oldalról.

Az adatbázis MySQL / MariaDB rendszerre készült.

## 2. Milyen táblák vannak?

Összesen hat táblát hoztunk létre. Mindegyik egy-egy dolgot tárol, hogy átlátható maradjon.

### users – a felhasználók

Itt vannak az oldal felhasználói. Minden felhasználóról eltároljuk a teljes nevét, az e-mail címét és a telefonszámát. Az e-mail cím egyedi, vagyis két embernek nem lehet ugyanaz.

### books – a könyvek

Itt vannak a könyvek. Egy könyvnél eltároljuk a címét, a szerzőjét, a nyelvét, a megjelenés évét és az árát (forintban). Azt is tudjuk, hogy melyik felhasználó töltötte fel.

### tags – a műfajok

Ez egy egyszerű lista a műfajokról, például: Drama, Fantasy, Horror, Romance, Science Fiction. Jelenleg 60 darab van benne. Egy műfajnév csak egyszer szerepelhet.

### book\_tags – melyik könyv milyen műfajú

Ez a „összekötő” tábla. Azért van rá szükség, mert egy könyvnek több műfaja is lehet (például az Egri csillagok történelmi, kalandos és regény is), egy műfajhoz pedig sok könyv tartozik. Ezt egyetlen oszlopban nem lehet jól megoldani, ezért kell ez a külön tábla.

### data\_bank – banki adatok

Ez a tábla a felhasználók banki jellegű adatait tárolná. Egyelőre **üres**, nem töltöttük fel adatokkal. Fontos: teljes kártyaszámot nem tárolunk, csak az utolsó 4 számjegyet. Itt van a felhasználó számlaszáma és az egyenlege is. Az egyenleg alapból 0 Ft-tal indul, és ebből lehet majd levonni a könyvek árát.

### be\_ki – be- és kijelentkezések

Itt látjuk, hogy melyik felhasználó mikor jelentkezett be és mikor ki. Ha a kijelentkezés ideje üres, az azt jelenti, hogy az illető még be van jelentkezve.

## 3. Hogyan kapcsolódnak egymáshoz a táblák?

A táblák „kulcsokkal” hivatkoznak egymásra. Ez olyan, mint egy sorszám: ahelyett, hogy minden sorba beírnánk a felhasználó összes adatát, csak a sorszámát írjuk be.

- **books → users:** minden könyvnél ott van, hogy ki töltötte fel.
- **be\_ki → users:** minden belépésnél ott van, hogy kié.
- **data\_bank → users:** a banki adatok egy felhasználóhoz tartoznak.
- **book\_tags → books és tags:** összeköti a könyveket a műfajaikkal.

Mindenhol be van állítva, hogy ha törlünk egy felhasználót (vagy egy könyvet), akkor a hozzá tartozó adatok is automatikusan törlődnek. Így nem maradnak árva, gazdátlan sorok az adatbázisban.

## 4. Példa adatok

Hogy ki lehessen próbálni az adatbázist, feltöltöttük példa adatokkal:

- **8 felhasználó:** gyakori magyar nevekkel. Az e-mail címek az example.com címet használják, a telefonszámok kitaláltak, így nem tartoznak valódi emberekhez.
- **15 valódi könyv:** például Egri csillagok, 1984, Dracula, Dűne, A kis herceg. A szerzők, a nyelvek és a megjelenési évek valósak. Az árak viszont kitaláltak, egy átlagos magyar könyvesbolt árait közelítik.
- **Műfaj-kapcsolatok:** minden könyvhöz 2-3 műfaj tartozik.
- **15 be- és kijelentkezés:** néhány felhasználó éppen be van jelentkezve.

## 5. Miket javítottunk az eredeti tervhez képest?

Az eredeti kódban volt néhány hiba, ezeket kijavítottuk:

- **Szintaktikai hibák:** volt egy felesleges vessző, és a CURRENT\_TIMESTAMP-et adattípusként használtuk, pedig az csak alapértelmezett érték lehet.
- **Sorrend:** a tags táblát a books elé kellett rakni, különben a kapcsolat hibát adott volna.
- **Adattípusok:** a TINYINT csak 255-ig számol, így hamar betelt volna. Helyette INT UNSIGNED AUTO\_INCREMENT van, ami magától számozza az új sorokat.
- **Szám helyett szöveg:** a számlaszámot szövegként tároljuk, mert lehet benne kötőjel vagy betű.
- **Több műfaj egy könyvhöz:** az eredetiben egy könyvnek csak egy műfaja lehetett volna. A book\_tags tábla ezt megoldja.
- **Megjelenési év:** utólag hozzáadtuk a books táblához. SMALLINT típust használtunk, mert a YEAR típus csak 1901-től működik, a Dracula pedig 1897-es.

* **Ár és egyenleg:** a data\_bank táblában eredetileg egy price (ár) oszlop volt, de az ár a könyvhöz tartozik, nem a banki adatokhoz. Ezért a könyvek kaptak egy price oszlopot, a data\_bank-ban pedig balance (egyenleg) lett.

## 6. Biztonság

Teljes bankkártyaszámot soha ne tároljunk a saját adatbázisunkban. Ez törvényi és biztonsági kockázat is. Ha az oldalon majd tényleges fizetés lesz, azt érdemes egy megbízható fizetési szolgáltatóra bízni (például Stripe). Jelszavakat is csak titkosítva (hash-elve) szabad tárolni, de ez a mostani adatbázisban még nincs benne.

## 7. Mi hiányzik még? (továbbfejlesztési ötletek)

- **Értékelések és vélemények:** az oldal neve book\_review, de még nincs külön tábla, ahol a felhasználók értékelhetnék a könyveket.
- **Vásárlások:** egy purchases vagy orders tábla, ahol látszik, ki mit vásárolt. Most az egyenlegből levonható a könyv ára, de a vásárlások történetét még nem tároljuk.
- **Jelszó oszlop** a users táblában (titkosítva).
- **A data\_bank feltöltése,** ha tényleg szükség lesz rá.

## 8. Konklúzió

Az adatbázis egyszerű, de jól működő alap egy online könyvtárhoz vagy könyvesbolthoz. A felhasználók, a könyvek, a műfajok és a belépések rendezetten, egymással összekapcsolva vannak tárolva. A felépítés könnyen bővíthető, így később hozzá lehet adni az értékeléseket, a vásárlásokat és minden egyéb új funkciót anélkül, hogy az egészet újra kellene kezdeni.
