SELECT ksiegowosc.pracownicy.id_pracownika, ksiegowosc.pensja.kwota_brutto 
FROM ksiegowosc.pracownicy 
INNER JOIN ksiegowosc.wynagrodzenia ON 
ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenia.id_pracownika 
INNER JOIN ksiegowosc.pensja 
ON ksiegowosc.wynagrodzenia.id_pensji = ksiegowosc.pensja.id_pensji 
where ksiegowosc.pensja.kwota_brutto > '1000';