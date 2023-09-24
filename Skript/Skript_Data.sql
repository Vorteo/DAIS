INSERT INTO Adresa (mesto,ulice,zeme,psc,datum_zmeny)
VALUES ('Ostrava','Frýdecká 25','Czech',70030,CURRENT_TIMESTAMP)

INSERT INTO Uzivatel (jmeno,prijmeni,telefon,email,typ_uzivatele,datum_zmeny,id_adresa)
VALUES ('Michal','Beneš','+420722501062','m.benes@seznam.cz','Neregistrovany zakaznik',CURRENT_TIMESTAMP,(SELECT id_adresa FROM Adresa WHERE psc = 70030))


INSERT INTO Adresa (mesto,ulice,zeme,psc,datum_zmeny)
VALUES ('Frýdek-Místek','Frýdlanstká 405','Czech',73801,CURRENT_TIMESTAMP)

INSERT INTO Uzivatel (jmeno,prijmeni,telefon,email,typ_uzivatele,datum_zmeny,id_adresa)
VALUES ('Jan','Novák','+420735501162','j.novak@gmail.com','Neregistrovany zakaznik',CURRENT_TIMESTAMP,(SELECT id_adresa FROM Adresa WHERE psc = 73801))

INSERT INTO Uzivatel (jmeno,prijmeni,telefon,email,typ_uzivatele,login,datum_registrace,datum_zmeny,id_adresa)
VALUES ('Petr','Mára','+420625128035','p.mara@gmail.com','Registrovany zakaznik','MARA6258',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,(SELECT id_adresa FROM Adresa WHERE psc = 73801))

INSERT INTO Adresa (mesto,ulice,zeme,psc,datum_zmeny)
VALUES ('Paskov','Paskovská 325','Czech',73921,CURRENT_TIMESTAMP)

INSERT INTO Uzivatel (jmeno,prijmeni,telefon,email,typ_uzivatele,login,datum_registrace,datum_zmeny,id_adresa)
VALUES ('Marek','Vrabec','+420888265328','m.vrabec@seznam.com','Registrovany zakaznik','VRABEC328',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,(SELECT id_adresa FROM Adresa WHERE psc = 73921))


INSERT INTO Adresa (mesto,ulice,zeme,psc,datum_zmeny)
VALUES ('Ostrava','Èeskobratrská 85','Czech',73935,CURRENT_TIMESTAMP)

INSERT INTO Uzivatel (jmeno,prijmeni,telefon,email,typ_uzivatele,login,datum_registrace,datum_zmeny,id_adresa)
VALUES ('Martin','Kaloè','+420608298468','m.kaloc@seznam.com','Pracovnik','KALOC328',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,(SELECT id_adresa FROM Adresa WHERE psc = 73935))

INSERT INTO Adresa (mesto,ulice,zeme,psc,datum_zmeny)
VALUES ('Brušperk',' Hlavní 38','Czech',73955,CURRENT_TIMESTAMP)

INSERT INTO Uzivatel (jmeno,prijmeni,telefon,email,typ_uzivatele,login,datum_registrace,datum_zmeny,id_adresa)
VALUES ('Patrik','Thomas','+420120358987','p.thomas@centrum.cz','Spravce','THOMAS328',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,(SELECT id_adresa FROM Adresa WHERE psc = 73955))

INSERT INTO Adresa (mesto,ulice,zeme,psc,datum_zmeny)
VALUES ('Vratimov','Frýdecka 125','Czech',73932,CURRENT_TIMESTAMP)

INSERT INTO Uzivatel (jmeno,prijmeni,telefon,email,typ_uzivatele,datum_zmeny,id_adresa)
VALUES ('Lukáš','Moravec','+420115268652','l.moravec@gmail.com','Neregistrovany zakaznik',CURRENT_TIMESTAMP,(SELECT id_adresa FROM Adresa WHERE psc = 73932))

INSERT INTO Adresa (mesto,ulice,zeme,psc,datum_zmeny)
VALUES ('Horní Datynì','Vratimovská 148','Czech',73932,CURRENT_TIMESTAMP)

INSERT INTO Uzivatel (jmeno,prijmeni,telefon,email,typ_uzivatele,login,datum_registrace,datum_zmeny,id_adresa)
VALUES ('Jakub','Dostal','+420722501199','j.dostal@seznam.cz','Registrovany zakaznik','DOSTAL255',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,(SELECT id_adresa FROM Adresa WHERE mesto = 'Horní Datynì'))


INSERT INTO Produkt (nazev,vyrobce,barva,hmotnost,cena,pocet_kusu_skladem,datum_pridani,datum_zmeny)
VALUES ('Iphone SE 64GB','Apple','Èerná',113,6500,20,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP)

INSERT INTO Produkt (nazev,vyrobce,popis,barva,hmotnost,cena,pocet_kusu_skladem,datum_pridani,datum_zmeny)
VALUES ('Galaxy S20','Samsung','Revoluèní Galaxy S20 pøichází nabitý špièkovými funkcemi, fantastickým designem...','Modrá',290,15500,30,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP)

