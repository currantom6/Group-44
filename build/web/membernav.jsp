<%-- 
    Document   : membernav
    Created on : 18/04/2019, 2:09:07 PM
    Author     : chenyizhe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Main Page</title>
        <link rel="stylesheet" href="css/bootstrap.min.css" >
        <link rel="stylesheet" href="css/style.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    </head>
    <body>
        <%-- member nav bar --%>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a href="main.jsp">
                    <img src="images/logo.png" alt="logo" style="width: 120px;height: 65px;">
                    </a>
                </div>
                <div class="nav navbar-header">
                <h3 class="fontcolor">Welcome to OMS</h3>
                </div>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-in btn btn-danger "></span> Log Out</a></li>
            </ul>
            <ul class="nav navbar-nav btn navbar-right">
                <li><a href ="<%=request.getContextPath()%>/main.jsp">Main</a></li>
                <li><a href ="<%=request.getContextPath()%>/booking.jsp">Bookings</a></li>
                <li><a href ="<%=request.getContextPath()%>/account.jsp">Account</a></li>
            </ul>
            </div>
        </nav>
    </body>
</html>
