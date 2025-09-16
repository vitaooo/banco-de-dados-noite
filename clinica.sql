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

create table if not exists especialidades(idespecialidade int not null,
esp_nome varchar(20), primary key(idespecialidade));

create table if not exists remedios(idremedios int not null,
rem_nome varchar(45),
primary key(idremedios));

-- drop table remedios;

alter table remedios drop rem_nome;

alter table remedios add rem_nome varchar(45) not null;

create table if not exists consultas(id_consulta int not null,
con_data datetime,
medicos_idcrm int not null,
pacientes_idpaciente int not null,
primary key (id_consulta),
foreign key(medicos_idcrm) references medicos(id_crm),
foreign key(pacientes_idpaciente) references pacientes(idpaciente));

create table if not exists consultas_has_remedios(
id_consulta int not null,
idremedios int not null,
cor_posologia varchar(45),
primary key (id_consulta, idremedios),
foreign key(id_consulta)
	references consultas(id_consulta),
foreign key(idremedios)
	references remedios(idremedios));
    
insert into especialidades values (2, "Gastro");
insert into especialidades values (3, "Cardiologista");

insert into medicos values (1, "dotor", "av manoel goulart 221", "181818",1);
insert into medicos values (2, "dotour", "av manoel golart 222", "171717",2);

insert into pacientes values (4,"maria","endec 1","111111111"), (5,"mario","endec 2","22222222"), (6,"marii","endec 3","33333333"), (7,"mariu","endec 4","444444444");

insert into consultas values (1, "2025-09-15 19:00:00",2,2);

insert into consultas values (2, current_time(),2,2);

insert into remedios values(1, "ozempic"), (2, "dipirona"), (3,"Nimesulida"), (4,"Buscopan");

insert into consultas_has_remedios (id_consulta, idremedios) values(1,2),(2,3),(3,3);

insert into consultas_has_remedios values (1,2,""),(2,3,"");

select * from especialidades;
select * from medicos;
select * from pacientes;
select * from consultas;
select * from remedios;
select * from consultas_has_remedios;

update consultas_has_remedios set cor_posologia = "3 8/8" where id_consulta = 1 and idremedios = 2;

update consultas_has_remedios set cor_posologia = "1 com pela manhã" where id_consulta = 2 and idremedios = 3;

update consultas_has_remedios set cor_posologia = "beber" where id_consulta <> 1;

update consultas_has_remedios set cor_posologia = "DISSOLVER NA AGUA" where id_consulta = 1 or idremedios = 3;