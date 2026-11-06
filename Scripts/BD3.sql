create table Filiais(
    codigo char(1) not null,
    nome varchar2(100) not null,
    telefone varchar2(10) not null,
    constraint pk_codigo primary key (codigo)
    );

create table Clientes(
    id number(8) not null,
    nome varchar2(100)not null,
    sexo char(1) not null,
    limite varchar2(100) not null,
    filial char(1) not null,
    constraint pk_id primary key (id),
    constraint fk_filiais_clientes foreign key (filial) references Filiais (codigo)
    );
    
alter table Filiais
    modify nome varchar2(100);
    
insert into Filiais values ('A','Centro','3332-2020');
insert into Filiais values ('B','Shopping','3333-1010');
insert into Filiais values ('C','Votorantim','3243-1515');
insert into Filiais values ('D','Itu','9321-8345');

insert into Clientes values ('5','JOÃO','F','R$500,00','A');
insert into Clientes values ('28','MARIA','F','R$300,00','C');
insert into Clientes values ('4','PEDRO','M','R$500,00','A');
insert into Clientes values ('32','PAULO','M','R$800,00','A');
insert into Clientes values ('16','ANA','F','R$900,00','C');
insert into Clientes values ('15','JOSÉ','M','R$500,00','B');
insert into Clientes values ('22','ANTONIO','M','R$500,00','');
insert into Clientes values ('19','CLÁDIA','F','R$900,00','B');

select * from Filiais;

select * from Clientes;

alter table Clientes
    modify (filial null);

delete from Clientes
    where id = 16;
    
update Clientes
    set filial = 'B';
    
delete from Filiais
    where codigo = 'C';
    
insert into Filiais values ('E','Salto','8343-9483');

insert into Clientes values ('25','Roberta','F','R$800,00','E');

update Clientes
    set filial = 'E'
    where id = 25;
    
update Clientes
    set limite = 'R$1000,00'
    where id = 19;



        




