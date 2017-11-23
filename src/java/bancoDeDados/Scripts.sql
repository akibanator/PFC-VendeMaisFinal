--NOME DO BANCO: DBVendeMais
--USER: postgres
--PASSWORD: postgres

create table Usuario (
    usuario_id serial PRIMARY KEY,
    email varchar not null unique,
    senha varchar not null,
    cpf varchar(14) not null unique,
    nome varchar(100) not null,
    telefone varchar (15) not null,
    ativo integer not null,
    perfil varchar not null
);

create table Endereco (
    endereco_id serial PRIMARY KEY,
    cep varchar(9) not null,
    rua varchar(100) not null,
    bairro varchar(50) not null,
    cidade varchar(50) not null,
    estado char(2) not null,
    numero varchar(4) not null,
    complemento varchar (50),
	usuario_id int references Usuario on delete cascade on update cascade
);

create table Categoria (
    categoria_id serial PRIMARY KEY,
    ativo integer not null,
	nome varchar(50) not null
);

create table Subcategoria (
    subcategoria_id serial PRIMARY KEY,
    nome varchar(50) not null,
    ativo integer not null,
	categoria_id integer REFERENCES Categoria (categoria_id)
	
);

create table Anuncio (
    anuncio_id serial PRIMARY KEY,
    titulo varchar (100) not null,
    descricao varchar(1000) not null,
    estado_produto varchar(10) not null,
    quantidade numeric(4) not null,
    largura varchar,
    altura varchar,
    peso varchar,
    cep varchar,
    bairro varchar,
    cidade varchar,
    estado varchar,
    rua varchar,
    vaga varchar,
    area varchar,
    areatotal varchar,
    ano varchar,
    marca varchar,
    cor varchar,
    preco decimal(7,2) not null,
    data_cadastro date not null,
    ativo int not null,
    forma_envio varchar (100),
    valor_frete decimal,
    observacoes varchar,
    pic1 varchar,
    pic2 varchar,
    pic3 varchar,
    pic4 varchar,
    pic5 varchar,
    motivo varchar,
    forma_pagamento varchar,
    prazo_entrega int;
        usuario_id int references Usuario on delete cascade on update cascade,
        categoria_id int references Categoria on delete cascade on update cascade,
        subcategoria_id int references Subcategoria on delete cascade on update cascade
);

create table Compra (
    compra_id serial PRIMARY KEY,
    data_compra date not null,
    quantidade numeric(4) not null,
    total decimal(7,2),
    subtotal decimal(7,2),       
    anuncio_id int references Anuncio on delete cascade on update cascade,    
    enderecoEnvio varchar not null,
    vendedor_id int references Usuario on delete cascade on update cascade,
    comprador_id int references Usuario on delete cascade on update cascade,
    nota int,
    comentario varchar (300)
);

create table Report(
	report_id serial primary key,
	mensagem varchar (1000) not null,
	email varchar(100) not null,
	nome varchar(50) not null,
	telefone varchar (15) not null,
	status varchar (8) not null
)
