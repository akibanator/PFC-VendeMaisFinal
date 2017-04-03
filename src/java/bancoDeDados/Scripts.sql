--NOME DO BANCO: DBVendeMais
--USER: postgres
--PASSWORD: postgres

create table Usuario (
    usuario_id serial PRIMARY KEY,
    email varchar(100) not null unique,
    senha varchar(10) not null,
    cpf varchar(14) not null unique,
    nome varchar(50) not null,
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
    complemento varchar (30),
	usuario_id int references Usuario on delete cascade on update cascade
);

create table Anuncio (
    anuncio_id serial PRIMARY KEY,
    categoria varchar,
    subcategoria varchar,
    titulo varchar (50) not null,
    descricao varchar(1000),
    estado_produto varchar(10) not null,
    quantidade numeric(4) not null,
    largura decimal not null,
    altura decimal not null,
    peso decimal not null,
    preco decimal(7,2) not null,
    data_cadastro date not null,
    ativo int not null,
    forma_envio varchar (50) not null,
    valor_frete decimal not null,
        endereco_venda int references Endereco on delete cascade on update cascade ,
        usuario_id int references Usuario on delete cascade on update cascade
);

create table Historico (
    compra_id serial PRIMARY KEY,
    data_compra date not null,
    quantidade numeric(4) not null,
    total decimal(7,2),
    subtotal decimal(7,2),
    emailC varchar not null,
    telefoneC varchar,
    vendedor varchar not null,
    comprador varchar not null,
    emailV varchar not null,
    telefoneV varchar,
    produto varchar not null,
    anuncio_id int references Anuncio on delete cascade on update cascade,
    formaEnvio varchar not null,
    enderecoEnvio varchar not null,
    vendedor_id int references Usuario on delete cascade on update cascade,
    comprador_id int references Usuario on delete cascade on update cascade 
);

create table Categoria (
    categoria_id serial PRIMARY KEY,
	nome varchar(20) not null
);

create table Subcategoria (
    subcategoria_id serial PRIMARY KEY,
	categoria_id integer REFERENCES Categoria (categoria_id),
	nome varchar(20) not null
);

create table Report(
	report_id serial primary key,
	mensagem varchar (1000) not null,
	email varchar(100) not null,
	nome varchar(50) not null,
	telefone varchar (15) not null,
	status varchar (8) not null
)