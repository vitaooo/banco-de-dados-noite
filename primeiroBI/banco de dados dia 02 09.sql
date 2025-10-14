create database if not exists livraria;

use livraria;

create table if not exists clientes(
cod_cliente int not null, nome varchar(50),
endereco varchar(100), telefone varchar(14), email varchar(50), 
primary key (cod_cliente));

create table if not exists livros( isbn varchar(20) not null, titulo varchar(50) not null,
autor int, editora int,
categoria int, estoque int,
valor decimal(10,2),
primary key(isbn),
foreign key (autor) references autores (id_autor),
foreign key (editora) references editoras (id_editora),
foreign key (categoria) references categorias (id_categoria));

create table if not exists autores(
id_autor int not null,
nome varchar(50),
primary key (id_autor));

create table if not exists editoras(id_editora int not null,
nome_categoria varchar(50) not null,
primary key (id_editora));

create table if not exists categorias(id_categoria int not null,
nome_categoria varchar(50),
primary key (id_categoria));

create table if not exists pedidos(
numero int not null,
datahora datetime,
cod_cliente int,
primary key (numero),
foreign key (cod_cliente) references clientes(cod_cliente));

create table if not exists pedidos_livro(numero int not null,
isbn varchar(20) not null,
qtde int,
primary key (numero, isbn),
foreign key (numero) references pedidos(numero),
foreign key (isbn) references livros(isbn));

