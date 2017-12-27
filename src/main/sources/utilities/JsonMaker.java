package utilities;

import bean.CalculationResult;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import utilities.json.ResultConverter;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class JsonMaker {
    public static String getResultsJson(List<CalculationResult> results){
        ArrayList<Object> resultArray = new ArrayList<Object>();

        for(CalculationResult calculationResult: (results == null) ? new ArrayList<CalculationResult>() : results) {
            resultArray.add(calculationResult);
        }

        Map<String, Object> map = new LinkedHashMap<String, Object>();
        map.put("table-class", "table table-hover table-bordered table-class");

        map.put("args", resultArray);

        GsonBuilder builder = new GsonBuilder();
        builder.registerTypeAdapter(CalculationResult.class, new ResultConverter());
        Gson gson = builder.create();

        return gson.toJson(map);
    }
}