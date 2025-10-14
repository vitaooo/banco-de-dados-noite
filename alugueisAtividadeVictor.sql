-- ex 1
use alugueis;
select nome, contato from clientes order by nome;

-- ex 3 (as quantidade == nome da tabela que conta as linhas
select count(nome) from clientes;

-- ex 4
select count(nome) as totalsilva from clientes where nome LIKE '%SILVA%';

-- ex 6
select distinct estado, cidade from enderecos 
order by estado, cidade;