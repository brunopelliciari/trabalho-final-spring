DROP TABLE LOCACAO;
DROP TABLE VEICULO;
DROP TABLE CARTAO_CREDITO;
DROP TABLE CONTATO;
DROP TABLE ENDERECO_CLIENTE;
DROP TABLE CLIENTE;
DROP TABLE FUNCIONARIO;

DROP SEQUENCE SEQ_LOCACAO;
DROP SEQUENCE SEQ_VEICULO;
DROP SEQUENCE SEQ_CARTAO_CREDITO;
DROP SEQUENCE SEQ_CLIENTE;
DROP SEQUENCE SEQ_CONTATO;
DROP SEQUENCE SEQ_ENDERECO_CLIENTE;
DROP SEQUENCE SEQ_FUNCIONARIO;


CREATE TABLE FUNCIONARIO(
id_funcionario INT PRIMARY KEY NOT NULL,
nome_funcionario VARCHAR2 (200) NOT NULL,
cpf_funcionario CHAR (11) UNIQUE NOT NULL,
email_funcionario VARCHAR2(100) NOT NULL,
matricula INT UNIQUE NOT NULL
);

CREATE TABLE CLIENTE (
id_cliente INT PRIMARY KEY NOT NULL,
nome_cliente VARCHAR2 (200) NOT NULL,
cpf_cliente CHAR (11) UNIQUE NOT NULL
);

CREATE TABLE ENDERECO_CLIENTE (
id_endereco INT PRIMARY KEY NOT NULL,
id_cliente INT NOT NULL,
rua VARCHAR2 (200) NOT NULL,
numero VARCHAR2(6) NOT NULL,
bairro VARCHAR2(50) NOT NULL,
cidade VARCHAR2(40) NOT NULL,
estado VARCHAR2(40) NOT NULL,
cep CHAR (9) NOT NULL,
complemento VARCHAR2(100) NOT NULL,
CONSTRAINT FK_ID_CLIENTE_ENDERECO_CLIENTE FOREIGN KEY ( ID_CLIENTE ) REFERENCES CLIENTE( ID_CLIENTE )
);

CREATE TABLE CONTATO (
id_contato INT PRIMARY KEY NOT NULL,
id_cliente INT NOT NULL,
telefone VARCHAR2(20) NOT NULL,
email VARCHAR2(50) NOT NULL,
CONSTRAINT FK_ID_CLIENTE_CONTATO FOREIGN KEY ( ID_CLIENTE ) REFERENCES CLIENTE( ID_CLIENTE )
);


CREATE TABLE CARTAO_CREDITO(
id_cartao INT PRIMARY KEY NOT NULL,
numero_cartao VARCHAR2 (20) NOT NULL,
bandeira_cartao VARCHAR2(10),
validade VARCHAR2 (7) NOT NULL,
limite NUMBER (10, 2) NOT NULL
);

CREATE TABLE VEICULO(
id_veiculo INT PRIMARY KEY NOT NULL,
marca VARCHAR2(200) NOT NULL,
modelo VARCHAR2(200) NOT NULL,
cor VARCHAR2 (40) NOT NULL,
ano NUMBER (4, 0) NOT NULL,
quilometragem NUMBER (8, 2) NOT NULL,
valor_locacao_diario NUMBER (6,2) NOT NULL,
disponibilidade VARCHAR2(11) NOT NULL,
placa VARCHAR2(7) NOT NULL
);


CREATE TABLE LOCACAO(
id_locacao INT PRIMARY KEY NOT NULL,
data_locacao DATE NOT NULL,
data_devolucao DATE NOT NULL,
valor_locacao_total NUMBER (14, 2) NOT NULL,
id_cliente INT NOT NULL,
id_veiculo INT NOT NULL,
id_funcionario INT NOT NULL,
id_cartao INT NOT NULL,
CONSTRAINT FK_LOCACAO_CLIENTE_ID_CLIENTE FOREIGN KEY ( ID_CLIENTE ) REFERENCES CLIENTE( ID_CLIENTE ),
CONSTRAINT FK_LOCACAO_VEICULO_ID_VEICULO FOREIGN KEY ( ID_VEICULO ) REFERENCES VEICULO( ID_VEICULO ),
CONSTRAINT FK_LOCACAO_FUNCIONARIO_ID_FUN FOREIGN KEY ( ID_FUNCIONARIO ) REFERENCES FUNCIONARIO( ID_FUNCIONARIO ),
CONSTRAINT FK_LOCACAO_CARTAO_ID_CARTAO FOREIGN KEY ( ID_CARTAO ) REFERENCES CARTAO_CREDITO(ID_CARTAO )
);


