<%-- 
    Document   : register
    Created on : 12/04/2019, 8:45:45 PM
    Author     : chenyizhe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*" %>
<%@ page import="xml.*" %>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
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
            <h1>Register</h1>
            <div class="btn-group btn-group-lg btn-group-justified">
            <a href="registerForm.jsp" class="btn btn-warning ">Register as Member</a>
            <a href="registerForm.jsp?type=1" class="btn btn-danger">Register as Staff</a>
            </div>
            <br>
            <p>Already have an account?</p>
            <p><a href="login.jsp">Login</a></p>
        </div>
    
    </body>
</html>
