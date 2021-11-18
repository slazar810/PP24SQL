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
    produkt int not null,
    placanje int not null
);

create table placanje(
    sifra int not null primary key auto_increment,
    vrsta_placanja int not null
);

create table vrsta_placanja(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null
);


alter table produkt add foreign key (kategorija) references kategorija(sifra);

alter table korisnik add foreign key (produkt) references produkt(sifra);

alter table korisnik add foreign key (placanje) references placanje(sifra);

alter table placanje add foreign key (vrsta_placanja) references vrsta_placanja(sifra);




insert into kategorija(sifra, naziv)values
(null, 'MMA trening oprema'),
(null, 'Dodaci prehrani');


insert into produkt(sifra, naziv, kategorija, velicina, boja, cijena)values
(null, 'Rukavice Everlast', 1, '4oz', 'crna', 299.99),
(null, 'Whey protein - čokolada', 2, '908g', 'crna' ,109.99);



insert into vrsta_placanja(sifra, naziv)values
(null, 'Pouzećem'),
(null, 'Paypal'),
(null, 'Kreditna kartica');


insert into placanje(sifra, vrsta_placanja)values
(null, 1),
(null, 2),
(null, 3);


insert into korisnik(sifra, ime, prezime, oib, email, produkt, placanje)values
(null, 'Petar', 'Petrović', '88830680172', 'cistaproba@gmail.com', 1, 1),
(null, 'Darko', 'Darković', '82813639605', 'donniedarko@gmail.com',2, 3);