CREATE SEQUENCE SEQ_VEICULO
START WITH 1
INCREMENT BY 1
NOCACHE NOCYCLE;

CREATE SEQUENCE SEQ_FUNCIONARIO
START WITH 1
INCREMENT BY 1
NOCACHE NOCYCLE;

CREATE SEQUENCE SEQ_CLIENTE
START WITH 1
INCREMENT BY 1
NOCACHE NOCYCLE;

CREATE SEQUENCE SEQ_LOCACAO
START WITH 1
INCREMENT BY 1
NOCACHE NOCYCLE;

CREATE SEQUENCE SEQ_CARTAO_CREDITO
START WITH 1
INCREMENT BY 1
NOCACHE NOCYCLE;

CREATE SEQUENCE SEQ_CONTATO
START WITH 1
INCREMENT BY 1
NOCACHE NOCYCLE;

CREATE SEQUENCE SEQ_ENDERECO_CLIENTE
START WITH 1
INCREMENT BY 1
NOCACHE NOCYCLE;


INSERT INTO VEICULO (ID_VEICULO, MARCA, MODELO, COR, ANO, QUILOMETRAGEM, VALOR_LOCACAO_DIARIO, DISPONIBILIDADE, PLACA)
VALUES (SEQ_VEICULO.nextval, 'Honda', 'Civic', 'Preto', 2019, 250000, 220, 'ALUGADO', 'APT0192');
INSERT INTO VEICULO (ID_VEICULO, MARCA, MODELO, COR, ANO, QUILOMETRAGEM, VALOR_LOCACAO_DIARIO, DISPONIBILIDADE, PLACA)
VALUES (SEQ_VEICULO.nextval, 'Honda', 'Fit', 'Preto', 2020, 59000, 160, 'ALUGADO', 'TSR1635');
INSERT INTO VEICULO (ID_VEICULO, MARCA, MODELO, COR, ANO, QUILOMETRAGEM, VALOR_LOCACAO_DIARIO, DISPONIBILIDADE, PLACA)
VALUES (SEQ_VEICULO.nextval, 'Toyota', 'Corolla', 'Cinza', 2019, 12000, 220, 'ALUGADO', 'BEH8574');
INSERT INTO VEICULO (ID_VEICULO, MARCA, MODELO, COR, ANO, QUILOMETRAGEM, VALOR_LOCACAO_DIARIO, DISPONIBILIDADE, PLACA)
VALUES (SEQ_VEICULO.nextval, 'Fiat', 'Uno', 'Verde', 2021, 75700, 120, 'ALUGADO', 'IAT6354');

INSERT INTO VEICULO (ID_VEICULO, MARCA, MODELO, COR, ANO, QUILOMETRAGEM, VALOR_LOCACAO_DIARIO, DISPONIBILIDADE, PLACA)
VALUES (SEQ_VEICULO.nextval, 'Volkswagen', 'Taos', 'azul', 2021, 89261, 400, 'ALUGADO', 'NUS8273');
INSERT INTO VEICULO (ID_VEICULO, MARCA, MODELO, COR, ANO, QUILOMETRAGEM, VALOR_LOCACAO_DIARIO, DISPONIBILIDADE, PLACA)
VALUES (SEQ_VEICULO.nextval, 'Volkswagen', 'jetta', 'Preto', 2022, 80560, 250, 'ALUGADO', 'PQI9832');
INSERT INTO VEICULO (ID_VEICULO, MARCA, MODELO, COR, ANO, QUILOMETRAGEM, VALOR_LOCACAO_DIARIO, DISPONIBILIDADE, PLACA)
VALUES (SEQ_VEICULO.nextval, 'hyundai', 'Creta', 'Branco', 2019, 300200, 200, 'DISPONIVEL', 'MCN0932');
INSERT INTO VEICULO (ID_VEICULO, MARCA, MODELO, COR, ANO, QUILOMETRAGEM, VALOR_LOCACAO_DIARIO, DISPONIBILIDADE, PLACA)
VALUES (SEQ_VEICULO.nextval, 'Mercedes-Benz', 'GLB', 'Cinza', 2022, 50200, 1200, 'DISPONIVEL', 'INT7463');

