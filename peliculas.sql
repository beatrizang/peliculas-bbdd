-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema peliculas
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `peliculas` ;

-- -----------------------------------------------------
-- Schema peliculas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `peliculas` DEFAULT CHARACTER SET utf8 ;
USE `peliculas` ;

-- -----------------------------------------------------
-- Table `Peliculas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Peliculas` ;

CREATE TABLE IF NOT EXISTS `Peliculas` (
  `idPelicula` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(150) NOT NULL,
  `duracion` INT NOT NULL,
  `anioEstreno` INT NOT NULL,
  `portada` VARCHAR(200) NULL,
  PRIMARY KEY (`idPelicula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Personas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Personas` ;

CREATE TABLE IF NOT EXISTS `Personas` (
  `idPersona` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(60) NOT NULL,
  `apellido` VARCHAR(60) NOT NULL,
  `nacionalidad` VARCHAR(45) NULL,
  `foto` VARCHAR(150) NULL,
  `fechaNacimiento` DATE NULL,
  PRIMARY KEY (`idPersona`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PersonasPeliculas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PersonasPeliculas` ;

CREATE TABLE IF NOT EXISTS `PersonasPeliculas` (
  `idPersona` INT NOT NULL,
  `idPelicula` INT NOT NULL,
  `tipo` ENUM('ACTOR', 'ACTRIZ', 'DIRECTOR', 'DIRECTORA', 'PRODUCTORA', 'PRODUCTOR') NOT NULL,
  `personaje` VARCHAR(100) NULL,
  PRIMARY KEY (`idPersona`, `idPelicula`),
  INDEX `fk_Personas_has_Peliculas_Peliculas1_idx` (`idPelicula` ASC) VISIBLE,
  INDEX `fk_Personas_has_Peliculas_Personas_idx` (`idPersona` ASC) VISIBLE,
  CONSTRAINT `fk_Personas_has_Peliculas_Personas`
    FOREIGN KEY (`idPersona`)
    REFERENCES `Personas` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Personas_has_Peliculas_Peliculas1`
    FOREIGN KEY (`idPelicula`)
    REFERENCES `Peliculas` (`idPelicula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Listas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Listas` ;

CREATE TABLE IF NOT EXISTS `Listas` (
  `idLista` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idLista`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PeliculasListas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PeliculasListas` ;

CREATE TABLE IF NOT EXISTS `PeliculasListas` (
  `idPelicula` INT NOT NULL,
  `idLista` INT NOT NULL,
  PRIMARY KEY (`idPelicula`, `idLista`),
  INDEX `fk_Peliculas_has_Listas_Listas1_idx` (`idLista` ASC) VISIBLE,
  INDEX `fk_Peliculas_has_Listas_Peliculas1_idx` (`idPelicula` ASC) VISIBLE,
  CONSTRAINT `fk_Peliculas_has_Listas_Peliculas1`
    FOREIGN KEY (`idPelicula`)
    REFERENCES `Peliculas` (`idPelicula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Peliculas_has_Listas_Listas1`
    FOREIGN KEY (`idLista`)
    REFERENCES `Listas` (`idLista`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Generos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Generos` ;

CREATE TABLE IF NOT EXISTS `Generos` (
  `idGenero` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idGenero`),
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PeliculasGeneros`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PeliculasGeneros` ;

CREATE TABLE IF NOT EXISTS `PeliculasGeneros` (
  `idPelicula` INT NOT NULL,
  `idGenero` INT NOT NULL,
  PRIMARY KEY (`idPelicula`, `idGenero`),
  INDEX `fk_Peliculas_has_Generos_Generos1_idx` (`idGenero` ASC) VISIBLE,
  INDEX `fk_Peliculas_has_Generos_Peliculas1_idx` (`idPelicula` ASC) VISIBLE,
  CONSTRAINT `fk_Peliculas_has_Generos_Peliculas1`
    FOREIGN KEY (`idPelicula`)
    REFERENCES `Peliculas` (`idPelicula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Peliculas_has_Generos_Generos1`
    FOREIGN KEY (`idGenero`)
    REFERENCES `Generos` (`idGenero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;




/* INSERCION DE DATOS*/

/* GENEROS */
INSERT INTO Generos (idGenero,nombre) VALUES (1,'ACCION');
INSERT INTO Generos (idGenero,nombre) VALUES (2,'ANIMACION');
INSERT INTO Generos (idGenero,nombre) VALUES (3,'AVENTURA');
INSERT INTO Generos (idGenero,nombre) VALUES (4,'BELICAS');
INSERT INTO Generos (idGenero,nombre) VALUES (5,'BIOGRAFICA');
INSERT INTO Generos (idGenero,nombre) VALUES (6,'CIENCIA FICCION');
INSERT INTO Generos (idGenero,nombre) VALUES (7,'CINE 2D');
INSERT INTO Generos (idGenero,nombre) VALUES (8,'CINE 3D');
INSERT INTO Generos (idGenero,nombre) VALUES (9,'COMEDIA');
INSERT INTO Generos (idGenero,nombre) VALUES (10,'CRIMEN');
INSERT INTO Generos (idGenero,nombre) VALUES (11,'DEPORTIVAS');
INSERT INTO Generos (idGenero,nombre) VALUES (12,'DOCUMENTAL');
INSERT INTO Generos (idGenero,nombre) VALUES (13,'DRAMA');
INSERT INTO Generos (idGenero,nombre) VALUES (14,'FANTASIA');
INSERT INTO Generos (idGenero,nombre) VALUES (15,'FUTURISTAS');
INSERT INTO Generos (idGenero,nombre) VALUES (16,'HISTORICAS');
INSERT INTO Generos (idGenero,nombre) VALUES (17,'INDEPENDIENTE');
INSERT INTO Generos (idGenero,nombre) VALUES (18,'INFANTIL');
INSERT INTO Generos (idGenero,nombre) VALUES (19,'MELODRAMA');
INSERT INTO Generos (idGenero,nombre) VALUES (20,'MUSICAL');
INSERT INTO Generos (idGenero,nombre) VALUES (21,'POLICIACAS');
INSERT INTO Generos (idGenero,nombre) VALUES (22,'RELIGIOSAS');
INSERT INTO Generos (idGenero,nombre) VALUES (23,'ROMANCE');
INSERT INTO Generos (idGenero,nombre) VALUES (24,'SUSPENSO');
INSERT INTO Generos (idGenero,nombre) VALUES (25,'TERROR');
INSERT INTO Generos (idGenero,nombre) VALUES (26,'WESTERN');


/* PELICULAS */
INSERT INTO Peliculas (idPelicula,titulo,duracion,anioEstreno) VALUES (1,'EL CISNE NEGRO',109,2010);
INSERT INTO Peliculas (idPelicula,titulo,duracion,anioEstreno) VALUES (2,'EL CLUB DE LA PELEA',139,1999);
INSERT INTO Peliculas (idPelicula,titulo,duracion,anioEstreno) VALUES (3,'MATRIX',131,1999);
INSERT INTO Peliculas (idPelicula,titulo,duracion,anioEstreno) VALUES (4,'ESPERANDO LA CARROZA',87,1985);
INSERT INTO Peliculas (idPelicula,titulo,duracion,anioEstreno) VALUES (5,'EL REY LEON',85,1994);
INSERT INTO Peliculas (idPelicula,titulo,duracion,anioEstreno) VALUES (6,'EL PADRINO',175,1972);
INSERT INTO Peliculas (idPelicula,titulo,duracion,anioEstreno) VALUES (7,'JOKER',121,2019);
INSERT INTO Peliculas (idPelicula,titulo,duracion,anioEstreno) VALUES (8,'COCO',109,2017);
INSERT INTO Peliculas (idPelicula,titulo,duracion,anioEstreno) VALUES (9,'SPIDER - MAN',121,2002);
INSERT INTO Peliculas (idPelicula,titulo,duracion,anioEstreno) VALUES (10,'EL VIAJE DE CHIHIRO',124,2001);

/* PELICULASGENEROS*/

INSERT INTO PeliculasGeneros (idPelicula,idGenero) VALUES (1,13);

INSERT INTO PeliculasGeneros (idPelicula,idGenero) VALUES (2,13);
INSERT INTO PeliculasGeneros (idPelicula,idGenero) VALUES (2,24);

INSERT INTO PeliculasGeneros (idPelicula,idGenero) VALUES (3,6);
INSERT INTO PeliculasGeneros (idPelicula,idGenero) VALUES (3,1);

INSERT INTO PeliculasGeneros (idPelicula,idGenero) VALUES (4,9);

INSERT INTO PeliculasGeneros (idPelicula,idGenero) VALUES (5,2);
INSERT INTO PeliculasGeneros (idPelicula,idGenero) VALUES (5,3);
INSERT INTO PeliculasGeneros (idPelicula,idGenero) VALUES (5,18);
INSERT INTO PeliculasGeneros (idPelicula,idGenero) VALUES (5,20);

INSERT INTO PeliculasGeneros (idPelicula,idGenero) VALUES (6,10);
INSERT INTO PeliculasGeneros (idPelicula,idGenero) VALUES (6,13);

INSERT INTO PeliculasGeneros (idPelicula,idGenero) VALUES (7,10);
INSERT INTO PeliculasGeneros (idPelicula,idGenero) VALUES (7,13);

INSERT INTO PeliculasGeneros (idPelicula,idGenero) VALUES (8,2);
INSERT INTO PeliculasGeneros (idPelicula,idGenero) VALUES (8,9);
INSERT INTO PeliculasGeneros (idPelicula,idGenero) VALUES (8,13);

INSERT INTO PeliculasGeneros (idPelicula,idGenero) VALUES (9,1);

INSERT INTO PeliculasGeneros (idPelicula,idGenero) VALUES (10,2);
INSERT INTO PeliculasGeneros (idPelicula,idGenero) VALUES (10,3);

/* PERSONAS */

INSERT INTO Personas (idPersona,nombre,apellido) VALUES (1,'HAYAO','MIYAZAKI');
INSERT INTO Personas (idPersona,nombre,apellido) VALUES (2,'ROB','MINKOFF');
INSERT INTO Personas (idPersona,nombre,apellido) VALUES (3,'ROGER','ALLERS');
INSERT INTO Personas (idPersona,nombre,apellido) VALUES (4,'ANTONIO','GASALLA');
INSERT INTO Personas (idPersona,nombre,apellido) VALUES (5,'CHINA','ZORRILLA');
INSERT INTO Personas (idPersona,nombre,apellido) VALUES (6,'KEANU','REEVES');
INSERT INTO Personas (idPersona,nombre,apellido) VALUES (7,'LILLY','WACHOWSKI');
INSERT INTO Personas (idPersona,nombre,apellido) VALUES (8,'LANA','WACHOWSKI');
INSERT INTO Personas (idPersona,nombre,apellido) VALUES (9,'TOBEY','MAGUIRE');
INSERT INTO Personas (idPersona,nombre,apellido) VALUES (10,'NATALIE','PORTMAN');
INSERT INTO Personas (idPersona,nombre,apellido) VALUES (11,'EDWARD','NORTON');
INSERT INTO Personas (idPersona,nombre,apellido) VALUES (12,'BRAD','PITT');
INSERT INTO Personas (idPersona,nombre,apellido) VALUES (13,'JOAQUIN','PHOENIX');
INSERT INTO Personas (idPersona,nombre,apellido) VALUES (14,'MARLON','BRANDO');
INSERT INTO Personas (idPersona,nombre,apellido) VALUES (16,'LEE','UNKRICH');
INSERT INTO Personas (idPersona,nombre,apellido) VALUES (17,'ANGELINA','JOLIE');
INSERT INTO Personas (idPersona,nombre,apellido) VALUES (18,'ROBERT','DE NIRO');

/* PERSONASPELICULAS*/

INSERT INTO PersonasPeliculas (idPersona,idPelicula,tipo) VALUES (1,10,'DIRECTOR');
INSERT INTO PersonasPeliculas (idPersona,idPelicula,tipo) VALUES (2,5,'DIRECTOR');
INSERT INTO PersonasPeliculas (idPersona,idPelicula,tipo) VALUES (3,5,'DIRECTOR');
INSERT INTO PersonasPeliculas (idPersona,idPelicula,tipo) VALUES (4,4,'ACTOR');
INSERT INTO PersonasPeliculas (idPersona,idPelicula,tipo) VALUES (5,4,'ACTRIZ');
INSERT INTO PersonasPeliculas (idPersona,idPelicula,tipo) VALUES (6,3,'ACTOR');
INSERT INTO PersonasPeliculas (idPersona,idPelicula,tipo) VALUES (7,3,'DIRECTORA');
INSERT INTO PersonasPeliculas (idPersona,idPelicula,tipo) VALUES (8,3,'DIRECTORA');
INSERT INTO PersonasPeliculas (idPersona,idPelicula,tipo) VALUES (9,9,'ACTOR');
INSERT INTO PersonasPeliculas (idPersona,idPelicula,tipo) VALUES (10,1,'ACTRIZ');
INSERT INTO PersonasPeliculas (idPersona,idPelicula,tipo) VALUES (11,2,'ACTOR');
INSERT INTO PersonasPeliculas (idPersona,idPelicula,tipo) VALUES (12,2,'ACTOR');
INSERT INTO PersonasPeliculas (idPersona,idPelicula,tipo) VALUES (13,7,'ACTOR');
INSERT INTO PersonasPeliculas (idPersona,idPelicula,tipo) VALUES (14,6,'ACTOR');
INSERT INTO PersonasPeliculas (idPersona,idPelicula,tipo) VALUES (16,8,'DIRECTOR');

/* LISTAS */

INSERT INTO Listas (idLista,nombre) VALUES (1,'VISTAS');

/* PELICULASLISTAS*/

INSERT INTO PeliculasListas (idPelicula,idLista) VALUES (1,1);
INSERT INTO PeliculasListas (idPelicula,idLista) VALUES (4,1);
INSERT INTO PeliculasListas (idPelicula,idLista) VALUES (7,1);

/* CONSULTAS */

-- MOSTRAR LAS PELICULAS ORDENAS ALFABETICAMENTE

DROP VIEW IF EXISTS peliculas_alfabetico;

CREATE VIEW peliculas_alfabetico (Titulo, `Año de Estreno`, Duracion)
AS
	SELECT titulo, anioEstreno, duracion
	FROM Peliculas 
	ORDER BY titulo ASC;

SELECT * FROM peliculas_alfabetico;

-- BUSCAR PELICULAS POR DETERMINADO GENERO

DROP PROCEDURE IF EXISTS BuscarPorGenero;

DELIMITER //
CREATE PROCEDURE BuscarPorGenero(pGenero VARCHAR(40), OUT mensaje VARCHAR(100))
SALIR:BEGIN
	IF (pGenero IS NULL OR pGenero = '') THEN
		SET mensaje = 'Se debe ingresar un género';
        LEAVE SALIR;
	END IF;
    
    SELECT Peliculas.titulo AS Titulo,
    Peliculas.anioEstreno AS 'Año de Estreno',
    Peliculas.duracion AS Duracion
    FROM Peliculas
    JOIN PeliculasGeneros
    ON Peliculas.idPelicula = PeliculasGeneros.idPelicula
    JOIN Generos
    ON PeliculasGeneros.idGenero = Generos.idGenero
    WHERE (Generos.nombre = pGenero)
	ORDER BY nombre ASC;
END //
DELIMITER ;


CALL BuscarPorGenero('ACCION',@mensaje);
SELECT @mensaje;

-- BUSCAR PELICULA POR ACTOR 
DROP PROCEDURE IF EXISTS BuscarPorActor;

DELIMITER //
CREATE PROCEDURE BuscarPorActor(pActor VARCHAR(40), OUT mensaje VARCHAR(100))
SALIR:BEGIN
	IF (pActor IS NULL OR pActor = '') THEN
		SET mensaje = 'Se debe ingresar un género';
        LEAVE SALIR;
	END IF;
    
    SELECT Peliculas.titulo AS Titulo,
    Peliculas.anioEstreno AS 'Año de Estreno',
    Peliculas.duracion AS Duracion
    FROM Personas
    JOIN PersonasPeliculas
    ON Personas.idPersona = PersonasPeliculas.idPersona
    JOIN Peliculas
    ON PersonasPeliculas.idPelicula = Peliculas.idPelicula
    WHERE Personas.nombre LIKE pActor OR Personas.apellido LIKE pActor
	ORDER BY nombre ASC;
END //
DELIMITER ;

CALL BuscarPorActor ('portman',@mensaje);

