--Iterpti destomus dalykus
INSERT INTO grma3240.Dalykas VALUES(1,'Matematika');
INSERT INTO grma3240.Dalykas VALUES(2,'Lietuviu k.');
INSERT INTO grma3240.Dalykas VALUES(3,'Istorija');
INSERT INTO grma3240.Dalykas VALUES(4,'Fizika');
INSERT INTO grma3240.Dalykas VALUES(5,'Anglu k.');
INSERT INTO grma3240.Dalykas VALUES(6,'Chemija');
INSERT INTO grma3240.Dalykas VALUES(7,'Rusu k.');
INSERT INTO grma3240.Dalykas VALUES(8,'Etika');
INSERT INTO grma3240.Dalykas VALUES(9,'Tikyba');
INSERT INTO grma3240.Dalykas VALUES(10,'Muzika');
INSERT INTO grma3240.Dalykas VALUES(11,'Biologija');
INSERT INTO grma3240.Dalykas VALUES(12,'Geografija');
INSERT INTO grma3240.Dalykas VALUES(13,'Sokis');

--Iterpti mokytojus
INSERT INTO grma3240.Mokytojas VALUES (1, 'Birute', 'Kairiene', '868557064', 'VU', DEFAULT);
INSERT INTO grma3240.Mokytojas VALUES (2, 'Danielius', 'Datkunas', '862227241', 'VDU', 'Vyresnysis mokytojas');
INSERT INTO grma3240.Mokytojas VALUES (3, 'Romualdas', 'Baura', '864825321', 'VU', 'Metodininkas');
INSERT INTO grma3240.Mokytojas VALUES (4, 'Milda', 'Misiuniene', '868585634', 'VU', 'Metodininkas');
INSERT INTO grma3240.Mokytojas VALUES (5, 'Zita', 'Zarankiene', '867758644', 'KTU', DEFAULT);
INSERT INTO grma3240.Mokytojas VALUES (6, 'Gintaras', 'Stanislovenas', '868875632', 'Utenos kolegija', DEFAULT);
INSERT INTO grma3240.Mokytojas VALUES (7, 'Jonas', 'Jarmalavicius', '863656421', 'VU', 'Ekspertas');
INSERT INTO grma3240.Mokytojas VALUES (8, 'Audrone', 'Bitiene', '868555734', 'LEU', DEFAULT);
INSERT INTO grma3240.Mokytojas VALUES (9, 'Antanas', 'Stakys', '861025364', 'LEU', 'Vyresnysis mokytojas');
INSERT INTO grma3240.Mokytojas VALUES (10, 'Albinas', 'Pimputis', '865846321', 'KTU', 'Metodininkas');
INSERT INTO grma3240.Mokytojas VALUES (11, 'Birute', 'Andrikoviene', '899865345', 'VU', DEFAULT);
INSERT INTO grma3240.Mokytojas VALUES (12, 'Daiva', 'Dudeniene', '868965431', 'LEU', 'Ekspertas');

--Iterpti klases
INSERT INTO grma3240.Klase VALUES ('1A', 1);
INSERT INTO grma3240.Klase VALUES ('1B', 4);
INSERT INTO grma3240.Klase VALUES ('2A', 3);
INSERT INTO grma3240.Klase VALUES ('3A', 9);
INSERT INTO grma3240.Klase VALUES ('4A', 12);

--Iterpti mokytoju mokomus dalykus
INSERT INTO grma3240.Mokymas VALUES (1,3);
INSERT INTO grma3240.Mokymas VALUES (2,4);
INSERT INTO grma3240.Mokymas VALUES (3,2);
INSERT INTO grma3240.Mokymas VALUES (4,1);
INSERT INTO grma3240.Mokymas VALUES (5,6);
INSERT INTO grma3240.Mokymas VALUES (5,11);
INSERT INTO grma3240.Mokymas VALUES (6,9);
INSERT INTO grma3240.Mokymas VALUES (7,12);
INSERT INTO grma3240.Mokymas VALUES (8,10);
INSERT INTO grma3240.Mokymas VALUES (8,13);
INSERT INTO grma3240.Mokymas VALUES (9,8);
INSERT INTO grma3240.Mokymas VALUES (10,7);
INSERT INTO grma3240.Mokymas VALUES (11,5);
INSERT INTO grma3240.Mokymas VALUES (12,3);

