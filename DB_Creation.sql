-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema YMR
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema YMR
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `YMR` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `YMR` ;

-- -----------------------------------------------------
-- Table `YMR`.`TbLanguages`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `YMR`.`TbLanguages` ;

CREATE TABLE IF NOT EXISTS `YMR`.`TbLanguages` (
  `idLanguage` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `language` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`idLanguage`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `YMR`.`TbCountries`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `YMR`.`TbCountries` ;

CREATE TABLE IF NOT EXISTS `YMR`.`TbCountries` (
  `idCountry` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `idLanguage` INT NOT NULL COMMENT '',
  `countryName` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`idCountry`)  COMMENT '',
  INDEX `FK_Language_idx` (`idLanguage` ASC)  COMMENT '',
  CONSTRAINT `FK_CountryLanguage`
    FOREIGN KEY (`idLanguage`)
    REFERENCES `YMR`.`TbLanguages` (`idLanguage`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `YMR`.`TbUserTypes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `YMR`.`TbUserTypes` ;

CREATE TABLE IF NOT EXISTS `YMR`.`TbUserTypes` (
  `idUserType` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `userType` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`idUserType`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `YMR`.`TbUserTitles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `YMR`.`TbUserTitles` ;

CREATE TABLE IF NOT EXISTS `YMR`.`TbUserTitles` (
  `idTitle` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `titleName` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`idTitle`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `YMR`.`TbUsers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `YMR`.`TbUsers` ;

CREATE TABLE IF NOT EXISTS `YMR`.`TbUsers` (
  `idUser` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `idCountry` INT NOT NULL COMMENT '',
  `idTitle` INT NOT NULL DEFAULT 0 COMMENT '',
  `idUserType` INT NOT NULL COMMENT '',
  `userName` VARCHAR(255) NOT NULL COMMENT '',
  `userEmail` VARCHAR(255) NOT NULL COMMENT '',
  PRIMARY KEY (`idUser`)  COMMENT '',
  INDEX `FK_UserCountry_idx` (`idCountry` ASC)  COMMENT '',
  INDEX `FK_UserType_idx` (`idUserType` ASC)  COMMENT '',
  INDEX `FK_UserTitle_idx` (`idTitle` ASC)  COMMENT '',
  UNIQUE INDEX `UN_UserName` (`userName` ASC)  COMMENT '',
  UNIQUE INDEX `UN_UserEmail` (`userEmail` ASC)  COMMENT '',
  CONSTRAINT `FK_UserCountry`
    FOREIGN KEY (`idCountry`)
    REFERENCES `YMR`.`TbCountries` (`idCountry`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_UserType`
    FOREIGN KEY (`idUserType`)
    REFERENCES `YMR`.`TbUserTypes` (`idUserType`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_UserTitle`
    FOREIGN KEY (`idTitle`)
    REFERENCES `YMR`.`TbUserTitles` (`idTitle`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `YMR`.`TbRecipes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `YMR`.`TbRecipes` ;

CREATE TABLE IF NOT EXISTS `YMR`.`TbRecipes` (
  `idRecipe` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `idUser` INT NOT NULL COMMENT '',
  `recipeDescription` LONGTEXT NULL COMMENT '',
  `recipeTitle` VARCHAR(255) NOT NULL COMMENT '',
  PRIMARY KEY (`idRecipe`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `YMR`.`TbHashtags`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `YMR`.`TbHashtags` ;

CREATE TABLE IF NOT EXISTS `YMR`.`TbHashtags` (
  `idHashtag` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `hashtag` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`idHashtag`)  COMMENT '',
  UNIQUE INDEX `UniqueHashtag` (`hashtag` ASC)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `YMR`.`TbComments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `YMR`.`TbComments` ;

CREATE TABLE IF NOT EXISTS `YMR`.`TbComments` (
  `idComment` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `idRecipe` INT NOT NULL COMMENT '',
  `order` INT NOT NULL COMMENT '',
  `comment` LONGTEXT NOT NULL COMMENT '',
  PRIMARY KEY (`idComment`)  COMMENT '',
  INDEX `FK_RecipeComment_idx` (`idRecipe` ASC)  COMMENT '',
  UNIQUE INDEX `UniqueCommentOrder` (`idRecipe` ASC, `order` ASC)  COMMENT '',
  CONSTRAINT `FK_RecipeComment`
    FOREIGN KEY (`idRecipe`)
    REFERENCES `YMR`.`TbRecipes` (`idRecipe`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `YMR`.`TbImages`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `YMR`.`TbImages` ;

CREATE TABLE IF NOT EXISTS `YMR`.`TbImages` (
  `idImage` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `idRecipe` INT NOT NULL COMMENT '',
  `imageURL` VARCHAR(255) NOT NULL COMMENT '',
  PRIMARY KEY (`idImage`)  COMMENT '',
  INDEX `FK_RecipeImage_idx` (`idRecipe` ASC)  COMMENT '',
  CONSTRAINT `FK_RecipeImage`
    FOREIGN KEY (`idRecipe`)
    REFERENCES `YMR`.`TbRecipes` (`idRecipe`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `YMR`.`TbRecipeParts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `YMR`.`TbRecipeParts` ;

CREATE TABLE IF NOT EXISTS `YMR`.`TbRecipeParts` (
  `idRecipePart` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `idRecipe` INT NOT NULL COMMENT '',
  `recipePartName` VARCHAR(255) NULL COMMENT '',
  PRIMARY KEY (`idRecipePart`)  COMMENT '',
  INDEX `FK_RecipePartsRecipe_idx` (`idRecipe` ASC)  COMMENT '',
  CONSTRAINT `FK_RecipePartsRecipe`
    FOREIGN KEY (`idRecipe`)
    REFERENCES `YMR`.`TbRecipes` (`idRecipe`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `YMR`.`TbRecipeSteps`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `YMR`.`TbRecipeSteps` ;

CREATE TABLE IF NOT EXISTS `YMR`.`TbRecipeSteps` (
  `idRecipeStep` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `idRecipePart` INT NOT NULL COMMENT '',
  `RecipeStepTitle` VARCHAR(255) NULL COMMENT '',
  `RecipeStepDescription` LONGTEXT NOT NULL COMMENT '',
  `RecipeStepOrder` INT NOT NULL COMMENT '',
  PRIMARY KEY (`idRecipeStep`)  COMMENT '',
  INDEX `FK_RecipeStepRecipePart_idx` (`idRecipePart` ASC)  COMMENT '',
  CONSTRAINT `FK_RecipeStepRecipePart`
    FOREIGN KEY (`idRecipePart`)
    REFERENCES `YMR`.`TbRecipeParts` (`idRecipePart`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `YMR`.`TbFollowers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `YMR`.`TbFollowers` ;

CREATE TABLE IF NOT EXISTS `YMR`.`TbFollowers` (
  `idFollowing` INT NOT NULL COMMENT '',
  `idFollower` INT NOT NULL COMMENT '',
  UNIQUE INDEX `Unique_Follow` (`idFollowing` ASC, `idFollower` ASC)  COMMENT '',
  INDEX `FK_UserFollower_idx` (`idFollower` ASC)  COMMENT '',
  CONSTRAINT `FK_UserFollowed`
    FOREIGN KEY (`idFollowing`)
    REFERENCES `YMR`.`TbUsers` (`idUser`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_UserFollower`
    FOREIGN KEY (`idFollower`)
    REFERENCES `YMR`.`TbUsers` (`idUser`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `YMR`.`TbTipsType`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `YMR`.`TbTipsType` ;

CREATE TABLE IF NOT EXISTS `YMR`.`TbTipsType` (
  `idTipsType` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `tipsType` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`idTipsType`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `YMR`.`TbTips`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `YMR`.`TbTips` ;

CREATE TABLE IF NOT EXISTS `YMR`.`TbTips` (
  `idTips` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `idTipsType` INT NOT NULL COMMENT '',
  `tipsDescription` LONGTEXT NOT NULL COMMENT '',
  PRIMARY KEY (`idTips`)  COMMENT '',
  INDEX `FK_TipsTipsType_idx` (`idTipsType` ASC)  COMMENT '',
  CONSTRAINT `FK_TipsTipsType`
    FOREIGN KEY (`idTipsType`)
    REFERENCES `YMR`.`TbTipsType` (`idTipsType`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `YMR`.`TbMeasureTypes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `YMR`.`TbMeasureTypes` ;

CREATE TABLE IF NOT EXISTS `YMR`.`TbMeasureTypes` (
  `idMeasureType` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `measureType` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`idMeasureType`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `YMR`.`TbMeasures`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `YMR`.`TbMeasures` ;

CREATE TABLE IF NOT EXISTS `YMR`.`TbMeasures` (
  `idMeasure` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `idCountry` INT NOT NULL COMMENT '',
  `idMeasureType` INT NOT NULL COMMENT '',
  `measureName` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`idMeasure`)  COMMENT '',
  INDEX `FK_CountryMeasure_idx` (`idCountry` ASC)  COMMENT '',
  INDEX `FK_MeasureTypeMeasure_idx` (`idMeasureType` ASC)  COMMENT '',
  CONSTRAINT `FK_CountryMeasure`
    FOREIGN KEY (`idCountry`)
    REFERENCES `YMR`.`TbCountries` (`idCountry`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_MeasureTypeMeasure`
    FOREIGN KEY (`idMeasureType`)
    REFERENCES `YMR`.`TbMeasureTypes` (`idMeasureType`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `YMR`.`TbConversion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `YMR`.`TbConversion` ;

CREATE TABLE IF NOT EXISTS `YMR`.`TbConversion` (
  `idMeasure1` INT NOT NULL COMMENT '',
  `idMeasure2` INT NOT NULL COMMENT '',
  `multiplier` DECIMAL(5) NOT NULL DEFAULT 0 COMMENT '',
  UNIQUE INDEX `UniqueConversion` (`idMeasure1` ASC, `idMeasure2` ASC)  COMMENT '',
  INDEX `FK_Measure2_idx` (`idMeasure2` ASC)  COMMENT '',
  CONSTRAINT `FK_Measure1`
    FOREIGN KEY (`idMeasure1`)
    REFERENCES `YMR`.`TbMeasures` (`idMeasure`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_Measure2`
    FOREIGN KEY (`idMeasure2`)
    REFERENCES `YMR`.`TbMeasures` (`idMeasure`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `YMR`.`TbIngredients`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `YMR`.`TbIngredients` ;

CREATE TABLE IF NOT EXISTS `YMR`.`TbIngredients` (
  `idIngredient` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `ingredientName` VARCHAR(255) NOT NULL COMMENT '',
  PRIMARY KEY (`idIngredient`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `YMR`.`TbRecipeIngredients`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `YMR`.`TbRecipeIngredients` ;

CREATE TABLE IF NOT EXISTS `YMR`.`TbRecipeIngredients` (
  `idRecipeIngredient` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `idRecipePart` INT NOT NULL COMMENT '',
  `idIngredient` INT NOT NULL COMMENT '',
  `idMeasure` INT NOT NULL COMMENT '',
  `ingredientOrder` INT NOT NULL COMMENT '',
  `amount` DECIMAL(2) NOT NULL COMMENT '',
  PRIMARY KEY (`idRecipeIngredient`)  COMMENT '',
  INDEX `FK_PartRecipeIngredients_idx` (`idRecipePart` ASC)  COMMENT '',
  INDEX `FK_IngredRecipeIngredients_idx` (`idIngredient` ASC)  COMMENT '',
  INDEX `FK_MeasureRecipeIngredients_idx` (`idMeasure` ASC)  COMMENT '',
  UNIQUE INDEX `UN_RecipebyPart` (`idRecipePart` ASC, `idIngredient` ASC)  COMMENT '',
  CONSTRAINT `FK_PartRecipeIngredients`
    FOREIGN KEY (`idRecipePart`)
    REFERENCES `YMR`.`TbRecipeParts` (`idRecipePart`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_IngredRecipeIngredients`
    FOREIGN KEY (`idIngredient`)
    REFERENCES `YMR`.`TbIngredients` (`idIngredient`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_MeasureRecipeIngredients`
    FOREIGN KEY (`idMeasure`)
    REFERENCES `YMR`.`TbMeasures` (`idMeasure`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `YMR`.`TbLikes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `YMR`.`TbLikes` ;

CREATE TABLE IF NOT EXISTS `YMR`.`TbLikes` (
  `idRecipe` INT NOT NULL COMMENT '',
  `idUser` INT NOT NULL COMMENT '',
  INDEX `FK_RecipeLike_idx` (`idRecipe` ASC)  COMMENT '',
  INDEX `FK_UserLike_idx` (`idUser` ASC)  COMMENT '',
  CONSTRAINT `FK_RecipeLike`
    FOREIGN KEY (`idRecipe`)
    REFERENCES `YMR`.`TbRecipes` (`idRecipe`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_UserLike`
    FOREIGN KEY (`idUser`)
    REFERENCES `YMR`.`TbUsers` (`idUser`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `YMR`.`TbRecipeTips`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `YMR`.`TbRecipeTips` ;

CREATE TABLE IF NOT EXISTS `YMR`.`TbRecipeTips` (
  `idRecipe` INT NOT NULL COMMENT '',
  `idTips` INT NOT NULL COMMENT '',
  INDEX `FK_RecipeTipsTips_idx` (`idTips` ASC)  COMMENT '',
  INDEX `FK_RecipePartTips_idx` (`idRecipe` ASC)  COMMENT '',
  CONSTRAINT `FK_RecipeTips`
    FOREIGN KEY (`idRecipe`)
    REFERENCES `YMR`.`TbRecipes` (`idRecipe`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_RecipeTipsTips`
    FOREIGN KEY (`idTips`)
    REFERENCES `YMR`.`TbTips` (`idTips`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `YMR`.`TbRecipeHashtags`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `YMR`.`TbRecipeHashtags` ;

CREATE TABLE IF NOT EXISTS `YMR`.`TbRecipeHashtags` (
  `idRecipe` INT NOT NULL COMMENT '',
  `idHashtag` INT NOT NULL COMMENT '',
  INDEX `FK_RecipeHashtagged_idx` (`idRecipe` ASC)  COMMENT '',
  INDEX `FK_RecipeHashtag_idx` (`idHashtag` ASC)  COMMENT '',
  CONSTRAINT `FK_RecipeHashtagged`
    FOREIGN KEY (`idRecipe`)
    REFERENCES `YMR`.`TbRecipes` (`idRecipe`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_RecipeHashtag`
    FOREIGN KEY (`idHashtag`)
    REFERENCES `YMR`.`TbHashtags` (`idHashtag`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `YMR`.`TbRecipePartTips`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `YMR`.`TbRecipePartTips` ;

CREATE TABLE IF NOT EXISTS `YMR`.`TbRecipePartTips` (
  `idRecipePartTips` INT NOT NULL COMMENT '',
  `idTips` INT NOT NULL COMMENT '',
  INDEX `FK_RecPartTips_idx` (`idRecipePartTips` ASC)  COMMENT '',
  INDEX `FK_RecipePartTips_idx` (`idTips` ASC)  COMMENT '',
  CONSTRAINT `FK_RecPartTips`
    FOREIGN KEY (`idRecipePartTips`)
    REFERENCES `YMR`.`TbRecipeParts` (`idRecipePart`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_RecipePartTips`
    FOREIGN KEY (`idTips`)
    REFERENCES `YMR`.`TbTips` (`idTips`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `YMR`.`TbTagTypes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `YMR`.`TbTagTypes` ;

CREATE TABLE IF NOT EXISTS `YMR`.`TbTagTypes` (
  `idTagType` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `tagType` VARCHAR(255) NOT NULL COMMENT '',
  PRIMARY KEY (`idTagType`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `YMR`.`TbTags`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `YMR`.`TbTags` ;

CREATE TABLE IF NOT EXISTS `YMR`.`TbTags` (
  `idTag` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `idTagType` INT NOT NULL COMMENT '',
  `tagName` VARCHAR(255) NOT NULL COMMENT '',
  PRIMARY KEY (`idTag`)  COMMENT '',
  INDEX `FK_TagsTagType_idx` (`idTagType` ASC)  COMMENT '',
  CONSTRAINT `FK_TagsTagType`
    FOREIGN KEY (`idTagType`)
    REFERENCES `YMR`.`TbTagTypes` (`idTagType`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `YMR`.`TbRecipeTag`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `YMR`.`TbRecipeTag` ;

CREATE TABLE IF NOT EXISTS `YMR`.`TbRecipeTag` (
  `idRecipe` INT NOT NULL COMMENT '',
  `idTag` INT NOT NULL COMMENT '',
  INDEX `FK_RecipeTagged_idx` (`idRecipe` ASC)  COMMENT '',
  INDEX `FK_RecipeTag_idx` (`idTag` ASC)  COMMENT '',
  CONSTRAINT `FK_RecipeTagged`
    FOREIGN KEY (`idRecipe`)
    REFERENCES `YMR`.`TbRecipes` (`idRecipe`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_RecipeTag`
    FOREIGN KEY (`idTag`)
    REFERENCES `YMR`.`TbTags` (`idTag`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
