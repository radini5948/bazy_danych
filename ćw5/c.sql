SELECT ksiegowosc.pracownicy.id_pracownika, ksiegowosc.pensja.kwota_brutto AS pensja, ksiegowosc.premia.kwota AS premia 
FROM ksiegowosc.pracownicy 
INNER JOIN ksiegowosc.wynagrodzenia ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenia.id_pracownika 
INNER JOIN ksiegowosc.pensja ON ksiegowosc.wynagrodzenia.id_pensji = ksiegowosc.pensja.id_pensji 
INNER JOIN ksiegowosc.premia ON ksiegowosc.premia.id_premii = ksiegowosc.pensja.id_pensji 
WHERE pensja.kwota_brutto > '2000' AND premia.kwota IS null;