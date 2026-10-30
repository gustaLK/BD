--DDL
CREATE TABLE socios (
    codigo   NUMBER(8) PRIMARY KEY,
    nome     VARCHAR2(40) NOT NULL,
    telefone VARCHAR2(20) NOT NULL,
    lograd   VARCHAR2(30) NOT NULL,
    complem  VARCHAR2(15),
    bairro   VARCHAR2(15),
    cidade   VARCHAR(20),
    uf       CHAR(2),
    cep      VARCHAR2(8)
);

CREATE TABLE assuntos (
    codigo NUMBER(8) NOT NULL,
    nome   VARCHAR2(40) NOT NULL,
    CONSTRAINT pk_assuntos PRIMARY KEY ( codigo ),
    CONSTRAINT uk_nome UNIQUE ( nome )
);

CREATE TABLE livros (
    id         VARCHAR2(15),
    titulo     VARCHAR2(80) NOT NULL,
    editora    VARCHAR2(20) NOT NULL,
    totpag     NUMBER(4),
    diasprazo  NUMBER(4),
    codassunto NUMBER(8) NOT NULL,
    CONSTRAINT pk_livros PRIMARY KEY ( id ),
    CONSTRAINT fk_assuntos_livro FOREIGN KEY ( codassunto )
        REFERENCES assuntos ( codigo ),
    CONSTRAINT ck_totpag CHECK ( totpag > 0 ),
    CONSTRAINT ck_diasprazo CHECK ( diasprazo >= 0 )
);

CREATE TABLE emprestimos (
    idlivro    VARCHAR2(15),
    codsocio   NUMBER(8),
    dtretirada DATE NOT NULL,
    dtdevprev  DATE NOT NULL,
    dtdevreal  DATE,
    vlmulta    NUMBER(8, 2) CHECK ( vlmulta >= 0 ),
    CONSTRAINT pk_emprestimos PRIMARY KEY ( idlivro,
                                            codsocio,
                                            dtretirada ),
    CONSTRAINT fk_socios_empr FOREIGN KEY ( codsocio )
        REFERENCES socios ( codigo ),
    CONSTRAINT fk_livros_empr FOREIGN KEY ( idlivro )
        REFERENCES livros ( id )
);

CREATE TABLE autores (
    codigo NUMBER(8),
    nome   VARCHAR2(40) NOT NULL,
    origem VARCHAR2(20) NOT NULL,
    CONSTRAINT pk_autores PRIMARY KEY ( codigo )
);

CREATE TABLE autorias (
    idlivro  VARCHAR2(15),
    codautor NUMBER(8),
    CONSTRAINT pk_autorias PRIMARY KEY ( idlivro,
                                         codautor ),
    CONSTRAINT fk_livros_autorias FOREIGN KEY ( idlivro )
        REFERENCES livros ( id ),
    CONSTRAINT fk_autores_autorias FOREIGN KEY ( codautor )
        REFERENCES autores ( codigo )
);

--DML
INSERT INTO socios VALUES (1, 'Luiz Cláudio', '2222222', 'Rua central', '100', null, 'Sorocaba', 'SP', '18100000');
INSERT INTO socios (codigo, nome, telefone, lograd) VALUES (67, 'Gustavo Henrique', '15992325501', 'Rua Expedicionarios');

UPDATE socios set bairro='Centro' WHERE codigo=1;
delete from socios where codigo=67;

SELECT * from socios
