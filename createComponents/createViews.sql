CREATE VIEW grma3240.Mokinio_vidurkis AS
	WITH Vidurkiai AS
		(SELECT Mokinio_nr, to_char(AVG(Pazymys), 'FM999999999.00') AS Vidurkis 
		FROM grma3240.Mokymasis 
		GROUP BY Mokinio_nr)
	SELECT	Nr,
		Vardas,
		Pavarde,
		Klase,
		Vidurkis
	FROM grma3240.Mokinys, Vidurkiai
	WHERE grma3240.Mokinys.Nr = Mokinio_nr;

CREATE VIEW grma3240.Aukletojai AS
	SELECT Vardas, Pavarde, Pavadinimas AS Klase
	FROM grma3240.Mokytojas, grma3240.Klase	
	WHERE grma3240.Mokytojas.Nr = grma3240.Klase.Aukletojas;

CREATE VIEW grma3240.Mokiniu_skaicius AS
	SELECT Klase, COUNT(*) AS "Mokiniu skaicius"
	FROM  grma3240.Mokinys
	GROUP BY Klase;