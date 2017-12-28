$(document).ready( function () {
    loadTable();
});

function trueOrFalseConverter(value) {
    if(value === true)
        return "Да"
    else
        return "Нет"
}

function getCell(textData) {
    var cell = $("<td nowrap></td>");
    cell.append(textData);
    return cell;
}

function getSimpleRow(data, number) {
    var row = $('<tr></tr>');
    row.append(getCell(number));
    row.append(getCell(data['period']));
    row.append(getCell(data['proceeds']));
    row.append(getCell(data['nonOperatingIncome']));
    row.append(getCell(trueOrFalseConverter(data['hasMainJob'])));
    row.append(getCell(trueOrFalseConverter(data['hasBenefits'])));
    row.append(getCell(trueOrFalseConverter(data['specialStatus'])));
    row.append(getCell(data['numOfChildren']));
    row.append(getCell(data['numOfDisabledChildren']));
    row.append(getCell(data['numOfDependents']));
    row.append(getCell(data['insuranceContributions']));
    row.append(getCell(data['educationExpenses']));
    row.append(getCell(data['expensesForBuilding']));
    row.append(getCell(data['expensesForBusiness']));
    row.append(getCell(data['result']));

    return row;
}

function getHeaderCell(name, title) {
    var cell = $('<th></th>');
    var p = $('<p></p>');
    if(title.length) {
        cell.attr("title", title);
        p.attr("style","writing-mode:tb-rl; filter: flipH flipV; height:100px; white-space: nowrap; overflow: hidden;"
                + "text-overflow: ellipsis;")
    }
    p.append(name);
    cell.append(p)
    return cell;
}

function getTableHeader() {
    var header = $('<thead class="table-header"></thead>');

    var headerRow = $('<tr style="font-weight: bold;"></tr>');
    headerRow.append(getHeaderCell("№", ""));
    headerRow.append(getHeaderCell("Период, за который производится расчет", "Период, за который производится расчет"));
    headerRow.append(getHeaderCell("Сумма выручки от реализации товаров (работ, услуг), имущественных прав за выбранный период (без налога на добавленную стоимость), руб.",
        "Сумма выручки от реализации товаров (работ, услуг), имущественных прав за выбранный период (без налога на добавленную стоимость), руб."));
    headerRow.append(getHeaderCell("Сумма внереализационных доходов за выбранный период (без налога на добавленную стоимость), руб.", "Сумма внереализационных доходов за выбранный период (без налога на добавленную стоимость), руб."));
    headerRow.append(getHeaderCell("Наличие места основной работы", "Наличие места основной работы"));
    headerRow.append(getHeaderCell("Наличие права на льготы (инвалид I или II группы, инвалид с детства, участник боевых действий на территории других государств и др.)",
        "Наличие права на льготы (инвалид I или II группы, инвалид с детства, участник боевых действий на территории других государств и др.)"));
    headerRow.append(getHeaderCell("Являетесь ли Вы вдовой (вдовцом), одиноким родителем, приемным родителем, опекуном или попечителем", "Являетесь ли Вы вдовой (вдовцом), одиноким родителем, приемным родителем, опекуном или попечителем"));
    headerRow.append(getHeaderCell("Количество детей до 18 лет", "Количество детей до 18 лет"));
    headerRow.append(getHeaderCell("Количество детей-инвалидов", "Количество детей-инвалидов"));
    headerRow.append(getHeaderCell("Количество иждивенцев", "Количество иждивенцев"));
    headerRow.append(getHeaderCell("Сумма расходов за выбранный период по страховым взносам по договорам добровольного страхования жизни и дополнительной пенсии, заключенным на срок не менее трех лет, а также по договорам добровольного страхования медицинских расходов, руб",
        "Сумма расходов за выбранный период по страховым взносам по договорам добровольного страхования жизни и дополнительной пенсии, заключенным на срок не менее трех лет, а также по договорам добровольного страхования медицинских расходов, руб."));
    headerRow.append(getHeaderCell("Сумма расходов за выбранный период на получение первого платного образования своего либо близких родственников, руб.",
        "Сумма расходов за выбранный период на получение первого платного образования своего либо близких родственников, руб."));
    headerRow.append(getHeaderCell("Сумма расходов за выбранный период на строительство либо приобретение жилья для нуждающихся в улучшении жилищных условий, руб.",
        "Сумма расходов за выбранный период на строительство либо приобретение жилья для нуждающихся в улучшении жилищных условий, руб."));
    headerRow.append(getHeaderCell("Сумма расходов за выбранный период, связанных с осуществлением предпринимательской деятельности, руб.",
        "Сумма расходов за выбранный период, связанных с осуществлением предпринимательской деятельности, руб."));
    headerRow.append(getHeaderCell("Итог, руб.",""));

    header.append(headerRow);

    return header;
}

function getTableBody(dataArray) {
    var body = $('<tbody></tbody>');

    var numberOfRow = 0;
    dataArray.forEach(function (data) {
        numberOfRow ++;
        body.append(getSimpleRow(data, numberOfRow));
    });
    return body;
}

function formResultTable(data) {
    var table ;

    if(data['args'].length >= 8)
        table = $("<table style=\"margin-bottom: -1; margin-right: 14px;\"></table>");
    else
        table = $("<table style=\"margin-bottom: -1;\"></table>");

    var tableClass = "table table-hover table-bordered table-class";
    table.attr("class", tableClass);

    table.append(getTableHeader());
    table.append(getTableBody(data['args']))


    $('#table-header').html(table);

}

function loadTable() {
    $("#table-header").html("");

    var div = $('<div style="width: 200px"></div>');
    var loader = $('<div></div>', {class: "loader"});
    div.append(loader)
    $("#table-container").html(div);

    var successFunction = formResultTable;

    $.ajax({
        url: "GetTableServlet",
        dataType: "json",
        success: function(data){
            successFunction(data);
        }
    });
}