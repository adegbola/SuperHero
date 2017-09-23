-- MySQL Script generated by MySQL Workbench
-- Wed Jul 19 20:06:59 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `SuperHero` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `SuperHero` DEFAULT CHARACTER SET utf8 ;
USE `SuperHero` ;

-- -----------------------------------------------------
-- Table `mydb`.`SuperHero`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SuperHero`.`SuperHero` ;

CREATE TABLE IF NOT EXISTS `SuperHero`.`SuperHero` (
  `SuperHeroID` INT NOT NULL AUTO_INCREMENT,
  `FirstName` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  `Description` VARCHAR(150) NOT NULL,
  `SuperPower` VARCHAR(150) NULL,
  `SuperHerocol` VARCHAR(150) NULL,
  PRIMARY KEY (`SuperHeroID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SuperHero`.`Location` ;

CREATE TABLE IF NOT EXISTS `SuperHero`.`Location` (
  `LocationID` INT NOT NULL AUTO_INCREMENT,
  `LocationName` VARCHAR(45) NOT NULL,
  `LocationDescription` VARCHAR(200) NOT NULL,
  `LocationAddress` VARCHAR(200) NOT NULL,
  `Longitude` varchar(10) NOT NULL,
  `Latitude` varchar(10) NOT NULL,
  PRIMARY KEY (`LocationID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Organization`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SuperHero`.`Organization` ;

CREATE TABLE IF NOT EXISTS `SuperHero`.`Organization` (
  `OrganizationID` INT NOT NULL AUTO_INCREMENT,
  `OrganizationName` VARCHAR(45) NOT NULL,
  `OrganizationDescription` VARCHAR(200) NOT NULL,
  `Phone` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
 
  `LocationID` INT NULL,
  PRIMARY KEY (`OrganizationID`),
  INDEX `LocationID_idx` (`LocationID` ASC),
  CONSTRAINT `LocationID`
    FOREIGN KEY (`LocationID`)
    REFERENCES `SuperHero`.`Location` (`LocationID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`SuperHeroOrganization`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SuperHero`.`SuperHeroOrganization` ;

CREATE TABLE IF NOT EXISTS `SuperHero`.`SuperHeroOrganization` (
  `SuperHeroID` INT NOT NULL,
  `OrganizationID` INT NOT NULL,
  PRIMARY KEY (`SuperHeroID`, `OrganizationID`),
  INDEX `fk_SuperHero_has_Organization_Organization1_idx` (`OrganizationID` ASC),
  INDEX `fk_SuperHero_has_Organization_SuperHero_idx` (`SuperHeroID` ASC),
  CONSTRAINT `SuperHeroID`
    FOREIGN KEY (`SuperHeroID`)
    REFERENCES `SuperHero`.`SuperHero` (`SuperHeroID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `OrganizationID`
    FOREIGN KEY (`OrganizationID`)
    REFERENCES `SuperHero`.`Organization` (`OrganizationID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Sighting`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SuperHero`.`Sighting` ;

CREATE TABLE IF NOT EXISTS `SuperHerohashtag`.`Sighting` (
  `SightingID` INT NOT NULL AUTO_INCREMENT,
  `DateDateTime` datetime NOT NULL,
  `SuperHeroID` INT NULL,
  `LocationID` INT NULL,
  PRIMARY KEY (`SightingID`),
  INDEX `SuperHeroID_idx` (`SuperHeroID` ASC),
  INDEX `LocationID_idx` (`LocationID` ASC),
  CONSTRAINT `Sighting_SuperHeroID`
    FOREIGN KEY (`SuperHeroID`)
    REFERENCES `SuperHero`.`SuperHero` (`SuperHeroID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Sighting_LocationID`
    FOREIGN KEY (`LocationID`)
    REFERENCES `SuperHero`.`Location` (`LocationID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;