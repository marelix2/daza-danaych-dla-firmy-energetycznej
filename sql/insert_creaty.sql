---------------------------------DROP------------------------------------------------
DROP TABLE Rachunki CASCADE CONSTRAINTS;
DROP TABLE Umowa CASCADE CONSTRAINTS;
DROP TABLE Klienci CASCADE CONSTRAINTS;
DROP TABLE Pracownicy CASCADE CONSTRAINTS;
DROP TABLE Oddzial CASCADE CONSTRAINTS;
DROP TABLE Firma CASCADE CONSTRAINTS;
DROP TABLE Linie CASCADE CONSTRAINTS;
DROP TABLE Transformator CASCADE CONSTRAINTS;
DROP TABLE Region CASCADE CONSTRAINTS;
DROP TABLE Linie_przesylowe CASCADE CONSTRAINTS;
DROP TABLE Elektrownia CASCADE CONSTRAINTS;

--------------------------------CREATE-----------------------------------------------
CREATE TABLE Elektrownia (
Id_elektrowni NUMBER CONSTRAINT elektrownia_pk PRIMARY KEY,
Rodzaj_elektrowni VARCHAR2(35) NOT NULL,
Nazwa_elektrowni VARCHAR2(40) NOT NULL,
Moc VARCHAR2(20) NOT NULL
);

CREATE TABLE Linie_przesylowe (
Id_linii_przesylowej NUMBER CONSTRAINT linie_przesylowe_pk PRIMARY KEY,
Rodzaj_inii_przesylowej VARCHAR2(40) NOT NULL,
Id_elektrowni NUMBER NOT NULL,
CONSTRAINT lp_el_fk FOREIGN KEY (Id_elektrowni) REFERENCES Elektrownia(Id_elektrowni)
);

CREATE TABLE Region (
Id_regionu NUMBER CONSTRAINT region_pk PRIMARY KEY,
Nazwa_regionu VARCHAR2(50) NOT NULL,
Id_linii_przesylowej NUMBER NOT NULL,
CONSTRAINT reg_lp_fk FOREIGN KEY (Id_linii_przesylowej) REFERENCES Linie_przesylowe(Id_linii_przesylowej)
);

CREATE TABLE Transformator (
Id_transformatora NUMBER CONSTRAINT transformator_pk PRIMARY KEY,
Rodzaj_transformatora VARCHAR2(40) NOT NULL,
Obszar VARCHAR2(40) NOT NULL,
Moc VARCHAR2(40) NOT NULL,
Id_regionu NUMBER NOT NULL,
CONSTRAINT tran_reg_fk FOREIGN KEY (Id_regionu) REFERENCES Region(Id_regionu)
);

CREATE TABLE Linie (
Id_linii NUMBER CONSTRAINT linia_pk PRIMARY KEY,
Id_regionu NUMBER NOT NULL,
Id_transformatora_wej NUMBER NOT NULL,
Id_transformatora_wyj NUMBER NOT NULL,
CONSTRAINT lin_reg_fk FOREIGN KEY (Id_regionu) REFERENCES Region(Id_regionu),
CONSTRAINT lin_tra_we_fk FOREIGN KEY (Id_transformatora_wej) REFERENCES Transformator(Id_transformatora),
CONSTRAINT lin_tra_wy_fk FOREIGN KEY (Id_transformatora_wyj) REFERENCES Transformator(Id_transformatora)
);


CREATE TABLE Firma (
Id_firmy NUMBER CONSTRAINT firma_pk PRIMARY KEY,
Nazwa_firmy VARCHAR2(40) NOT NULL,
Wlasciciel VARCHAR2(30) NOT NULL,
Kapital VARCHAR2(20) NOT NULL,
REGON NUMBER(14) NOT NULL,
NIP NUMBER(11) NOT NULL
);

CREATE TABLE Oddzial (
Id_oddzialu NUMBER CONSTRAINT oddzial_pk PRIMARY KEY,
Nazwa_oddzialu VARCHAR2(40) NOT NULL,
Id_regionu NUMBER NOT NULL,
Id_firmy NUMBER NOT NULL,
CONSTRAINT oddz_reg_fk FOREIGN KEY (Id_regionu) REFERENCES Region(Id_regionu),
CONSTRAINT oddz_fir_fk FOREIGN KEY (Id_firmy) REFERENCES Firma(Id_firmy)
);

CREATE TABLE Pracownicy (
Id_pracownika NUMBER CONSTRAINT pracownik_pk PRIMARY KEY,
Imie_pracownika VARCHAR2(35) NOT NULL,
Nazwisko_pracownika VARCHAR2(40) NOT NULL,
Pensja NUMBER(10) NOT NULL,
Id_oddzialu NUMBER NOT NULL,
CONSTRAINT pr_odz_fk FOREIGN KEY (Id_oddzialu) REFERENCES Oddzial(Id_oddzialu)
);

CREATE TABLE Klienci (
Id_klienta NUMBER CONSTRAINT klient_pk PRIMARY KEY,
Imie_klienta VARCHAR2(35) NOT NULL,
Nazwisko_klienta VARCHAR2(35) NOT NULL,
Adres_klienta VARCHAR2(35) NOT NULL,
Miasto VARCHAR2(35) NOT NULL,
PESEL NUMBER(12) UNIQUE
);

CREATE TABLE Umowa (
Id_umowy NUMBER CONSTRAINT  umow_pk PRIMARY KEY,
Rodzaj_umowy VARCHAR2(40) NOT NULL,
Id_klienta NUMBER NOT NULL,
Id_firmy NUMBER NOT NULL,
Id_linii NUMBER NOT NULL,
Data_zawarcia DATE,
Data_konca DATE,
CONSTRAINT um_kl_fk FOREIGN KEY (Id_klienta) REFERENCES Klienci(Id_klienta),
CONSTRAINT um_fir_fk FOREIGN KEY (Id_firmy) REFERENCES Firma(Id_firmy),
CONSTRAINT um_linia_fk FOREIGN KEY (Id_linii) REFERENCES Linie(Id_linii)
);

CREATE TABLE Rachunki (
Id_rachunku NUMBER CONSTRAINT rachunek_pk PRIMARY KEY,
Cena_pradu NUMBER(10,2) NOT NULL,
Zuzycie_w_kwh number(5) NOT NULL,
Id_umowy NUMBER NOT NULL,
CONSTRAINT rach_umo_fk FOREIGN KEY (Id_umowy) REFERENCES Umowa(Id_umowy)
);


---------------------------------DELETE------------------------------------------------
DELETE FROM  Rachunki;
DELETE FROM  Umowa;
DELETE FROM  Klienci;
DELETE FROM  Pracownicy;
DELETE FROM  Oddzial;
DELETE FROM  Firma;
DELETE FROM  Linie;
DELETE FROM  Transformator;
DELETE FROM  Region;
DELETE FROM  Linie_przesylowe;
DELETE FROM  Elektrownia;

