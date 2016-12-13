CREATE SCHEMA grma3240;

CREATE TABLE grma3240.Dalykas
(
	Nr		SMALLINT	NOT NULL CHECK(Nr>0),
	Pavadinimas	CHAR(15)	NOT NULL CONSTRAINT Raktas2 UNIQUE,
	PRIMARY KEY(Nr)
);

CREATE TABLE grma3240.Mokytojas
(
        Nr		SMALLINT	NOT NULL CHECK(Nr>0),
	Vardas		CHAR(15)	NOT NULL,
	Pavarde		CHAR(20)	NOT NULL,
	Telefono_nr	CHAR(12)	NOT NULL,
	Baigta_mokslo_istaiga	CHAR(15),
	Kvalifikacija	CHAR(20)	CONSTRAINT Kvalifikacijos
					CHECK(Kvalifikacija IN
					('Mokytojas','Vyresnysis mokytojas',
					'Metodininkas', 'Ekspertas'))
					DEFAULT 'Mokytojas',
	PRIMARY KEY (Nr)
);

CREATE TABLE grma3240.Klase
(
	Pavadinimas	CHAR(2)		NOT NULL,
	Aukletojas	SMALLINT	NOT NULL,
	PRIMARY KEY(Pavadinimas),
	FOREIGN KEY (Aukletojas)	
		REFERENCES grma3240.Mokytojas
		ON DELETE RESTRICT
		ON UPDATE CASCADE
);

CREATE TABLE grma3240.Mokinys
(
	Nr		SERIAL,
	Vardas		CHAR(15)	NOT NULL,
	Pavarde		CHAR(20)	NOT NULL,
	Klase		CHAR(2)		NOT NULL,
	Tevo_globejo_vardas	CHAR(15)	NOT NULL,
	Tevo_globejo_pavarde	CHAR(20)	NOT NULL,
	Telefono_nr	CHAR(12)	NOT NULL,
	Gatve		CHAR(15)	NOT NULL,
	Namas		SMALLINT	NOT NULL,
	Butas		SMALLINT	DEFAULT NULL,
	PRIMARY KEY (Nr),
	FOREIGN KEY(Klase) 
		REFERENCES grma3240.Klase
		ON DELETE RESTRICT
		ON UPDATE CASCADE
);

CREATE TABLE grma3240.Tvarkarastis
(
	Dalyko_nr SMALLINT,
	Klases_pav CHAR(2),
	PRIMARY KEY (Dalyko_nr, Klases_pav),
	FOREIGN KEY (Dalyko_nr) 
		REFERENCES grma3240.Dalykas
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY (Klases_pav)
		REFERENCES grma3240.Klase
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE grma3240.Mokymasis
(
	Mokinio_nr	SMALLINT	NOT NULL,
	Dalyko_nr	SMALLINT	NOT NULL,
	Pazymys		DECIMAL		CONSTRAINT PazymioAibe
					CHECK(Pazymys>=0 AND Pazymys<=10)
					DEFAULT 0,
	PRIMARY KEY(Mokinio_nr, Dalyko_nr),
	FOREIGN KEY(Mokinio_nr)
		REFERENCES grma3240.Mokinys
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY(Dalyko_nr)
		REFERENCES grma3240.Dalykas
		ON DELETE CASCADE
		ON UPDATE CASCADE		
);

CREATE TABLE grma3240.Mokymas
(
	Mokytojo_nr	SMALLINT NOT NULL,
	Dalyko_nr	SMALLINT NOT NULL,
	PRIMARY KEY(Mokytojo_nr, Dalyko_nr),
	FOREIGN KEY(Mokytojo_nr)
		REFERENCES grma3240.Mokytojas
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY(Dalyko_nr)
		REFERENCES grma3240.Dalykas
		ON DELETE RESTRICT
		ON UPDATE CASCADE
);