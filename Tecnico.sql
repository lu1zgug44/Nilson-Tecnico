drop database if exists Tecnico;
create database Tecnico;

use Tecnico;

create table tbstatus(
codStatus INT primary key not null auto_increment,
statusProfessor varchar(10)
);

insert into tbstatus (statusProfessor) 
values('Ativo'),
('Inativo'),
('Afastado');

create table tbprofessor(
codProfessor INT primary key auto_increment,
nomeProfessor varchar(50),
emailProfessor varchar(50),
fotoProfessor varchar(255),
codStatus INT not null,
foreign key (codStatus) references tbStatus(codStatus)
);

insert into tbprofessor (nomeProfessor, emailProfessor, fotoProfessor, codStatus) 
values('Marcos Paulo', 'marcos.paulo@escola.com', 'marcos.jpg', 1),
('Eric Wallis', 'eric.wallis@escola.com', 'eric.jpg', 1),
('Luiz Gustavo', 'luiz.gustavo@escola.com', 'luiz.jpg', 2);

select tbprofessor.codProfessor, tbprofessor.nomeProfessor, tbprofessor.emailProfessor, tbprofessor.fotoProfessor, tbstatus.statusProfessor
from tbprofessor
inner join tbstatus on tbprofessor.codStatus = tbstatus.codStatus;

create table tbformacao(
codFormacao INT primary key auto_increment,
nomeFormacao varchar(50),
tipoFormacao varchar(30)
);

insert into tbformacao (nomeFormacao, tipoFormacao)
values('Licenciatura em Matemática', 'Graduação'),
('Engenharia de Software', 'Graduação'),
('Mestrado em Educação', 'Pós-graduação');

create table tbformacaoprofessor(
codFormacaoProfessor INT primary key auto_increment,
codFormacao INT not null,
codProfessor INT not null,
instituicao varchar(255),
foreign key (codFormacao) references tbformacao(codFormacao),
foreign key (codProfessor) references tbprofessor(codProfessor)
);

insert into tbformacaoprofessor(codFormacao, codProfessor, instituicao)
	values(1,1,'UNIP'),
    (2,2,'USP'),
    (3,3,'FATEC');

select tbprofessor.nomeProfessor, tbformacao.nomeFormacao, tbformacao.tipoFormacao, tbformacaoprofessor.instituicao
from tbprofessor
inner join tbformacaoprofessor
on tbprofessor.codProfessor = tbformacaoprofessor.codProfessor
inner join tbformacao
on tbformacaoprofessor.codFormacao = tbformacao.codFormacao;

create table tbcursos(
codCurso INT primary key auto_increment,
nomeCurso varchar(50),
periodoCurso varchar(20)
);

insert into tbcursos(nomeCurso, periodoCurso)
	values('Matemática','Noturno'),
    ('Informática','Matutino'),
    ('Pedagogia','Vespertino');

create table tbcursoprofessor(
codCursoProfessor INT primary key auto_increment,
codCurso INT not null,
codProfessor INT not null,
foreign key (codCurso) references tbcursos(codCurso),
foreign key (codProfessor) references tbprofessor(codProfessor)
);

insert into tbcursoprofessor(codCurso, codProfessor)
	values(1,1),
    (2,2),
    (3,3);

select tbprofessor.nomeProfessor, tbcursos.nomeCurso, tbcursos.periodoCurso
from tbprofessor
inner join tbcursoprofessor
on tbprofessor.codProfessor = tbcursoprofessor.codProfessor
inner join tbcursos
on tbcursoprofessor.codCurso = tbcursos.codCurso;

create table tbcoordenador(
codCoordenador INT primary key auto_increment,
nomeCoordenador varchar(50)
);

insert into tbcoordenador(nomeCoordenador)
	values('Marcos Paulo'),
    ('Eric Wallis'),
    ('Luiz Gustavo');

create table tbcursocoordenador(
codCursoCoordenador INT primary key auto_increment,
codCurso INT not null,
codCoordenador INT not null,
foreign key (codCurso) references tbcursos(codCurso),
foreign key (codCoordenador) references tbcoordenador(codCoordenador)
);

insert into tbcursocoordenador(codCurso, codCoordenador)
	values(1,1),
    (2,2),
    (3,3);

select tbcoordenador.nomeCoordenador, tbcursos.nomeCurso, tbcursos.periodoCurso
from tbcoordenador
inner join tbcursocoordenador
on tbcoordenador.codCoordenador = tbcursocoordenador.codCoordenador
inner join tbcursos
on tbcursocoordenador.codCurso = tbcursos.codCurso;

create table tblogin(
codLogin INT primary key auto_increment,
usuarioLogin varchar(50),
senhaLogin varchar(10),
Tipo INT not null
);

insert into tblogin(usuarioLogin, senhaLogin, tipo)
	values('Luiz','123456',1),
    ('Eric','123455',2),
    ('Marcos','123454',3);