INSERT INTO VEICULO (ID_VEICULO, MARCA, MODELO, COR, ANO, QUILOMETRAGEM, VALOR_LOCACAO_DIARIO, DISPONIBILIDADE, PLACA)
VALUES (SEQ_VEICULO.nextval, 'Chevrolet', 'Corsa Premium', 'Preto', 2009, 56000, 120, 'DISPONIVEL', 'VAR3121');
INSERT INTO VEICULO (ID_VEICULO, MARCA, MODELO, COR, ANO, QUILOMETRAGEM, VALOR_LOCACAO_DIARIO, DISPONIBILIDADE, PLACA)
VALUES (SEQ_VEICULO.nextval, 'Chevrolet', 'Onix', 'Prata', 2016, 98000, 220, 'DISPONIVEL', 'LUI2924');
INSERT INTO VEICULO (ID_VEICULO, MARCA, MODELO, COR, ANO, QUILOMETRAGEM, VALOR_LOCACAO_DIARIO, DISPONIBILIDADE, PLACA)
VALUES (SEQ_VEICULO.nextval, 'Volkswagem', 'Gol G6', 'Vermelho', 2020, 87000, 200, 'DISPONIVEL', 'KAR0620');
INSERT INTO VEICULO (ID_VEICULO, MARCA, MODELO, COR, ANO, QUILOMETRAGEM, VALOR_LOCACAO_DIARIO, DISPONIBILIDADE, PLACA)
VALUES (SEQ_VEICULO.nextval, 'Renault', 'Clio', 'Branco', 2010, 70000, 130, 'DISPONIVEL', 'TUL0932');

SELECT * FROM VEICULO;

INSERT INTO FUNCIONARIO (ID_FUNCIONARIO, NOME_FUNCIONARIO, CPF_FUNCIONARIO, EMAIL_FUNCIONARIO, MATRICULA)
VALUES (SEQ_FUNCIONARIO.nextval, 'Dudu do Palmeiras', '85235795125', 'jhennyffersobrinho@gmail.com', '123');
INSERT INTO FUNCIONARIO (ID_FUNCIONARIO, NOME_FUNCIONARIO, CPF_FUNCIONARIO, EMAIL_FUNCIONARIO, MATRICULA)
VALUES (SEQ_FUNCIONARIO.nextval, 'Luciano Huck', '89512595125', 'jhennyffersobrinho@gmail.com', '456');
INSERT INTO FUNCIONARIO (ID_FUNCIONARIO, NOME_FUNCIONARIO, CPF_FUNCIONARIO, EMAIL_FUNCIONARIO, MATRICULA)
VALUES (SEQ_FUNCIONARIO.nextval, 'Michael Jackson', '19735795108', 'jhennyffersobrinho@gmail.com', '789');
INSERT INTO FUNCIONARIO (ID_FUNCIONARIO, NOME_FUNCIONARIO, CPF_FUNCIONARIO, EMAIL_FUNCIONARIO, MATRICULA)
VALUES (SEQ_FUNCIONARIO.nextval, 'Silvio Santos', '98563210444', 'jhennyffersobrinho@gmail.com', '145');

INSERT INTO FUNCIONARIO (ID_FUNCIONARIO, NOME_FUNCIONARIO, CPF_FUNCIONARIO, EMAIL_FUNCIONARIO, MATRICULA)
VALUES (SEQ_FUNCIONARIO.nextval, 'Maria fernandes', '52355125209', 'jhennyffersobrinho@gmail.com', '369');
INSERT INTO FUNCIONARIO (ID_FUNCIONARIO, NOME_FUNCIONARIO, CPF_FUNCIONARIO, EMAIL_FUNCIONARIO, MATRICULA)
VALUES (SEQ_FUNCIONARIO.nextval, 'Eva Nunes', '99512595025', 'jhennyffersobrinho@gmail.com', '586');
INSERT INTO FUNCIONARIO (ID_FUNCIONARIO, NOME_FUNCIONARIO, CPF_FUNCIONARIO, EMAIL_FUNCIONARIO, MATRICULA)
VALUES (SEQ_FUNCIONARIO.nextval, 'Lucas Souza', '89735795105', 'jhennyffersobrinho@gmail.com', '776');
INSERT INTO FUNCIONARIO (ID_FUNCIONARIO, NOME_FUNCIONARIO, CPF_FUNCIONARIO, EMAIL_FUNCIONARIO, MATRICULA)
VALUES (SEQ_FUNCIONARIO.nextval, 'Nathanael Queiroz', '18554210444', 'jhennyffersobrinho@gmail.com', '195');

