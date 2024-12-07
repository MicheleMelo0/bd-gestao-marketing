-- Estrutura
CREATE SEQUENCE seq_campanha_canal START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_canais START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_campanha START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_interacoes START WITH 1 INCREMENT BY 1;

CREATE TABLE CANAIS_MARKETING(
    CANAL_ID NUMBER DEFAULT seq_canais.NEXTVAL PRIMARY KEY,
    NOME VARCHAR2(100) NOT NULL
);

CREATE TABLE CAMPANHAS_MARKETING(
    CAMPANHA_ID NUMBER DEFAULT seq_campanha.NEXTVAL PRIMARY KEY,
    NOME VARCHAR2(100) NOT NULL,
    DATA_INICIO DATE,
    DATA_FIM DATE,
    ORCAMENTO NUMBER(10,2)
);

CREATE TABLE INTERACOES_MARKETING(
    INTERACAO_ID NUMBER DEFAULT seq_interacoes.NEXTVAL PRIMARY KEY,
    CAMPANHA_ID NUMBER NOT NULL,
    DATA_INTERACAO DATE,
    TIPO VARCHAR2(50),
    METRICA VARCHAR2(100),
    VALOR NUMBER,

    CONSTRAINT FK_CAMPANHA FOREIGN KEY (CAMPANHA_ID) REFERENCES CAMPANHAS_MARKETING(CAMPANHA_ID)
);

CREATE TABLE CAMPANHAS_CANAIS(
    CAMPANHA_CANAL_ID NUMBER DEFAULT seq_campanha_canal.NEXTVAL PRIMARY KEY,
    CAMPANHA_ID NUMBER NOT NULL,
    CANAL_ID NUMBER NOT NULL,
    GASTOS NUMBER(10,2),

    CONSTRAINT FK_CAMPANHA_CANAL FOREIGN KEY (CAMPANHA_ID) REFERENCES CAMPANHAS_MARKETING(CAMPANHA_ID),
    CONSTRAINT FK_CANAL_ID FOREIGN KEY (CANAL_ID) REFERENCES CANAIS_MARKETING(CANAL_ID)
);