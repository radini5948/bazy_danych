ALTER TABLE pracownicy ALTER COLUMN telefon TYPE VARCHAR;
UPDATE ksiegowosc.pracownicy SET telefon = concat('(+48) ',telefon);