INSERT INTO FUNCIONARIO (ID_FUNCIONARIO, NOME_FUNCIONARIO, CPF_FUNCIONARIO, EMAIL_FUNCIONARIO, MATRICULA)
VALUES (SEQ_FUNCIONARIO.nextval, 'Nikola Tesla', '35184287612', 'jhennyffersobrinho@gmail.com', '140');
INSERT INTO FUNCIONARIO (ID_FUNCIONARIO, NOME_FUNCIONARIO, CPF_FUNCIONARIO, EMAIL_FUNCIONARIO, MATRICULA)
VALUES (SEQ_FUNCIONARIO.nextval, 'Thomas Edison', '98531647862', 'jhennyffersobrinho@gmail.com', '220');
INSERT INTO FUNCIONARIO (ID_FUNCIONARIO, NOME_FUNCIONARIO, CPF_FUNCIONARIO, EMAIL_FUNCIONARIO, MATRICULA)
VALUES (SEQ_FUNCIONARIO.nextval, 'Michael Faraday', '97963521584', 'jhennyffersobrinho@gmail.com', '333');
INSERT INTO FUNCIONARIO (ID_FUNCIONARIO, NOME_FUNCIONARIO, CPF_FUNCIONARIO, EMAIL_FUNCIONARIO, MATRICULA)
VALUES (SEQ_FUNCIONARIO.nextval, 'Albert Einstein', '97956412853', 'jhennyffersobrinho@gmail.com', '240');

SELECT * FROM FUNCIONARIO;

INSERT INTO CLIENTE (ID_CLIENTE, NOME_CLIENTE, CPF_CLIENTE)
VALUES (SEQ_CLIENTE.nextval, 'Thiago', '85226595885');
INSERT INTO CLIENTE (ID_CLIENTE, NOME_CLIENTE, CPF_CLIENTE)
VALUES (SEQ_CLIENTE.nextval, 'Marcos', '75335795188');
INSERT INTO CLIENTE (ID_CLIENTE, NOME_CLIENTE, CPF_CLIENTE)
VALUES (SEQ_CLIENTE.nextval, 'Carlos', '11122233344');
INSERT INTO CLIENTE (ID_CLIENTE, NOME_CLIENTE, CPF_CLIENTE)
VALUES (SEQ_CLIENTE.nextval, 'Sandro', '55566677788');

INSERT INTO CLIENTE (ID_CLIENTE, NOME_CLIENTE, CPF_CLIENTE)
VALUES (SEQ_CLIENTE.nextval, 'Julia', '69226595895');
INSERT INTO CLIENTE (ID_CLIENTE, NOME_CLIENTE, CPF_CLIENTE)
VALUES (SEQ_CLIENTE.nextval, 'Carlos', '70335795182');
INSERT INTO CLIENTE (ID_CLIENTE, NOME_CLIENTE, CPF_CLIENTE)
VALUES (SEQ_CLIENTE.nextval, 'Lucas', '10983456204');
INSERT INTO CLIENTE (ID_CLIENTE, NOME_CLIENTE, CPF_CLIENTE)
VALUES (SEQ_CLIENTE.nextval, 'Rebeca', '01265396710');

INSERT INTO CLIENTE (ID_CLIENTE, NOME_CLIENTE, CPF_CLIENTE)
VALUES (SEQ_CLIENTE.nextval, 'Peter Parker', '22659588587');
INSERT INTO CLIENTE (ID_CLIENTE, NOME_CLIENTE, CPF_CLIENTE)
VALUES (SEQ_CLIENTE.nextval, 'Steven Strange', '65432189076');
INSERT INTO CLIENTE (ID_CLIENTE, NOME_CLIENTE, CPF_CLIENTE)
VALUES (SEQ_CLIENTE.nextval, 'Tony Stark', '03421876542');
INSERT INTO CLIENTE (ID_CLIENTE, NOME_CLIENTE, CPF_CLIENTE)
VALUES (SEQ_CLIENTE.nextval, 'Bruce Banner', '07432198753');

SELECT * FROM CLIENTE;

