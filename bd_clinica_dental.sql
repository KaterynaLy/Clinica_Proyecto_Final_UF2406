-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema clinica_dental
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema clinica_dental
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `clinica_dental` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `clinica_dental` ;

-- -----------------------------------------------------
-- Table `clinica_dental`.`paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clinica_dental`.`paciente` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `apellido` VARCHAR(255) NULL DEFAULT NULL,
  `direccion` VARCHAR(255) NULL DEFAULT NULL,
  `documentoIdentidad` VARCHAR(255) NULL DEFAULT NULL,
  `email` VARCHAR(255) NULL DEFAULT NULL,
  `fechaCreacion` DATETIME(6) NULL DEFAULT NULL,
  `fechaNacimiento` DATETIME(6) NULL DEFAULT NULL,
  `genero` VARCHAR(255) NULL DEFAULT NULL,
  `nombre` VARCHAR(255) NULL DEFAULT NULL,
  `origenCliente` VARCHAR(255) NULL DEFAULT NULL,
  `telefono` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 26
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `clinica_dental`.`financiacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clinica_dental`.`financiacion` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `cuotas` INT NULL DEFAULT NULL,
  `metodoFinanciacion` VARCHAR(255) NULL DEFAULT NULL,
  `fechaFin` DATETIME(6) NULL DEFAULT NULL,
  `fechaInicio` DATETIME(6) NULL DEFAULT NULL,
  `montoCuota` DOUBLE NULL DEFAULT NULL,
  `montoTotal` DOUBLE NULL DEFAULT NULL,
  `idPaciente` BIGINT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `FKke5ejb67wnbalucflqlh4sr7j` (`idPaciente` ASC) VISIBLE,
  CONSTRAINT `FKke5ejb67wnbalucflqlh4sr7j`
    FOREIGN KEY (`idPaciente`)
    REFERENCES `clinica_dental`.`paciente` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `clinica_dental`.`caja`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clinica_dental`.`caja` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `fechaPago` DATETIME(6) NULL DEFAULT NULL,
  `financiador` VARCHAR(255) NULL DEFAULT NULL,
  `monto` DOUBLE NULL DEFAULT NULL,
  `metodoPago` VARCHAR(255) NULL DEFAULT NULL,
  `idFinanciacion` BIGINT NULL DEFAULT NULL,
  `idPaciente` BIGINT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `FKgvilp42nkyg8go64uim1rihul` (`idFinanciacion` ASC) VISIBLE,
  INDEX `FKhnyipxgyoi8subbefme0ovhb7` (`idPaciente` ASC) VISIBLE,
  CONSTRAINT `FKgvilp42nkyg8go64uim1rihul`
    FOREIGN KEY (`idFinanciacion`)
    REFERENCES `clinica_dental`.`financiacion` (`id`),
  CONSTRAINT `FKhnyipxgyoi8subbefme0ovhb7`
    FOREIGN KEY (`idPaciente`)
    REFERENCES `clinica_dental`.`paciente` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 19
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `clinica_dental`.`cita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clinica_dental`.`cita` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `idPaciente` BIGINT NOT NULL,
  `fecha` DATE NOT NULL,
  `hora` TIME NOT NULL,
  `estado` VARCHAR(50) NOT NULL DEFAULT 'Pendiente',
  PRIMARY KEY (`id`),
  INDEX `idPaciente` (`idPaciente` ASC) VISIBLE,
  CONSTRAINT `cita_ibfk_1`
    FOREIGN KEY (`idPaciente`)
    REFERENCES `clinica_dental`.`paciente` (`id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `clinica_dental`.`tratamiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clinica_dental`.`tratamiento` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `aprobado` BIT(1) NULL DEFAULT NULL,
  `descripcion` VARCHAR(255) NULL DEFAULT NULL,
  `fechaFin` DATE NULL DEFAULT NULL,
  `fechaInicio` DATE NULL DEFAULT NULL,
  `nombre` VARCHAR(255) NULL DEFAULT NULL,
  `presupuesto` DECIMAL(19,2) NULL DEFAULT NULL,
  `idPaciente` BIGINT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `FKbvhh8co5ih5qduk9oxx8tmgkh` (`idPaciente` ASC) VISIBLE,
  CONSTRAINT `FKbvhh8co5ih5qduk9oxx8tmgkh`
    FOREIGN KEY (`idPaciente`)
    REFERENCES `clinica_dental`.`paciente` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 21
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `clinica_dental`.`documento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clinica_dental`.`documento` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `fechaFirma` DATETIME(6) NULL DEFAULT NULL,
  `firmado` BIT(1) NULL DEFAULT NULL,
  `nombreDocumento` VARCHAR(255) NULL DEFAULT NULL,
  `idPaciente` BIGINT NULL DEFAULT NULL,
  `idTratamiento` BIGINT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `FKrtyt6frvv5pfwrvfpss0itoyy` (`idPaciente` ASC) VISIBLE,
  INDEX `FKkhhfjg9lt57hhjtjlc7xwoudk` (`idTratamiento` ASC) VISIBLE,
  CONSTRAINT `FKkhhfjg9lt57hhjtjlc7xwoudk`
    FOREIGN KEY (`idTratamiento`)
    REFERENCES `clinica_dental`.`tratamiento` (`id`),
  CONSTRAINT `FKrtyt6frvv5pfwrvfpss0itoyy`
    FOREIGN KEY (`idPaciente`)
    REFERENCES `clinica_dental`.`paciente` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 21
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `clinica_dental`.`presupuesto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clinica_dental`.`presupuesto` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(255) NULL DEFAULT NULL,
  `estado` VARCHAR(255) NULL DEFAULT NULL,
  `fechaAceptacion` DATE NULL DEFAULT NULL,
  `fechaCreacion` DATE NULL DEFAULT NULL,
  `monto` DECIMAL(19,2) NULL DEFAULT NULL,
  `idPaciente` BIGINT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK3llotqrkxavntsbwn39j4xhmg` (`idPaciente` ASC) VISIBLE,
  CONSTRAINT `FK3llotqrkxavntsbwn39j4xhmg`
    FOREIGN KEY (`idPaciente`)
    REFERENCES `clinica_dental`.`paciente` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 21
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `clinica_dental`.`rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clinica_dental`.`rol` (
  `idRol` BIGINT NOT NULL AUTO_INCREMENT,
  `nombreRol` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`idRol`))
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `clinica_dental`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clinica_dental`.`usuario` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(255) NULL DEFAULT NULL,
  `nombreUsuario` VARCHAR(255) NULL DEFAULT NULL,
  `password` VARCHAR(255) NULL DEFAULT NULL,
  `idRol` BIGINT NULL DEFAULT NULL,
  `idPaciente` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK5wgt2t5jmrf3q5l0utng6267r` (`idRol` ASC) VISIBLE,
  INDEX `fk_usuario_paciente` (`idPaciente` ASC) VISIBLE,
  CONSTRAINT `FK5wgt2t5jmrf3q5l0utng6267r`
    FOREIGN KEY (`idRol`)
    REFERENCES `clinica_dental`.`rol` (`idRol`),
  CONSTRAINT `fk_usuario_paciente`
    FOREIGN KEY (`idPaciente`)
    REFERENCES `clinica_dental`.`paciente` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
