USE kart_associacao;

/* 1. Desativa o modo de segurança para permitir o UPDATE */
SET SQL_SAFE_UPDATES = 0;

/* 2. Altera Campo Grande para Salvador */
UPDATE Etapa
SET local = 'Salvador'
WHERE local = 'Campo Grande';

/* 3. Altera Londrina para Goiânia */
UPDATE Etapa
SET local = 'Goiânia'
WHERE local = 'Londrina';

/* 4. Reativa o modo de segurança (boa prática) */
SET SQL_SAFE_UPDATES = 1;

/* Verificação (opcional) */
SELECT * FROM Etapa;