INSERT INTO CONTATO (ID_CONTATO, ID_CLIENTE, TELEFONE, EMAIL)
VALUES (SEQ_CONTATO.nextval, 1, '(11) 99999-8888', 'thiago@email.com');
INSERT INTO CONTATO (ID_CONTATO, ID_CLIENTE, TELEFONE, EMAIL)
VALUES (SEQ_CONTATO.nextval, 2, '(47) 33333-8888', 'marcos@email.com');
INSERT INTO CONTATO (ID_CONTATO, ID_CLIENTE, TELEFONE, EMAIL)
VALUES (SEQ_CONTATO.nextval, 3, '(16) 22222-8888', 'carlos@email.com');
INSERT INTO CONTATO (ID_CONTATO, ID_CLIENTE, TELEFONE, EMAIL)
VALUES (SEQ_CONTATO.nextval, 4, '(11) 11111-8888', 'sandro@email.com');

INSERT INTO CONTATO (ID_CONTATO, ID_CLIENTE, TELEFONE, EMAIL)
VALUES (SEQ_CONTATO.nextval, 5, '(46) 99191-8568', 'juliaf06@email.com');
INSERT INTO CONTATO (ID_CONTATO, ID_CLIENTE, TELEFONE, EMAIL)
VALUES (SEQ_CONTATO.nextval, 6, '(93) 99234-8913', 'carlosperez@email.com');
INSERT INTO CONTATO (ID_CONTATO, ID_CLIENTE, TELEFONE, EMAIL)
VALUES (SEQ_CONTATO.nextval, 7, '(92) 99056-0965', 'lucas.nobre@email.com');
INSERT INTO CONTATO (ID_CONTATO, ID_CLIENTE, TELEFONE, EMAIL)
VALUES (SEQ_CONTATO.nextval, 8, '(11) 99114-5687', 'rebeca@email.com');

INSERT INTO CONTATO (ID_CONTATO, ID_CLIENTE, TELEFONE, EMAIL)
VALUES (SEQ_CONTATO.nextval, 9, '(11) 77777-2222', 'peterparker@email.com');
INSERT INTO CONTATO (ID_CONTATO, ID_CLIENTE, TELEFONE, EMAIL)
VALUES (SEQ_CONTATO.nextval, 10, '(47) 88888-1111', 'steven.strange@email.com');
INSERT INTO CONTATO (ID_CONTATO, ID_CLIENTE, TELEFONE, EMAIL)
VALUES (SEQ_CONTATO.nextval, 11, '(16) 99999-3333', 'tony@starkindustries.com');
INSERT INTO CONTATO (ID_CONTATO, ID_CLIENTE, TELEFONE, EMAIL)
VALUES (SEQ_CONTATO.nextval, 12, '(11) 44444-6666', 'banner@hotmail.com.br');

SELECT * FROM CONTATO;

INSERT INTO ENDERECO_CLIENTE (ID_ENDERECO, ID_CLIENTE, RUA, NUMERO, BAIRRO, CIDADE, ESTADO, CEP, COMPLEMENTO)
VALUES (SEQ_ENDERECO_CLIENTE.nextval, 1, 'Rua da Árvore', '121', 'Bairro da Árvore', 'Goiânia', 'Goiás', '15987-956', ' ');
INSERT INTO ENDERECO_CLIENTE (ID_ENDERECO, ID_CLIENTE, RUA, NUMERO, BAIRRO, CIDADE, ESTADO, CEP, COMPLEMENTO)
VALUES (SEQ_ENDERECO_CLIENTE.nextval, 2, 'Rua do Céu', '1997', 'Bairro Azul', 'São Paulo', 'São Paulo', '95357-365', ' ');
INSERT INTO ENDERECO_CLIENTE (ID_ENDERECO, ID_CLIENTE, RUA, NUMERO, BAIRRO, CIDADE, ESTADO, CEP, COMPLEMENTO)
VALUES (SEQ_ENDERECO_CLIENTE.nextval, 3, 'Rua do Chinelo', '68', 'Bairro Amarelo', 'Bauru', 'São Paulo', '95127-856', ' ');
INSERT INTO ENDERECO_CLIENTE (ID_ENDERECO, ID_CLIENTE, RUA, NUMERO, BAIRRO, CIDADE, ESTADO, CEP, COMPLEMENTO)
VALUES (SEQ_ENDERECO_CLIENTE.nextval, 4, 'Rua Bela', '785', 'Bela Vista', 'Porto Alegre', 'Rio Grande do Sul', '65432-755', ' ');

