use clinica;

select * from especialidade;

insert into especialidade values (10,'psiquiatra');

set autocommit = 0;

delete from especialidade where idespecialidade >= 9;

select * from medicos;

delete from medicos where id_crm = 8;

rollback;