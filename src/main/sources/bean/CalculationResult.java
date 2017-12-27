package bean;

public class CalculationResult {

    private int id;
    private CalculationParameters parameters;
    private double result;

    public CalculationResult(){
       parameters = new CalculationParameters();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public CalculationParameters getParameters() {
        return parameters;
    }

    public void setParameters(CalculationParameters parameters) {
        this.parameters = parameters;
    }

    public double getResult() {
        return result;
    }

    public void setResult(double result) {
        this.result = result;
    }
}