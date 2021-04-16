--brisanje tabela
if object_id ('Rezervacija', 'U') is not null drop table Rezervacija; 
if object_id ('Karta', 'U') is not null drop table Karta; 
if object_id ('Projekcija', 'U') is not null drop table Projekcija; 
if object_id ('Sediste', 'U') is not null drop table Sediste; 
if object_id ('Sala', 'U') is not null drop table Sala;
if object_id ('Predstava', 'U') is not null drop table Predstava;
if object_id ('Pozoriste', 'U') is not null drop table Pozoriste;
if object_id ('Blagajnik', 'U') is not null drop table Blagajnik;
if object_id ('Korisnik', 'U') is not null drop table Korisnik;
if object_id ('TipRezervacije', 'U') is not null drop table TipRezervacije;   

--tabele

--sala
create table Sala (
salaID int not null,
naziv varchar(50) not null
);

if exists (select * from sys.key_constraints where name = 'PK_sala')
alter table Sala drop constraint PK_sala;
alter table Sala
add constraint PK_sala primary key (salaID);

--pravljenje sekvence
if exists (select name from sys.sequences where name = 'Seq_Sala') drop sequence Seq_Sala;
create sequence Seq_Sala
start with 1
increment by 1
cycle

--dodavanje sekvence u tabelu
if exists (select * from sys.default_constraints where name = 'DFT_Sala_id')
alter table Sala drop constraint DFT_Sala_id;
alter table Sala
add constraint DFT_Sala_id default (next value for Seq_Sala) for salaID;

--sediste
create table Sediste (
sedisteID int not null,
red int not null,
kolona int not null
);

if exists (select * from sys.key_constraints where name = 'PK_sediste')
alter table Sediste drop constraint PK_sediste;
alter table Sediste
add constraint PK_sediste primary key (sedisteID);

--pravljenje sekvence
if exists (select name from sys.sequences where name = 'Seq_Sediste') drop sequence Seq_Sediste;
create sequence Seq_Sediste
start with 1
increment by 1
cycle

--dodavanje sekvence u tabelu
if exists (select * from sys.default_constraints where name = 'DFT_Sediste_id')
alter table Sediste drop constraint DFT_Sediste_id;
alter table Sediste
add constraint DFT_Sediste_id default (next value for Seq_Sediste) for sedisteID;

--predstava
create table Predstava (
predstavaID int not null,
nazp varchar(50) not null,
zanr varchar(50) not null
);

if exists (select * from sys.key_constraints where name = 'PK_predstava')
alter table Predstava drop constraint PK_predstava;
alter table Predstava
add constraint PK_predstava primary key (predstavaID);

--pravljenje sekvence
if exists (select name from sys.sequences where name = 'Seq_Predstava') drop sequence Seq_Predstava;
create sequence Seq_Predstava
start with 1
increment by 1
cycle

--dodavanje sekvence u tabelu
if exists (select * from sys.default_constraints where name = 'DFT_Predstava_id')
alter table Predstava drop constraint DFT_Predstava_id;
alter table Predstava
add constraint DFT_Predstava_id default (next value for Seq_Predstava) for predstavaID;

--pozoriste
create table Pozoriste (
pozoristeID int not null,
ime varchar(50) not null,
grad varchar(50) not null
);

if exists (select * from sys.key_constraints where name = 'PK_pozoriste')
alter table Pozoriste drop constraint PK_pozoriste;
alter table Pozoriste
add constraint PK_pozoriste primary key (pozoristeID);

--pravljenje sekvence
if exists (select name from sys.sequences where name = 'Seq_Pozoriste') drop sequence Seq_Pozoriste;
create sequence Seq_Pozoriste
start with 1
increment by 1
cycle

--dodavanje sekvence u tabelu
if exists (select * from sys.default_constraints where name = 'DFT_Pozoriste_id')
alter table Pozoriste drop constraint DFT_Pozoriste_id;
alter table Pozoriste
add constraint DFT_Pozoriste_id default (next value for Seq_Pozoriste) for pozoristeID;

--projekcija
create table Projekcija (
projekcijaID int not null,
vremeProj time not null,
datumProj date not null,
salaID int not null,
predstavaID int not null,
pozoristeID int not null
);

