create table Filiais(
    codigo char(1) not null,
    nome varchar2(100) not null,
    telefone varchar2(10) not null,
    constraint pk_filiais primary key (codigo)
    );

create table Clientes(
    id number(8) not null,
    nome varchar2(100)not null,
    sexo char(1) not null,
    limite varchar2(100) not null,
    filial char(1),
    constraint pk_clientes primary key (id),
    constraint fk_filiais_clientes foreign key (filial) references Filiais (codigo)
    );

insert into Filiais values ('A','Centro','33322020');
insert into Filiais values ('B','Shopping','33331010');
insert into Filiais values ('C','Votorantim','32431515');
insert into Filiais values ('D','Itu','93218345');

insert into Clientes values ('5','JOÃO','F','500.00','A');
insert into Clientes values ('28','MARIA','F','300.00','C');
insert into Clientes values ('4','PEDRO','M','500.00','A');
insert into Clientes values ('32','PAULO','M','800.00','A');
insert into Clientes values ('16','ANA','F','900.00','C');
insert into Clientes values ('15','JOSÉ','M','500.00','B');
insert into Clientes values ('22','ANTONIO','M','500.00','');
insert into Clientes values ('19','CLÁDIA','F','900.00','B');

select * from Filiais;

select * from Clientes;

delete from clientes
      where id = 16;

update clientes 
      set filial = B
      where id = 28;

delete from filiais
      where codigo = 'C';

insert into filiais values ('E', 'salto', '83439483');
insert into clientes values (25, 'Roberta', 'F',  '800.00', 'E');

update clientes
      set limite = +100
      where sexo = F;
