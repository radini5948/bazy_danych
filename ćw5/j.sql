SELECT ksiegowosc.pensja.kwota_brutto AS pensja, premia.kwota AS premia, pracownicy.* 
FROM ksiegowosc.pracownicy 
INNER JOIN ksiegowosc.wynagrodzenia ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenia.id_pracownika 
INNER JOIN ksiegowosc.pensja ON ksiegowosc.wynagrodzenia.id_pensji = ksiegowosc.pensja.id_pensji 
INNER JOIN ksiegowosc.premia ON ksiegowosc.premia.id_premii = ksiegowosc.pensja.id_pensji
ORDER BY ksiegowosc.pensja.kwota_brutto, ksiegowosc.premia.kwota DESC;