INSERT INTO ENDERECO_CLIENTE (ID_ENDERECO, ID_CLIENTE, RUA, NUMERO, BAIRRO, CIDADE, ESTADO, CEP, COMPLEMENTO)
VALUES (SEQ_ENDERECO_CLIENTE.nextval, 5, 'Rua Do lago', '105', 'São Jerônimo', 'São Paulo', 'Goiás', '97845-250', 'casa');
INSERT INTO ENDERECO_CLIENTE (ID_ENDERECO, ID_CLIENTE, RUA, NUMERO, BAIRRO, CIDADE, ESTADO, CEP, COMPLEMENTO)
VALUES (SEQ_ENDERECO_CLIENTE.nextval, 6, 'Rua Antônio de Andrade', '320', 'Nossa Chácara', 'Rio de Janeiro', 'São Paulo', '82574-355', 'casa');
INSERT INTO ENDERECO_CLIENTE (ID_ENDERECO, ID_CLIENTE, RUA, NUMERO, BAIRRO, CIDADE, ESTADO, CEP, COMPLEMENTO)
VALUES (SEQ_ENDERECO_CLIENTE.nextval, 7, 'Rua Raúl Pila', '47', 'Vista Alegre', 'Bauru', 'Rio Grande do Sul', '31678-120', 'casa');
INSERT INTO ENDERECO_CLIENTE (ID_ENDERECO, ID_CLIENTE, RUA, NUMERO, BAIRRO, CIDADE, ESTADO, CEP, COMPLEMENTO)
VALUES (SEQ_ENDERECO_CLIENTE.nextval, 8, 'Avenida Brásil', '71', 'Cohab A', 'Porto Alegre', 'Bahia', '39825-975', 'casa');

INSERT INTO ENDERECO_CLIENTE (ID_ENDERECO, ID_CLIENTE, RUA, NUMERO, BAIRRO, CIDADE, ESTADO, CEP, COMPLEMENTO)
VALUES (SEQ_ENDERECO_CLIENTE.nextval, 9, 'Rua Brasil', '746', 'Bairro do Liberdade', 'Pato Branco', 'Paraná', '69314-956', ' ');
INSERT INTO ENDERECO_CLIENTE (ID_ENDERECO, ID_CLIENTE, RUA, NUMERO, BAIRRO, CIDADE, ESTADO, CEP, COMPLEMENTO)
VALUES (SEQ_ENDERECO_CLIENTE.nextval, 10, 'Rua itamaraty', '190', 'Bairro floresta', 'Beltrão', 'Paraná', '99087-653', ' ');
INSERT INTO ENDERECO_CLIENTE (ID_ENDERECO, ID_CLIENTE, RUA, NUMERO, BAIRRO, CIDADE, ESTADO, CEP, COMPLEMENTO)
VALUES (SEQ_ENDERECO_CLIENTE.nextval, 11, 'Rua São LUcas', '902', 'Bairro Buriti', 'Boa Vista', 'Roraima', '85510-846', ' ');
INSERT INTO ENDERECO_CLIENTE (ID_ENDERECO, ID_CLIENTE, RUA, NUMERO, BAIRRO, CIDADE, ESTADO, CEP, COMPLEMENTO)
VALUES (SEQ_ENDERECO_CLIENTE.nextval, 12, 'Rua Bela Vista', '778', 'Bairro Bom Jardim', 'Santarem', 'Para', '68432-551', ' ');

SELECT * FROM ENDERECO_CLIENTE;

INSERT INTO CARTAO_CREDITO (ID_CARTAO, NUMERO_CARTAO, BANDEIRA_CARTAO, VALIDADE, LIMITE)
VALUES (SEQ_CARTAO_CREDITO.nextval, '9999 8888 2222 5555', 'VISA', '05/2030', '50000');
INSERT INTO CARTAO_CREDITO (ID_CARTAO, NUMERO_CARTAO, BANDEIRA_CARTAO, VALIDADE, LIMITE)
VALUES (SEQ_CARTAO_CREDITO.nextval, '3333 7777 7777 6666', 'MASTERCARD', '08/2030', '75000');
INSERT INTO CARTAO_CREDITO (ID_CARTAO, NUMERO_CARTAO, BANDEIRA_CARTAO, VALIDADE, LIMITE)
VALUES (SEQ_CARTAO_CREDITO.nextval, '1111 8888 7777 6666', 'VISA', '05/2025', '30000');
INSERT INTO CARTAO_CREDITO (ID_CARTAO, NUMERO_CARTAO, BANDEIRA_CARTAO, VALIDADE, LIMITE)
VALUES (SEQ_CARTAO_CREDITO.nextval, '2222 9999 7777 6666', 'MASTERCARD', '02/2023', '20000');

