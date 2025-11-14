USE kart_associacao;

/* 1. Altera Campo Grande para Salvador */
UPDATE Etapa
SET local = 'Salvador'
WHERE local = 'Campo Grande';

/* 2. Altera Londrina para Goiânia */
UPDATE Etapa
SET local = 'Goiânia'
WHERE local = 'Londrina';

/* Verificação (opcional) */
SELECT * FROM Etapa;