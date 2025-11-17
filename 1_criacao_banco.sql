/* 1. Criação do Banco de Dados */
CREATE DATABASE IF NOT EXISTS kart_associacao;

/* 2. Seleciona o banco para uso */
USE kart_associacao;

/* 3. Criação das tabelas "pai" (sem dependências) */
CREATE TABLE Temporada (
    idTemporada INT NOT NULL AUTO_INCREMENT,
    numero INT,
    PRIMARY KEY (idTemporada)
);

CREATE TABLE Patrocinio (
    idPatracinio INT NOT NULL AUTO_INCREMENT,
    nomePatrocinio VARCHAR(45),
    PRIMARY KEY (idPatracinio)
);

/* 4. Criação das tabelas "filhas" (com dependências) */
CREATE TABLE Equipe (
    idEquipe INT NOT NULL AUTO_INCREMENT,
    Nome VARCHAR(100),
    Patrocinio_idPatrocinio INT, /* Este campo pde ser nulo, como indica o diagrama */
    PRIMARY KEY (idEquipe),
    FOREIGN KEY (Patrocinio_idPatrocinio) REFERENCES(idPatracinio)
);

CREATE TABLE Piloto (
    idPiloto INT NOT NULL AUTO_INCREMENT,
    Nome VARCHAR(150),
    peso FLOAT,
    capitao TINYINT, /* Usamos TINYINT para 0 (Não) ou 1 (Sim) */
    Equipe_idEquipe INT NOT NULL, /* Esta é uma FK obrigatóri */
    nacionalidade VARCHAR(45), /* Ajustado de VARCHAR(4) para caber os dados */
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
    Pilato_idPiloto INT NOT NULL,
    PRIMARY KEY (Etapa_idEtapa, Pilato_idPiloto), /* Chabe primária composta */
    FOREIGN KEY (Etapa_idEtapa) REFERENCES Etapa(idEtapa),
    FOREIGN KEY (Piloto_idPiloto) REFERENCES Piloto(idPiloto)
);