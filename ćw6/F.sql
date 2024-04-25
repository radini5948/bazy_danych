SELECT concat('Pracownik ',ksiegowosc.pracownicy.imie,' ',ksiegowosc.pracownicy.nazwisko,', w dniu ',ksiegowosc.wynagrodzenia."data",
' otrzymał pensję całkowitą na kwotę ',ksiegowosc.pensja.kwota_brutto+premia.kwota,', gdzie wynagrodzenie zasadnicze wynosiło: ',
ksiegowosc.pensja.kwota_brutto,' zł, premia: ',ksiegowosc.premia.kwota,' zł, nadgodziny: ',ksiegowosc.godziny.liczba_godzin) 
FROM ksiegowosc.pracownicy INNER JOIN ksiegowosc.godziny ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.godziny.id_pracownika 
INNER JOIN ksiegowosc.wynagrodzenia on ksiegowosc.godziny.id_godziny  = ksiegowosc.wynagrodzenia.id_godziny 
INNER JOIN ksiegowosc.pensja ON ksiegowosc.wynagrodzenia.id_pensji = ksiegowosc.pensja.id_pensji 
INNER JOIN ksiegowosc.premia ON ksiegowosc.premia.id_premii = ksiegowosc.pensja.id_pensji;