--------------------------------INSERT-----------------------------------------------
INSERT INTO Elektrownia VALUES(1,'Elektrownia jadrowa','Elektrociep³ownia Gdansk','1500 MW');
INSERT INTO Elektrownia VALUES(2,'Elektrownia sloneczna','Elektrownia Szczecin','800 MW');
INSERT INTO Elektrownia VALUES(3,'Elektrownia wiatrowa','Elektrociep³ownia Warszawa','700 MW');
INSERT INTO Elektrownia VALUES(4,'Elektrownia geotermalna','Elektrociep³ownia Krakow','1400 MW');
INSERT INTO Elektrownia VALUES(5,'Elektrownia gazowa','Elektrownia Lublin','1150 MW');
INSERT INTO Elektrownia VALUES(6,'Elektrownia wodna','Elektrociep³ownia Rzeszów','380 MW');
INSERT INTO Elektrownia VALUES(7,'Elektrownia weglowa','Elektrownia Kielce','900 MW');
INSERT INTO Elektrownia VALUES(8,'Elektrownia weglowa','Elektrociep³ownia Katowice','750 MW');
INSERT INTO Elektrownia VALUES(9,'Elektrownia weglowa','Elektrociep³ownia Opole','1400 MW');
INSERT INTO Elektrownia VALUES(10,'Elektrownia wiatrowa','Elektrownia £ódŸ','890 MW');
INSERT INTO Elektrownia VALUES(11,'Elektrownia jadrowa','Elektrociep³ownia Poznañ','1500 MW');
INSERT INTO Elektrownia VALUES(12,'Elektrownia sloneczna','Elektrownia Wroclaw','800 MW');
INSERT INTO Elektrownia VALUES(13,'Elektrownia wiatrowa','Elektrociep³ownia Bialystok','700 MW');
INSERT INTO Elektrownia VALUES(14,'Elektrownia wodna','Elektrociep³ownia Bydgoszcz','380 MW');
INSERT INTO Elektrownia VALUES(15,'Elektrownia weglowa','Elektrownia Zielona Gora','900 MW');

INSERT INTO Linie_przesylowe VALUES(1,'Linia przesylowa kat. I',10);
INSERT INTO Linie_przesylowe VALUES(2,'Linia przesylowa kat. II',9);
INSERT INTO Linie_przesylowe VALUES(3,'Linia przesylowa kat. III',8);
INSERT INTO Linie_przesylowe VALUES(4,'Linia przesylowa kat. II',7);
INSERT INTO Linie_przesylowe VALUES(5,'Linia przesylowa kat. III',6);
INSERT INTO Linie_przesylowe VALUES(6,'Linia przesylowa kat. I',5);
INSERT INTO Linie_przesylowe VALUES(7,'Linia przesylowa kat. II',4);
INSERT INTO Linie_przesylowe VALUES(8,'Linia przesylowa kat. III',3);
INSERT INTO Linie_przesylowe VALUES(9,'Linia przesylowa kat. I',2);
INSERT INTO Linie_przesylowe VALUES(10,'Linia przesylowa kat. II',1);
INSERT INTO Linie_przesylowe VALUES(11,'Linia przesylowa kat. II',11);
INSERT INTO Linie_przesylowe VALUES(12,'Linia przesylowa kat. III',12);
INSERT INTO Linie_przesylowe VALUES(13,'Linia przesylowa kat. I',13);
INSERT INTO Linie_przesylowe VALUES(14,'Linia przesylowa kat. II',14);
INSERT INTO Linie_przesylowe VALUES(15,'Linia przesylowa kat. I',15);

INSERT INTO Region VALUES(1,'Pomorski',10);
INSERT INTO Region VALUES(2,'Zachodniopomorski',9);
INSERT INTO Region VALUES(3,'Mazowiecki',8);
INSERT INTO Region VALUES(4,'Malopolski',7);
INSERT INTO Region VALUES(5,'Lubelski',6);
INSERT INTO Region VALUES(6,'Podkarpacki',5);
INSERT INTO Region VALUES(7,'Swietokrzyski',4);
INSERT INTO Region VALUES(8,'Slaski',3);
INSERT INTO Region VALUES(9,'Opolski',2);
INSERT INTO Region VALUES(10,'£ódzki',1);
INSERT INTO Region VALUES(11,'Wielkopolski',11);
INSERT INTO Region VALUES(12,'Dolnoslaski',12);
INSERT INTO Region VALUES(13,'Podlaski',13);
INSERT INTO Region VALUES(14,'Kujawsko-pomorski',14);
INSERT INTO Region VALUES(15,'Lubuski',15);

INSERT INTO Transformator VALUES(1,'Transformator œredniego napiêcia,','Gdynia','131 000 V',1);
INSERT INTO Transformator VALUES(2,'Transformator œredniego napiêcia,','Koszalin','120 000 V',2);
INSERT INTO Transformator VALUES(3,'Transformator œredniego napiêcia,','Radom','110 000 V',3);
INSERT INTO Transformator VALUES(4,'Transformator œredniego napiêcia,','Nowy S¹cz','100 000 V',4);
INSERT INTO Transformator VALUES(5,'Transformator œredniego napiêcia,','Biala Podlaska','145 000 V',5);
INSERT INTO Transformator VALUES(6,'Transformator niskiego napiêcia,','Tarnobrzeg','11 000 V',6);
INSERT INTO Transformator VALUES(7,'Transformator niskiego napiêcia,','Jêdrzejów','13 000 V',7);
INSERT INTO Transformator VALUES(8,'Transformator niskiego napiêcia,','Sosnowiec','9 000 V',8);
INSERT INTO Transformator VALUES(9,'Transformator niskiego napiêcia,','Nysa','12 500 V',9);
INSERT INTO Transformator VALUES(10,'Transformator niskiego napiêcia,','Sieradz','10 500 V',10);
INSERT INTO Transformator VALUES(11,'Transformator wysokiego napiêcia,','Kalisz','400 000 V',11);
INSERT INTO Transformator VALUES(12,'Transformator wysokiego napiêcia,','Legnica','430 000 V',12);
INSERT INTO Transformator VALUES(13,'Transformator wysokiego napiêcia,','£om¿a','380 000 V',13);
INSERT INTO Transformator VALUES(14,'Transformator wysokiego napiêcia,','Toruñ','300 000 V',14);
INSERT INTO Transformator VALUES(15,'Transformator wysokiego napiêcia,','Gorzów Wielkopolski','410 000 V',15);

