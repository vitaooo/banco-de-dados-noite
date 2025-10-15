-- ex 1
select nome, contato from clientes order by nome;

-- ex 2
select * from clientes order by cliente_id desc;

-- ex 3 (as quantidade == nome da tabela que conta as linhas
select count(nome) from clientes;

-- ex 4
select count(nome) as totalsilva from clientes where nome LIKE '%SILVA%';

-- ex 5
select distinct estado from enderecos order by estado;

-- ex 6
select distinct estado, cidade from enderecos 
order by estado, cidade;

-- ex 7
SELECT distinct CONCAT(cidade, '-' ,estado) as cidade_estado FROM enderecos;

-- ex 9
select * from enderecos where numero >= 100 and numero <= 200;
-- or
select * from enderecos where 
numero between 100 and 200;

-- ex 10
select distinct hospedagem_id, rua from hospedagens h
inner join enderecos e on e.endereco_id = h.endereco_id;

-- ex 11
select p.proprietario_id, p.nome, p.contato, 
h.tipo, 
e.rua, e.numero, e.bairro, e.cidade, e.estado 
from proprietarios p
inner join hospedagens h on p.proprietario_id = h.proprietario_id
inner join enderecos e on e.endereco_id = h.endereco_id
where e.estado = 'SP';

-- ex 12
select
	p.nome
from 
	proprietarios p
inner join hospedagens h 
		on p.proprietario_id = h.proprietario_id
group by nome
order by qtde desc;

-- ex 13


-- ex 14
select
	p.nome, count(*) as qtde 
from 
	proprietarios p
inner join hospedagens h 
		on p.proprietario_id = h.proprietario_id
group by nome
order by qtde desc;

-- ex 18
select p.nome, sum(a.preco_total) as total from proprietarios p
inner join hospedagens h on h.proprietario_id = 
    p.proprietario_id
inner join alugueis a on a.hospedagem_id = 
	h.hospedagem_id
inner join enderecos e on e.endereco_id = 
	h.endereco_id
where year(a.data_inicio)=2023 and
e.estado = 'SP' and h.tipo = 'APARTAMENTO'
group by 1
order by total desc;

