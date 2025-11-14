USE kart_associacao;

/* 1. Ddesativa o mode de segurança para esta sessão */
SET SQL_SAFE_UPDATES = 0;

/* 2. "Rescinde o contrato": Define o FK da equipe como NULL */
UPDATE Equipe
SET patrocinio_idPatrocinio = NULL
WHERE Nome = 'Corredores de Aço';

/* 3. Exclui o patrocinador da base, já que nenhuma equipe o referencia mais */
DELETE FROM Patrocinio
WHERE nomePatrocinio = 'Pneus ProDrive';

/* 4. Reativa o modo de segurança (boa prática) */
SET SQL_SAFE_UPDATES = 1;

/* Verificação (opicional) */
SELECT Nome, patrocinio_idPatrocinio FROM Equipe WHERE Nome = 'Corredores de Aço';
SELECT * FROM Patrocinio WHERE nomePatrocinio = 'Pneus ProDrive';