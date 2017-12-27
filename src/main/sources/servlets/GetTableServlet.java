package servlets;

import bean.CalculationResult;
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

@WebServlet("/GetTableServlet")
public class GetTableServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        try {
            String table = "";
            List<CalculationResult> resultList = DaoFactory.getCalculationResult().getAllResults();
            table = JsonMaker.getResultsJson(resultList);
            response.getWriter().append(table);
        }
        catch (DaoException ex){
            throw new ServletException(ex);
        }
    }
}