--Iterpti klasems destomus dalykus
INSERT INTO grma3240.Tvarkarastis VALUES (1,'1A');
INSERT INTO grma3240.Tvarkarastis VALUES (2,'1A');
INSERT INTO grma3240.Tvarkarastis VALUES (3,'1B');
INSERT INTO grma3240.Tvarkarastis VALUES (4,'1B');
INSERT INTO grma3240.Tvarkarastis VALUES (5,'1B');
INSERT INTO grma3240.Tvarkarastis VALUES (2,'1B');
INSERT INTO grma3240.Tvarkarastis VALUES (3,'2A');
INSERT INTO grma3240.Tvarkarastis VALUES (4,'2A');
INSERT INTO grma3240.Tvarkarastis VALUES (5,'2A');
INSERT INTO grma3240.Tvarkarastis VALUES (8,'3A');
INSERT INTO grma3240.Tvarkarastis VALUES (9,'3A');
INSERT INTO grma3240.Tvarkarastis VALUES (10,'3A');
INSERT INTO grma3240.Tvarkarastis VALUES (6,'4A');
INSERT INTO grma3240.Tvarkarastis VALUES (7,'4A');
INSERT INTO grma3240.Tvarkarastis VALUES (11,'4A');
INSERT INTO grma3240.Tvarkarastis VALUES (12,'4A');
INSERT INTO grma3240.Tvarkarastis VALUES (13,'4A');
INSERT INTO grma3240.Tvarkarastis VALUES (2,'4A');
INSERT INTO grma3240.Tvarkarastis VALUES (3,'4A');
--Iterpti mokinius i 1A klase
INSERT INTO grma3240.Mokinys VALUES (DEFAULT, 'Jonas', 'Didziokas', '1A', 'Petras', 'Didziokas', '862227241', 'Aukstakalnio', 74, 1);
INSERT INTO grma3240.Mokinys VALUES (DEFAULT, 'Antane', 'Mietyte', '1A', 'Julija', 'Mietienie', '865869342', 'Taikos', 53, 27);
INSERT INTO grma3240.Mokinys VALUES (DEFAULT, 'Mindaugas', 'Zakarka', '1A', 'Julius', 'Zakarka', '868903227', 'Vaizganto', 3, 1);
INSERT INTO grma3240.Mokinys VALUES (DEFAULT, 'Mantas', 'Vadisius', '1A', 'Saule', 'Vadisiene', '860224551', 'Basanviciaus', 12, 31);
INSERT INTO grma3240.Mokinys VALUES (DEFAULT, 'Marius', 'Ambrazevicius', '1A', 'Algis', 'Ambrazevicius', '867803669', 'Birstono', 9, null);
INSERT INTO grma3240.Mokinys VALUES (DEFAULT, 'Jone', 'Abromaityte', '1A', 'Saulius', 'Abromaitis', '868978568', 'Eigulio', 103, 14);
INSERT INTO grma3240.Mokinys VALUES (DEFAULT, 'Jonas', 'Antonevicius', '1A', 'Petras', 'Antonevicius', '862227241', 'Aukstakalnio', 63, 3);
INSERT INTO grma3240.Mokinys VALUES (DEFAULT, 'Ieva', 'Streizyte', '1A', 'Laima', 'Streiziene', '862663058', 'Taikos', 27, null);
INSERT INTO grma3240.Mokinys VALUES (DEFAULT, 'Tomas', 'Mikulenas', '1A', 'Migle', 'Mikuleniene', '868520258', 'Aukstakalnio', 72, 29);
INSERT INTO grma3240.Mokinys VALUES (DEFAULT, 'Brigita', 'Varkaviciute', '1A', 'Asta', 'Varkaviciene', '869879630', 'Taikos', 42, 1);
INSERT INTO grma3240.Mokinys VALUES (DEFAULT, 'Migle', 'Vizbaraite', '1A', 'Alma', 'Vizbariene', '864561475', 'Ligonines', 4, null);
INSERT INTO grma3240.Mokinys VALUES (DEFAULT, 'Paulius', 'Buga', '1A', 'Lina', 'Deskeviciene', '869898695', 'Aukstakalnio', 76, 2);
INSERT INTO grma3240.Mokinys VALUES (DEFAULT, 'Rutenis', 'Vytas', '1A', 'Paulius', 'Vytas', '860212356', 'Maironio', 15, 68);
INSERT INTO grma3240.Mokinys VALUES (DEFAULT, 'Azuolas', 'Didziokas', '1A', 'Petras', 'Didziokas', '862227241', 'Aukstakalnio', 74, 1);
INSERT INTO grma3240.Mokinys VALUES (DEFAULT, 'Ieva', 'Malaiskaite', '1A', 'Asta', 'Malaiskiene', '867875206', 'Maironio', 4, 15);

