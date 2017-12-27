package utilities.json;

import bean.CalculationResult;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonSerializationContext;
import com.google.gson.JsonSerializer;

import java.lang.reflect.Type;

public class ResultConverter implements JsonSerializer<CalculationResult>{

    @Override
    public JsonElement serialize(CalculationResult src, Type srcType, JsonSerializationContext context){
        JsonObject object = new JsonObject();

        object.addProperty("period", src.getParameters().getPeriod());
        object.addProperty("proceeds", src.getParameters().getProceeds());
        object.addProperty("nonOperatingIncome", src.getParameters().getNonOperatingIncome());
        object.addProperty("hasMainJob", src.getParameters().isHasMainJob());
        object.addProperty("hasBenefits", src.getParameters().isHasBenefits());
        object.addProperty("specialStatus", src.getParameters().isSpecialStatus());
        object.addProperty("numOfChildren", src.getParameters().getNumOfChildren());
        object.addProperty("numOfDisabledChildren", src.getParameters().getNumOfDisabledChildren());
        object.addProperty("numOfDependents", src.getParameters().getNumOfDependents());
        object.addProperty("insuranceContributions", src.getParameters().getInsuranceContributions());
        object.addProperty("educationExpenses", src.getParameters().getEducationExpenses());
        object.addProperty("expensesForBuilding", src.getParameters().getExpensesForBuilding());
        object.addProperty("expensesForBusiness", src.getParameters().getExpensesForBusiness());
        object.addProperty("result", src.getResult());

        return object;
    }
}