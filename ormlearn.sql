-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema hello-world
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema hello-world
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ormlearn` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
USE `ormlearn` ;

-- -----------------------------------------------------
-- Table `hello-world`.`address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ormlearn`.`address` (
  `id` INT(11) NOT NULL,
  `street` VARCHAR(25) NULL DEFAULT NULL,
  `city` VARCHAR(25) NULL DEFAULT NULL,
  `state` VARCHAR(25) NULL DEFAULT NULL,
  `country` VARCHAR(25) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hello-world`.`publisher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ormlearn`.`publisher` (
  `id` INT(11) NOT NULL,
  `name` VARCHAR(25) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hello-world`.`book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ormlearn`.`book` (
  `book_id` INT(11) NOT NULL,
  `name` VARCHAR(25) NULL DEFAULT NULL,
  `publisher_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`book_id`),
  INDEX `publisher_id` (`publisher_id` ASC) VISIBLE,
  CONSTRAINT `book_ibfk_1`
    FOREIGN KEY (`publisher_id`)
    REFERENCES `ormlearn`.`publisher` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hello-world`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ormlearn`.`employee` (
  `employee_id` INT(11) NOT NULL,
  `first_Name` VARCHAR(25) NULL DEFAULT NULL,
  `last_Name` VARCHAR(25) NULL DEFAULT NULL,
  `address_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  INDEX `address_id` (`address_id` ASC) VISIBLE,
  CONSTRAINT `employee_ibfk_1`
    FOREIGN KEY (`address_id`)
    REFERENCES `ormlearn`.`address` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hello-world`.`message`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ormlearn`.`message` (
  `ID` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `TEXT` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 103
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hello-world`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ormlearn`.`student` (
  `id` INT(11) NOT NULL,
  `name` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hello-world`.`teacher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ormlearn`.`teacher` (
  `id` INT(11) NOT NULL,
  `name` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hello-world`.`student_teacher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ormlearn`.`student_teacher` (
  `Student_ID` INT(11) NOT NULL,
  `Teacher_ID` INT(11) NOT NULL,
  INDEX `Student_ID` (`Student_ID` ASC) VISIBLE,
  INDEX `Teacher_ID` (`Teacher_ID` ASC) VISIBLE,
  CONSTRAINT `student_teacher_ibfk_1`
    FOREIGN KEY (`Student_ID`)
    REFERENCES `ormlearn`.`student` (`id`),
  CONSTRAINT `student_teacher_ibfk_2`
    FOREIGN KEY (`Teacher_ID`)
    REFERENCES `ormlearn`.`teacher` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