--Iterpti i 1B klase
INSERT INTO grma3240.Mokinys VALUES (DEFAULT, 'Jonas', 'Andrikonis', '1B', 'Juozas', 'Andrikonis', '863571592', 'Smelio', 33, 1);
INSERT INTO grma3240.Mokinys VALUES (DEFAULT, 'Zigmas', 'Kuprevicius', '1B', 'Petras', 'Kuprevicius', '868557654', 'Ligonines', 14, null);

--Iterpti i 2A klase
INSERT INTO grma3240.Mokinys VALUES (DEFAULT, 'Antane', 'Vareikyte', '2A', 'Mindaugas', 'Vareikis', '869802584', 'Sodu', 24, null);
INSERT INTO grma3240.Mokinys VALUES (DEFAULT, 'Jonas', 'Didziokas', '2A', 'Marius', 'Didziokas', '860147325', 'Ausros', 45, 9);
INSERT INTO grma3240.Mokinys VALUES (DEFAULT, 'Jura', 'Aleksandraviciute', '2A', 'Irma', 'Aleksandraviciene', '860145239', 'Aukstakalnio', 74, 26);

--Iterpti i 3A klase
INSERT INTO grma3240.Mokinys VALUES (DEFAULT, 'Ugnius', 'Biguzas', '3A', 'Ignas', 'Biguzas', '861593265', 'Maironio', 86, 47);
INSERT INTO grma3240.Mokinys VALUES (DEFAULT, 'Ieva', 'Bernotaite', '3A', 'Ingrida', 'Bernotiene', '860326519', 'Sodu', 68, null);
INSERT INTO grma3240.Mokinys VALUES (DEFAULT, 'Algis', 'Sakalauskas', '3A', 'Petras', 'Sakalauskas', '866983214', 'Aukstakalnio', 23, 14);

--Iterpti i 4A klase
INSERT INTO grma3240.Mokinys VALUES (DEFAULT, 'Aiste', 'Kinduryte', '4A', 'Palmira', 'Kinduriene', '867832959', 'Ausros', 9, 45);

