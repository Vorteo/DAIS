/*1; 1; 8; Dotaz, ktery zobrazi informace o produktu - nazev, vyrobce, popis, cenu a setridi zaznamy podle ceny od nejmensi po nejvetsi. */
SELECT nazev,vyrobce,popis,cena
FROM Produkt
ORDER BY cena ASC

/*1; 2; 8; Dotaz, ktery zobrazi informace o uzivateli - sloupce jmeno a prijmeni spoji dohromady a zobrazi zbyle informace jako je telefon, email, typ uzivatele, jeho login a datum jeho registrace.*/
SELECT CONCAT(jmeno,' ',prijmeni) AS jmeno_prijmeni, telefon, email, typ_uzivatele, login, datum_registrace
FROM Uzivatel

/*1; 3; 8; Dotaz zobrazi informace o objednavkach - id objednavky, rok vytvoreni objednavky a celkovou cenu za objednavku.*/
SELECT id_objednavka, YEAR(datum_vytvoreni) AS Rok_vytvoreni, stav, celkova_cena
FROM Objednavka

/*1; 4; 8; Dotaz vypise informace o produktech setrizene podle delky jejich nazvu od nejdelsiho nazvu po nejmensi.*/
SELECT nazev,vyrobce,barva,pocet_kusu_skladem,cena
FROM Produkt
ORDER BY LEN(nazev) DESC

/*2; 1; 3; Dotaz vypise zaznamy které mají stav 'Dokonceno' nebo 'Storno' a jejich celkova_cena je mensi nez 12 000.*/
SELECT id_objednavka,stav, celkova_cena,datum_vytvoreni
FROM Objednavka
WHERE (stav = 'Dokonceno' OR stav = ' Storno') AND celkova_cena < 12000

/*2; 2; 5; Dotaz, ktery vypise Uzivatele, kteri jsou registrovani.*/
SELECT jmeno,prijmeni,login, email, datum_registrace
FROM Uzivatel
WHERE login IS NOT NULL

/*2; 3; 4; Dotaz vypise Produkty jejich nazev obsahuje na znak 'a'.*/
SELECT nazev,vyrobce,pocet_kusu_skladem,cena,popis,barva,hmotnost
FROM Produkt
WHERE nazev LIKE '%a%'

/*2; 4; 2; Dotaz, ktery vrati produkty, ktere maji vice jak 20 kusu na sklade a jsou od vyrobcu Samsung nebo Sony. Vypiseme jejich vyrobce + nazev dohromady, pocet jejich kusu a cenu vynasobenou poctem kusu.*/  
SELECT (vyrobce +' '+ nazev) AS cely_nazev_produktu, pocet_kusu_skladem, (cena * pocet_kusu_skladem) AS 'Celkova cena produktu skladem'
FROM Produkt
WHERE vyrobce IN ('Samsung','Sony') AND pocet_kusu_skladem > 20


/*3; 1; 2; Vypište jména a pøijmení uživatelù, kteøí si objednali telefon 'Iphone SE 64GB'*/
SELECT Uzivatel.id_uzivatel,Uzivatel.jmeno, Uzivatel.prijmeni
FROM Uzivatel
WHERE  Uzivatel.id_uzivatel IN 
		(SELECT Objednavka.id_uzivatel 
		 FROM Objednavka JOIN Polozka_Objednavky ON Objednavka.id_objednavka = Polozka_Objednavky.id_objednavka
		 JOIN Produkt ON Produkt.id_produkt=Polozka_Objednavky.id_produkt
		 WHERE Produkt.nazev = 'Iphone SE 64GB'
		)

/*3; 2; 2; Stejný dotaz jako predchozi jen prepsany pomoci EXISTS*/
SELECT id_uzivatel,jmeno, prijmeni
FROM Uzivatel
WHERE EXISTS 
		(SELECT Objednavka.id_uzivatel 
		 FROM Objednavka JOIN Polozka_Objednavky ON Objednavka.id_objednavka = Polozka_Objednavky.id_objednavka
		 JOIN Produkt ON Produkt.id_produkt=Polozka_Objednavky.id_produkt
		 WHERE Uzivatel.id_uzivatel = Objednavka.id_uzivatel AND Produkt.nazev = 'Iphone SE 64GB'  
		)

/*3; 3; 2; Stejný dotaz jako predchozi pouze prepsany pomoci ALL*/
SELECT  Uzivatel.id_uzivatel,Uzivatel.jmeno, Uzivatel.prijmeni
FROM Uzivatel JOIN Objednavka ON Uzivatel.id_uzivatel = Objednavka.id_uzivatel
JOIN Polozka_Objednavky ON Polozka_Objednavky.id_objednavka = Objednavka.id_objednavka
WHERE Polozka_Objednavky.id_produkt  = ALL(
								SELECT id_produkt
								FROM Produkt
								WHERE Produkt.nazev = 'Iphone SE 64GB'
								) 


/*3; 4; ; Neprisel jsem na to jak udelat stejny dotaz pomoci 4 konstrukce.*/


