drop database if exists Tecnico;
create database Tecnico;

use Tecnico;

create table tbstatus(
codStatus INT primary key not null,
statusProfessor varchar(10)
);

create table tbprofessor(
codProfessor INT primary key auto_increment,
nomeProfessor varchar(50),
emailProfessor varchar(50),
fotoProfessor varchar(255),
codStatus INT,
foreign key (codStatus) references tbStatus(codStatus)
);

create table tbformacao(
codFormacao INT primary key auto_increment,
nomeFormacao varchar(50),
tipoFormacao varchar(30)
);

create table tbformacaoprofessor(
codFormacaoProfessor INT primary key auto_increment,
codFormacao INT,
codProfessor INT,
instituicao varchar(255),
foreign key (codFormacao) references tbformacao(codFormacao),
foreign key (codProfessor) references tbprofessor(codProfessor)
);

create table tbcursos(
codCurso INT primary key auto_increment,
nomeCurso varchar(50),
periodoCurso varchar(20)
);

create table tbcursoprofessor(
codCursoProfessor INT primary key auto_increment,
codCurso INT,
codProfessor INT,
foreign key (codCurso) references tbcursos(codCurso),
foreign key (codProfessor) references tbprofessor(codProfessor)
);

create table tbcoordenador(
codCoordenador INT primary key auto_increment,
nomeCoordenador varchar(50)
);

create table tbcursocoordenador(
codCursoCoordenador INT primary key auto_increment,
codCurso INT,
codCoordenador INT,
foreign key (codCurso) references tbcursos(codCurso),
foreign key (codCoordenador) references tbcoordenador(codCoordenador)
);

create table tblogin(
codLogin INT primary key auto_increment,
usuarioLogin varchar(50),
senhaLogin varchar(10),
Tipo INT
);