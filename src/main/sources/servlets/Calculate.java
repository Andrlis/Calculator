package servlets;

import bean.CalculationParameters;
import bean.CalculationResult;
import calculation.CalculationException;
import calculation.Calculator;
import dao.DaoException;
import dao.DaoFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Calculate")
public class Calculate extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        CalculationParameters parameters = createParameters(request);
        CalculationResult calculationResult = new CalculationResult();

        calculationResult.setParameters(parameters);

        try {
            calculationResult .setResult(Calculator.calculateTax(parameters));
        }catch (CalculationException ex){
            throw new ServletException(ex);
        }

        try {
            DaoFactory.getCalculationResult().saveResult(calculationResult);
        }catch (DaoException ex){
            throw new ServletException(ex);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    private CalculationParameters createParameters(HttpServletRequest request){
        CalculationParameters parameters = new CalculationParameters();

        int period = Integer.parseInt(request.getParameter("period"));
        double proceeds = Double.parseDouble(request.getParameter("proceeds"));
        double nonOperatingIncome = Double.parseDouble(request.getParameter("nonOperatingIncome"));
        boolean hasMainJob = Boolean.parseBoolean(request.getParameter("hasMainJob"));
        boolean hasBenefits = Boolean.parseBoolean(request.getParameter("hasBenefits"));
        boolean specialStatus = Boolean.parseBoolean(request.getParameter("specialStatus"));
        int numOfChildren = Integer.parseInt(request.getParameter("numOfChildren"));
        int numOfDisabledChildren = Integer.parseInt(request.getParameter("numOfDisabledChildren"));
        int numOfDependents = Integer.parseInt(request.getParameter("numOfDependents"));
        double insuranceContributions = Double.parseDouble(request.getParameter("insuranceContributions"));
        double educationExpenses = Double.parseDouble(request.getParameter("educationExpenses"));
        double expensesForBuilding = Double.parseDouble(request.getParameter("expensesForBuilding"));
        double expensesForBusiness = Double.parseDouble(request.getParameter("expensesForBusiness"));

        parameters.setPeriod(period);
        parameters.setProceeds(proceeds);
        parameters.setNonOperatingIncome(nonOperatingIncome);
        parameters.setHasMainJob(hasMainJob);
        parameters.setHasBenefits(hasBenefits);
        parameters.setSpecialStatus(specialStatus);
        parameters.setNumOfChildren(numOfChildren);
        parameters.setNumOfDisabledChildren(numOfDisabledChildren);
        parameters.setNumOfDependents(numOfDependents);
        parameters.setInsuranceContributions(insuranceContributions);
        parameters.setEducationExpenses(educationExpenses);
        parameters.setExpensesForBuilding(expensesForBuilding);
        parameters.setExpensesForBusiness(expensesForBusiness);

        return parameters;
    }
}
