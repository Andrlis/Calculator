<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 25.12.2017
  Time: 1:44
  To change this template use File | Settings | File Templates.
--%>
<%@page isELIgnored="false" %>
<%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <title>Calculation result</title>

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

        .th_p{
            writing-mode:tb-rl;
            filter: flipH flipV;
            height:80px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
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

<div class="container-fluid text-center">
    <div class="row content">
        <div class="col-sm-2 sidenav"></div>
        <div class="col-sm-8 text-left" style="padding-top: 100px; text-align: center">
            <table class="table table-hover table-bordered table-class" width="90%" style="margin: auto;">
                <thead class="table-header">
                    <tr style="font-weight: bold;">
                        <th title="Период, за который производится расчет">
                            <p class="th_p">Период, за который производится расчет</p></th>
                        <th title="Сумма выручки от реализации товаров (работ, услуг), имущественных прав за выбранный период (без налога на добавленную стоимость), руб.">
                            <p class="th_p">Сумма выручки от реализации товаров (работ, услуг), имущественных прав за выбранный период (без налога на добавленную стоимость), руб.</p></th>
                        <th title="Сумма внереализационных доходов за выбранный период (без налога на добавленную стоимость), руб.">
                            <p class="th_p">Сумма внереализационных доходов за выбранный период (без налога на добавленную стоимость), руб.</p></th>
                        <th title="Наличие места основной работы">
                            <p class="th_p">Наличие места основной работы</p></th>
                        <th title="Наличие права на льготы (инвалид I или II группы, инвалид с детства, участник боевых действий на территории других государств и др.)">
                            <p class="th_p">Наличие права на льготы (инвалид I или II группы, инвалид с детства, участник боевых действий на территории других государств и др.)</p></th>
                        <th title="Являетесь ли Вы вдовой (вдовцом), одиноким родителем, приемным родителем, опекуном или попечителем">
                            <p class="th_p">Являетесь ли Вы вдовой (вдовцом), одиноким родителем, приемным родителем, опекуном или попечителем</p></th>
                        <th title="Количество детей до 18 лет">
                            <p class="th_p">Количество детей до 18 лет</p></th>
                        <th title="Количество детей-инвалидов">
                            <p class="th_p">Количество детей-инвалидов</p></th>
                        <th title="Количество иждивенцев">
                            <p class="th_p">Количество иждивенцев</p></th>
                        <th title="Сумма расходов за выбранный период по страховым взносам по договорам добровольного страхования жизни и дополнительной пенсии, заключенным на срок не менее трех лет, а также по договорам добровольного страхования медицинских расходов, руб.">
                            <p class="th_p">Сумма расходов за выбранный период по страховым взносам по договорам добровольного страхования жизни и дополнительной пенсии, заключенным на срок не менее трех лет, а также по договорам добровольного страхования медицинских расходов, руб.</p></th>
                        <th title="Сумма расходов за выбранный период на получение первого платного образования своего либо близких родственников, руб.">
                            <p class="th_p">Сумма расходов за выбранный период на получение первого платного образования своего либо близких родственников, руб.</p></th>
                        <th title="Сумма расходов за выбранный период на строительство либо приобретение жилья для нуждающихся в улучшении жилищных условий, руб.">
                            <p class="th_p">Сумма расходов за выбранный период на строительство либо приобретение жилья для нуждающихся в улучшении жилищных условий, руб.</p></th>
                        <th title="Сумма расходов за выбранный период, связанных с осуществлением предпринимательской деятельности, руб.">
                            <p class="th_p">Сумма расходов за выбранный период, связанных с осуществлением предпринимательской деятельности, руб.</p></th>
                        <th><p>Итог, руб.</p></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>${calculationResult.parameters.period}</td>
                        <td>${calculationResult.parameters.proceeds}</td>
                        <td>${calculationResult.parameters.nonOperatingIncome}</td>
                        <c:if test="${calculationResult.parameters.hasMainJob == true}">
                            <td>Да</td>
                        </c:if>
                        <c:if test="${calculationResult.parameters.hasMainJob == false}">
                            <td>Нет</td>
                        </c:if>
                        <c:if test="${calculationResult.parameters.hasBenefits == true}">
                            <td>Да</td>
                        </c:if>
                        <c:if test="${calculationResult.parameters.hasBenefits == false}">
                            <td>Нет</td>
                        </c:if>
                        <c:if test="${calculationResult.parameters.specialStatus == true}">
                            <td>Да</td>
                        </c:if>
                        <c:if test="${calculationResult.parameters.specialStatus == false}">
                            <td>Нет</td>
                        </c:if>
                        <td>${calculationResult.parameters.numOfChildren}</td>
                        <td>${calculationResult.parameters.numOfDisabledChildren}</td>
                        <td>${calculationResult.parameters.numOfDependents}</td>
                        <td>${calculationResult.parameters.insuranceContributions}</td>
                        <td>${calculationResult.parameters.educationExpenses}</td>
                        <td>${calculationResult.parameters.expensesForBuilding}</td>
                        <td>${calculationResult.parameters.expensesForBusiness}</td>
                        <td>${calculationResult.result}</td>
                    </tr>
                </tbody>
            </table>
            <a href="/StartServlet" class="btn btn-default" role="button" style="margin-top: 3%">Новый расчет</a>
        </div>
        <div class="col-sm-2 sidenav"></div>
    </div>
</div>
</body>
</html>