INSERT INTO Linie VALUES(1,1,1,6);
INSERT INTO Linie VALUES(2,1,1,7);
INSERT INTO Linie VALUES(3,1,1,8);
INSERT INTO Linie VALUES(4,2,2,4);
INSERT INTO Linie VALUES(5,2,2,4);
INSERT INTO Linie VALUES(6,2,2,5);
INSERT INTO Linie VALUES(7,3,3,8);
INSERT INTO Linie VALUES(8,3,3,7);
INSERT INTO Linie VALUES(9,3,3,7);
INSERT INTO Linie VALUES(10,4,4,6);
INSERT INTO Linie VALUES(11,4,4,10);
INSERT INTO Linie VALUES(12,4,4,10);
INSERT INTO Linie VALUES(13,5,5,10);
INSERT INTO Linie VALUES(14,5,5,8);
INSERT INTO Linie VALUES(15,5,5,7);
INSERT INTO Linie VALUES(16,6,3,6);
INSERT INTO Linie VALUES(17,6,4,6);
INSERT INTO Linie VALUES(18,6,2,6);
INSERT INTO Linie VALUES(19,7,3,7);
INSERT INTO Linie VALUES(20,7,2,7);
INSERT INTO Linie VALUES(21,7,1,7);
INSERT INTO Linie VALUES(22,8,2,8);
INSERT INTO Linie VALUES(23,8,3,8);
INSERT INTO Linie VALUES(24,8,4,8);
INSERT INTO Linie VALUES(25,9,5,9);
INSERT INTO Linie VALUES(26,9,2,9);
INSERT INTO Linie VALUES(27,9,1,9);
INSERT INTO Linie VALUES(28,10,10,2);
INSERT INTO Linie VALUES(29,10,10,2);
INSERT INTO Linie VALUES(30,10,10,3);
INSERT INTO Linie VALUES(31,11,11,5);
INSERT INTO Linie VALUES(32,11,11,2);
INSERT INTO Linie VALUES(33,11,11,4);
INSERT INTO Linie VALUES(34,12,12,4);
INSERT INTO Linie VALUES(35,12,12,5);
INSERT INTO Linie VALUES(36,12,12,3);
INSERT INTO Linie VALUES(37,13,13,2);
INSERT INTO Linie VALUES(38,13,13,1);
INSERT INTO Linie VALUES(39,13,13,1);
INSERT INTO Linie VALUES(40,14,14,1);
INSERT INTO Linie VALUES(41,14,14,3);
INSERT INTO Linie VALUES(42,14,14,4);
INSERT INTO Linie VALUES(43,15,15,5);
INSERT INTO Linie VALUES(44,15,15,6);
INSERT INTO Linie VALUES(45,15,15,7);

INSERT INTO Firma VALUES(1,'Krajowa Spolka Energetyczna','Jan Nowak','18689608290,00z³','006337638','536025054');
INSERT INTO Firma VALUES(2,'Energeon','Krzysztof Kowalski','9608290,00z³','006557638','518025054');
INSERT INTO Firma VALUES(3,'Energetyx','Adam Kwiatkowski','689608290,00z³','006997638','572025054');
INSERT INTO Firma VALUES(4,'Tuaronex','Aleksander Orzechowski','9608290,00z³','006337446','536025678');
INSERT INTO Firma VALUES(5,'Polskie Zaklady Energetyczne','Anna Platkowska','8689635750,00z³','005448638','554025087');
INSERT INTO Firma VALUES(6,'Polska Grupa Energetyczna','Michal Pieczaba','3218290,00z³','006987631','636025054');
INSERT INTO Firma VALUES(7,'Energix','Jerzy Solorz','9608290,00z³','006557638','118025054');
INSERT INTO Firma VALUES(8,'Energea','Adam Michnik','689608290,00z³','006997638','272025054');
INSERT INTO Firma VALUES(9,'Tauron','Aleksander Orzechowski','9608290,00z³','006337446','336025678');
INSERT INTO Firma VALUES(10,'Zaklad Energetyczny Okregu Kielce Radom','Anna Platkowska','89635750,00z³','005448638','754035087');
INSERT INTO Firma VALUES(11,'Polska Spolka Energii i Gazownictwa','Jan Nowak','1589608290,00z³','006337638','936025054');
INSERT INTO Firma VALUES(12,'Energy S.A.','Adam Kowalski','9908290,00z³','007557638','108025054');
INSERT INTO Firma VALUES(13,'American Energy in Poland','John Cena','19608290,00z³','008997638','882025054');
INSERT INTO Firma VALUES(14,'La Energione','Kuba Odyniec','9708290,00z³','009337446','777025678');
INSERT INTO Firma VALUES(15,'Enegria i Gornictwo S.A.','Julianna Ogorek','69635750,00z³','025448638','999025087');

INSERT INTO Oddzial VALUES(1,'Oddzial Obrotu',3,1);
INSERT INTO Oddzial VALUES(2,'Oddzial Dystrybucji',3,1);
INSERT INTO Oddzial VALUES(3,'Oddzial Informatyczny',3,1);
INSERT INTO Oddzial VALUES(4,'Oddzial Obrotu',3,2);
INSERT INTO Oddzial VALUES(5,'Oddzial Dystrybucji',3,2);
INSERT INTO Oddzial VALUES(6,'Oddzial Informatyczny',3,2);
INSERT INTO Oddzial VALUES(7,'Oddzial Obrotu',11,3);
INSERT INTO Oddzial VALUES(8,'Oddzial Dystrybucji',11,3);
INSERT INTO Oddzial VALUES(9,'Oddzial Informatyczny',11,3);
INSERT INTO Oddzial VALUES(10,'Oddzial Obrotu',4,4);
INSERT INTO Oddzial VALUES(11,'Oddzial Dystrybucji',4,4);
INSERT INTO Oddzial VALUES(12,'Oddzial Informatyczny',4,4);
INSERT INTO Oddzial VALUES(13,'Oddzial Obrotu',15,5);
INSERT INTO Oddzial VALUES(14,'Oddzial Dystrybucji',15,5);
INSERT INTO Oddzial VALUES(15,'Oddzial Informatyczny',15,5);

