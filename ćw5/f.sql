SELECT ksiegowosc.pracownicy.imie, ksiegowosc.pracownicy.nazwisko, (godziny.liczba_godzin-10) AS nadgodziny 
FROM ksiegowosc.pracownicy 
INNER JOIN ksiegowosc.godziny ON ksiegowosc.godziny.id_pracownika = ksiegowosc.pracownicy.id_pracownika
WHERE ksiegowosc.godziny.liczba_godzin > '10';