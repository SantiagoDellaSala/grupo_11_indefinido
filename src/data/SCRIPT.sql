-- MySQL Script generated by MySQL Workbench
-- Tue Feb 27 22:06:56 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema db_suyds
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_suyds
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_suyds` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `db_suyds` ;

-- -----------------------------------------------------
-- Table `db_suyds`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_suyds`.`categories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db_suyds`.`images`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_suyds`.`images` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db_suyds`.`materials`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_suyds`.`materials` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db_suyds`.`origins`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_suyds`.`origins` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db_suyds`.`qualities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_suyds`.`qualities` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db_suyds`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_suyds`.`products` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `price` INT NOT NULL,
  `description` TEXT NOT NULL,
  `discount` INT NULL DEFAULT NULL,
  `mainImage` VARCHAR(255) NULL DEFAULT NULL,
  `materialId` INT NULL DEFAULT NULL,
  `originId` INT NULL DEFAULT NULL,
  `qualityId` INT NULL DEFAULT NULL,
  `categoryId` INT NULL DEFAULT NULL,
  `imageId` INT NULL DEFAULT NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `materialId` (`materialId` ASC) VISIBLE,
  INDEX `originId` (`originId` ASC) VISIBLE,
  INDEX `qualityId` (`qualityId` ASC) VISIBLE,
  INDEX `categoryId` (`categoryId` ASC) VISIBLE,
  INDEX `imageId` (`imageId` ASC) VISIBLE,
  CONSTRAINT `products_ibfk_1`
    FOREIGN KEY (`materialId`)
    REFERENCES `db_suyds`.`materials` (`id`),
  CONSTRAINT `products_ibfk_2`
    FOREIGN KEY (`originId`)
    REFERENCES `db_suyds`.`origins` (`id`),
  CONSTRAINT `products_ibfk_3`
    FOREIGN KEY (`qualityId`)
    REFERENCES `db_suyds`.`qualities` (`id`),
  CONSTRAINT `products_ibfk_4`
    FOREIGN KEY (`categoryId`)
    REFERENCES `db_suyds`.`categories` (`id`),
  CONSTRAINT `products_ibfk_5`
    FOREIGN KEY (`imageId`)
    REFERENCES `db_suyds`.`images` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db_suyds`.`items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_suyds`.`items` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cantidad` VARCHAR(255) NULL DEFAULT NULL,
  `productItemId` INT NOT NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `productItemId` (`productItemId` ASC) VISIBLE,
  CONSTRAINT `items_ibfk_1`
    FOREIGN KEY (`productItemId`)
    REFERENCES `db_suyds`.`products` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db_suyds`.`sequelizemeta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_suyds`.`sequelizemeta` (
  `name` VARCHAR(255) COLLATE 'utf8mb3_unicode_ci' NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE INDEX `name` (`name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_suyds`.`states`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_suyds`.`states` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db_suyds`.`troleys`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_suyds`.`troleys` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `total` INT NOT NULL,
  `stateId` INT NOT NULL,
  `itemId` INT NULL DEFAULT NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `stateId` (`stateId` ASC) VISIBLE,
  INDEX `itemId` (`itemId` ASC) VISIBLE,
  CONSTRAINT `troleys_ibfk_1`
    FOREIGN KEY (`stateId`)
    REFERENCES `db_suyds`.`states` (`id`),
  CONSTRAINT `troleys_ibfk_2`
    FOREIGN KEY (`itemId`)
    REFERENCES `db_suyds`.`items` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db_suyds`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_suyds`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `surname` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `avatar` VARCHAR(255) NULL DEFAULT NULL,
  `roleId` INT NULL DEFAULT NULL,
  `troleyId` INT NULL DEFAULT NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `troleyId` (`troleyId` ASC) VISIBLE,
  CONSTRAINT `users_ibfk_1`
    FOREIGN KEY (`troleyId`)
    REFERENCES `db_suyds`.`troleys` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
