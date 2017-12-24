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
            calculationResult.setResult(Calculator.calculateTax(parameters));
            //DaoFactory.getCalculationResult().saveResult(calculationResult);

            request.setAttribute("calculationResult", calculationResult);
            request
                    .getRequestDispatcher("WEB-INF/pages/result.jsp")
                    .forward(request, response);
        }
        catch (CalculationException ex){
            throw new ServletException(ex);
        }
//        catch (DaoException ex){
//            throw new ServletException(ex);
//        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    private CalculationParameters createParameters(HttpServletRequest request){
        CalculationParameters parameters = new CalculationParameters();

        int period = Integer.parseInt(request.getParameter("period"));
        int proceeds = Integer.parseInt(request.getParameter("proceeds"));
        int nonOperatingIncome = Integer.parseInt(request.getParameter("nonOperatingIncome"));
        boolean hasMainJob = Boolean.parseBoolean(request.getParameter("hasMainJob"));
        boolean hasBenefits = Boolean.parseBoolean(request.getParameter("hasBenefits"));
        boolean specialStatus = Boolean.parseBoolean(request.getParameter("specialStatus"));
        int numOfChildren = Integer.parseInt(request.getParameter("numOfChildren"));
        int numOfDisabledChildren = Integer.parseInt(request.getParameter("numOfDisabledChildren"));
        int numOfDependents = Integer.parseInt(request.getParameter("numOfDependents"));
        int insuranceContributions = Integer.parseInt(request.getParameter("insuranceContributions"));
        int educationExpenses = Integer.parseInt(request.getParameter("educationExpenses"));
        int expensesForBuilding = Integer.parseInt(request.getParameter("expensesForBuilding"));
        int expensesForBusiness = Integer.parseInt(request.getParameter("expensesForBusiness"));

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
