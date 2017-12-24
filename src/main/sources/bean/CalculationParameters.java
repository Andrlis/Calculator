package bean;

public class CalculationParameters {

    private int period;
    private double proceeds;
    private double nonOperatingIncome;
    private boolean hasMainJob;
    private boolean hasBenefits;
    private boolean specialStatus;
    private int numOfChildren;
    private int numOfDisabledChildren;
    private int numOfDependents;
    private double insuranceContributions;
    private double educationExpenses;
    private double expensesForBuilding;
    private double expensesForBusiness;


    public int getPeriod() {
        return period;
    }

    public void setPeriod(int period) {
        this.period = period;
    }

    public double getProceeds() {
        return proceeds;
    }

    public void setProceeds(double proceeds) {
        this.proceeds = proceeds;
    }

    public double getNonOperatingIncome() {
        return nonOperatingIncome;
    }

    public void setNonOperatingIncome(double nonOperatingIncome) {
        this.nonOperatingIncome = nonOperatingIncome;
    }

    public boolean isHasMainJob() {
        return hasMainJob;
    }

    public void setHasMainJob(boolean hasMainJob) {
        this.hasMainJob = hasMainJob;
    }

    public boolean isHasBenefits() {
        return hasBenefits;
    }

    public void setHasBenefits(boolean hasBenefits) {
        this.hasBenefits = hasBenefits;
    }

    public boolean isSpecialStatus() {
        return specialStatus;
    }

    public void setSpecialStatus(boolean specialStatus) {
        this.specialStatus = specialStatus;
    }

    public int getNumOfChildren() {
        return numOfChildren;
    }

    public void setNumOfChildren(int numOfChildren) {
        this.numOfChildren = numOfChildren;
    }

    public int getNumOfDisabledChildren() {
        return numOfDisabledChildren;
    }

    public void setNumOfDisabledChildren(int numOfDisabledChildren) {
        this.numOfDisabledChildren = numOfDisabledChildren;
    }

    public int getNumOfDependents() {
        return numOfDependents;
    }

    public void setNumOfDependents(int numOfDependents) {
        this.numOfDependents = numOfDependents;
    }

    public double getInsuranceContributions() {
        return insuranceContributions;
    }

    public void setInsuranceContributions(double insuranceContributions) {
        this.insuranceContributions = insuranceContributions;
    }

    public double getEducationExpenses() {
        return educationExpenses;
    }

    public void setEducationExpenses(double educationExpenses) {
        this.educationExpenses = educationExpenses;
    }

    public double getExpensesForBuilding() {
        return expensesForBuilding;
    }

    public void setExpensesForBuilding(double expensesForBuilding) {
        this.expensesForBuilding = expensesForBuilding;
    }

    public double getExpensesForBusiness() {
        return expensesForBusiness;
    }

    public void setExpensesForBusiness(double expensesForBusiness) {
        this.expensesForBusiness = expensesForBusiness;
    }
}