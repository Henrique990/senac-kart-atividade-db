USE kart_associacao;

SELECT
    p.Nome AS NomeDoPiloto,
    p.peso AS Peso_kg,
    p.nacionalidade AS Nacionalidade,
    IF(p.capitao = 1, 'Sim', 'Não') AS 'É Capitão?', /* Converte 1/0 para Sim/Não */
    e.Nome AS NomeDaEquipe
FROM
    Piloto AS p
JOIN
    Equipe AS e ON p.Equipe_idEquipe = e.idEquipe
ORDER BY
    NomeDaEquipe, NomeDoPiloto;