INSERT INTO CARTAO_CREDITO (ID_CARTAO, NUMERO_CARTAO, BANDEIRA_CARTAO, VALIDADE, LIMITE)
VALUES (SEQ_CARTAO_CREDITO.nextval, '7834 1234 0921 6982', 'VISA', '06/2031', '5000');
INSERT INTO CARTAO_CREDITO (ID_CARTAO, NUMERO_CARTAO, BANDEIRA_CARTAO, VALIDADE, LIMITE)
VALUES (SEQ_CARTAO_CREDITO.nextval, '3034 7342 7453 6666', 'MASTERCARD', '08/2032', '1200');
INSERT INTO CARTAO_CREDITO (ID_CARTAO, NUMERO_CARTAO, BANDEIRA_CARTAO, VALIDADE, LIMITE)
VALUES (SEQ_CARTAO_CREDITO.nextval, '1294 8812 7721 6216', 'VISA', '06/2025', '8000');
INSERT INTO CARTAO_CREDITO (ID_CARTAO, NUMERO_CARTAO, BANDEIRA_CARTAO, VALIDADE, LIMITE)
VALUES (SEQ_CARTAO_CREDITO.nextval, '2122 9934 7547 6096', 'MASTERCARD', '04/2023', '87000');

INSERT INTO CARTAO_CREDITO (ID_CARTAO, NUMERO_CARTAO, BANDEIRA_CARTAO, VALIDADE, LIMITE)
VALUES (SEQ_CARTAO_CREDITO.nextval, '3333 8888 5555 2222', 'VISA', '06/2025', '60000');
INSERT INTO CARTAO_CREDITO (ID_CARTAO, NUMERO_CARTAO, BANDEIRA_CARTAO, VALIDADE, LIMITE)
VALUES (SEQ_CARTAO_CREDITO.nextval, '2222 9999 7777 4444', 'MASTERCARD', '08/2024', '85500');
INSERT INTO CARTAO_CREDITO (ID_CARTAO, NUMERO_CARTAO, BANDEIRA_CARTAO, VALIDADE, LIMITE)
VALUES (SEQ_CARTAO_CREDITO.nextval, '8888 1111 6666 3333', 'VISA', '05/2030', '99000');
INSERT INTO CARTAO_CREDITO (ID_CARTAO, NUMERO_CARTAO, BANDEIRA_CARTAO, VALIDADE, LIMITE)
VALUES (SEQ_CARTAO_CREDITO.nextval, '1111 9999 3333 7777', 'MASTERCARD', '03/2028', '22700');

SELECT * FROM CARTAO_CREDITO;

INSERT INTO LOCACAO(ID_LOCACAO, DATA_LOCACAO, DATA_DEVOLUCAO, VALOR_LOCACAO_TOTAL, ID_CLIENTE, ID_VEICULO, ID_FUNCIONARIO, ID_CARTAO)
VALUES (SEQ_LOCACAO.nextval, TO_DATE ('2023-03-05','yyyy-mm-dd'), TO_DATE ('2023-03-10','yyyy-mm-dd'), 1100, 1, 1, 1, 1);
INSERT INTO LOCACAO(ID_LOCACAO, DATA_LOCACAO, DATA_DEVOLUCAO, VALOR_LOCACAO_TOTAL, ID_CLIENTE, ID_VEICULO, ID_FUNCIONARIO, ID_CARTAO)
VALUES (SEQ_LOCACAO.nextval, TO_DATE ('2023-03-10','yyyy-mm-dd'), TO_DATE ('2023-03-12','yyyy-mm-dd'), 320, 2, 2, 2, 2);
INSERT INTO LOCACAO(ID_LOCACAO, DATA_LOCACAO, DATA_DEVOLUCAO, VALOR_LOCACAO_TOTAL, ID_CLIENTE, ID_VEICULO, ID_FUNCIONARIO, ID_CARTAO)
VALUES (SEQ_LOCACAO.nextval, TO_DATE ('2023-03-10','yyyy-mm-dd'), TO_DATE ('2023-03-20','yyyy-mm-dd'), 2200, 3, 3, 3, 3);
INSERT INTO LOCACAO(ID_LOCACAO, DATA_LOCACAO, DATA_DEVOLUCAO, VALOR_LOCACAO_TOTAL, ID_CLIENTE, ID_VEICULO, ID_FUNCIONARIO, ID_CARTAO)
VALUES (SEQ_LOCACAO.nextval, TO_DATE ('2023-03-05','yyyy-mm-dd'), TO_DATE ('2023-03-06','yyyy-mm-dd'), 120, 4, 4, 4, 4);
INSERT INTO LOCACAO(ID_LOCACAO, DATA_LOCACAO, DATA_DEVOLUCAO, VALOR_LOCACAO_TOTAL, ID_CLIENTE, ID_VEICULO, ID_FUNCIONARIO, ID_CARTAO)
VALUES (SEQ_LOCACAO.nextval, TO_DATE ('2023-03-09','yyyy-mm-dd'), TO_DATE ('2023-03-10','yyyy-mm-dd'), 400, 5, 5, 5, 5);
INSERT INTO LOCACAO(ID_LOCACAO, DATA_LOCACAO, DATA_DEVOLUCAO, VALOR_LOCACAO_TOTAL, ID_CLIENTE, ID_VEICULO, ID_FUNCIONARIO, ID_CARTAO)
VALUES (SEQ_LOCACAO.nextval, TO_DATE ('2023-05-10','yyyy-mm-dd'), TO_DATE ('2023-05-12','yyyy-mm-dd'), 250, 6, 6, 6, 6);


