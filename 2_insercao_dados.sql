/* Usar o banco correto */
USE kart_associacao;

/* 1. Inserir Temporada */
INSERT INTO Temporada (numero) VALUES (1);

/* 2. Inserir Patrocinadores */
INSERT INTO Patrocinio (nomePatrocinio) VALUES
('MotorTech Brasil'),
('Velocidade Extrema'),
('Alta Performance'),
('Turbo Racing'),
('Pneus ProDrive');

/* 3. Inserir Equipes (usando subconsultas para linkar o patrocinador) */
INSERT INTO Equipe (Nome, patrocinio_idPatrocinio) VALUES
('Escuderia Veloz', (SELECT idPatrocinio FROM Patrocinio WHERE nomePatrocinio = 'MotorTech Brasil')),
('Rápidos & Furiosos', (SELECT idPatrocinio FROM Patrocinio WHERE nomePatrocinio = 'Velocidade Extrema')), /* CORRIGIDO: 'Furiosos' */
('Fênix Racing', (SELECT idPatrocinio FROM Patrocinio WHERE nomePatrocinio = 'Alta Performance')),
('Equipe Tempestade', (SELECT idPatrocinio FROM Patrocinio WHERE nomePatrocinio = 'Turbo Racing')),
('Corredores de Aço', (SELECT idPatrocinio FROM Patrocinio WHERE nomePatrocinio = 'Pneus ProDrive'));

/* 4. Inserir Pilotos (usando subconsultas para linkar a equipe) */
INSERT INTO Piloto (Nome, peso, capitao, nacionalidade, Equipe_idEquipe) VALUES
/* Escuderia Veloz */
('Lucas Andrade', 70.5, 1, 'Brasil', (SELECT idEquipe FROM Equipe WHERE Nome = 'Escuderia Veloz')),
('Renato Figueiredo', 75, 0, 'Brasil', (SELECT idEquipe FROM Equipe WHERE Nome = 'Escuderia Veloz')),
/* Rapidos & Furiosos */
('Mateus Silva', 68, 0, 'Brasil', (SELECT idEquipe FROM Equipe WHERE Nome = 'Rápidos & Furiosos')),
('Bruno Almeida', 78.3, 1, 'Brasil', (SELECT idEquipe FROM Equipe WHERE Nome = 'Rápidos & Furiosos')),
/* Fênix Racing */
('Carla Pereira', 60, 1, 'Portugal', (SELECT idEquipe FROM Equipe WHERE Nome = 'Fênix Racing')),
('Gabriela Torres', 58.5, 0, 'Brasil', (SELECT idEquipe FROM Equipe WHERE Nome = 'Fênix Racing')),
/* Equipe Tempestade */
('João Costa', 80.5, 0, 'Brasil', (SELECT idEquipe FROM Equipe WHERE Nome = 'Equipe Tempestade')),
('Thiago Santos', 72.5, 0, 'Brasil', (SELECT idEquipe FROM Equipe WHERE Nome = 'Equipe Tempestade')),
/* Corredores de Aço */
('Mariana Gomes', 62, 1, 'Portugal', (SELECT idEquipe FROM Equipe WHERE Nome = 'Corredores de Aço')),
('Beatriz Lopes', 63.2, 1, 'Portugal', (SELECT idEquipe FROM Equipe WHERE Nome = 'Corredores de Aço'));

/* 5. Inserir Etapas (linkando com a Temporada 1) */
INSERT INTO Etapa (local, data, hora, Temporada_idTemporada) VALUES
('São Paulo', '2024-01-15', '14:00', (SELECT idTemporada FROM Temporada WHERE numero = 1)),
('Rio de Janeiro', '2024-02-20', '16:00', (SELECT idTemporada FROM Temporada WHERE numero = 1)),
('Campo Grande', '2024-03-18', '15:00', (SELECT idTemporada FROM Temporada WHERE numero = 1)),
('Londrina', '2024-04-22', '13:00', (SELECT idTemporada FROM Temporada WHERE numero = 1)),
('Porto Alegre', '2024-05-10', '10:00', (SELECT idTemporada FROM Temporada WHERE numero = 1));

/* 6. Inserir Participações na Etapa 1 (Todos os 10 pilotos) */
/* Este script insere todos os 10 pilotos na Etapa 1 ('São Paulo') */
INSERT INTO Etapa_has_Piloto (Etapa_idEtapa, Piloto_idPiloto)
SELECT 
    (SELECT idEtapa FROM Etapa WHERE local = 'São Paulo'),
    idPiloto
FROM Piloto;