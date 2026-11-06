create table editora (
    ideditora NUMBER(8),
    nome varchar2(100) not null,
    cidade varchar2(70) not null,
    UF char(2) not null,
    constraint  pk_editora primary key (ideditora)
);

create sequence sq_editora;

select sq_editora.nextval from dual;
    
insert into editora values (sq_editora.nextval, 'Erika', 'Sao Paulo', 'SP');
insert into editora values (sq_editora.nextval, 'Juliano', 'Amapa', 'AP');
insert into editora values (sq_editora.nextval, 'Globo', 'Sao Paulo', 'SP');
insert into editora values (sq_editora.nextval, 'Rural', 'Sao Paulo', 'SP');
commit;

update editora set cidade='Fortaleza' where ideditora=6;
update editora set UF='CE' where ideditora=6;

select * from editora;

alter table livros 
    add ideditora number(8);
    
alter table livros
    add constraint fk_livros_editora foreign key (ideditora) references editora (ideditora);
    
alter table livros
    drop editora;