INSERT INTO Produkt (nazev,vyrobce,popis,barva,hmotnost,cena,pocet_kusu_skladem,datum_pridani,datum_zmeny)
VALUES ('Iphone XR','Apple','Dostupnìjší varianta slavného telefonu s nejvýkonnìjším smartphonovým procesorem...','Èervená',210,18500,25,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP)

INSERT INTO Produkt (nazev,vyrobce,popis,barva,hmotnost,cena,pocet_kusu_skladem,datum_pridani,datum_zmeny)
VALUES ('Galaxy S10','Samsung','Galaxy S10 nabízí svým uživatelùm nejnovìjší mobilní technologie...','Modrá',190,13300,40,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP)

INSERT INTO Produkt (nazev,vyrobce,barva,hmotnost,cena,pocet_kusu_skladem,datum_pridani,datum_zmeny)
VALUES ('Xperia 5 Dual','Sony','Èerná',136,13600,15,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP)

INSERT INTO Produkt (nazev,vyrobce,popis,barva,hmotnost,cena,pocet_kusu_skladem,datum_pridani,datum_zmeny)
VALUES ('Redmi Note 8T','Xiaomi','Inteligentní elegán, který zvládne všechny vaše požadavky levou zadní...','Modrá',140,4990,60,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP)

INSERT INTO Produkt (nazev,vyrobce,popis,barva,hmotnost,cena,pocet_kusu_skladem,datum_pridani,datum_zmeny)
VALUES ('8A','Honor','Smartphone s vícevrstvou povrchovou texturou a prostorným displejem nabízí osmijádrový výkon...','Èerná',133,3490,120,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP)


INSERT INTO Produkt (nazev,vyrobce,popis,barva,hmotnost,cena,pocet_kusu_skladem,datum_pridani,datum_zmeny)
VALUES ('Zenfone 7','Asus','Chytrý telefon se špièkovým výkonem, výklopným trojitým fotoaparátem pro pøední i zadní stranu...','Èervená',165,16790,38,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP)


INSERT INTO Kategorie (nazev,datum_zmeny)
VALUES ('Pro nároèné',CURRENT_TIMESTAMP)

INSERT INTO Kategorie (nazev,datum_zmeny)
VALUES ('Pro nenároèné',CURRENT_TIMESTAMP)

INSERT INTO Kategorie (nazev,datum_zmeny)
VALUES ('Zlatá støední cesta',CURRENT_TIMESTAMP)


INSERT INTO produkt_kategorie (id_produkt,id_kategorie)
VALUES (1,3)

INSERT INTO produkt_kategorie (id_produkt,id_kategorie)
VALUES (2,1),(3,1),(4,1),(5,1)

INSERT INTO produkt_kategorie (id_produkt,id_kategorie)
VALUES (6,3),(7,3),(8,1)



INSERT INTO Kategorie (nazev,datum_zmeny,popis)
VALUES ('iOS',CURRENT_TIMESTAMP,'Telefon s operaèním systémem iOS')

INSERT INTO Kategorie (nazev,datum_zmeny,popis)
VALUES ('Android',CURRENT_TIMESTAMP,'Telefon s operaèním systémem Android')

INSERT INTO produkt_kategorie (id_produkt,id_kategorie)
VALUES (1,4),(3,4),(2,5),(4,5),(5,5),(6,5),(7,5),(8,5)


INSERT INTO Platba (nazev,cena,datum_zmeny)
VALUES ('Hotove',25,CURRENT_TIMESTAMP)

INSERT INTO Platba (nazev,cena,datum_zmeny,datum_platby)
VALUES ('Hotove',25,CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)

INSERT INTO Platba (nazev,cena,datum_zmeny,datum_platby)
VALUES ('Kartou',10,'2020-11-28 11:05:01', '2020-11-28 13:20:34')

INSERT INTO Platba (nazev,cena,datum_zmeny,datum_platby)
VALUES ('Online kartou',5,'2020-11-25 19:30:01', '2020-11-25 19:30:01')

INSERT INTO Platba (nazev,cena,datum_zmeny)
VALUES ('Kartou',10,'2020-11-24 21:30:01')

INSERT INTO Platba (nazev,cena,datum_zmeny,datum_platby)
VALUES ('Hotove',40,'2020-11-29 09:15:01', '2020-11-25 19:30:01')


INSERT INTO Doprava (nazev,cena,popis,datum_zmeny)
VALUES ('Osobne',89,'Vyzvednuti objednavky na jednom z nasich vydejnich mist...',CURRENT_TIMESTAMP)

INSERT INTO Doprava (nazev,cena,popis,datum_zmeny)
VALUES ('Postou',115,'Doruceni objednavky ceskou postou...',CURRENT_TIMESTAMP)

INSERT INTO Doprava (nazev,cena,popis,datum_zmeny)
VALUES ('Zasilkovna',60,'Vyzvednuti na vydejnich mistech Zasilkovny',CURRENT_TIMESTAMP)


