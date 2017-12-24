SET NAMES 'utf8';
SET SESSION collation_connection = 'utf8_general_ci';

CREATE DATABASE IBAcalculator DEFAULT CHARACTER SET 'utf8';

USE IBAcalculator;

CREATE TABLE results(
	id_result INTEGER AUTO_INCREMENT,
	period INTEGER NOT NULL,
	proceeds INTEGER NOT NULL,
	nonOperatingIncome INTEGER NOT NULL,
	hasMainJob BOOLEAN NOT NULL,
	hasBenefits BOOLEAN NOT NULL,
	specialStatus BOOLEAN NOT NULL,
	numOfChildren INTEGER NOT NULL,
	numOfDisabledChildren INTEGER NOT NULL,
	numOfDependents INTEGER NOT NULL,
	insuranceContributions INTEGER NOT NULL,
	educationExpenses INTEGER NOT NULL,
	expensesForBuilding INTEGER NOT NULL,
	expensesForBusiness INTEGER NOT NULL,
	calculationResult DOUBLE NOT NULL,
	PRIMARY KEY(id_result)
);