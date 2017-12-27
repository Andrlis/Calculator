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
    <meta name="viewport" content="width=device-width, initial-scale=1">

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
            <li><a href="/StartServlet">Калькулятор</a></li>
            <li class="active"><a href="/GetResultsServlet">Результаты</a></li>
        </ul>
    </div>
</nav>

<div class="container-fluid text-center">
    <div class="row content">
        <div class="col-sm-2 sidenav"></div>
        <div class="col-sm-8 text-left" style="padding-top: 5%; text-align: center">

            <div style="text-align: center;">
                <div id="table-header" class="table-responsive" style="overflow: unset;">

                </div>
            </div>

            <div style="text-align: center;">
                <div id="table-container" class="table-responsive" style="height: 60%; width: max-content; margin: auto;">

                </div>
            </div>
        </div>
        <div class="col-sm-2 sidenav"></div>
    </div>
</div>

</body>
</html>
