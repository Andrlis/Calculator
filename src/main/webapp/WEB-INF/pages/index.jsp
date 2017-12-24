<%--
  Created by IntelliJ IDEA.
  User: Andrey
  Date: 24.12.2017
  Time: 13:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <%--<link rel='stylesheet' href="bootstrap/css/bootstrap.css" type='text/css' media='all'>--%>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <title>Calculator</title>

    <style>
        .navbar {
            margin-bottom: 0;
            border-radius: 0;
        }

        .row.content {height: 100%}

        .sidenav {
            padding-top: 20px;
            background-color: #f1f1f1;
            height: 100%;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <ul class="nav navbar-nav">
            <li class="active"><a href="/StartServlet">Калькулятор</a></li>
            <li><a href="#">Результаты</a></li>
        </ul>
    </div>
</nav>

<div class="container-fluid text-center">
    <div class="row content">
        <div class="col-sm-2 sidenav"></div>
        <div class="col-sm-8 text-left">
            <form action="Calculate" method="POST">
                <table style="padding-top: 5%">
                    <tr>
                        <td><p>Период, за который производится расчет:</p></td>
                        <td><select name="period">
                            <option value="3">Квартал</option>
                            <option value="6">Полугодие</option>
                            <option value="9">Девять месяцев</option>
                            <option value="12">Год</option>
                        </select>
                        </td>
                    </tr>
                    <tr>
                        <td><p>Сумма выручки от реализации товаров (работ, услуг), имущественных прав за выбранный период (без налога на добавленную стоимость), руб.</p></td>
                        <td><input type="text" name="proceeds"></td>
                    </tr>
                    <tr>
                        <td><p>Сумма внереализационных доходов за выбранный период (без налога на добавленную стоимость), руб.</p></td>
                        <td><input type="text" name="nonOperatingIncome"></td>
                    </tr>
                    <tr>
                        <td><p>Наличие места основной работы:</p></td>
                        <td>
                            <input type="radio" name="hasMainJob" value="true">Да <input type="radio" name="hasMainJob" value="false">Нет
                        </td>
                    </tr>
                    <tr>
                        <td><p>Наличие права на льготы (инвалид I или II группы, инвалид с детства, участник боевых действий на территории других государств и др.):</p></td>
                        <td>
                            <input type="radio" name="hasBenefits" value="true">Да <input type="radio" name="hasBenefits" value="false">Нет
                        </td>
                    </tr>
                    <tr>
                        <td><p>Являетесь ли Вы вдовой (вдовцом), одиноким родителем, приемным родителем, опекуном или попечителем:</p></td>
                        <td>
                            <input type="radio" name="specialStatus" value="true">Да <input type="radio" name="specialStatus" value="false">Нет
                        </td>
                    </tr>
                    <tr>
                        <td><p>Количество детей до 18 лет:</p></td>
                        <td><input type="text" name="numOfChildren"></td>
                    </tr>
                    <tr>
                        <td><p>Количество детей-инвалидов:</p></td>
                        <td><input type="text" name="numOfDisabledChildren"></td>
                    </tr>
                    <tr>
                        <td><p>Количество иждивенцев:</p></td>
                        <td><input type="text" name="numOfDependents"></td>
                    </tr>
                    <tr>
                        <td><p>Сумма расходов за выбранный период по страховым взносам по договорам добровольного страхования жизни и дополнительной пенсии, заключенным на срок не менее трех лет, а также по договорам добровольного страхования медицинских расходов, руб.:</p></td>
                        <td><input type="text" name="insuranceContributions"></td>
                    </tr>
                    <tr>
                        <td><p>Сумма расходов за выбранный период на получение первого платного образования своего либо близких родственников, руб.:</p></td>
                        <td><input type="text" name="educationExpenses"></td>
                    </tr>
                    <tr>
                        <td><p>Сумма расходов за выбранный период на строительство либо приобретение жилья для нуждающихся в улучшении жилищных условий, руб.:</p></td>
                        <td><input type="text" name="expensesForBuilding"></td>
                    </tr>
                    <tr>
                        <td><p>Сумма расходов за выбранный период, связанных с осуществлением предпринимательской деятельности, руб.:</p></td>
                        <td><input type="text" name="expensesForBusiness"></td>
                    </tr>
                </table>
                <input type="submit" value="Рассчитать">
            </form>
        </div>
        <div class="col-sm-2 sidenav"></div>
    </div>
</div>
</body>
</html>
