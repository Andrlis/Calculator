package servlets;

import bean.CalculationResult;
import bean.FilterParameters;
import dao.DaoException;
import dao.DaoFactory;
import utilities.JsonMaker;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/GetFilteredTableServlet")
public class GetFilteredTableServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        FilterParameters parameters = creteParameters(request);

        try {
            String table = "";
            List<CalculationResult> resultList = DaoFactory.getCalculationResult().getResultsByParameters(parameters);
            table = JsonMaker.getResultsJson(resultList);
            response.getWriter().append(table);
        }
        catch (DaoException ex){
            throw new ServletException(ex);
        }
    }

    private FilterParameters creteParameters(HttpServletRequest request){
        FilterParameters parameters = new FilterParameters();

        parameters.setParameter1(request.getParameter("param1"));
        parameters.setParameter2(request.getParameter("param2"));

        if(request.getParameter("paramValue1") != null
                && !request.getParameter("paramValue1").equals("undefined"))
            parameters.getParameterValues1().add(request.getParameter("paramValue1"));
        if(request.getParameter("paramValue2") != null
                && !request.getParameter("paramValue2").equals("undefined"))
            parameters.getParameterValues1().add(request.getParameter("paramValue2"));
        if(request.getParameter("paramValue3") != null
                && !request.getParameter("paramValue3").equals("undefined"))
            parameters.getParameterValues2().add(request.getParameter("paramValue3"));
        if(request.getParameter("paramValue4") != null
                && !request.getParameter("paramValue4").equals("undefined"))
            parameters.getParameterValues2().add(request.getParameter("paramValue4"));

        return parameters;
    }
}
