SELECT ksiegowosc.pracownicy.imie, ksiegowosc.pracownicy.nazwisko, (godziny.liczba_godzin-10) AS nadgodziny 
FROM ksiegowosc.pracownicy 
INNER JOIN ksiegowosc.godziny ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.godziny.id_pracownika 
INNER JOIN ksiegowosc.wynagrodzenia ON ksiegowosc.godziny.id_godziny  = ksiegowosc.wynagrodzenia.id_godziny 
INNER JOIN ksiegowosc.pensja ON ksiegowosc.wynagrodzenia.id_pensji = pensja.id_pensji 
INNER JOIN ksiegowosc.premia ON ksiegowosc.premia.id_premii = pensja.id_pensji 
WHERE ksiegowosc.premia.kwota IS null AND ksiegowosc.godziny.liczba_godzin > '10';