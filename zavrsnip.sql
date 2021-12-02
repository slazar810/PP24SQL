drop database if exists zavrsnip;
create database zavrsnip character set utf8;
use zavrsnip;


create table produkt(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    kategorija int not null,
    opis varchar(255),
    cijena decimal (18,2) not null
);

create table kategorija(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null
);

create table korisnik(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    oib char(11) not null,
    email varchar(50) not null
);

create table narudzba(
    sifra int not null primary key auto_increment,
    korisnik int not null,
    datum_narduzbe datetime
);

create table kosarica(
    narudzba int not null,
    produkt int not null,
    ukupna_cijena decimal(18,2) not null,
    kolicina int
);


alter table produkt add foreign key (kategorija) references kategorija(sifra);


alter table narudzba add foreign key (korisnik) references korisnik(sifra);

alter table kosarica add foreign key(narudzba) references narudzba(sifra);


alter table kosarica add foreign key (produkt) references produkt (sifra);





select * from kategorija;

insert into kategorija(sifra, naziv)values
(null, 'MMA trening oprema'),
(null, 'Dodaci prehrani');

select * from produkt;

insert into produkt(sifra, naziv, kategorija, opis, cijena)values
(null, 'Rukavice Everlast', 1, '4oz-crna', 299.99),
(null, 'Whey protein - čokolada', 2, '908g-crna' ,109.99);

select * from korisnik;

insert into korisnik(sifra, ime, prezime, oib, email)values
(null, 'Petar', 'Petrović', '88830680172', 'cistaproba@gmail.com'),
(null, 'Darko', 'Darković', '82813639605', 'donniedarko@gmail.com');

select * from narudzba;

insert into narudzba(sifra, produkt,korisnik, datum_narduzbe)values
(null, 1, 1,'2021-11-20'),
(null, 2, 2,'2021-11-21');

select * from kosarica;

insert into kosarica(narudzba, produkt, količina_cijena)values
(1,1,299.99),
(2,2,109.99);