package dao;

import bean.CalculationResult;
import dao.mySqlDao.MySqlCalculationResultDAO;

public class DaoFactory {

    private enum DbType {MySQL}

    private static DbType type = DbType.MySQL;

    public static CalculationResultDAO getCalculationResult() {
        switch (type) {
            case MySQL:
                return new MySqlCalculationResultDAO();
            default:
                return null;
        }
    }
}