drop database if exists Tecnico;
create database Tecnico;

use Tecnico;

create table tbprofessor(
codProfessor INT primary key auto_increment,
nomeProfessor varchar(50),
emailProfessor varchar(50),
fotoProfessor varchar(255),
codStatus INT
);