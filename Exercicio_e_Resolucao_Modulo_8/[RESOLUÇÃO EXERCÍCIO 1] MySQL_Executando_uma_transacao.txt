--
-- Baseado na tabela, construa uma transação que atualiza o valor aplicado 
-- em cada conta bancária baseado no índice de correção percentual de 3% 

--
-- Cria a tabela CONTA_BANCARIA
--
CREATE TABLE CONTA_BANCARIA (
	CODIGO INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,	-- Código interno (PK)
	TITULAR VARCHAR(32) NOT NULL,				-- Nome do titular da conta
	SALDO DOUBLE NOT NULL,					-- Representa o saldo da conta
	PRIMARY KEY(CODIGO)					-- Define o campo CODIGO como PK (Primary Key)
);

INSERT INTO CONTA_BANCARIA VALUES (1, 'André', 213);
INSERT INTO CONTA_BANCARIA VALUES (2, 'Diogo', 489);
INSERT INTO CONTA_BANCARIA VALUES (3, 'Rafael', 568);
INSERT INTO CONTA_BANCARIA VALUES (4, 'Carlos', 712);
INSERT INTO CONTA_BANCARIA VALUES (5, 'Peter', -38);

START TRANSACTION;
UPDATE CONTA_BANCARIA SET SALDO = SALDO + (SALDO / 100 * 3) WHERE SALDO > 0;
COMMIT;