INSERT INTO Pracownicy VALUES(1,'Adam','B¹k','1500,00',1);
INSERT INTO Pracownicy VALUES(2,'Julian','B¹kiewicz','1800,00',1);
INSERT INTO Pracownicy VALUES(3,'Tomasz','Stermach','2500,00',1);
INSERT INTO Pracownicy VALUES(4,'Oskar','Kaminski','8500,00',1);
INSERT INTO Pracownicy VALUES(5,'Anna','Marszalek','3500,00',2);
INSERT INTO Pracownicy VALUES(6,'Damian','Krzywik','1700,00',2);
INSERT INTO Pracownicy VALUES(7,'Adrian','Prawda','1500,00',2);
INSERT INTO Pracownicy VALUES(8,'Andrzej','Gorzki','4700,00',2);
INSERT INTO Pracownicy VALUES(9,'Adrianna','B¹kiewicz','1600,00',3);
INSERT INTO Pracownicy VALUES(10,'Karolina','Nowak','9600,00',3);
INSERT INTO Pracownicy VALUES(11,'Mariusz','Królik','5600,00',3);
INSERT INTO Pracownicy VALUES(12,'Mariusz','Frankiewicz','2600,00',3);
INSERT INTO Pracownicy VALUES(13,'Adrianna','B¹kiewicz','5000,00',4);
INSERT INTO Pracownicy VALUES(14,'Artur','£uszczkiewicz','7600,00',4);
INSERT INTO Pracownicy VALUES(15,'Artur','Michalsli','1400,00',4);
INSERT INTO Pracownicy VALUES(16,'Pawel','Pawlikowski','1600,00',4);
INSERT INTO Pracownicy VALUES(17,'Andrzej','Œliwa','2600,00',5);
INSERT INTO Pracownicy VALUES(18,'Beata','Ko¿uchowska','1700,00',5);
INSERT INTO Pracownicy VALUES(19,'Franciszek','Jarosiñski','1500,00',5);
INSERT INTO Pracownicy VALUES(20,'Dominik','Wodecki','8200,00',5);
INSERT INTO Pracownicy VALUES(21,'Adam','PaŸdzioch','1500,00',6);
INSERT INTO Pracownicy VALUES(22,'Julian','Stal','1800,00',6);
INSERT INTO Pracownicy VALUES(23,'Tomasz','Silny','2500,00',6);
INSERT INTO Pracownicy VALUES(24,'Oskar','Slaby','8500,00',6);
INSERT INTO Pracownicy VALUES(25,'Anna','Kowalska','3500,00',7);
INSERT INTO Pracownicy VALUES(26,'Damian','Krzywda','1700,00',7);
INSERT INTO Pracownicy VALUES(27,'Adrian','Pocznik','1500,00',7);
INSERT INTO Pracownicy VALUES(28,'Andrzej','Slodowy','4700,00',7);
INSERT INTO Pracownicy VALUES(29,'Adrianna','Nowak','1600,00',8);
INSERT INTO Pracownicy VALUES(30,'Karolina','Kowalska','9600,00',8);
INSERT INTO Pracownicy VALUES(31,'Mariusz','Kwiatkowski','5600,00',8);
INSERT INTO Pracownicy VALUES(32,'Mariusz','W¹chala','2600,00',8);
INSERT INTO Pracownicy VALUES(33,'Adrianna','Nartowska','5000,00',9);
INSERT INTO Pracownicy VALUES(34,'Artur','Napotomny','7600,00',9);
INSERT INTO Pracownicy VALUES(35,'Artur','Michalski','1400,00',9);
INSERT INTO Pracownicy VALUES(36,'Pawel','Paw','1600,00',9);
INSERT INTO Pracownicy VALUES(37,'Andrzej','Kwiatkowski','2600,00',10);
INSERT INTO Pracownicy VALUES(38,'Beata','Ró¿alska','1700,00',10);
INSERT INTO Pracownicy VALUES(39,'Franciszek','Zaj¹c','1500,00',10);
INSERT INTO Pracownicy VALUES(40,'Dominik','Kieliœ','8200,00',10);
INSERT INTO Pracownicy VALUES(41,'Adam','Jackowski','1500,00',11);
INSERT INTO Pracownicy VALUES(42,'Julian','Koœmider','1800,00',11);
INSERT INTO Pracownicy VALUES(43,'Tomasz','Pietrucha','2500,00',11);
INSERT INTO Pracownicy VALUES(44,'Oskar','Purchala','8500,00',11);
INSERT INTO Pracownicy VALUES(45,'Anna','Terczynski','3500,00',12);
INSERT INTO Pracownicy VALUES(46,'Damian','Muszynski','1700,00',12);
INSERT INTO Pracownicy VALUES(47,'Adrian','Sawczak','1500,00',12);
INSERT INTO Pracownicy VALUES(48,'Andrzej','Baran','4700,00',12);
INSERT INTO Pracownicy VALUES(49,'Adrianna','Koziol','1600,00',13);
INSERT INTO Pracownicy VALUES(50,'Karolina','Nowak','9600,00',13);
INSERT INTO Pracownicy VALUES(51,'Mariusz','Zaj¹c','5600,00',13);
INSERT INTO Pracownicy VALUES(52,'Mariusz','Przylucki','2600,00',13);
INSERT INTO Pracownicy VALUES(53,'Adrianna','Czuba','5000,00',14);
INSERT INTO Pracownicy VALUES(54,'Artur','Pawlikowski','7600,00',14);
INSERT INTO Pracownicy VALUES(55,'Artur','Matys','1400,00',14);
INSERT INTO Pracownicy VALUES(56,'Pawel','Kamiñski','1600,00',14);
INSERT INTO Pracownicy VALUES(57,'Andrzej','Oczko','2600,00',15);
INSERT INTO Pracownicy VALUES(58,'Beata','Otto','1700,00',15);
INSERT INTO Pracownicy VALUES(59,'Franciszek','Grubba','1500,00',15);
INSERT INTO Pracownicy VALUES(60,'Dominik','Rzepecki','8200,00',15);



