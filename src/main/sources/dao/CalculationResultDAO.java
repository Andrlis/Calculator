package dao;

import bean.CalculationResult;
import bean.FilterParameters;

import java.util.List;

public interface CalculationResultDAO {
    CalculationResult getResultById(int id) throws DaoException;
    List<CalculationResult> getAllResults() throws DaoException;
    List<CalculationResult> getResultsByParameters(FilterParameters parameters) throws DaoException;
    void saveResult(CalculationResult result) throws DaoException;
    void updateResult(int id, CalculationResult result) throws DaoException;
    void removeResult(int id) throws DaoException;
}