if exists (select * from sys.key_constraints where name = 'PK_projekcija')
alter table Projekcija drop constraint PK_projekcija;
alter table Projekcija
add constraint PK_projekcija primary key (projekcijaID);

if exists (select * from sys.foreign_keys where name = 'FK_projekcija_sala')
alter table Projekcija drop constraint FK_projekcija_sala;
alter table Projekcija
add constraint FK_projekcija_sala foreign key (salaID) references Sala (salaID);

if exists (select * from sys.foreign_keys where name = 'FK_projekcija_predstava')
alter table Projekcija drop constraint FK_projekcija_predstava;
alter table Projekcija
add constraint FK_projekcija_predstava foreign key (predstavaID) references Predstava (predstavaID);

if exists (select * from sys.foreign_keys where name = 'FK_projekcija_pozoriste')
alter table Projekcija drop constraint FK_projekcija_pozoriste;
alter table Projekcija
add constraint FK_projekcija_pozoriste foreign key (pozoristeID) references Pozoriste (pozoristeID);

--pravljenje sekvence
if exists (select name from sys.sequences where name = 'Seq_Projekcija') drop sequence Seq_Projekcija;
create sequence Seq_Projekcija
start with 1
increment by 1
cycle

--dodavanje sekvence u tabelu
if exists (select * from sys.default_constraints where name = 'DFT_Projekcija_id')
alter table Projekcija drop constraint DFT_Projekcija_id;
alter table Projekcija
add constraint DFT_Projekcija_id default (next value for Seq_Projekcija) for projekcijaID;

--blagajnik
create table Blagajnik (
blagajnikID int not null,
imeBlagajnika varchar(50) not null,
prezBlagajnika varchar(50) not null,
jmbg varchar(50) not null,
usernameBlagajnika varchar(50) not null,
passwordBlagajnika varchar(50) not null
);

if exists (select * from sys.key_constraints where name = 'PK_blagajnik')
alter table Blagajnik drop constraint PK_blagajnik;
alter table Blagajnik
add constraint PK_blagajnik primary key (blagajnikID);

if exists (select * from sys.objects where name = 'UQ_username')
alter table Blagajnik drop constraint UQ_username;
alter table Blagajnik
add constraint UQ_username unique (usernameBlagajnika);


--pravljenje sekvence
if exists (select name from sys.sequences where name = 'Seq_Blagajnik') drop sequence Seq_Blagajnik;
create sequence Seq_Blagajnik
start with 1
increment by 1
cycle

--dodavanje sekvence u tabelu
if exists (select * from sys.default_constraints where name = 'DFT_Blagajnik_id')
alter table Blagajnik drop constraint DFT_Blagajnik_id;
alter table Blagajnik
add constraint DFT_Blagajnik_id default (next value for Seq_Blagajnik) for blagajnikID;

--karta
create table Karta (
kartaID int not null,
cena float not null,
sedisteID int not null,
projekcijaID int not null,
blagajnikID int not null
);

if exists (select * from sys.key_constraints where name = 'PK_karta')
alter table Karta drop constraint PK_karta;
alter table Karta
add constraint PK_karta primary key (kartaID);

if exists (select * from sys.foreign_keys where name = 'FK_karta_sediste')
alter table Karta drop constraint FK_karta_sediste;
alter table Karta
add constraint FK_karta_sediste foreign key (sedisteID) references Sediste (sedisteID);

if exists (select * from sys.foreign_keys where name = 'FK_karta_projekcija')
alter table Karta drop constraint FK_karta_projekcija;
alter table Karta
add constraint FK_karta_projekcija foreign key (projekcijaID) references Projekcija (projekcijaID);

if exists (select * from sys.foreign_keys where name = 'FK_karta_blagajnik')
alter table Karta drop constraint FK_karta_blagajnik;
alter table Karta
add constraint FK_karta_blagajnik foreign key (blagajnikID) references Blagajnik (blagajnikID);

--pravljenje sekvence
if exists (select name from sys.sequences where name = 'Seq_Karta') drop sequence Seq_Karta;
create sequence Seq_Karta
start with 1
increment by 1
cycle

