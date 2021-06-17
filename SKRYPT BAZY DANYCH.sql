
-- tables
-- Table: Basen
CREATE TABLE Basen (
    IdBasen int NOT NULL,
    Nazwa varchar(50) NOT NULL,
    Miasto varchar(50) NOT NULL,
    Ulica varchar(50) NOT NULL,
    CONSTRAINT Basen_pk PRIMARY KEY (IdBasen)
);

-- Table: Czlonek
CREATE TABLE Czlonek (
    Osoba_IdOsoba int NOT NULL,
    Ulubiony_styl varchar(30) NOT NULL,
    CONSTRAINT Czlonek_pk PRIMARY KEY (Osoba_IdOsoba)
);

-- Table: Osiagniecie
CREATE TABLE Osiagniecie (
    IdOsiagniecie int NOT NULL,
    Styl varchar(50) NOT NULL,
    Czas varchar(50) NOT NULL,
    Czlonek_Osoba_IdOsoba int NOT NULL,
    Zawody_IdZawody int NOT NULL,
    CONSTRAINT Osiagniecie_pk PRIMARY KEY (IdOsiagniecie)
);

-- Table: Osoba
CREATE TABLE Osoba (
    IdOsoba int NOT NULL,
    Imie varchar(50) NOT NULL,
    Nazwisko varchar(50) NOT NULL,
    Data_urodzenia date NOT NULL,
    Nr_kontaktowy varchar(25) NOT NULL,
    CONSTRAINT Osoba_pk PRIMARY KEY (IdOsoba)
);

-- Table: Trener
CREATE TABLE Trener (
    Osoba_IdOsoba int NOT NULL,
    Stopien_trenerski varchar(30) NOT NULL,
    CONSTRAINT Trener_pk PRIMARY KEY (Osoba_IdOsoba)
);

-- Table: Trening
CREATE TABLE Trening (
    IdTrening int NOT NULL,
    Godzina_rozpoczecia varchar(10) NOT NULL,
    Godzina_zakonczenia varchar(10) NOT NULL,
    Dzien_tygodnia varchar(10) NOT NULL,
    Trener_Osoba_IdOsoba int NOT NULL,
    Basen_IdBasen int NOT NULL,
    CONSTRAINT Trening_pk PRIMARY KEY (IdTrening)
);

-- Table: Zawody
CREATE TABLE Zawody (
    IdZawody int NOT NULL,
    Nazwa varchar(50) NOT NULL,
    Data_rozpoczecia date NOT NULL,
    Data_zakonczenia date NOT NULL,
    CONSTRAINT Zawody_pk PRIMARY KEY (IdZawody)
);

-- foreign keys
-- Reference: Czlonek_Osoba (table: Czlonek)
ALTER TABLE Czlonek ADD CONSTRAINT Czlonek_Osoba FOREIGN KEY (Osoba_IdOsoba)
    REFERENCES Osoba (IdOsoba);

-- Reference: Osiagniecie_Czlonek (table: Osiagniecie)
ALTER TABLE Osiagniecie ADD CONSTRAINT Osiagniecie_Czlonek FOREIGN KEY (Czlonek_Osoba_IdOsoba)
    REFERENCES Czlonek (Osoba_IdOsoba);

-- Reference: Osiagniecie_Zawody (table: Osiagniecie)
ALTER TABLE Osiagniecie ADD CONSTRAINT Osiagniecie_Zawody FOREIGN KEY (Zawody_IdZawody)
    REFERENCES Zawody (IdZawody);

-- Reference: Trener_Osoba (table: Trener)
ALTER TABLE Trener ADD CONSTRAINT Trener_Osoba FOREIGN KEY (Osoba_IdOsoba)
    REFERENCES Osoba (IdOsoba);

-- Reference: Trening_Basen (table: Trening)
ALTER TABLE Trening ADD CONSTRAINT Trening_Basen FOREIGN KEY (Basen_IdBasen)
    REFERENCES Basen (IdBasen);

-- Reference: Trening_Trener (table: Trening)
ALTER TABLE Trening ADD CONSTRAINT Trening_Trener FOREIGN KEY (Trener_Osoba_IdOsoba)
    REFERENCES Trener (Osoba_IdOsoba);

select * from osoba;
select * from czlonek;
select * from trener;
select * from osiagniecie;
select * from basen;
select * from zawody;
select * from trening;


INSERT INTO osoba
VALUES (1, 'Mateusz', 'Solecki', '1944-7-30', '123456789');
INSERT INTO osoba
VALUES (2, 'Jan', 'Kowalski', '2000-9-20', '456987123');
INSERT INTO osoba
VALUES (3, 'Marian', 'Nowak', '2003-1-23', '147852369');

INSERT INTO czlonek
VALUES (2, 'grzbietowy');
INSERT INTO czlonek
VALUES (3, 'kraul');

INSERT INTO trener
VALUES (1, 'mistrzowski');

INSERT INTO zawody
VALUES (1, 'Letnie Mistrzostwa Polski', '2021-6-27', '2021-6-29');
INSERT INTO zawody
VALUES (2, 'Zimowe Mistrzostwa Polski', '2021-12-12', '2021-12-15');

INSERT INTO osiagniecie
VALUES (1, '50m grzbietowym', '00:30:09', 2, 1);
INSERT INTO osiagniecie
VALUES (2, '100m grzbietowym', '01:05:40', 3, 1);
INSERT INTO osiagniecie
VALUES (3, '100m grzbietowym', '01:03:22', 2, 1);

INSERT INTO basen
VALUES (1, 'Muszelka', 'Warszawa', 'Balkonowa');

INSERT INTO trening
VALUES (1, '15:00', '17:00', 'wtorek', 1, 1);
INSERT INTO trening
VALUES (2, '17:00', '19:00', 'czwartek', 1, 1); 

-- koniec