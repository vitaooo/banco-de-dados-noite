create database livraria;
use livraria;
create table clientes(cod_cliente int not null, 
nome varchar(50) not null,endereco varchar(100), 
telefone varchar(14), email varchar(50),
primary key (cod_cliente));

create table categorias(id_categoria int not null,
nome_categoria varchar(50) not null,
primary key (id_categoria));

create table if not exists autores(id_autor int not null,
nome_autor varchar(50),
primary key (id_autor));

create table editoras(id_editora int not null,
nome_editora varchar(50),
primary key (id_editora));

create table livros(isbn varchar(14) not null,
titulo varchar(100) not null,
cod_categoria int not null,
cod_editora int not null,
cod_autor int not null,
valor decimal(10,2),
estoque int,
primary key (isbn),
foreign key (cod_categoria) references categorias(id_categoria),
foreign key (cod_editora) references editoras(id_editora),
foreign key (cod_autor) references autores(id_autor));

create table pedidos(numero int not null,
datahora datetime,
cod_cliente int not null,
primary key (numero),
foreign key (cod_cliente) references clientes(cod_cliente));

create table pedidos_livros(numero int not null,
isbn varchar(14) not null,
qtde int,
primary key(numero, isbn),
foreign key (numero) references pedidos(numero),
foreign key (isbn) references livros(isbn));

alter table pedidos_livros add valor decimal(10,2);

rename table pedido_livro to pedidos_livros;

drop table pedidos_livros;

insert into autores(id_autor, nome_autor) 
values (1,"MARIA JOSE");

insert into autores(id_autor, nome_autor) 
values (2,"CARLOS ANTONIO");

insert into autores VALUES (3,"JOSE ANTONIO"),
							(4,"JOSE ANTONIO"),
                            (5,"CARLOS JOSE");

INSERT INTO CATEGORIAS VALUES (1,"ROMANCE"),(2,"FICÇÃO"),(3,"AUTO AJUDA");

select * from autores;  -- SELECIONAR AUTORES

select * FROM CATEGORIAS;

select * from editoras;

insert into editoras values(1,"vida"),(2,"fox");

select * from livros;

insert into livros values ("isbn123isbn456","PAI RICO PAI POBRE",2,1,1,15.5,10);




