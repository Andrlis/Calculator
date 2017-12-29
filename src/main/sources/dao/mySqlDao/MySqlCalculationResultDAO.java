package dao.mySqlDao;

import bean.CalculationResult;
import bean.FilterParameters;
import dao.CalculationResultDAO;
import dao.DaoException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MySqlCalculationResultDAO extends AbstractSqlDAO implements CalculationResultDAO {

    private final static String GET_ALL_QUERY =
            "SELECT * FROM ibacalculator.results";
    private final static String GET_BY_ID_QUERY =
            "SELECT * FROM ibacalculator.results WHERE id_result = ?";
    private final static String SAVE_QUERY =
            "INSERT INTO ibacalculator.results (period, proceeds, nonOperatingIncome, hasMainJob, hasBenefits," +
                    " specialStatus, numOfChildren, numOfDisabledChildren, numOfDependents, insuranceContributions," +
                    " educationExpenses, expensesForBuilding, expensesForBusiness, calculationResult)"
                    + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private final static String UPDATE_QUERY =
            "UPDATE ibacalculator.results SET period = ?, proceeds = ?, nonOperatingIncome = ?, hasMainJob = ?," +
                    " hasBenefits = ?, specialStatus = ?, numOfChildren = ?, numOfDisabledChildren = ?," +
                    " numOfDependents = ?, insuranceContributions = ?, educationExpenses = ?, expensesForBuilding = ?," +
                    " expensesForBusiness = ? calculationResult = ? WHERE id_result = ?";
    private final static String REMOVE_QUERY =
            "DELETE FROM ibacalculator.results WHERE id_result = ?";

    @Override
    public CalculationResult getResultById(int id) throws DaoException{
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        CalculationResult result = null;

        try {
            connection = getConnection();
            statement = connection.prepareStatement(GET_BY_ID_QUERY);
            statement.setInt(1, id);
            resultSet = statement.executeQuery();

            if (resultSet.next()) {
                result = new CalculationResult();

                result.setId(resultSet.getInt("id_result"));
                result.getParameters().setPeriod(resultSet.getInt("period"));
                result.getParameters().setProceeds(resultSet.getInt("proceeds"));
                result.getParameters().setNonOperatingIncome(resultSet.getInt("nonOperatingIncome"));
                result.getParameters().setHasMainJob(resultSet.getBoolean("hasMainJob"));
                result.getParameters().setHasBenefits(resultSet.getBoolean("hasBenefits"));
                result.getParameters().setSpecialStatus(resultSet.getBoolean("specialStatus"));
                result.getParameters().setNumOfChildren(resultSet.getInt("numOfChildren"));
                result.getParameters().setNumOfDisabledChildren(resultSet.getInt("numOfDisabledChildren"));
                result.getParameters().setNumOfDependents(resultSet.getInt("numOfDependents"));
                result.getParameters().setInsuranceContributions(resultSet.getInt("insuranceContributions"));
                result.getParameters().setEducationExpenses(resultSet.getInt("educationExpenses"));
                result.getParameters().setExpensesForBuilding(resultSet.getInt("expensesForBuilding"));
                result.getParameters().setExpensesForBusiness(resultSet.getInt("expensesForBusiness"));
                result.setResult(resultSet.getDouble("calculationResult"));
            }
        } catch (SQLException e) {
            throw new DaoException(e);
        } finally {
            closeDB(connection, statement, resultSet);
        }
        return result;
    }

    @Override
    public List<CalculationResult> getAllResults() throws DaoException{
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        List<CalculationResult> results = new ArrayList<CalculationResult>();

        try {
            connection = getConnection();
            statement = connection.prepareStatement(GET_ALL_QUERY);
            resultSet = statement.executeQuery();

            while(resultSet.next()) {
                CalculationResult result = new CalculationResult();
                result.setId(resultSet.getInt("id_result"));
                result.getParameters().setPeriod(resultSet.getInt("period"));
                result.getParameters().setProceeds(resultSet.getInt("proceeds"));
                result.getParameters().setNonOperatingIncome(resultSet.getInt("nonOperatingIncome"));
                result.getParameters().setHasMainJob(resultSet.getBoolean("hasMainJob"));
                result.getParameters().setHasBenefits(resultSet.getBoolean("hasBenefits"));
                result.getParameters().setSpecialStatus(resultSet.getBoolean("specialStatus"));
                result.getParameters().setNumOfChildren(resultSet.getInt("numOfChildren"));
                result.getParameters().setNumOfDisabledChildren(resultSet.getInt("numOfDisabledChildren"));
                result.getParameters().setNumOfDependents(resultSet.getInt("numOfDependents"));
                result.getParameters().setInsuranceContributions(resultSet.getInt("insuranceContributions"));
                result.getParameters().setEducationExpenses(resultSet.getInt("educationExpenses"));
                result.getParameters().setExpensesForBuilding(resultSet.getInt("expensesForBuilding"));
                result.getParameters().setExpensesForBusiness(resultSet.getInt("expensesForBusiness"));
                result.setResult(resultSet.getDouble("calculationResult"));

                results.add(result);
            }
        } catch (SQLException e) {
            throw new DaoException();
        } finally {
            closeDB(connection, statement, resultSet);
        }

        return results;
    }

    @Override
    public List<CalculationResult> getResultsByParameters(FilterParameters parameters) throws DaoException{
        String QUERY = "SELECT * FROM ibacalculator.results WHERE " + parameters.toQueryString();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        List<CalculationResult> results = new ArrayList<CalculationResult>();

        try {
            connection = getConnection();
            statement = connection.prepareStatement(QUERY);
            resultSet = statement.executeQuery();

            while(resultSet.next()) {
                CalculationResult result = new CalculationResult();
                result.setId(resultSet.getInt("id_result"));
                result.getParameters().setPeriod(resultSet.getInt("period"));
                result.getParameters().setProceeds(resultSet.getInt("proceeds"));
                result.getParameters().setNonOperatingIncome(resultSet.getInt("nonOperatingIncome"));
                result.getParameters().setHasMainJob(resultSet.getBoolean("hasMainJob"));
                result.getParameters().setHasBenefits(resultSet.getBoolean("hasBenefits"));
                result.getParameters().setSpecialStatus(resultSet.getBoolean("specialStatus"));
                result.getParameters().setNumOfChildren(resultSet.getInt("numOfChildren"));
                result.getParameters().setNumOfDisabledChildren(resultSet.getInt("numOfDisabledChildren"));
                result.getParameters().setNumOfDependents(resultSet.getInt("numOfDependents"));
                result.getParameters().setInsuranceContributions(resultSet.getInt("insuranceContributions"));
                result.getParameters().setEducationExpenses(resultSet.getInt("educationExpenses"));
                result.getParameters().setExpensesForBuilding(resultSet.getInt("expensesForBuilding"));
                result.getParameters().setExpensesForBusiness(resultSet.getInt("expensesForBusiness"));
                result.setResult(resultSet.getDouble("calculationResult"));

                results.add(result);
            }
        } catch (SQLException e) {
            throw new DaoException();
        } finally {
            closeDB(connection, statement, resultSet);
        }

        return results;
    }

    @Override
    public void saveResult(CalculationResult result) throws DaoException{
        Connection connection = null;
        PreparedStatement statement = null;

        try{
            connection = getConnection();

            statement = connection.prepareStatement(SAVE_QUERY);

            statement.setInt(1, result.getParameters().getPeriod());
            statement.setInt(2, result.getParameters().getProceeds());
            statement.setInt(3, result.getParameters().getNonOperatingIncome());
            statement.setBoolean(4, result.getParameters().isHasMainJob());
            statement.setBoolean(5, result.getParameters().isHasBenefits());
            statement.setBoolean(6, result.getParameters().isSpecialStatus());
            statement.setInt(7, result.getParameters().getNumOfChildren());
            statement.setInt(8, result.getParameters().getNumOfDisabledChildren());
            statement.setInt(9, result.getParameters().getNumOfDependents());
            statement.setInt(10, result.getParameters().getInsuranceContributions());
            statement.setInt(11, result.getParameters().getEducationExpenses());
            statement.setInt(12, result.getParameters().getExpensesForBuilding());
            statement.setInt(13, result.getParameters().getExpensesForBusiness());
            statement.setDouble(14, result.getResult());

            statement.executeUpdate();
        }catch (SQLException e) {
            throw new DaoException(e);
        } finally {
            closeDB(connection,statement);
        }
    }

    @Override
    public void updateResult(int id, CalculationResult result) throws DaoException{
        Connection connection = null;
        PreparedStatement statement = null;

        try{
            connection = getConnection();

            statement = connection.prepareStatement("UPDATE_QUERY");

            statement.setInt(1, result.getParameters().getPeriod());
            statement.setInt(2, result.getParameters().getProceeds());
            statement.setInt(3, result.getParameters().getNonOperatingIncome());
            statement.setBoolean(4, result.getParameters().isHasMainJob());
            statement.setBoolean(5, result.getParameters().isHasBenefits());
            statement.setBoolean(6, result.getParameters().isSpecialStatus());
            statement.setInt(7, result.getParameters().getNumOfChildren());
            statement.setInt(8, result.getParameters().getNumOfDisabledChildren());
            statement.setInt(9, result.getParameters().getNumOfDependents());
            statement.setInt(10, result.getParameters().getInsuranceContributions());
            statement.setInt(11, result.getParameters().getEducationExpenses());
            statement.setInt(12, result.getParameters().getExpensesForBuilding());
            statement.setInt(13, result.getParameters().getExpensesForBusiness());
            statement.setDouble(14, result.getResult());

            statement.executeUpdate();
        }catch (SQLException e) {
            throw new DaoException();
        } finally {
            closeDB(connection, statement);
        }
    }

    @Override
    public void removeResult(int id) throws DaoException{
        Connection connection = null;
        PreparedStatement statement = null;

        try{
            connection = getConnection();

            statement = connection.prepareStatement("DELETE_QUERY");

            statement.setInt(1, id);

            statement.executeUpdate();
        }catch (SQLException e) {
            throw new DaoException();
        } finally {
            closeDB(connection, statement);
        }
    }
}