INSERT INTO Objednavka (datum_vytvoreni,stav,celkova_cena,id_uzivatel,id_platby,datum_zmeny,id_doprava)
VALUES ('2020-11-26 18:21:06.950','Dokonceno',6565,1,1,'2020-11-26 18:21:06.950',1)

INSERT INTO Objednavka (datum_vytvoreni,stav,celkova_cena,id_uzivatel,datum_zmeny,id_doprava)
VALUES (CURRENT_TIMESTAMP,'Vyrizuje se',13595,2,CURRENT_TIMESTAMP,2)

INSERT INTO Objednavka (datum_vytvoreni,stav,celkova_cena,id_uzivatel,id_platby,datum_zmeny,id_doprava)
VALUES ('2020-11-25 08:21:06.950','Odeslano',18565,3,4,'2020-11-26 15:21:06.950',3)

INSERT INTO Objednavka (datum_vytvoreni,stav,celkova_cena,id_uzivatel,id_platby,datum_zmeny,id_doprava)
VALUES (CURRENT_TIMESTAMP,'Dokonceno',10045,4,2,CURRENT_TIMESTAMP,1)

INSERT INTO Objednavka (datum_vytvoreni,stav,celkova_cena,id_uzivatel,id_platby,datum_zmeny,id_doprava)
VALUES (CURRENT_TIMESTAMP,'Dokonceno',5040,7,3,CURRENT_TIMESTAMP,2)

INSERT INTO Objednavka (datum_vytvoreni,stav,celkova_cena,id_uzivatel,id_platby,datum_zmeny,id_doprava)
VALUES (CURRENT_TIMESTAMP,'Dokonceno',16860,8,5,CURRENT_TIMESTAMP,3)

INSERT INTO Objednavka (datum_vytvoreni,stav,celkova_cena,id_uzivatel,datum_zmeny,id_doprava)
VALUES (CURRENT_TIMESTAMP,'Prijata',20395,8,CURRENT_TIMESTAMP,2)

INSERT INTO Objednavka (datum_vytvoreni,stav,celkova_cena,id_uzivatel,datum_zmeny,id_doprava)
VALUES ('2020-11-26 18:21:06.950','Storno',31040,5,'2020-11-26 18:21:06.950',1)


INSERT INTO Polozka_Objednavky (mnozstvi,id_objednavka,id_produkt)
VALUES (1,1,1)

INSERT INTO Polozka_Objednavky (mnozstvi,id_objednavka,id_produkt)
VALUES (1,2,1), (2,2,7)

INSERT INTO Polozka_Objednavky (mnozstvi,id_objednavka,id_produkt)
VALUES (1,3,3)

INSERT INTO Polozka_Objednavky (mnozstvi,id_objednavka,id_produkt)
VALUES (2,4,6)

INSERT INTO Polozka_Objednavky (mnozstvi,id_objednavka,id_produkt)
VALUES (1,5,6)

INSERT INTO Polozka_Objednavky (mnozstvi,id_objednavka,id_produkt)
VALUES (1,6,8)

INSERT INTO Polozka_Objednavky (mnozstvi,id_objednavka,id_produkt)
VALUES (1,7,4)

INSERT INTO Polozka_Objednavky (mnozstvi,id_objednavka,id_produkt)
VALUES (2,7,7)

INSERT INTO Polozka_Objednavky (mnozstvi,id_objednavka,id_produkt)
VALUES (2,8,2)


INSERT INTO Historie_Uzivatel (datum_zmeny,nazev_zmeneho_atributu,hodnota,id_uzivatel)
VALUES ('2020-11-21 19:30:01','jmeno','Aleš',1)

INSERT INTO Historie_Uzivatel (datum_zmeny,nazev_zmeneho_atributu,hodnota,id_uzivatel)
VALUES ('2020-11-18 13:30:01','typ_uzivatele','Spravce',5)

INSERT INTO Historie_Uzivatel (datum_zmeny,nazev_zmeneho_atributu,hodnota,id_uzivatel)
VALUES ('2020-11-22 08:38:01','telefon','+420722501050',6)

INSERT INTO Historie_Produktu (datum_zmeny,nazev_zmeneho_atributu,hodnota,id_produkt)
VALUES ('2020-11-18 08:38:01','cena',8000,1)

INSERT INTO Historie_Produktu (datum_zmeny,nazev_zmeneho_atributu,hodnota,id_produkt)
VALUES ('2020-11-08 15:56:01','hmotnost',250,4)

INSERT INTO Historie_Produktu (datum_zmeny,nazev_zmeneho_atributu,hodnota,id_produkt)
VALUES ('2020-11-02 19:38:01','cena',2000,6)

INSERT INTO Historie_Produktu (datum_zmeny,nazev_zmeneho_atributu,hodnota,id_produkt)
VALUES ('2020-11-09 22:38:01','cena',14000,2)

INSERT INTO Kategorie (nazev,datum_zmeny)
VALUES ('Windows Phone','2018-06-22 08:23:00.000')