INSERT INTO Klienci VALUES(1,'Anna','Ciosk','Ul. Sloneczna 12','Gdynia','96062455555');
INSERT INTO Klienci VALUES(2,'Krzysztof','Kowalski','Ul. Wiejska 3/4','Koszalin','56062456845');
INSERT INTO Klienci VALUES(3,'Mariusz','Piotrowski','Ul. Glowackiego','Radom','76062468555');
INSERT INTO Klienci VALUES(4,'Tadeusz','Maliniak','Ul. Studencka 32','Nowy S¹cz','86062455965');
INSERT INTO Klienci VALUES(5,'Karol','Wojciechowski','Ul. Poznanska 22','Biala Podlaska','76062478555');
INSERT INTO Klienci VALUES(6,'Maciej','Radecki','Ul. Wroclawska 21','Tarnobrzeg','360624512355');
INSERT INTO Klienci VALUES(7,'Pawe³','Gruszczyñski','Ul. Kielecka 54','Jêdrzejów','46062445655');
INSERT INTO Klienci VALUES(8,'Pawe³','Laprus','Al. Pilsudskiego 67/9','Sosnowiec','56062852155');
INSERT INTO Klienci VALUES(9,'Robert','S³oma','Ul. Wesola 86/4','Nysa','66062454445');
INSERT INTO Klienci VALUES(10,'Kamila','Baran','Ul. Wiosenna 4/86','Sieradz','76062411155');
INSERT INTO Klienci VALUES(11,'Albert','Drozdowski','Ul. Mieszka I 4/2','Kalisz','86062422255');
INSERT INTO Klienci VALUES(12,'Henryk','Bista','Ul. Bliska 43','Legnica','96062453335');
INSERT INTO Klienci VALUES(13,'Marek','Makuszyñski','Ul. 11-ego Listopada 53','£om¿a','96062444455');
INSERT INTO Klienci VALUES(14,'Zbigniew','Michta','Ul. Jana Pawla II 12','Toruñ','56062466655');
INSERT INTO Klienci VALUES(15,'Katarzyna','Michalska','Ul. Torowa 36','Gorzów Wielkoposlki','66062477755');
INSERT INTO Klienci VALUES(16,'Anita','Kwiatkowska','Ul.Pochmurna 12','Gdynia','95062455555');
INSERT INTO Klienci VALUES(17,'Andrzej','Linda','Ul. Miejska 3/4','Koszalin','55062456845');
INSERT INTO Klienci VALUES(18,'Zbigniew','Pazura','Ul. Partyzantow 23','Radom','75062468555');
INSERT INTO Klienci VALUES(19,'Bartosz','Pasikowski','Ul. Orzechowa 32','Nowy S¹cz','85062455965');
INSERT INTO Klienci VALUES(20,'Bartlomiej','Kozidrak','Ul. Kielecka 22','Biala Podlaska','75062478555');
INSERT INTO Klienci VALUES(21,'Michal','Lewandowski','Ul. Nullo 21','Tarnobrzeg','350624512355');
INSERT INTO Klienci VALUES(22,'Boguslaw','Kaminski','Ul. Mogilska 54','Jêdrzejów','45062445655');
INSERT INTO Klienci VALUES(23,'Cezary','Stermach','Al. Staszica 67/9','Sosnowiec','55062852155');
INSERT INTO Klienci VALUES(24,'Filip','Galant','Ul. Mickiewicza 86/4','Nysa','65062454445');
INSERT INTO Klienci VALUES(25,'Karolina','Kisiel','Ul. Slowackiego 4/86','Sieradz','75062411155');
INSERT INTO Klienci VALUES(26,'Wiktor','Kieliœ','Ul. ¯eromskiego I 4/2','Kalisz','85062422255');
INSERT INTO Klienci VALUES(27,'Jaroslaw','Jarocha','Ul. Œciegiennego 43','Legnica','95062453335');
INSERT INTO Klienci VALUES(28,'Michal','Kripke','Ul. ¯elazna 53','£om¿a','95062444455');
INSERT INTO Klienci VALUES(29,'Henryk','Bauman','Ul. ¯ytnia 12','Toruñ','55062466655');
INSERT INTO Klienci VALUES(30,'Bartlomiej','Lewandowski','Ul. Kielecka 222','Biala Podlaska','74062478555');
INSERT INTO Klienci VALUES(31,'Michal','Prawda','Ul. Nullo 241','Tarnobrzeg','340624512355');
INSERT INTO Klienci VALUES(32,'Boguslaw','Andrzejewski','Ul. Mogilska 58','Jêdrzejów','44062445655');
INSERT INTO Klienci VALUES(33,'Cezary','Kwasniewski','Al. Staszica 67/4','Sosnowiec','54062852155');
INSERT INTO Klienci VALUES(34,'Filip','Duda','Ul. Mickiewicza 86/5','Nysa','6462454445');
INSERT INTO Klienci VALUES(35,'Karolina','Gmoch','Ul. Slowackiego 4/8','Sieradz','74062411155');
INSERT INTO Klienci VALUES(36,'Wiktor','Petru','Ul. ¯eromskiego I 54/2','Kalisz','84062422255');
INSERT INTO Klienci VALUES(37,'Jaroslaw','Balcerowicz','Ul. Œciegiennego 83','Legnica','94062453335');
INSERT INTO Klienci VALUES(38,'Michal','Kononowicz','Ul. ¯elazna 73','£om¿a','94062444455');
INSERT INTO Klienci VALUES(39,'Henryk','Baran','Ul. ¯ytnia 22','Toruñ','54062466655');
INSERT INTO Klienci VALUES(40,'Beata','Koziol','Ul. Grunwaldzka 56','Gorzów Wielkoposlki','33062477755');
INSERT INTO Klienci VALUES(41,'Anna','Ciosek','Ul. Sloneczna 32','Gdynia','93062455555');
INSERT INTO Klienci VALUES(42,'Krzysztof','Kowalsky','Ul. Wiejska 3/8','Koszalin','53062456845');
INSERT INTO Klienci VALUES(43,'Mariusz','Radziejewski','Ul. Glowackiego 7','Radom','73062468555');
INSERT INTO Klienci VALUES(44,'Tadeusz','Suchmiel','Ul. Studencka 82','Nowy S¹cz','83062455965');
INSERT INTO Klienci VALUES(45,'Karol','Podraza','Ul. Poznanska 62','Biala Podlaska','76032478555');
INSERT INTO Klienci VALUES(46,'Maciej','Œwider','Ul. Wroclawska 11','Tarnobrzeg','360623512355');
INSERT INTO Klienci VALUES(47,'Pawe³','Krawczyk','Ul. Kielecka 34','Jêdrzejów','46062435655');
INSERT INTO Klienci VALUES(48,'Pawe³','Fendrych','Al. Pilsudskiego 77/9','Sosnowiec','53062852155');
INSERT INTO Klienci VALUES(49,'Robert','Krupa','Ul. Wesola 36/4','Nysa','66062454345');
INSERT INTO Klienci VALUES(50,'Kamila','Bal','Ul. Wiosenna 4/6','Sieradz','76062431155');
INSERT INTO Klienci VALUES(51,'Albert','Witkowska','Ul. Mieszka I 4/4','Kalisz','83062422255');
INSERT INTO Klienci VALUES(52,'Henryk','Witkowski','Ul. Bliska 45','Legnica','96063453335');
INSERT INTO Klienci VALUES(53,'Marek','Krawczyk','Ul. 11-ego Listopada 3','£om¿a','96362444455');
INSERT INTO Klienci VALUES(54,'Zbigniew','Kowalski','Ul. Jana Pawla II 2','Toruñ','56362466655');
INSERT INTO Klienci VALUES(55,'Katarzyna','Nowak','Ul. Torowa 6','Gorzów Wielkoposlki','63062477755');
INSERT INTO Klienci VALUES(56,'Anita','Nowek','Ul.Pochmurna 2','Gdynia','95062455355');
INSERT INTO Klienci VALUES(57,'Andrzej','Kwiatkowski','Ul. Miejska 4','Koszalin','55032456845');
INSERT INTO Klienci VALUES(58,'Zbigniew','Andrzejewski','Ul. Partyzantow 3','Radom','75362468555');
INSERT INTO Klienci VALUES(59,'Bartosz','Honorata','Ul. Orzechowa 3','Nowy S¹cz','85063455965');
INSERT INTO Klienci VALUES(60,'Bartlomiej','Azymut','Ul. Pinczowska 32','Biala Podlaska','73062478555');
INSERT INTO Klienci VALUES(61,'Michal','Pla¿a','Ul. Nullo 71','Tarnobrzeg','350624532355');
INSERT INTO Klienci VALUES(62,'Boguslaw','Melfi','Ul. Mogilska 44','Jêdrzejów','45032445655');
INSERT INTO Klienci VALUES(63,'Cezary','Corleone','Al. Staszica 7/9','Sosnowiec','55362852155');
INSERT INTO Klienci VALUES(64,'Filip','Radowicz','Ul. Mickiewicza 6/4','Nysa','65063454445');
INSERT INTO Klienci VALUES(65,'Karolina','Radziwil','Ul. Slowackiego 4/6','Sieradz','75362411155');
INSERT INTO Klienci VALUES(66,'Wiktor','Binkowski','Ul. ¯eromskiego I 4/8','Kalisz','85362422255');
INSERT INTO Klienci VALUES(67,'Jaroslaw','Kubuœ','Ul. Œciegiennego 48','Legnica','95062353335');
INSERT INTO Klienci VALUES(68,'Michal','Kamiñski','Ul. ¯elazna 58','£om¿a','95062444355');
INSERT INTO Klienci VALUES(69,'Henryk','Wardecki','Ul. ¯ytnia 18','Toruñ','55062463655');
INSERT INTO Klienci VALUES(70,'Beata','Lato','Ul. Grunwaldzka 38','Gorzów Wielkoposlki','65062473755');

 INSERT INTO Umowa VALUES(1,'Umowa G11–jednostrefowa taryfa,',1,1,1,'2011-01-07','2018-01-01');