--INSERT INTO LOCACAO(ID_LOCACAO, DATA_LOCACAO, DATA_DEVOLUCAO, VALOR_LOCACAO_TOTAL, ID_CLIENTE, ID_VEICULO, ID_FUNCIONARIO, ID_CARTAO)
--VALUES (SEQ_LOCACAO.nextval, TO_DATE ('16-07-2022','dd-mm-yyyy'), TO_DATE ('20-07-2022','dd-mm-yyyy'), 200, 7, 7, 7, 7);
--INSERT INTO LOCACAO(ID_LOCACAO, DATA_LOCACAO, DATA_DEVOLUCAO, VALOR_LOCACAO_TOTAL, ID_CLIENTE, ID_VEICULO, ID_FUNCIONARIO, ID_CARTAO)
--VALUES (SEQ_LOCACAO.nextval, TO_DATE ('02-09-2022','dd-mm-yyyy'), TO_DATE ('06-10-2022','dd-mm-yyyy'), 1200, 8, 8, 8, 8);
--INSERT INTO LOCACAO(ID_LOCACAO, DATA_LOCACAO, DATA_DEVOLUCAO, VALOR_LOCACAO_TOTAL, ID_CLIENTE, ID_VEICULO, ID_FUNCIONARIO, ID_CARTAO)
--VALUES (SEQ_LOCACAO.nextval, TO_DATE ('05-03-2022','dd-mm-yyyy'), TO_DATE ('06-10-2022','dd-mm-yyyy'), 1700, 9, 9, 9, 9);
--INSERT INTO LOCACAO(ID_LOCACAO, DATA_LOCACAO, DATA_DEVOLUCAO, VALOR_LOCACAO_TOTAL, ID_CLIENTE, ID_VEICULO, ID_FUNCIONARIO, ID_CARTAO)
--VALUES (SEQ_LOCACAO.nextval, TO_DATE ('05-04-2022','dd-mm-yyyy'), TO_DATE ('07-04-2022','dd-mm-yyyy'), 2000, 10, 10, 10, 10);
--INSERT INTO LOCACAO(ID_LOCACAO, DATA_LOCACAO, DATA_DEVOLUCAO, VALOR_LOCACAO_TOTAL, ID_CLIENTE, ID_VEICULO, ID_FUNCIONARIO, ID_CARTAO)
--VALUES (SEQ_LOCACAO.nextval, TO_DATE ('08-04-2022','dd-mm-yyyy'), TO_DATE ('10-04-2022','dd-mm-yyyy'), 1100, 11, 11, 11, 11);
--INSERT INTO LOCACAO(ID_LOCACAO, DATA_LOCACAO, DATA_DEVOLUCAO, VALOR_LOCACAO_TOTAL, ID_CLIENTE, ID_VEICULO, ID_FUNCIONARIO, ID_CARTAO)
--VALUES (SEQ_LOCACAO.nextval, TO_DATE ('11-04-2022','dd-mm-yyyy'), TO_DATE ('13-04-2022','dd-mm-yyyy'), 2300, 12, 12, 12, 12);

SELECT * FROM LOCACAO;