/*4; 1; 6; Pro kazdeho vyrobce z tabulky Produkt vypiste pocet jeho telefonu.*/
SELECT vyrobce, COUNT(*) AS pocet
FROM Produkt
GROUP BY vyrobce

/*4; 2; 7;  Vypiste pocet a celkovou cenu za vsechny objednavky podle uzivatele.*/
SELECT id_uzivatel,COUNT(id_uzivatel) AS pocet_objednavek, SUM(celkova_cena) as 'Soucet cen vsech objednavek podle uzivatele'
from Objednavka
GROUP BY id_uzivatel 
ORDER BY SUM(celkova_cena) DESC

/*4; 3; 6; Vypiste prumernou cenu telefonu podle vyrobce.*/
SELECT vyrobce, AVG(cena) AS 'Prumerna cena'
FROM Produkt
GROUP BY vyrobce

/*4; 4; 1; Vypiste id zakazniku s alespon 2 objednavkami.*/
SELECT id_uzivatel, COUNT(*) AS 'Pocet objednavek'
FROM Objednavka
GROUP BY id_uzivatel
HAVING COUNT(*) >= 2

/*5; 1; 1; Vypise jmena a prijmeni uzivatelu, kteri maji 2 a vice objednavek.*/
SELECT Uzivatel.jmeno,Uzivatel.prijmeni
FROM Uzivatel JOIN Objednavka ON Uzivatel.id_uzivatel = Objednavka.id_uzivatel
GROUP BY Uzivatel.jmeno, Uzivatel.prijmeni
HAVING COUNT(Objednavka.id_objednavka) >= 2

/*5; 2; 1; Stejny dotaz jako predchozi pouze napsany bez Spojovani tabulek*/
SELECT Uzivatel.jmeno,Uzivatel.prijmeni 
FROM Uzivatel
WHERE Uzivatel.id_uzivatel IN (
								SELECT id_uzivatel
								FROM Objednavka
								GROUP BY id_uzivatel
								HAVING COUNT(Objednavka.id_objednavka) >= 2
							  )

/*5; 3; 6; Vypiste nazvy vsech kategorii a k nim pocty telefonu.*/
SELECT Kategorie.id_kategorie,Kategorie.nazev,COUNT(Produkt.id_produkt) AS pocet_telefonu
FROM Kategorie LEFT JOIN produkt_kategorie ON Kategorie.id_kategorie = produkt_kategorie.id_kategorie
LEFT JOIN Produkt ON Produkt.id_produkt = produkt_kategorie.id_produkt
GROUP BY Kategorie.id_kategorie,Kategorie.nazev

/*5; 4; 2; Vypiste pro kazdeho uzivatele - (id, jmeno, prijmeni) a pocty jejich objednavek.*/
SELECT Uzivatel.id_uzivatel, Uzivatel.jmeno, Uzivatel.prijmeni, COUNT(Objednavka.id_objednavka) AS pocet
FROM Uzivatel LEFT JOIN Objednavka ON Uzivatel.id_uzivatel = Objednavka.id_uzivatel
WHERE Uzivatel.jmeno LIKE '%k'
GROUP BY Uzivatel.id_uzivatel, Uzivatel.jmeno, Uzivatel.prijmeni




/* 6; 1; 1; Dotaz, ktery vypise uzivatele s nejvetsim poctem objednavek  */
SELECT Uzivatel.id_uzivatel, Uzivatel.jmeno, Uzivatel.prijmeni, COUNT(Objednavka.id_objednavka) AS pocet
FROM projekt.Uzivatel LEFT JOIN projekt.Objednavka ON Uzivatel.id_uzivatel = Objednavka.id_uzivatel
GROUP BY Uzivatel.jmeno,Uzivatel.prijmeni, Uzivatel.id_uzivatel
HAVING COUNT(Objednavka.id_objednavka) =	( 
											SELECT MAX(pocet)
											FROM (
													SELECT COUNT(Objednavka.id_objednavka) AS pocet
													FROM projekt.Uzivatel LEFT JOIN projekt.Objednavka ON Uzivatel.id_uzivatel = Objednavka.id_uzivatel
													GROUP BY Uzivatel.id_uzivatel
												  ) t
											)





/* 6; 2; 3;Dotaz, ktery vypise produkty, ktere si alespon dva uzivatele koupili naposledy. */ 
SELECT id_produkt,nazev 
FROM (
		SELECT Produkt.id_produkt, Produkt.nazev, id_uzivatel  
		FROM projekt.Objednavka o1 JOIN Polozka_Objednavky ON o1.id_objednavka = Polozka_Objednavky.id_objednavka
		JOIN  projekt.Produkt ON Produkt.id_produkt = Polozka_Objednavky.id_produkt
		WHERE o1.datum_vytvoreni = (
								SELECT MAX(datum_vytvoreni)
								FROM projekt.Objednavka o2
								WHERE o1.id_uzivatel = o2.id_uzivatel
								)
	)t
GROUP BY id_produkt,nazev
HAVING COUNT(*) >= 2