INSERT INTO Umowa VALUES(2,'Umowa G11P-taryfa przedp³atowa',2,1,1,'2012-02-05','2019-02-02');
INSERT INTO Umowa VALUES(3,'Umowa G11–jednostrefowa taryfa,',3,1,2,'2013-03-02','2020-03-03');
INSERT INTO Umowa VALUES(4,'Umowa G12–dwustrefowa  taryfa,',4,1,2,'2014-04-02','2020-04-12');
INSERT INTO Umowa VALUES(5,'Umowa G12–dwustrefowa  taryfa,',5,1,3,'2015-05-29','2020-05-12');
INSERT INTO Umowa VALUES(6,'Umowa G11–jednostrefowa taryfa,',6,1,3,'2011-06-24','2022-06-05');
INSERT INTO Umowa VALUES(7,'Umowa G11–jednostrefowa taryfa,',7,1,4,'2012-07-22','2025-07-12');
INSERT INTO Umowa VALUES(8,'Umowa G12–dwustrefowa  taryfa,',8,1,4,'2013-01-19','2026-08-15');
INSERT INTO Umowa VALUES(9,'Umowa G11P-taryfa przedp³atowa',9,1,5,'2014-02-17','2023-09-06');
INSERT INTO Umowa VALUES(10,'Umowa G11–jednostrefowa taryfa,',10,1,5,'2015-04-13','2019-01-30');
INSERT INTO Umowa VALUES(11,'Umowa G11–jednostrefowa taryfa,',11,1,6,'2011-02-07','2019-11-30');
INSERT INTO Umowa VALUES(12,'Umowa G12–dwustrefowa  taryfa,',12,1,6,'2012-03-05','2019-12-07');
INSERT INTO Umowa VALUES(13,'Umowa G11–jednostrefowa taryfa,',13,1,7,'2013-04-02','2018-02-12');
INSERT INTO Umowa VALUES(14,'Umowa G11P-taryfa przedp³atowa',3,1,7,'2014-12-02','2018-02-25');
INSERT INTO Umowa VALUES(15,'Umowa G11–jednostrefowa taryfa,',4,5,1,'2015-11-01','2017-02-08');
INSERT INTO Umowa VALUES(16,'Umowa G12–dwustrefowa  taryfa,',15,3,1,'2011-11-01','2017-04-12');
INSERT INTO Umowa VALUES(17,'Umowa G11–jednostrefowa taryfa,',2,1,1,'2012-10-01','2017-04-28');
INSERT INTO Umowa VALUES(18,'Umowa G12–dwustrefowa  taryfa,',3,1,2,'2013-09-19','2017-05-09');
INSERT INTO Umowa VALUES(19,'Umowa G12–dwustrefowa  taryfa,',4,1,2,'2014-08-17','2020-08-12');
INSERT INTO Umowa VALUES(20,'Umowa G11–jednostrefowa taryfa,',4,2,2,'2014-09-03','2023-08-27');
INSERT INTO Umowa VALUES(21,'Umowa G11–jednostrefowa taryfa,',15,2,8,'2010-02-07','2019-01-10');
INSERT INTO Umowa VALUES(22,'Umowa G11P-taryfa przedp³atowa',16,2,8,'2011-03-05','2020-02-12');
INSERT INTO Umowa VALUES(23,'Umowa G11–jednostrefowa taryfa,',17,2,9,'2012-04-02','2021-03-26');
INSERT INTO Umowa VALUES(24,'Umowa G12–dwustrefowa  taryfa,',18,2,9,'2013-05-02','2021-04-11');
INSERT INTO Umowa VALUES(25,'Umowa G12–dwustrefowa  taryfa,',19,2,10,'2013-06-29','2021-05-25');
INSERT INTO Umowa VALUES(26,'Umowa G11–jednostrefowa taryfa,',20,2,10,'2010-07-24','2023-06-12');
INSERT INTO Umowa VALUES(27,'Umowa G11–jednostrefowa taryfa,',21,2,11,'2011-08-22','2026-07-24');
INSERT INTO Umowa VALUES(28,'Umowa G12–dwustrefowa  taryfa,',23,2,11,'2012-02-19','2027-08-12');
INSERT INTO Umowa VALUES(29,'Umowa G11P-taryfa przedp³atowa',24,2,12,'2013-03-17','2024-09-23');
INSERT INTO Umowa VALUES(30,'Umowa G11–jednostrefowa taryfa,',25,2,12,'2014-02-13','2022-01-12');
INSERT INTO Umowa VALUES(31,'Umowa G11–jednostrefowa taryfa,',26,2,13,'2010-06-07','2019-11-22');
INSERT INTO Umowa VALUES(32,'Umowa G12–dwustrefowa  taryfa,',27,2,13,'2011-04-05','2020-12-21');
INSERT INTO Umowa VALUES(33,'Umowa G11–jednostrefowa taryfa,',28,2,14,'2013-05-02','2018-02-13');
INSERT INTO Umowa VALUES(34,'Umowa G11P-taryfa przedp³atowa',15,2,8,'2014-11-02','2018-02-12');
INSERT INTO Umowa VALUES(35,'Umowa G11–jednostrefowa taryfa,',20,2,10,'2014-12-01','2013-02-20');
INSERT INTO Umowa VALUES(36,'Umowa G12–dwustrefowa  taryfa,',20,2,10,'2010-12-01','2014-04-12');
INSERT INTO Umowa VALUES(37,'Umowa G11–jednostrefowa taryfa,',21,2,11,'2011-09-01','2018-04-14');
INSERT INTO Umowa VALUES(38,'Umowa G12–dwustrefowa  taryfa,',19,2,10,'2012-08-19','2018-05-19');
INSERT INTO Umowa VALUES(39,'Umowa G12–dwustrefowa  taryfa,',18,2,9,'2013-09-17','2021-08-12');
INSERT INTO Umowa VALUES(40,'Umowa G11–jednostrefowa taryfa,',17,2,9,'2013-09-03','2021-08-18');
INSERT INTO Umowa VALUES(41,'Umowa G11–jednostrefowa taryfa,',29,3,14,'2011-02-01','2018-01-15');
INSERT INTO Umowa VALUES(42,'Umowa G11P-taryfa przedp³atowa',30,3,15,'2012-03-02','2019-02-17');
INSERT INTO Umowa VALUES(43,'Umowa G11–jednostrefowa taryfa,',31,3,15,'2013-03-03','2020-03-16');
INSERT INTO Umowa VALUES(44,'Umowa G12–dwustrefowa  taryfa,',32,3,16,'2014-03-04','2020-04-12');
INSERT INTO Umowa VALUES(45,'Umowa G12–dwustrefowa  taryfa,',33,3,17,'2015-02-05','2020-05-16');
INSERT INTO Umowa VALUES(46,'Umowa G11–jednostrefowa taryfa,',34,3,17,'2011-04-06','2022-06-15');
INSERT INTO Umowa VALUES(47,'Umowa G11–jednostrefowa taryfa,',35,3,18,'2012-05-07','2025-07-12');
INSERT INTO Umowa VALUES(48,'Umowa G12–dwustrefowa  taryfa,',36,3,18,'2013-08-08','2026-08-14');
INSERT INTO Umowa VALUES(49,'Umowa G11P-taryfa przedp³atowa',37,3,19,'2014-12-10','2023-09-17');
INSERT INTO Umowa VALUES(50,'Umowa G11–jednostrefowa taryfa,',38,1,19,'2015-02-13','2019-01-12');
INSERT INTO Umowa VALUES(51,'Umowa G11–jednostrefowa taryfa,',39,3,20,'2011-12-07','2019-11-13');
INSERT INTO Umowa VALUES(52,'Umowa G12–dwustrefowa  taryfa,',41,3,20,'2012-01-05','2019-12-12');
INSERT INTO Umowa VALUES(53,'Umowa G11–jednostrefowa taryfa,',42,3,21,'2013-02-09','2018-02-18');
INSERT INTO Umowa VALUES(54,'Umowa G11P-taryfa przedp³atowa',29,3,14,'2014-10-02','2018-02-11');
INSERT INTO Umowa VALUES(55,'Umowa G11–jednostrefowa taryfa,',29,3,14,'2015-09-11','2017-02-12');
INSERT INTO Umowa VALUES(56,'Umowa G12–dwustrefowa  taryfa,',30,3,15,'2011-09-01','2017-04-19');
INSERT INTO Umowa VALUES(57,'Umowa G11–jednostrefowa taryfa,',38,3,19,'2012-09-13','2017-04-10');
INSERT INTO Umowa VALUES(58,'Umowa G12–dwustrefowa  taryfa,',36,3,18,'2013-07-19','2017-05-12');
INSERT INTO Umowa VALUES(59,'Umowa G12–dwustrefowa  taryfa,',34,3,17,'2014-04-15','2020-08-20');
INSERT INTO Umowa VALUES(60,'Umowa G11–jednostrefowa taryfa,',27,3,13,'2014-05-03','2023-08-12');
INSERT INTO Umowa VALUES(61,'Umowa G11–jednostrefowa taryfa,',43,4,21,'2010-03-16','2019-01-09');
INSERT INTO Umowa VALUES(62,'Umowa G11P-taryfa przedp³atowa',44,4,21,'2011-01-05','2020-02-21');
INSERT INTO Umowa VALUES(63,'Umowa G11–jednostrefowa taryfa,',44,4,21,'2012-03-17','2021-03-12');
INSERT INTO Umowa VALUES(64,'Umowa G12–dwustrefowa  taryfa,',45,4,22,'2013-01-02','2021-04-08');
INSERT INTO Umowa VALUES(65,'Umowa G12–dwustrefowa  taryfa,',45,4,22,'2013-02-18','2021-05-12');
INSERT INTO Umowa VALUES(66,'Umowa G11–jednostrefowa taryfa,',46,4,23,'2010-08-24','2023-06-22');
INSERT INTO Umowa VALUES(67,'Umowa G11–jednostrefowa taryfa,',47,4,23,'2011-10-19','2026-07-07');
INSERT INTO Umowa VALUES(68,'Umowa G12–dwustrefowa  taryfa,',48,4,24,'2012-11-19','2027-08-23');
INSERT INTO Umowa VALUES(69,'Umowa G11P-taryfa przedp³atowa',49,4,24,'2013-12-20','2024-09-12');
INSERT INTO Umowa VALUES(70,'Umowa G11–jednostrefowa taryfa,',50,4,25,'2014-06-13','2022-01-06');
INSERT INTO Umowa VALUES(71,'Umowa G11–jednostrefowa taryfa,',51,4,25,'2010-06-21','2019-11-24');
INSERT INTO Umowa VALUES(72,'Umowa G12–dwustrefowa  taryfa,',52,4,26,'2011-02-05','2020-12-12');
INSERT INTO Umowa VALUES(73,'Umowa G11–jednostrefowa taryfa,',53,4,26,'2013-01-02','2018-02-12');
INSERT INTO Umowa VALUES(74,'Umowa G11P-taryfa przedp³atowa',54,4,27,'2014-11-22','2018-02-05');
INSERT INTO Umowa VALUES(75,'Umowa G11–jednostrefowa taryfa,',55,4,27,'2014-01-01','2013-02-12');
INSERT INTO Umowa VALUES(76,'Umowa G12–dwustrefowa  taryfa,',56,4,28,'2010-12-23','2014-04-25');
INSERT INTO Umowa VALUES(77,'Umowa G11–jednostrefowa taryfa,',56,4,28,'2011-02-01','2018-04-12');
INSERT INTO Umowa VALUES(78,'Umowa G12–dwustrefowa  taryfa,',57,4,29,'2012-10-25','2018-05-04');
INSERT INTO Umowa VALUES(79,'Umowa G12–dwustrefowa  taryfa,',58,4,40,'2013-07-24','2021-08-03');
INSERT INTO Umowa VALUES(80,'Umowa G11–jednostrefowa taryfa,',59,4,29,'2013-04-26','2021-08-27');
INSERT INTO Umowa VALUES(81,'Umowa G11–jednostrefowa taryfa,',60,4,30,'2013-04-26','2021-08-27');
INSERT INTO Umowa VALUES(82,'Umowa G11–jednostrefowa taryfa,',61,5,39,'2014-02-13','2022-01-12');
INSERT INTO Umowa VALUES(83,'Umowa G11–jednostrefowa taryfa,',62,5,31,'2010-06-07','2019-11-22');
INSERT INTO Umowa VALUES(84,'Umowa G12–dwustrefowa  taryfa,',64,5,31,'2011-04-05','2020-12-21');
INSERT INTO Umowa VALUES(85,'Umowa G11–jednostrefowa taryfa,',65,5,32,'2013-05-02','2018-02-13');
INSERT INTO Umowa VALUES(86,'Umowa G11P-taryfa przedp³atowa',66,5,32,'2014-11-02','2018-02-12');
INSERT INTO Umowa VALUES(87,'Umowa G11–jednostrefowa taryfa,',67,5,34,'2014-12-01','2013-02-20');
INSERT INTO Umowa VALUES(88,'Umowa G12–dwustrefowa  taryfa,',68,5,35,'2010-12-01','2014-04-12');
INSERT INTO Umowa VALUES(89,'Umowa G11–jednostrefowa taryfa,',69,5,36,'2011-09-01','2018-04-14');
INSERT INTO Umowa VALUES(90,'Umowa G12–dwustrefowa  taryfa,',70,5,37,'2012-08-19','2018-05-19');

