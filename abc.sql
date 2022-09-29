-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema abc
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema abc
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `abc` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `abc` ;

-- -----------------------------------------------------
-- Table `abc`.`abc_logs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `abc`.`abc_logs` (
  `change_id` INT NULL DEFAULT NULL,
  `username` VARCHAR(40) NULL DEFAULT NULL,
  `action_taken` VARCHAR(55) NULL DEFAULT NULL,
  `action_used_on` VARCHAR(55) NULL DEFAULT NULL,
  `changed_date` TIMESTAMP NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `abc`.`client_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `abc`.`client_info` (
  `client_id` INT NOT NULL AUTO_INCREMENT,
  `client_name` VARCHAR(40) NOT NULL,
  `address` VARCHAR(255) NOT NULL,
  `phone_number` CHAR(12) NOT NULL,
  `is_deleted` TINYINT(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`client_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `abc`.`client_contacts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `abc`.`client_contacts` (
  `client_contacts_id` INT NOT NULL AUTO_INCREMENT,
  `client_id` INT NOT NULL,
  `email_address` VARCHAR(40) NOT NULL,
  `phone_number` CHAR(12) NOT NULL,
  `contact_name` VARCHAR(50) NOT NULL,
  `is_deleted` TINYINT(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`client_contacts_id`),
  INDEX `fk_client_info_contact_idx` (`client_id` ASC) VISIBLE,
  CONSTRAINT `fk_client_info_contact`
    FOREIGN KEY (`client_id`)
    REFERENCES `abc`.`client_info` (`client_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `abc`.`inventory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `abc`.`inventory` (
  `inventory_id` INT NOT NULL AUTO_INCREMENT,
  `item_name` VARCHAR(40) NOT NULL,
  `storage_type` VARCHAR(40) NOT NULL,
  `max_item_capacity` INT NOT NULL,
  `client_id` INT NOT NULL,
  `is_deleted` TINYINT(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`inventory_id`),
  INDEX `fk_client_inventory_idx` (`client_id` ASC) VISIBLE,
  CONSTRAINT `fk_client_inventory`
    FOREIGN KEY (`client_id`)
    REFERENCES `abc`.`client_info` (`client_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `abc`.`resources`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `abc`.`resources` (
  `resource_id` INT NOT NULL AUTO_INCREMENT,
  `resource_name` VARCHAR(40) NOT NULL,
  `resource_type` VARCHAR(40) NOT NULL,
  `max_num_resources` INT NOT NULL,
  `current_num_resources` INT NOT NULL,
  `inventory_id` INT NOT NULL,
  `is_deleted` TINYINT(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`resource_id`),
  INDEX `fk_inventory_resource_idx` (`inventory_id` ASC) VISIBLE,
  CONSTRAINT `fk_inventory_resource`
    FOREIGN KEY (`inventory_id`)
    REFERENCES `abc`.`inventory` (`inventory_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
