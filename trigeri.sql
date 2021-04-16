/*
Napraviti triger koji ce se aktivirati nakon rezervacije gde ce gledati da li korisnik ima prava da rezervise kartu
*/
if object_id('RezervacijaZaKorisnik', 'TR') is not null drop trigger RezervacijaZaKorisnik;
go
create trigger RezervacijaZaKorisnik
on Rezervacija
after insert
as
begin;
	declare @regKorisnik as int = (select korisnikID from inserted);

	if @regKorisnik in (select korisnikID from Rezervacija)
		begin
			print 'Korisnik ima prava da rezervise kartu'
		end
	else
		begin
			print 'Korisnik nema prava da reezrvise kartu'
		end
	
end;
go

/*
Napraviti triger da kada korisnik rezervise kartu dobije 5 poena ali samo ako je rezervisao online 
*/
if object_id('RezervacijaPoeni', 'TR') is not null drop trigger RezervacijaPoeni;
go
create trigger RezervacijaPoeni
on Rezervacija
after insert
as
begin;
	declare @nacinRezervacije as varchar = (select tipRezervacijeID from inserted);
	declare @korisnikID as int = (select korisnikID from inserted);
	declare @poen as int = 0;

	if @nacinRezervacije = 1
		begin
			update Korisnik
			set poeni = @poen + 5
			where korisnikID = @korisnikID
		end
end;
go


