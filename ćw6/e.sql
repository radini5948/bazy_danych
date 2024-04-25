SELECT ksiegowosc.pracownicy.imie, ksiegowosc.pracownicy.nazwisko, ksiegowosc.pensja.kwota_brutto, ksiegowosc.premia.kwota
FROM ksiegowosc.pracownicy LEFT JOIN ksiegowosc.wynagrodzenia ON
ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenia.id_pracownika LEFT JOIN ksiegowosc.pensja ON ksiegowosc.pensja.id_pensji = ksiegowosc.wynagrodzenia.id_pensji
left join ksiegowosc.premia on ksiegowosc.premia.id_premii = ksiegowosc.pensja.id_pensji;