<%--
  Created by IntelliJ IDEA.
  User: Andrey
  Date: 25.12.2017
  Time: 12:48
  To change this template use File | Settings | File Templates.
--%>
<%@page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width">

    <link rel="stylesheet" href="css/app.css" media="screen">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/app.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <title>Calculation results</title>

    <style>
        .navbar {
            margin-bottom: 0;
            border-radius: 0;
        }

        td, th {
            padding: 10px;
            align: center;
            vertical-align: middle;
            text-align: center;
        }

        .row.content {height: 100%}

        .sidenav {
            padding-top: 20px;
            background-color: #f1f1f1;
            height: 100%;
        }

        tbody {
            display:block;
            height:100px;
            overflow:auto;
        }
        thead, tbody tr {
            display:table;
            width:100%;
            table-layout:fixed;
        }
        thead {
            width: calc( 100% - 1em )
        }

    </style>
</head>
<body>
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container-fluid">
            <ul class="nav navbar-nav">
                <li><a href="/StartServlet">Калькулятор</a></li>
                <li><a href="/GetResultsServlet">Результаты</a></li>
            </ul>
        </div>
    </nav>

    <div class="container-fluid text-center" style="background-color: #f1f1f1; height: 100%">
        <div class="row content">
            <div class="col-sm-2 sidenav">
                <button class="btn btn-lg" type="button" data-toggle="modal" data-target="#filter" style="margin-top: 45%"><span class="glyphicon glyphicon-filter"></span></button>
            </div>
            <div class="col-sm-8 text-left" style="padding-top: 100px; padding-bottom: 20px; text-align: center; background-color:#ffffff">
                <div style="text-align: center;">
                    <div id="table-header" class="table-responsive"></div>
                </div>
            </div>
            <div class="col-sm-2 sidenav"></div>
        </div>
    </div>


    <%--Всплывающее окно--%>
    <div id="filter" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header"><button class="close" type="button" data-dismiss="modal">×</button>
                    <h3 class="modal-title">Фильтрация по параметрам</h3>
                </div>
                <div class="modal-body">
                    <div>
                        <table>
                            <caption>Параметр 1</caption>
                            <tr>
                                <td><select class="form-control" id="parameter1" required width="50%" required>
                                    <option value="">Параметр</option>
                                    <option value="period">Период, за который производится расчет</option>
                                    <option value="proceeds">Сумма выручки от реализации товаров (работ, услуг), имущественных прав за выбранный период (без налога на добавленную стоимость), руб.</option>
                                    <option value="nonOperatingIncome">Сумма внереализационных доходов за выбранный период (без налога на добавленную стоимость), руб.</option>
                                    <option value="hasMainJob">Наличие места основной работы</option>
                                    <option value="hasBenefits">Наличие права на льготы (инвалид I или II группы, инвалид с детства, участник боевых действий на территории других государств и др.)</option>
                                    <option value="specialStatus">Являетесь ли Вы вдовой (вдовцом), одиноким родителем, приемным родителем, опекуном или попечителем</option>
                                    <option value="numOfChildren">Количество детей до 18 лет</option>
                                    <option value="numOfDisabledChildren">Количество детей-инвалидов</option>
                                    <option value="numOfDependents">Количество иждивенцев</option>
                                    <option value="insuranceContributions">Сумма расходов за выбранный период по страховым взносам по договорам добровольного страхования жизни и дополнительной пенсии, заключенным на срок не менее трех лет, а также по договорам добровольного страхования медицинских расходов, руб.</option>
                                    <option value="educationExpenses">Сумма расходов за выбранный период на получение первого платного образования своего либо близких родственников, руб.</option>
                                    <option value="expensesForBuilding">Сумма расходов за выбранный период на строительство либо приобретение жилья для нуждающихся в улучшении жилищных условий, руб.</option>
                                    <option value="expensesForBusiness">Сумма расходов за выбранный период, связанных с осуществлением предпринимательской деятельности, руб.</option>
                                </select></td>
                                <td>
                                    <div id="parameter1-value1" style="visibility: hidden">
                                        <select id="param1-value1" class="form-control" style='width: 30%'><option value="true">Да</option><option value="false">Нет</option></select>
                                    </div>
                                    <div id="parameter1-value2" style="visibility: hidden">
                                        <input id="param1-value2" type="number" min='0' max='99999999999' class="form-control" style="width: 6em; float:left;" placeholder='От'>
                                        <input id="param1-value3" type="number" min='0' max='99999999999' class="form-control" style="width: 6em; float:left;" placeholder='До'>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div>
                        <table>
                            <caption>Параметр 2</caption>
                            <tr>
                                <td><select class="form-control" id="parameter2" required width="50%" required>
                                    <option value="">Параметр</option>
                                    <option value="period">Период, за который производится расчет</option>
                                    <option value="proceeds">Сумма выручки от реализации товаров (работ, услуг), имущественных прав за выбранный период (без налога на добавленную стоимость), руб.</option>
                                    <option value="nonOperatingIncome">Сумма внереализационных доходов за выбранный период (без налога на добавленную стоимость), руб.</option>
                                    <option value="hasMainJob">Наличие места основной работы</option>
                                    <option value="hasBenefits">Наличие права на льготы (инвалид I или II группы, инвалид с детства, участник боевых действий на территории других государств и др.)</option>
                                    <option value="specialStatus">Являетесь ли Вы вдовой (вдовцом), одиноким родителем, приемным родителем, опекуном или попечителем</option>
                                    <option value="numOfChildren">Количество детей до 18 лет</option>
                                    <option value="numOfDisabledChildren">Количество детей-инвалидов</option>
                                    <option value="numOfDependents">Количество иждивенцев</option>
                                    <option value="insuranceContributions">Сумма расходов за выбранный период по страховым взносам по договорам добровольного страхования жизни и дополнительной пенсии, заключенным на срок не менее трех лет, а также по договорам добровольного страхования медицинских расходов, руб.</option>
                                    <option value="educationExpenses">Сумма расходов за выбранный период на получение первого платного образования своего либо близких родственников, руб.</option>
                                    <option value="expensesForBuilding">Сумма расходов за выбранный период на строительство либо приобретение жилья для нуждающихся в улучшении жилищных условий, руб.</option>
                                    <option value="expensesForBusiness">Сумма расходов за выбранный период, связанных с осуществлением предпринимательской деятельности, руб.</option>
                                </select></td>
                                <td>
                                    <div id="parameter2-value1" style="visibility: hidden">
                                        <select id='param2-value1' class="form-control" style='width: 30%'><option value="true">Да</option><option value="false">Нет</option></select>
                                    </div>
                                    <div id="parameter2-value2" style="visibility: hidden">
                                        <input id='param2-value2' type="number" min='0' max='99999999999' class="form-control" style="width: 6em; float:left;" placeholder='От'>
                                        <input id='param2-value3' type="number" min='0' max='99999999999' class="form-control" style="width: 6em; float:left;" placeholder='До'>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-default" type="button" data-dismiss="modal" onclick="filterTable()">Применить</button>
                </div>
            </div>
        </div>
    </div>

</body>
</html>