drop database if exists Tecnico;
create database Tecnico;

use Tecnico;

create table tbcursos(
codCurso INT primary key auto_increment,
nomeCurso varchar(50),
periodoCurso varchar(20)
);

create table tbprofessor(
codProfessor INT primary key auto_increment,
nomeProfessor varchar(50),
emailProfessor varchar(50),
fotoProfessor varchar(255),
codStatus INT
);

create table tbformacao(
codFormacao INT primary key auto_increment,
nomeFormacao varchar(50),
tipoFormacao varchar(30)
);

create table tblogin(
codLogin INT primary key auto_increment,
usuarioLogin varchar(50),
senhaLogin varchar(10),
Tipo INT
);