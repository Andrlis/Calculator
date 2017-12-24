<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 25.12.2017
  Time: 1:44
  To change this template use File | Settings | File Templates.
--%>
<%@page isELIgnored="false" %>
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

        td, th {
            padding: 0;
            padding-bottom: 2%;
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
        <div class="col-sm-8 text-left" style="padding-top: 5%">
            <table class="table-bordered" width="90%">
                <th>
                    <td title="Период, за который производится расчет"><p>1</p></td>
                    <td title="Сумма выручки от реализации товаров (работ, услуг), имущественных прав за выбранный период (без налога на добавленную стоимость), руб."><p>2</p></td>
                    <td title="Сумма внереализационных доходов за выбранный период (без налога на добавленную стоимость), руб."><p>3</p></td>
                    <td title="Наличие места основной работы"><p>4</p></td>
                    <td title="Наличие права на льготы (инвалид I или II группы, инвалид с детства, участник боевых действий на территории других государств и др.)"><p>5</p></td>
                    <td title="Являетесь ли Вы вдовой (вдовцом), одиноким родителем, приемным родителем, опекуном или попечителем"><p>6</p></td>
                    <td title="Количество детей до 18 лет"><p>7</p></td>
                    <td title="Количество детей-инвалидов"><p>8</p></td>
                    <td title="Количество иждивенцев"><p>9</p></td>
                    <td title="Сумма расходов за выбранный период по страховым взносам по договорам добровольного страхования жизни и дополнительной пенсии, заключенным на срок не менее трех лет, а также по договорам добровольного страхования медицинских расходов, руб"><p>10</p></td>
                    <td title="Сумма расходов за выбранный период на получение первого платного образования своего либо близких родственников, руб.:"><p>11</p></td>
                    <td title="Сумма расходов за выбранный период на строительство либо приобретение жилья для нуждающихся в улучшении жилищных условий, руб."><p>12</p></td>
                    <td title="Сумма расходов за выбранный период, связанных с осуществлением предпринимательской деятельности, руб.:"><p>13</p></td>
                    <td><p>Итог</p></td>
                </th>
                <tr>
                    <td>${calculationResult.parameters.period}</td>
                    <td>${calculationResult.parameters.proceeds}</td>
                    <td>${calculationResult.parameters.nonOperatingIncome}</td>
                    <td>${calculationResult.parameters.hasMainJob}</td>
                    <td>${calculationResult.parameters.hasBenefits}</td>
                    <td>${calculationResult.parameters.specialStatus}</td>
                    <td>${calculationResult.parameters.numOfChildren}</td>
                    <td>${calculationResult.parameters.numOfDisabledChildren}</td>
                    <td>${calculationResult.parameters.numOfDependents}</td>
                    <td>${calculationResult.parameters.insuranceContributions}</td>
                    <td>${calculationResult.parameters.educationExpenses}</td>
                    <td>${calculationResult.parameters.expensesForBuilding}</td>
                    <td>${calculationResult.parameters.expensesForBusiness}</td>
                    <td>${calculationResult.result}</td>
                </tr>
            </table>
        </div>
        <div class="col-sm-2 sidenav"></div>
    </div>
</div>
</body>
</html>
