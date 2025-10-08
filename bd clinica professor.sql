create database if not exists clinica;
use clinica;
create table pacientes (idpaciente int not null,
pac_nome varchar(45) not null,
pac_endereco varchar(45) not null,
pac_fone varchar(14),
primary key (idpaciente));

create table especialidade (idespecialidade int not null,
esp_nome varchar(45) not null,
primary key (idespecialidade));

create table medicos (id_crm int not null,
med_nome varchar(45) not null,
med_endereco varchar(45) not null,
med_fone varchar(14) not null,
med_especialidade int not null,
primary key (id_crm),
foreign key (med_especialidade) 
	references especialidade(idespecialidade));

create table if not exists remedios (idremedios int not null,
rem_nome varchar(45),
primary key (idremedios));

-- drop table remedios;

alter table remedios modify 
rem_nome varchar(45) not null; 

-- alter table remedios drop rem_nome;

-- alter table remedios add 
	-- rem_nome varchar(45) not null;

create table if not exists consultas(id_consulta int not null,
con_data datetime,
medicos_idcrm int not null,
pacientes_idpaciente int not null,
primary key (id_consulta),
foreign key (medicos_idcrm)
	references medicos (id_crm),
foreign key (pacientes_idpaciente)
	references pacientes (idpaciente));

create table consultas_has_remedios
	(id_consulta int not null,
    idremedios int not null,
    cor_posologia varchar(45),
    primary key(id_consulta,idremedios),
    foreign key (id_consulta)
		references consultas(id_consulta),
	foreign key(idremedios)
		references remedios(idremedios));

insert into especialidade (idespecialidade,esp_nome) values (1,"GASTRO");
insert into especialidade (idespecialidade,esp_nome) values (2,"CARDIO");
insert into especialidade values (3,"CIRURGIÃO");
insert into especialidade values(4,"VASCULAR"),(5,"NEURO"),(6,"ORTOPEDISTA"),
(7,"OTORRINO"),(8,"DERMATO");

insert into medicos (id_crm,med_nome,med_endereco,med_fone,
med_especialidade) values (1,"JOÃO CARLOS","AV. BRASIL 123","1899998855",8);

insert into medicos values (2,"MARIA FERNANDA","AV. ANA JACINTA 456",
"1899998855",3);

insert into medicos values (3,"JOSÉ ANTONIO","AV. CEL GOULART 963",
"1899998855",4),(4,"PEDRO JOSÉ","AV. A. RODRIGUES 956",
"1767675645",6),(5,"CARLOS PORTUGAL","AV. PINHEIROS 987",
"1899998855",7),(6,"BERENICE","AV. 11 DE MARIO 741",
"1899998855",5);

insert into pacientes values(1,"maria","endereço 1","11111111"),
(2,"carla","endereço 2","222222"),(3,"josé","endereço 3","333333"),
(4,"joão","endereço 4","4444444"),(5,"pedro","endereço 5","555555");

insert into consultas values (1,"2025-09-15 19:00:00",2,5);

insert into consultas values (2,current_time(),3,1),(3,current_time(),2,2),
  (4,current_time(),5,5),(5,current_time(),4,1);


insert into remedios values(1,"Ozempic"),(2,"Eliquis"),(3,"Keytruda"),
(4,"Humira"),(5,"Puran T4"),(6,"Neosoro"),(7,"Cimegripe"),(8,"Rivotril"),
(9,"Dipirona"),(10,"Dorflex");

insert into consultas_has_remedios (id_consulta,idremedios) 
values (1,2),(1,3),(1,5);

insert into consultas_has_remedios values (2,4,""),(3,3,""),(2,2,"");

select * from especialidade;
select * from medicos;
select * from pacientes;
select * from consultas;
select * from remedios;
select * from consultas_has_remedios;

update consultas_has_remedios set cor_posologia = "2 comp ao dia" where
id_consulta = 1 and idremedios = 3;

update consultas_has_remedios set cor_posologia = "1 comp a noite" where
idremedios = 2;

update consultas_has_remedios set cor_posologia = "meio comp ao dia" where
id_consulta <> 1;

update consultas_has_remedios set cor_posologia = 'DISOLVER NA ÁGUA' where
id_consulta = 1 or idremedios = 4;

SET SQL_SAFE_UPDATES = 1;

update consultas_has_remedios 
set cor_posologia = 'DISOLVER NA ÁGUA' 
where id_consulta = 1 or idremedios = 4;


delete from consultas_has_remedios where id_consulta = 2;

delete from consultas_has_remedios where id_consulta = 1 and idremedios = 3;

delete from remedios where idremedios = 10;

delete from remedios where idremedios 
    not in (select idremedios from consultas_has_remedios);
    
    
-- delete from remedios where idremedios in (1,6,7,8,9); 




 flush privileges;

 create user 'neto@localhost' identified by '123';
 
 select user from mysql.user;
 
-- drop user neto@localhost;
 grant all on clinica.* to 'neto@localhost';
 
 grant insert on clinica.* to 'neto@localhost';
 
 revoke all on clinica.* from 'neto@localhost';
 
select @@autocommit;
set autocommit = 0;

select * from especialidade;

insert into especialidade values (9,'pediatra');

commit;

delete from especialidade where idespecialidade = 1;

-- select * from especialidade;

-- delete from especialidade where idespecialidade= 10;

-- commit;



   