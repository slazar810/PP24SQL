drop database if exists zavrsnip;
create database zavrsnip character set utf8;
use zavrsnip;


create table produkt(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    kategorija int not null,
    velicina varchar(20),
    boja varchar(10),
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
    email varchar(50) not null,
    narudzba int not null
);

create table narudzba(
    sifra int not null primary key auto_increment,
    produkt int not null,
    datum_narduzbe datetime
);

create table kosarica(
    narudzba int not null,
    korisnik int not null,
    ukupna_cijena decimal(18,2) not null
);


alter table produkt add foreign key (kategorija) references kategorija(sifra);

alter table korisnik add foreign key (narudzba) references narudzba(sifra);

alter table narudzba add foreign key (produkt) references produkt(sifra);

alter table kosarica add foreign key(narudzba) references narudzba(sifra);

alter table kosarica add foreign key (korisnik) references korisnik(sifra);






