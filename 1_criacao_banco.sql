/* 0. Apaga o banco antigo para garantir um teste limpo */
DROP DATABASE IF EXISTS kart_associacao;

/* 1. Criação do Banco de Dados */
CREATE DATABASE kart_associacao;

/* 2. Seleciona o banco para uso */
USE kart_associacao;

/* 3. Criação das tabelas "pai" (sem dependências) */
CREATE TABLE Temporada (
    idTemporada INT NOT NULL AUTO_INCREMENT,
    numero INT,
    PRIMARY KEY (idTemporada)
);

CREATE TABLE Patrocinio (
    idPatrocinio INT NOT NULL AUTO_INCREMENT,
    nomePatrocinio VARCHAR(45),
    PRIMARY KEY (idPatrocinio)
);

/* 4. Criação das tabelas "filhas" (com dependências) */
CREATE TABLE Equipe (
    idEquipe INT NOT NULL AUTO_INCREMENT,
    Nome VARCHAR(100),
    patrocinio_idPatrocinio INT,
    PRIMARY KEY (idEquipe),
    FOREIGN KEY (patrocinio_idPatrocinio) 
        REFERENCES Patrocinio(idPatrocinio)
);

CREATE TABLE Piloto (
    idPiloto INT NOT NULL AUTO_INCREMENT,
    Nome VARCHAR(150),
    peso FLOAT,
    capitao TINYINT,
    Equipe_idEquipe INT NOT NULL, 
    nacionalidade VARCHAR(45),
    PRIMARY KEY (idPiloto),
    FOREIGN KEY (Equipe_idEquipe) REFERENCES Equipe(idEquipe)
);

CREATE TABLE Etapa (
    idEtapa INT NOT NULL AUTO_INCREMENT,
    local VARCHAR(100),
    data DATE,
    hora VARCHAR(45),
    Temporada_idTemporada INT NOT NULL,
    PRIMARY KEY (idEtapa),
    FOREIGN KEY (Temporada_idTemporada) REFERENCES Temporada(idTemporada)
);

/* 5. Criação da tabela de junção (N:N) */
CREATE TABLE Etapa_has_Piloto (
    Etapa_idEtapa INT NOT NULL,
    Piloto_idPiloto INT NOT NULL,
    PRIMARY KEY (Etapa_idEtapa, Piloto_idPiloto),
    FOREIGN KEY (Etapa_idEtapa) REFERENCES Etapa(idEtapa),
    FOREIGN KEY (Piloto_idPiloto) REFERENCES Piloto(idPiloto)
);