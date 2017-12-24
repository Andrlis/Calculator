package calculation;

public class CalculationException extends Exception {

    public CalculationException() {}

    public CalculationException(String message) {
        super(message);
    }

    public CalculationException(Throwable cause) {
        super(cause);
    }

    public CalculationException(String message, Throwable cause) {
        super(message, cause);
    }
}