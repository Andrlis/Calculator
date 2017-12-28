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

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <title>Calculator</title>

    <style>
        .navbar {
            margin-bottom: 0;
            border-radius: 0;
        }

        td {
            padding-bottom: 5px;
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
            <li><a href="/GetResultsServlet">Результаты</a></li>
        </ul>
    </div>
</nav>

<div class="container-fluid text-center" style="background-color: #f1f1f1">
    <div class="row content">
        <div class="col-sm-2 sidenav"></div>
        <div class="col-sm-8 text-left" style="padding-top: 100px; background-color:#ffffff">
            <form action="Calculate" method="POST">
                <table>
                    <tr>
                        <td width="70%"><p>Период, за который производится расчет:</p></td>
                        <td><select class="form-control" name="period" required>
                            <option value="">Выбрать</option>
                            <option value="3">Квартал</option>
                            <option value="6">Полугодие</option>
                            <option value="9">Девять месяцев</option>
                            <option value="12">Год</option>
                        </select>
                        </td>
                    </tr>
                    <tr>
                        <td width="70%"><p>Сумма выручки от реализации товаров (работ, услуг), имущественных прав за выбранный период (без налога на добавленную стоимость), руб.:</p></td>
                        <td><input type="number" step="1" min="0" max="99999999999" value="0" class="form-control" name="proceeds" required></td>
                    </tr>
                    <tr>
                        <td width="70%"><p>Сумма внереализационных доходов за выбранный период (без налога на добавленную стоимость), руб.:</p></td>
                        <td><input type="number" step="1" min="0" max="99999999999" class="form-control" name="nonOperatingIncome" required></td>
                    </tr>
                    <tr>
                        <td width="70%"><p>Наличие места основной работы:</p></td>
                        <td>
                            <input type="radio" name="hasMainJob" value="true" required>Да <input type="radio" name="hasMainJob" value="false">Нет
                        </td>
                    </tr>
                    <tr>
                        <td width="70%"><p>Наличие права на льготы (инвалид I или II группы, инвалид с детства, участник боевых действий на территории других государств и др.):</p></td>
                        <td>
                            <input type="radio" name="hasBenefits" value="true" required>Да <input type="radio" name="hasBenefits" value="false">Нет
                        </td>
                    </tr>
                    <tr>
                        <td width="70%"><p>Являетесь ли Вы вдовой (вдовцом), одиноким родителем, приемным родителем, опекуном или попечителем:</p></td>
                        <td>
                            <input type="radio" name="specialStatus" value="true" required>Да <input type="radio" name="specialStatus" value="false">Нет
                        </td>
                    </tr>
                    <tr>
                        <td width="70%"><p>Количество детей до 18 лет:</p></td>
                        <td><input type="number" step="1" min="0" max="100" class="form-control"  name="numOfChildren" required></td>
                    </tr>
                    <tr>
                        <td width="70%"><p>Количество детей-инвалидов:</p></td>
                        <td><input type="number" step="1" min="0" max="100" class="form-control" name="numOfDisabledChildren" required></td>
                    </tr>
                    <tr>
                        <td width="70%"><p>Количество иждивенцев:</p></td>
                        <td><input type="number" step="1" min="0" max="100" class="form-control" name="numOfDependents" required></td>
                    </tr>
                    <tr>
                        <td width="70%"><p>Сумма расходов за выбранный период по страховым взносам по договорам добровольного страхования жизни и дополнительной пенсии, заключенным на срок не менее трех лет, а также по договорам добровольного страхования медицинских расходов, руб.:</p></td>
                        <td><input type="number" step="1" min="0" max="99999999999" class="form-control" name="insuranceContributions" required></td>
                    </tr>
                    <tr>
                        <td width="70%"><p>Сумма расходов за выбранный период на получение первого платного образования своего либо близких родственников, руб.:</p></td>
                        <td><input type="number" step="1" min="0" max="99999999999" class="form-control" name="educationExpenses" required></td>
                    </tr>
                    <tr>
                        <td width="70%"><p>Сумма расходов за выбранный период на строительство либо приобретение жилья для нуждающихся в улучшении жилищных условий, руб.:</p></td>
                        <td><input type="number" step="1" min="0" max="99999999999" class="form-control" name="expensesForBuilding" required></td>
                    </tr>
                    <tr>
                        <td width="70%"><p>Сумма расходов за выбранный период, связанных с осуществлением предпринимательской деятельности, руб.:</p></td>
                        <td><input type="number" step="1" min="0" max="99999999999" class="form-control" name="expensesForBusiness" required></td>
                    </tr>
                    <tr>
                        <td align="center" colspan="2"><input type="submit" class="btn btn-lg btn-block" value="Рассчитать"></td>
                    </tr>
                </table>

            </form>
        </div>
        <div class="col-sm-2 sidenav"></div>
    </div>
</div>
</body>
</html>