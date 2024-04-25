SELECT ksiegowosc.pracownicy.imie, ksiegowosc.pracownicy.nazwisko, md5(ksiegowosc.pensja.kwota_brutto::varchar) 
FROM ksiegowosc.pracownicy 
INNER JOIN ksiegowosc.wynagrodzenia ON
pracownicy.id_pracownika = ksiegowosc.wynagrodzenia.id_pracownika 
INNER JOIN ksiegowosc.pensja ON ksiegowosc.pensja.id_pensji = ksiegowosc.wynagrodzenia.id_pensji;