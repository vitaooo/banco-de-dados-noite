create database clinica;

use clinica;

create table if not exists pacientes(idpaciente int null,
pac_nome varchar(45), pac_endereco varchar(50),
pac_telefone varchar(11), primary key (idpaciente));

create table medicos(id_crm int not null,
med_nome varchar(45), med_endereco varchar(50),
med_telefone varchar(11), med_especialidade int not null,
primary key(id_crm),
foreign key (med_especialidade) references especialidades(idespecialidade));

drop table medicos;

create table if not exists especialidades(idespecialidade int not null,
esp_nome varchar(20), primary key(idespecialidade));

create table remedios(idremedios int not null,
rem_nome varchar(45),
primary key(idremedios));

-- drop table remedios;

alter table remedios drop rem_nome;

alter table remedios add rem_nome varchar(45) not null;

create table consultas(id_consulta int not null,
con_data datetime,
medicos_idcrm int not null,
pacientes_idpaciente int not null,
primary key (id_consulta),
foreign key(medicos_idcrm) references medicos(id_crm),
foreign key(pacientes_idpaciente) references pacientes(idpaciente));

create table consultas_has_remedios(
id_consulta int not null,
idremedios int not null,
cor_posologia varchar(45),
primary key (id_consulta, idremedios),
foreign key(id_consulta)
	references consultas(id_consulta),
foreign key(idremedios)
	references remedios(idremedio));