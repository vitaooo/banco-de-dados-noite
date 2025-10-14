select idespecialidade, esp_nome from especialidades where idespecialidade = 2;

select * from medicos
inner join especialidades;

-- metodo atual
select 
	m.med_nome, e.esp_nome, m.med_fone 
from 
	medicos m 
inner join especialidade e on m.med_especialidade = e.idespecialidade;

update medicos set med_especialidade = 2 where id_crm = 8;

select m.med_nome, m.med_fone from medicos m
inner join especialidade e on m.med_especialidade = e.idespecialidade
where e.esp_nome = 'Dermato';

select count(*) from medicos;

select * from medicos order by med_nome desc;

select 
	esp_nome as nome_medico, count(*) as quantidade 
from 
	especialidade e
inner join medicos m on e.idespecialidade = m.med_especialidade
group by 1
order by 1 desc;

-- metodo antigo
select 
	m.med_nome, e.esp_nome, m.med_fone
from medicos m, especialidade e
where 
	m.med_especialidade = e.idespecialidade;