--Iterpti mokiniu besimokmus dalykus
--1A KLASE
INSERT INTO grma3240.Mokymasis VALUES (1,1,8.9);
INSERT INTO grma3240.Mokymasis VALUES (1,2,6);
INSERT INTO grma3240.Mokymasis VALUES (2,1,8.9);
INSERT INTO grma3240.Mokymasis VALUES (2,2,9.9);
INSERT INTO grma3240.Mokymasis VALUES (3,1,8.9);
INSERT INTO grma3240.Mokymasis VALUES (3,2,7.5);
INSERT INTO grma3240.Mokymasis VALUES (4,1,5.6);
INSERT INTO grma3240.Mokymasis VALUES (4,2,8.9);
INSERT INTO grma3240.Mokymasis VALUES (5,1,4);
INSERT INTO grma3240.Mokymasis VALUES (5,2,6.7);
INSERT INTO grma3240.Mokymasis VALUES (6,1,7.3);
INSERT INTO grma3240.Mokymasis VALUES (6,2,10);
INSERT INTO grma3240.Mokymasis VALUES (7,1,9);
INSERT INTO grma3240.Mokymasis VALUES (7,2,8.9);
INSERT INTO grma3240.Mokymasis VALUES (8,1,6.8);
INSERT INTO grma3240.Mokymasis VALUES (8,2,9);
INSERT INTO grma3240.Mokymasis VALUES (9,1,4);
INSERT INTO grma3240.Mokymasis VALUES (9,2,5);
INSERT INTO grma3240.Mokymasis VALUES (10,1,9.5);
INSERT INTO grma3240.Mokymasis VALUES (10,2,9.2);
INSERT INTO grma3240.Mokymasis VALUES (11,1,8.8);
INSERT INTO grma3240.Mokymasis VALUES (11,2,9.7);
INSERT INTO grma3240.Mokymasis VALUES (12,1,6.4);
INSERT INTO grma3240.Mokymasis VALUES (12,2,8.5);
INSERT INTO grma3240.Mokymasis VALUES (13,1,7.9);
INSERT INTO grma3240.Mokymasis VALUES (13,2,10);
INSERT INTO grma3240.Mokymasis VALUES (14,1,10);
INSERT INTO grma3240.Mokymasis VALUES (14,2,10);
INSERT INTO grma3240.Mokymasis VALUES (15,1,3.6);
INSERT INTO grma3240.Mokymasis VALUES (15,2,6.4);
--1B KLASE
INSERT INTO grma3240.Mokymasis VALUES (16,2,8.9);
INSERT INTO grma3240.Mokymasis VALUES (16,3,8.9);
INSERT INTO grma3240.Mokymasis VALUES (16,4,8.9);
INSERT INTO grma3240.Mokymasis VALUES (16,5,8.9);
INSERT INTO grma3240.Mokymasis VALUES (17,2,8.9);
INSERT INTO grma3240.Mokymasis VALUES (17,3,8.9);
INSERT INTO grma3240.Mokymasis VALUES (17,4,8.9);
INSERT INTO grma3240.Mokymasis VALUES (17,5,8.9);
--2A KLASE
INSERT INTO grma3240.Mokymasis VALUES (18,3,8.9);
INSERT INTO grma3240.Mokymasis VALUES (18,4,8.9);
INSERT INTO grma3240.Mokymasis VALUES (18,5,8.9);
INSERT INTO grma3240.Mokymasis VALUES (19,3,8.9);
INSERT INTO grma3240.Mokymasis VALUES (19,4,8.9);
INSERT INTO grma3240.Mokymasis VALUES (19,5,8.9);
INSERT INTO grma3240.Mokymasis VALUES (20,3,8.9);
INSERT INTO grma3240.Mokymasis VALUES (20,4,8.9);
INSERT INTO grma3240.Mokymasis VALUES (20,5,8.9);
--3A KLASE
INSERT INTO grma3240.Mokymasis VALUES (21,8,8.9);
INSERT INTO grma3240.Mokymasis VALUES (21,9,8.9);
INSERT INTO grma3240.Mokymasis VALUES (21,10,8.9);
INSERT INTO grma3240.Mokymasis VALUES (22,8,8.9);
INSERT INTO grma3240.Mokymasis VALUES (22,9,8.9);
INSERT INTO grma3240.Mokymasis VALUES (22,10,8.9);
INSERT INTO grma3240.Mokymasis VALUES (23,8,8.9);
INSERT INTO grma3240.Mokymasis VALUES (23,9,8.9);
INSERT INTO grma3240.Mokymasis VALUES (23,10,8.9);
--4A KLASE
INSERT INTO grma3240.Mokymasis VALUES (24,2,8.9);
INSERT INTO grma3240.Mokymasis VALUES (24,3,8.9);
INSERT INTO grma3240.Mokymasis VALUES (24,6,8.9);
INSERT INTO grma3240.Mokymasis VALUES (24,7,8.9);
INSERT INTO grma3240.Mokymasis VALUES (24,11,8.9);
INSERT INTO grma3240.Mokymasis VALUES (24,12,8.9);
INSERT INTO grma3240.Mokymasis VALUES (24,13,8.9);