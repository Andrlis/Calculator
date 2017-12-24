package dao;

import bean.CalculationResult;
import java.util.List;

public interface CalculationResultDAO {
    CalculationResult getResultById(int id) throws DaoException;
    List<CalculationResult> getAllResults() throws DaoException;
    void saveResult(CalculationResult result) throws DaoException;
    void updateResult(int id, CalculationResult result) throws DaoException;
    void removeResult(int id) throws DaoException;
}
