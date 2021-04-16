INSERT INTO Sala (naziv) values('zlatna');
INSERT INTO Sala (naziv) values('srebrna');
INSERT INTO Sala (naziv) values('bronzana');
INSERT INTO Sala (naziv) values('crvena');
INSERT INTO Sala (naziv) values('plava');

INSERT INTO Sediste (red, kolona) values(1, 1);
INSERT INTO Sediste (red, kolona) values(1, 2);
INSERT INTO Sediste (red, kolona) values(1, 3);
INSERT INTO Sediste (red, kolona) values(1, 4);
INSERT INTO Sediste (red, kolona) values(1, 5);
INSERT INTO Sediste (red, kolona) values(2, 1);
INSERT INTO Sediste (red, kolona) values(2, 2);
INSERT INTO Sediste (red, kolona) values(2, 3);
INSERT INTO Sediste (red, kolona) values(2, 4);
INSERT INTO Sediste (red, kolona) values(2, 5);

INSERT INTO Predstava(nazp, zanr) values('Labudovo jezero', 'balet');
INSERT INTO Predstava(nazp, zanr) values('Romeo i Julija', 'tragedija');
INSERT INTO Predstava(nazp, zanr) values('Nabuko', 'opera');
INSERT INTO Predstava(nazp, zanr) values('Otelo', 'opera');
INSERT INTO Predstava(nazp, zanr) values('Gospodja Ministarka', 'komedija'); 

INSERT INTO Pozoriste(ime, grad) values('Srpsko narodno pozoriste', 'Novi Sad');
INSERT INTO Pozoriste(ime, grad) values('Bitef teatar', 'Beograd');
INSERT INTO Pozoriste(ime, grad) values('Pozoriste Bora Stankovic', 'Vranje');
INSERT INTO Pozoriste(ime, grad) values('Atelje 212', 'Beograd');
INSERT INTO Pozoriste(ime, grad) values('Pozoriste mladih', 'Novi Sad'); 

INSERT INTO Projekcija(vremeProj, datumProj, salaID, predstavaID, pozoristeID) values(cast('19:00' as datetime),cast('15-may-2020' as date), 1, 1, 1);
INSERT INTO Projekcija(vremeProj, datumProj, salaID, predstavaID, pozoristeID) values(cast('20:45' as datetime),cast('30-aug-2020' as date), 2, 2, 2);
INSERT INTO Projekcija(vremeProj, datumProj, salaID, predstavaID, pozoristeID) values(cast('19:30' as datetime),cast('16-apr-2020' as date), 3, 3, 3);
INSERT INTO Projekcija(vremeProj, datumProj, salaID, predstavaID, pozoristeID) values(cast('21:15' as datetime),cast('22-nov-2020' as date), 4, 4, 4);
INSERT INTO Projekcija(vremeProj, datumProj, salaID, predstavaID, pozoristeID) values(cast('20:15' as datetime),cast('02-jul-2020' as date), 5, 5, 5); 

INSERT INTO Blagajnik(imeBlagajnika, prezBlagajnika, jmbg, usernameBlagajnika, passwordBlagajnika) values('Jovana', 'Petrovic', '1596321526', 'jovanapetrovic', 'joca556');
INSERT INTO Blagajnik(imeBlagajnika, prezBlagajnika, jmbg, usernameBlagajnika, passwordBlagajnika) values('Petar', 'Markovic', '96345152', 'petarmarkovic', 'pedjapedja');
INSERT INTO Blagajnik(imeBlagajnika, prezBlagajnika, jmbg, usernameBlagajnika, passwordBlagajnika) values('Tijana', 'Vekovic', '144153669', 'tijanavekovic', 'tica1623');
INSERT INTO Blagajnik(imeBlagajnika, prezBlagajnika, jmbg, usernameBlagajnika, passwordBlagajnika) values('Maja', 'Majic', '12634458', 'majicmaja', 'maja1234');
INSERT INTO Blagajnik(imeBlagajnika, prezBlagajnika, jmbg, usernameBlagajnika, passwordBlagajnika) values('Svetozar', 'Svetozarevic', '669335485', 'svetasvetozarevic', 'sveta74');

INSERT INTO Karta(cena, sedisteID, projekcijaID, blagajnikID) values(2100, 10, 5, 4);
INSERT INTO Karta(cena, sedisteID, projekcijaID, blagajnikID) values(1500, 5, 4, 3);
INSERT INTO Karta(cena, sedisteID, projekcijaID, blagajnikID) values(1200, 3, 3, 2);
INSERT INTO Karta(cena, sedisteID, projekcijaID, blagajnikID) values(1700, 9, 2, 1);
INSERT INTO Karta(cena, sedisteID, projekcijaID, blagajnikID) values(800, 1, 1, 5); 

INSERT INTO Korisnik(imeKorisnika, prezKorisnika, kontakt, username, password) values('Nadja', 'Jovanovic', '063456665', 'nadjajovanovic', 'nadja1997');
INSERT INTO Korisnik(imeKorisnika, prezKorisnika, kontakt, username, password) values('Vladimir', 'Vladimirovic', '064123456', 'vladimir', 'vlado123');
INSERT INTO Korisnik(imeKorisnika, prezKorisnika, kontakt, username, password) values('Marko', 'Markovic', '060147852', 'markovicm', 'markic44');
INSERT INTO Korisnik(imeKorisnika, prezKorisnika, kontakt, username, password) values('Teodora', 'Pecelj', '061125548', 'peceljteodora', 'peci7');
INSERT INTO Korisnik(imeKorisnika, prezKorisnika, kontakt, username, password) values('Vanja', 'Pejovic', '065569995', 'vanjapejovic', 'vaksi22');

INSERT INTO TipRezervacije(nacin) values('online');
INSERT INTO TipRezervacije(nacin) values('telefon');

INSERT INTO Rezervacija(vremeRez, datumRez, ukupnaCena, korisnikID, kartaID, tipRezervacijeID) values(cast('14:50' as datetime),cast('01-jul-2020' as date), 2100, 5, 1, 1);
INSERT INTO Rezervacija(vremeRez, datumRez, ukupnaCena, korisnikID, kartaID, tipRezervacijeID) values(cast('16:28' as datetime),cast('20-nov-2020' as date), 1500, 4, 2, 2);
INSERT INTO Rezervacija(vremeRez, datumRez, ukupnaCena, korisnikID, kartaID, tipRezervacijeID) values(cast('13:14' as datetime),cast('13-apr-2020' as date), 1200, 3, 3, 2);
INSERT INTO Rezervacija(vremeRez, datumRez, ukupnaCena, korisnikID, kartaID, tipRezervacijeID) values(cast('22:03' as datetime),cast('28-aug-2020' as date), 1700, 2, 4, 2);
INSERT INTO Rezervacija(vremeRez, datumRez, ukupnaCena, korisnikID, kartaID, tipRezervacijeID) values(cast('19:49' as datetime),cast('14-may-2020' as date), 800, 1, 5, 1);


