<%-- 
    Document   : loginCenter
    Created on : 23/05/2019, 1:27:50 AM
    Author     : chenyizhe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*" %>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="css/bootstrap.min.css" >
        <link rel="stylesheet" href="css/style.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    </head>
    <body style="background-color: rgb(38, 38, 38);">
        
        <%--Navigation Bar --%>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a href="index.jsp">
                    <img src="images/logo.png" alt="logo" style="width: 120px;height: 65px;">
                    </a>
                </div>
                <div class="nav navbar-header">
                <h3 class="fontcolor">Welcome to OMS</h3>
                </div>
            </div>
        </nav>
       
        <div class="container struct fontcolor" align="center">
            <h1>Login Center</h1>
            <br>
            <div class="btn-group btn-group-lg btn-group-justified">
            <a href="login.jsp" class="btn btn-warning ">Login as Member</a>
            <a href="loginStaff.jsp" class="btn btn-danger">Login as Staff</a>
            </div>
            <br>
          <p>Not a member? Click here to register</p>
          <p><a href="register.jsp">Register</a></p>
        </div>
    
    </body>
</html>
