drop database if exists githubprimjer;
create database githubprimjer;
use githubprimjer;

create table git(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null
);

insert into git(sifra, naziv) values (null, 'Test');
