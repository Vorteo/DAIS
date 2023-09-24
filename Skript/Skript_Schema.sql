
CREATE TABLE Uzivatel 
    (
     id_uzivatel INTEGER IDENTITY PRIMARY KEY NOT NULL , 
     jmeno VARCHAR (50) NOT NULL , 
     prijmeni VARCHAR (50) NOT NULL , 
     telefon VARCHAR (13) NOT NULL , 
     email VARCHAR (50) NOT NULL , 
     typ_uzivatele VARCHAR (30) NOT NULL , 
     login VARCHAR (25) , 
     datum_registrace DATETIME , 
     datum_zmeny DATETIME NOT NULL , 
     id_adresa INTEGER NOT NULL 
    )


CREATE TABLE Adresa 
    (
     id_adresa INTEGER IDENTITY PRIMARY KEY NOT NULL , 
     mesto VARCHAR (30) NOT NULL , 
     ulice VARCHAR (50) NOT NULL , 
     zeme VARCHAR (30) NOT NULL , 
     psc INTEGER , 
     datum_zmeny DATETIME NOT NULL 
    )


ALTER TABLE Uzivatel
ADD CONSTRAINT Uzivatel_Adresa_FK FOREIGN KEY (id_adresa) REFERENCES Adresa (id_adresa)

CREATE TABLE Doprava 
    (
     id_doprava INTEGER IDENTITY PRIMARY KEY NOT NULL , 
     nazev VARCHAR (20) NOT NULL , 
     cena INTEGER NOT NULL , 
     popis VARCHAR (100) , 
     datum_zmeny DATETIME NOT NULL 
    )


CREATE TABLE Platba 
    (
     id_platby INTEGER IDENTITY PRIMARY KEY NOT NULL , 
     nazev VARCHAR (30) NOT NULL , 
     cena INTEGER NOT NULL ,  
     datum_zmeny DATETIME NOT NULL,
     datum_platby DATETIME
    )


CREATE TABLE Objednavka 
    (
     id_objednavka INTEGER IDENTITY PRIMARY KEY NOT NULL , 
     datum_vytvoreni DATETIME NOT NULL , 
     stav VARCHAR (60) NOT NULL , 
     celkova_cena INTEGER NOT NULL , 
     id_uzivatel INTEGER NOT NULL , 
     id_platby INTEGER , 
     datum_zmeny DATETIME NOT NULL , 
     id_doprava INTEGER NOT NULL 
    )


ALTER TABLE Objednavka
ADD CONSTRAINT Objednavka_Uzivatel_FK FOREIGN KEY (id_uzivatel) REFERENCES Uzivatel (id_uzivatel)

ALTER TABLE Objednavka
ADD CONSTRAINT Objednavka_Platba_FK FOREIGN KEY (id_platby) REFERENCES Platba (id_platby)

ALTER TABLE Objednavka 
ADD CONSTRAINT Objednavka_Doprava_FK FOREIGN KEY (id_doprava) REFERENCES Doprava (id_doprava)

CREATE TABLE Polozka_Objednavky 
    (
     mnozstvi INTEGER NOT NULL , 
     id_objednavka INTEGER NOT NULL , 
     id_produkt INTEGER NOT NULL 
    )

CREATE TABLE Produkt 
    (
     id_produkt INTEGER IDENTITY PRIMARY KEY NOT NULL , 
     nazev VARCHAR (40) NOT NULL , 
     vyrobce VARCHAR (50) NOT NULL , 
     fotografie IMAGE , 
     popis VARCHAR (100) , 
     barva VARCHAR (15) NOT NULL , 
     hmotnost INTEGER NOT NULL , 
     cena INTEGER NOT NULL , 
     pocet_kusu_skladem INTEGER NOT NULL , 
     datum_pridani DATETIME NOT NULL , 
     datum_zmeny DATETIME NOT NULL 
    )

ALTER TABLE Polozka_Objednavky
ADD CONSTRAINT Polozka_objednavky_PK PRIMARY KEY (id_objednavka, id_produkt)