INSERT INTO Rachunki VALUES(1,0.65,330,1);
INSERT INTO Rachunki VALUES(2,0.90,430,2);
INSERT INTO Rachunki VALUES(3,0.65,530,3);
INSERT INTO Rachunki VALUES(4,0.70,450,4);
INSERT INTO Rachunki VALUES(5,0.70,430,5);
INSERT INTO Rachunki VALUES(6,0.65,650,6);
INSERT INTO Rachunki VALUES(7,0.65,210,7);
INSERT INTO Rachunki VALUES(8,0.70,320,8);
INSERT INTO Rachunki VALUES(9,0.90,7860,9);
INSERT INTO Rachunki VALUES(10,0.65,4530,10);
INSERT INTO Rachunki VALUES(11,0.65,340,11);
INSERT INTO Rachunki VALUES(12,0.70,330,12);
INSERT INTO Rachunki VALUES(13,0.65,360,13);
INSERT INTO Rachunki VALUES(14,0.90,380,14);
INSERT INTO Rachunki VALUES(15,0.65,430,15);
INSERT INTO Rachunki VALUES(16,0.60,240,16);
INSERT INTO Rachunki VALUES(17,0.65,870,17);
INSERT INTO Rachunki VALUES(18,0.70,320,18);
INSERT INTO Rachunki VALUES(19,0.70,890,19);
INSERT INTO Rachunki VALUES(20,0.65,950,20);
INSERT INTO Rachunki VALUES(21,0.65,930,21);
INSERT INTO Rachunki VALUES(22,0.90,750,22);
INSERT INTO Rachunki VALUES(23,0.65,730,23);
INSERT INTO Rachunki VALUES(24,0.70,530,24);
INSERT INTO Rachunki VALUES(25,0.70,630,25);
INSERT INTO Rachunki VALUES(26,0.65,730,26);
INSERT INTO Rachunki VALUES(27,0.65,830,27);
INSERT INTO Rachunki VALUES(28,0.70,330,28);
INSERT INTO Rachunki VALUES(29,0.90,430,29);
INSERT INTO Rachunki VALUES(30,0.65,350,30);
INSERT INTO Rachunki VALUES(31,0.65,360,31);
INSERT INTO Rachunki VALUES(32,0.70,370,32);
INSERT INTO Rachunki VALUES(33,0.65,390,33);
INSERT INTO Rachunki VALUES(34,0.90,330,34);
INSERT INTO Rachunki VALUES(35,0.65,410,35);
INSERT INTO Rachunki VALUES(36,0.70,380,36);
INSERT INTO Rachunki VALUES(37,0.65,370,37);
INSERT INTO Rachunki VALUES(38,0.70,908,38);
INSERT INTO Rachunki VALUES(39,0.70,330,39);
INSERT INTO Rachunki VALUES(40,0.65,430,40);
INSERT INTO Rachunki VALUES(41,0.65,3430,41);
INSERT INTO Rachunki VALUES(42,0.90,420,42);
INSERT INTO Rachunki VALUES(43,0.65,410,43);
INSERT INTO Rachunki VALUES(44,0.70,450,44);
INSERT INTO Rachunki VALUES(45,0.70,470,45);
INSERT INTO Rachunki VALUES(46,0.65,490,46);
INSERT INTO Rachunki VALUES(47,0.65,340,47);
INSERT INTO Rachunki VALUES(48,0.70,530,48);
INSERT INTO Rachunki VALUES(49,0.90,520,49);
INSERT INTO Rachunki VALUES(50,0.65,510,50);
INSERT INTO Rachunki VALUES(51,0.65,330,51);
INSERT INTO Rachunki VALUES(52,0.70,580,52);
INSERT INTO Rachunki VALUES(53,0.65,570,53);
INSERT INTO Rachunki VALUES(54,0.90,560,54);
INSERT INTO Rachunki VALUES(55,0.65,4530,55);
INSERT INTO Rachunki VALUES(56,0.70,5800,56);
INSERT INTO Rachunki VALUES(57,0.65,430,57);
INSERT INTO Rachunki VALUES(58,0.70,343,58);
INSERT INTO Rachunki VALUES(59,0.70,230,59);
INSERT INTO Rachunki VALUES(60,0.65,130,60);
INSERT INTO Rachunki VALUES(61,0.65,120,61);
INSERT INTO Rachunki VALUES(62,0.90,180,62);
INSERT INTO Rachunki VALUES(63,0.65,170,63);
INSERT INTO Rachunki VALUES(64,0.70,130,64);
INSERT INTO Rachunki VALUES(65,0.70,250,65);
INSERT INTO Rachunki VALUES(66,0.65,260,66);
INSERT INTO Rachunki VALUES(67,0.65,270,67);
INSERT INTO Rachunki VALUES(68,0.70,300,68);
INSERT INTO Rachunki VALUES(69,0.90,320,69);
INSERT INTO Rachunki VALUES(70,0.65,380,70);
INSERT INTO Rachunki VALUES(71,0.65,340,71);
INSERT INTO Rachunki VALUES(72,0.70,510,72);
INSERT INTO Rachunki VALUES(73,0.65,6320,73);
INSERT INTO Rachunki VALUES(74,0.90,640,74);
INSERT INTO Rachunki VALUES(75,0.65,210,75);
INSERT INTO Rachunki VALUES(76,0.70,740,76);
INSERT INTO Rachunki VALUES(77,0.65,720,77);
INSERT INTO Rachunki VALUES(78,0.70,190,78);
INSERT INTO Rachunki VALUES(79,0.70,140,79);
INSERT INTO Rachunki VALUES(80,0.65,110,80);
INSERT INTO Rachunki VALUES(81,0.65,100,81);
INSERT INTO Rachunki VALUES(82,0.65,130,82);
INSERT INTO Rachunki VALUES(83,0.65,150,83);
INSERT INTO Rachunki VALUES(84,0.70,170,84);
INSERT INTO Rachunki VALUES(85,0.65,400,85);
INSERT INTO Rachunki VALUES(86,0.90,450,86);
INSERT INTO Rachunki VALUES(87,0.65,620,87);
INSERT INTO Rachunki VALUES(88,0.70,680,88);
INSERT INTO Rachunki VALUES(89,0.65,670,89);
INSERT INTO Rachunki VALUES(90,0.70,690,90);