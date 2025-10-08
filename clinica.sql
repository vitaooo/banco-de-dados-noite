select idespecialidade, esp_nome from especialidades where idespecialidade = 2;

select * from medicos
inner join especialidades;

select m.med_nome, e.esp_nome, m.med_telefone from medicos m inner join especialidades e on m.med_especialidade = e.idespecialidade;

update medicos set med_especialidade = 2 where id_crm = 2;

select m.med_nome, m.med_telefone from medicos m
inner join especialidades e on m.med_especialidade = e.idespecialidade
where e.esp_nome = 'Dermato';