package calculation;

import bean.CalculationParameters;

public class Calculator {

    public static double calculateTax(CalculationParameters parameters) throws CalculationException{

        double tempValue = parameters.getProceeds()
                + parameters.getNonOperatingIncome()
                - parameters.getExpensesForBusiness();

        if(tempValue < 0)
            throw new CalculationException("Wrong parameters.");

        if(!parameters.isHasMainJob()){

            tempValue = secondStep(tempValue, parameters);

            tempValue = thirdStep(tempValue, parameters);

            tempValue = fourthStep(tempValue, parameters);

            tempValue = fifthStep(tempValue, parameters);

            tempValue = tempValue
                    - (parameters.getEducationExpenses() + parameters.getExpensesForBuilding() + parameters.getExpensesForBusiness());
            tempValue = checkZeroValue(tempValue);

        }

        return tempValue*0.16;
    }

    private static double checkZeroValue(double value){
        return value >= 0 ? value : 0;
    }

    private static double secondStep(double tempValue, CalculationParameters parameters){
        if (tempValue <= 15020000){
            tempValue = tempValue - (830000 * parameters.getPeriod());
            tempValue = checkZeroValue(tempValue);
        }
        return tempValue;
    }

    private static double thirdStep(double tempValue, CalculationParameters parameters){
        if (parameters.isHasBenefits()){
            tempValue = tempValue - (1170000 * parameters.getPeriod());
            tempValue = checkZeroValue(tempValue);
        }
        return tempValue;
    }

    private static double fourthStep(double tempValue, CalculationParameters parameters){
        if (parameters.isSpecialStatus()
                && parameters.getNumOfChildren() > 0
                && parameters.getNumOfDependents() > 0
                && parameters.getNumOfDisabledChildren() <= parameters.getNumOfChildren()){
            tempValue = tempValue
                    - parameters.getPeriod() * 460000  * (parameters.getNumOfChildren() + parameters.getNumOfDependents());
            tempValue = checkZeroValue(tempValue);
        }
        else{
            if(parameters.getNumOfChildren() == 1
                    && parameters.getNumOfDisabledChildren() == 0
                    && parameters.getNumOfDependents() > 0){
                tempValue = tempValue
                        - parameters.getPeriod() * 240000 * (parameters.getNumOfChildren() + parameters.getNumOfDependents());
            }
            if(parameters.getNumOfChildren() == 1
                    && parameters.getNumOfDisabledChildren() == 1
                    && parameters.getNumOfDependents() > 0){
                tempValue = tempValue
                        - parameters.getPeriod() *
                        ((parameters.getNumOfChildren() * 460000) + (parameters.getNumOfDependents() * 240000));
            }
            if(parameters.getNumOfChildren() > 1
                    && parameters.getNumOfDisabledChildren() <= parameters.getNumOfChildren()
                    && parameters.getNumOfDependents() > 0){
                tempValue = tempValue
                        - parameters.getPeriod() * 460000 * (parameters.getNumOfChildren() + parameters.getNumOfDependents());
            }
            tempValue = checkZeroValue(tempValue);
        }
        return tempValue;
    }

    private static double fifthStep(double tempValue, CalculationParameters parameters){
        if(parameters.getInsuranceContributions() <= 16000000){
            tempValue = tempValue - parameters.getInsuranceContributions();
        }
        else {
            tempValue = tempValue - 16000000;
        }
        return checkZeroValue(tempValue);
    }
}