ALTER TABLE Polozka_Objednavky
ADD CONSTRAINT Polozka_Objednavky_Produkt_FK FOREIGN KEY (id_produkt) REFERENCES Produkt (id_produkt)

ALTER TABLE Polozka_Objednavky
ADD CONSTRAINT Polozka_Objednavky_Objednavka_FK FOREIGN KEY (id_objednavka) REFERENCES  Objednavka (id_objednavka)

CREATE TABLE Kategorie 
    (
     id_kategorie INTEGER IDENTITY PRIMARY KEY NOT NULL , 
     nazev VARCHAR (40) NOT NULL , 
     datum_zmeny DATETIME NOT NULL , 
     popis VARCHAR (100) 
    )

CREATE TABLE produkt_kategorie 
    (
     id_produkt INTEGER NOT NULL , 
     id_kategorie INTEGER NOT NULL 
    )

ALTER TABLE produkt_kategorie 
ADD CONSTRAINT produkt_kategorie_PK PRIMARY KEY (id_produkt, id_kategorie)

ALTER TABLE produkt_kategorie
ADD CONSTRAINT produkt_kategorie_Kategorie_FK FOREIGN KEY (id_kategorie) REFERENCES Kategorie (id_kategorie)

ALTER TABLE produkt_kategorie 
ADD CONSTRAINT produkt_kategorie_Produkt_FK FOREIGN KEY (id_produkt) REFERENCES Produkt (id_produkt)

CREATE TABLE Historie_Produktu 
    (
     id_historie_produktu INTEGER IDENTITY PRIMARY KEY NOT NULL , 
     datum_zmeny DATETIME NOT NULL , 
     nazev_zmeneho_atributu VARCHAR (60) NOT NULL , 
     hodnota VARCHAR (100) NOT NULL , 
     id_produkt INTEGER NOT NULL 
    )

ALTER TABLE Historie_Produktu
ADD CONSTRAINT Historie_Produktu_Produkt_FK FOREIGN KEY (id_produkt) REFERENCES Produkt (id_produkt)


CREATE TABLE Historie_Uzivatel 
    (
     id_historie_uzivatel INTEGER IDENTITY PRIMARY KEY NOT NULL , 
     datum_zmeny DATETIME NOT NULL , 
     nazev_zmeneho_atributu VARCHAR (60) NOT NULL , 
     hodnota VARCHAR (100) NOT NULL , 
     id_uzivatel INTEGER NOT NULL 
    )

ALTER TABLE Historie_Uzivatel 
ADD CONSTRAINT Historie_Uzivatel_Uzivatel_FK FOREIGN KEY (id_uzivatel) REFERENCES Uzivatel (id_uzivatel)


--- INTEGRITNI OMEZENI

ALTER TABLE Uzivatel
ADD CONSTRAINT email_check CHECK (email LIKE '%@%')

ALTER TABLE Uzivatel
ADD CONSTRAINT login_length_check CHECK (len(login)>=8)

ALTER TABLE Uzivatel
ADD CONSTRAINT typ_uzivatele_check CHECK (typ_uzivatele IN ('Registrovany zakaznik','Neregistrovany zakaznik', 'Pracovnik', 'Spravce' ))

ALTER TABLE Objednavka
ADD CONSTRAINT stav_check CHECK (stav IN ('Prijata', 'Vyrizuje se', 'Cekame na zbozi', 'Platba prijata', 'Odeslano', 'Dokonceno', 'Storno'))

ALTER TABLE Polozka_Objednavky
ADD CONSTRAINT mnozstvi_check CHECK (mnozstvi >= 1)

ALTER TABLE Platba
ADD CONSTRAINT nazev_platby_check CHECK (nazev IN ('Hotove', 'Kartou', 'Online Kartou'))

ALTER TABLE Doprava
ADD CONSTRAINT nazev_dopravy_check CHECK (nazev IN ('Osobne', 'Postou', 'Zasilkovna'))

ALTER TABLE Uzivatel
ADD CONSTRAINT telefon_cislo_check CHECK (len(telefon) >= 9)
