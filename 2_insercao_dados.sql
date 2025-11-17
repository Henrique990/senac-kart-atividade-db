/* Usar o banco correto */
USE kart_associacao;

/* 1. Inserir Temporada */
INSERT INTO Temporada (numero) VALUES (1); [cite: 4954]

/* 2. Inserir Patrocinadores */
INSERT INTO Patrocinio (nomePatrocinio) VALUES
('MotorTech Brasil'), [cite: 4965]
('Velocidade Extrema'), [cite: 4966]
('Alta Performance'), [cite: 4967]
('Turbo Racing'), [cite: 4967]
('Pneus ProDrive'); [cite: 4967]

/* 3. Inserir Equipes (usando subconsultas para linkar o patrocinador) */
INSERT INTO Equipe (Nome, patrocinio_idPatrocinio) VALUES
('Escuderia Veloz', (SELECT idPatrocinio FROM Patrocinio WHERE nomePatrocinio = 'MotorTech Brasil')), [cite: 4965]
('Rápidos & Furisos', (SELECT idPatrocinio FROM Patrocinio WHERE nomePatrocinio = 'Velocidade Extrema')), [cite: 4966]
('Fênix Racing', (SELECT idPatrocinio FROM Patrocinio WHERE nomePatrocinio = 'Alta Performance')), [cite: 4967]
/* Usar o banco correto */
USE kart_associacao;

/* 1. Inserir Temporada */
INSERT INTO Temporada (numero) VALUES (1); [cite: 4954]

/* 2. Inserir Patrocinadores */
INSERT INTO Patrocinio (nomePatrocinio) VALUES
('MotorTech Brasil'), [cite: 4965]
('Velocidade Extrema'), [cite: 4966]
('Alta Performance'), [cite: 4967]
('Turbo Racing'), [cite: 4967]
('Pneus ProDrive'); [cite: 4967]

/* 3. Inserir Equipes (usando subconsultas para linkar o patrocinador) */
INSERT INTO Equipe (Nome, patrocinio_idPatrocinio) VALUES
('Escuderia Veloz', (SELECT idPatrocinio FROM Patrocinio WHERE nomePatrocinio = 'MotorTech Brasil')), [cite: 4965]
('Rápidos & Furiosos', (SELECT idPatrocinio FROM Patrocinio WHERE nomePatrocinio = 'Velocidade Extrema')), [cite: 4966]
('Fênix Racing', (SELECT idPatrocinio FROM Patrocinio WHERE nomePatrocinio = 'Alta Performance')), [cite: 4967]
('Equipe Tempestade', (SELECT idPatrocinio FROM Patrocinio WHERE nomePatrocinio = 'Turbo Racing')), [cite: 4967]
('Corredores de Aço', (SELECT idPatrocinio FROM Patrocinio WHERE nomePatrocinio = 'Pneus ProDrive')); [cite: 4967]

/* 4. Inserir Pilotos (usando subconsultas para linkar a equipe) */
INSERT INTO Piloto (Nome, peso, capitao, nacionalidade, Equipe_idEquipe) VALUES
/* Escuderia Veloz */
('Lucas Andrade', 70.5, 1, 'Brasil', (SELECT idEquipe FROM Equipe WHERE Nome = 'Escuderia Veloz')), [cite: 4971]
('Renato Figueiredo', 75, 0, 'Brasil', (SELECT idEquipe FROM Equipe WHERE Nome = 'Escuderia Veloz')), [cite: 4972, 4974]
/* Rapidos & Furiosos */
('Mateus Silva', 68, 0, 'Brasil', (SELECT idEquipe FROM Equipe WHERE Nome = 'Rápidos & Furiosos')), [cite: 4975]
('Bruno Almeida', 78.3, 1, 'Brasil', (SELECT idEquipe FROM Equipe WHERE Nome = 'Rápidos & Furiosos')), [cite: 4976]
/* Fênix Racing */
('Carla Pereira', 60, 1, 'Portugal', (SELECT idEquipe FROM Equipe WHERE Nome = 'Fênix Racing')), [cite: 4978]
('Gabriela Torres', 58.5, 0, 'Brasil', (SELECT idEquipe FROM Equipe WHERE Nome = 'Fênix Racing')), [cite: 4979, 4981]
/* Equipe Tempestade */
('João Costa', 80.5, 0, 'Brasil', (SELECT idEquipe FROM Equipe WHERE Nome = 'Equipe Tempestade')), [cite: 4982]
('Thiago Santos', 72.5, 0, 'Brasil', (SELECT idEquipe FROM Equipe WHERE Nome = 'Equipe Tempestade')), [cite: 4983]
/* Corredores de Aço */
('Mariana Gomes', 62, 1, 'Portugal', (SELECT idEquipe FROM Equipe WHERE Nome = 'Corredores de Aço')), [cite: 4985]
('Beatriz Lopes', 63.2, 1, 'Portugal', (SELECT idEquipe FROM Equipe WHERE Nome = 'Corredores de Aço')); [cite: 4986]

/* 5. Inserir Etapas (linkando com a Temporada 1) */
INSERT INTO Etapa (local, data, hora, Temporada_idTemporada) VALUES
('São Paulo', '2024-01-15', '14:00', (SELECT idTemporada FROM Temporada WHERE numero = 1)), [cite: 4958]
('Rio de Janeiro', '2024-02-20', '16:00', (SELECT idTemporada FROM Temporada WHERE numero = 1)), [cite: 4959]
('Campo Grande', '2024-03-18', '15:00', (SELECT idTemporada FROM Temporada WHERE numero = 1)), [cite: 4960]
('Londrina', '2024-04-22', '13:00', (SELECT idTemporada FROM Temporada WHERE numero = 1)), [cite: 4961]
('Porto Alegre', '2024-05-10', '10:00', (SELECT idTemporada FROM Temporada WHERE numero = 1)); [cite: 4962]

/* 6. Inserir Participações na Etapa 1 (Todos os 10 pilotos) */
/* Este script insere todos os 10 pilotos na Etapa 1 ('São Paulo') */
INSERT INTO Etapa_has_Piloto (Etapa_idEtapa, Piloto_idPiloto)
SELECT 
    (SELECT idEtapa FROM Etapa WHERE local = 'São Paulo'),
    idPiloto
FROM Piloto; [cite: 4988-4990]