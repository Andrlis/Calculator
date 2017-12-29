package bean;

import java.util.ArrayList;

public class FilterParameters {

    String parameter1;
    String parameter2;

    ArrayList<String> parameterValues1;
    ArrayList<String> parameterValues2;

    public FilterParameters() {
        this.parameterValues1 = new ArrayList<String>();
        this.parameterValues2 = new ArrayList<String>();
    }

    public String getParameter1() {
        return parameter1;
    }

    public void setParameter1(String parameter1) {
        this.parameter1 = parameter1;
    }

    public String getParameter2() {
        return parameter2;
    }

    public void setParameter2(String parameter2) {
        this.parameter2 = parameter2;
    }

    public ArrayList<String> getParameterValues1() {
        return parameterValues1;
    }

    public void setParameterValues1(ArrayList<String> parameterValues1) {
        this.parameterValues1 = parameterValues1;
    }

    public ArrayList<String> getParameterValues2() {
        return parameterValues2;
    }

    public void setParameterValues2(ArrayList<String> parameterValues2) {
        this.parameterValues2 = parameterValues2;
    }

    public String toQueryString(){
        String query = "";

        query += (parameterValues1.size() == 1) ?
                String.format("%s = %s", parameter1, parameterValues1.get(0)) :
                String.format("(%s >= %s AND %s <= %s)", parameter1, parameterValues1.get(0).toString(),
                    parameter1, parameterValues1.get(1).toString());

        query += " AND ";

        query += (parameterValues2.size() == 1) ?
                String.format("%s = %s", parameter2, parameterValues2.get(0)) :
                String.format("(%s >= %s AND %s <= %s)", parameter2, parameterValues2.get(0).toString(),
                        parameter2, parameterValues2.get(1).toString());

        return query;
    }
}