--dodavanje sekvence u tabelu
if exists (select * from sys.default_constraints where name = 'DFT_Karta_id')
alter table Karta drop constraint DFT_Karta_id;
alter table Karta
add constraint DFT_Karta_id default (next value for Seq_Karta) for kartaID;

--korisnik
create table Korisnik (
korisnikID int not null,
imeKorisnika varchar(50) not null,
prezKorisnika varchar(50) not null,
kontakt varchar(50) not null,
username varchar(50) not null,
password varchar(50) not null,
poeni int
);

if exists (select * from sys.key_constraints where name = 'PK_korisnik')
alter table Korisnik drop constraint PK_korisnik;
alter table Korisnik
add constraint PK_korisnik primary key (korisnikID);

if exists (select * from sys.objects where name = 'UQ_korisnik_username')
alter table Korisnik drop constraint UQ_korisnik_username;
alter table Korisnik
add constraint UQ_korisnik_username unique (username);

--pravljenje sekvence
if exists (select name from sys.sequences where name = 'Seq_Korisnik') drop sequence Seq_Korisnik;
create sequence Seq_Korisnik
start with 1
increment by 1
cycle

--dodavanje sekvence u tabelu
if exists (select * from sys.default_constraints where name = 'DFT_Korisnik_id')
alter table Korisnik drop constraint DFT_Korisnik_id;
alter table Korisnik
add constraint DFT_Korisnik_id default (next value for Seq_Korisnik) for korisnikID;

--tip rezervacije
create table TipRezervacije (
tipRezervacijeID int not null,
nacin varchar(25) not null
);

if exists (select * from sys.key_constraints where name = 'PK_tip_rezervacije')
alter table TipRezervacije drop constraint PK_tip_rezervacije;
alter table TipRezervacije
add constraint PK_tip_rezervacije primary key (tipRezervacijeID);

--pravljenje sekvence
if exists (select name from sys.sequences where name = 'Seq_TipRezervacije') drop sequence Seq_TipRezervacije;
create sequence Seq_TipRezervacije
start with 1
increment by 1
cycle

--dodavanje sekvence u tabelu
if exists (select * from sys.default_constraints where name = 'DFT_TipRezervacije_id')
alter table TipRezervacije drop constraint DFT_TipRezervacije_id;
alter table TipRezervacije
add constraint DFT_TipRezervacije_id default (next value for Seq_TipRezervacije) for tipRezervacijeID;

--rezervacija
create table Rezervacija (
rezervacijaID int not null,
vremeRez time not null,
datumRez date not null,
ukupnaCena float not null,
korisnikID int not null,
kartaID int not null,
tipRezervacijeID int not null,
);

if exists (select * from sys.key_constraints where name = 'PK_rezervacija')
alter table Rezervacija drop constraint PK_rezervacija;
alter table Rezervacija
add constraint PK_rezervacija primary key (rezervacijaID);

if exists (select * from sys.foreign_keys where name = 'FK_rezervacija_korisnik')
alter table Rezervacija drop constraint FK_rezervacija_korisnik;
alter table Rezervacija
add constraint FK_rezervacija_korisnik foreign key (korisnikID) references Korisnik (korisnikID);

if exists (select * from sys.foreign_keys where name = 'FK_rezervacija_karta')
alter table Rezervacija drop constraint FK_rezervacija_karta;
alter table Rezervacija
add constraint FK_rezervacija_karta foreign key (kartaID) references Karta (kartaID);

if exists (select * from sys.foreign_keys where name = 'FK_rezervacija_tip_rezervacije')
alter table Rezervacija drop constraint FK_rezervacija_tip_rezervacije;
alter table Rezervacija
add constraint FK_rezervacija_tip_rezervacije foreign key (tipRezervacijeID) references TipRezervacije (tipRezervacijeID);

--pravljenje sekvence
if exists (select name from sys.sequences where name = 'Seq_Rezervacija') drop sequence Seq_Rezervacija;
create sequence Seq_Rezervacija
start with 1
increment by 1
cycle

--dodavanje sekvence u tabelu
if exists (select * from sys.default_constraints where name = 'DFT_Rezervacija_id')
alter table Rezervacija drop constraint DFT_Rezervacija_id;
alter table Rezervacija
add constraint DFT_Rezervacija_id default (next value for Seq_Rezervacija) for rezervacijaID;