SET NAMES 'utf8';
SET SESSION collation_connection = 'utf8_general_ci';

CREATE DATABASE IBAcalculator DEFAULT CHARACTER SET 'utf8';

USE IBAcalculator;

CREATE TABLE results(
	id_result INTEGER AUTO_INCREMENT,
	period INTEGER NOT NULL,
	proceeds DOUBLE NOT NULL,
	nonOperatingIncome DOUBLE NOT NULL,
	hasMainJob BOOLEAN NOT NULL,
	hasBenefits BOOLEAN NOT NULL,
	specialStatus BOOLEAN NOT NULL,
	numOfChildren INTEGER NOT NULL,
	numOfDisabledChildren INTEGER NOT NULL,
	numOfDependents INTEGER NOT NULL,
	insuranceContributions DOUBLE NOT NULL,
	educationExpenses DOUBLE NOT NULL,
	expensesForBuilding DOUBLE NOT NULL,
	expensesForBusiness DOUBLE NOT NULL,
	calculationResult DOUBLE NOT NULL,
	PRIMARY KEY(id_result)
);