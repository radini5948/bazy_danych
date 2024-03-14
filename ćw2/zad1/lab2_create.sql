-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2024-03-13 20:37:52.797

-- tables
-- Table: Artykuly
CREATE TABLE Artykuly (
    IDZamowienia int  NOT NULL,
    IDPudelka int  NOT NULL,
    Sztuk int  NOT NULL,
    Zamowienia_IDZamowienia int  NOT NULL,
    Zamowienia_IDKlienta int  NOT NULL,
    CONSTRAINT Artykuly_pk PRIMARY KEY (IDZamowienia,IDPudelka)
);

-- Table: Czekoladki
CREATE TABLE Czekoladki (
    IdCzekoladki varchar(3)  NOT NULL,
    Nazwa varchar(255)  NOT NULL,
    RodzajCzekolady varchar(255)  NOT NULL,
    RodzajOrzecha varchar(255)  NOT NULL,
    Opis varchar(255)  NOT NULL,
    Koszt money  NOT NULL,
    Masa int  NOT NULL,
    Zawartosc_IDPudelka varchar(4)  NOT NULL,
    Zawartosc_IdCzekoladki varchar(3)  NOT NULL,
    CONSTRAINT Czekoladki_pk PRIMARY KEY (IdCzekoladki)
);

-- Table: Klienci
CREATE TABLE Klienci (
    IDKlienta int  NOT NULL,
    Nazwa varchar(255)  NOT NULL,
    Ulica varchar(255)  NOT NULL,
    Miejscowość varchar(255)  NOT NULL,
    Kod char(6)  NOT NULL,
    Telefon char(9)  NOT NULL,
    CONSTRAINT Klienci_pk PRIMARY KEY (IDKlienta)
);

-- Table: Pudelka
CREATE TABLE Pudelka (
    IDPudelka int  NOT NULL,
    Nazwa varchar(255)  NOT NULL,
    Opis varchar(255)  NOT NULL,
    Cena money  NOT NULL,
    Stan int  NOT NULL,
    Artykuly_IDZamowienia int  NOT NULL,
    Artykuly_IDPudelka int  NOT NULL,
    CONSTRAINT Pudelka_pk PRIMARY KEY (IDPudelka)
);

-- Table: Zamowienia
CREATE TABLE Zamowienia (
    IDZamowienia int  NOT NULL,
    IDKlienta int  NOT NULL,
    DataRealizacji varchar(255)  NOT NULL,
    Klienci_IDKlienta int  NOT NULL,
    CONSTRAINT Zamowienia_pk PRIMARY KEY (IDZamowienia,IDKlienta)
);

-- Table: Zawartosc
CREATE TABLE Zawartosc (
    IDPudelka varchar(4)  NOT NULL,
    IdCzekoladki varchar(3)  NOT NULL,
    Sztuk int  NOT NULL,
    Pudelka_IDPudelka int  NOT NULL,
    CONSTRAINT Zawartosc_pk PRIMARY KEY (IDPudelka,IdCzekoladki)
);

-- foreign keys
-- Reference: Artykuly_Zamowienia (table: Artykuly)
ALTER TABLE Artykuly ADD CONSTRAINT Artykuly_Zamowienia
    FOREIGN KEY (Zamowienia_IDZamowienia, Zamowienia_IDKlienta)
    REFERENCES Zamowienia (IDZamowienia, IDKlienta)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Czekoladki_Zawartosc (table: Czekoladki)
ALTER TABLE Czekoladki ADD CONSTRAINT Czekoladki_Zawartosc
    FOREIGN KEY (Zawartosc_IDPudelka, Zawartosc_IdCzekoladki)
    REFERENCES Zawartosc (IDPudelka, IdCzekoladki)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Pudelka_Artykuly (table: Pudelka)
ALTER TABLE Pudelka ADD CONSTRAINT Pudelka_Artykuly
    FOREIGN KEY (Artykuly_IDZamowienia, Artykuly_IDPudelka)
    REFERENCES Artykuly (IDZamowienia, IDPudelka)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Zamowienia_Klienci (table: Zamowienia)
ALTER TABLE Zamowienia ADD CONSTRAINT Zamowienia_Klienci
    FOREIGN KEY (Klienci_IDKlienta)
    REFERENCES Klienci (IDKlienta)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Zawartosc_Pudelka (table: Zawartosc)
ALTER TABLE Zawartosc ADD CONSTRAINT Zawartosc_Pudelka
    FOREIGN KEY (Pudelka_IDPudelka)
    REFERENCES Pudelka (IDPudelka)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

