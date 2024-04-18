select ksiegowosc.pracownicy.imie, ksiegowosc.pracownicy.nazwisko, ksiegowosc.pensja.kwota_brutto 
from ksiegowosc.pracownicy 
inner join ksiegowosc.wynagrodzenia on ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenia.id_pracownika 
inner join ksiegowosc.pensja on ksiegowosc.wynagrodzenia.id_pensji = ksiegowosc.pensja.id_pensji 
where ksiegowosc.pensja.kwota_brutto between '1500' and '3000';