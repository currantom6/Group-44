<%-- 
    Document   : admin
    Created on : 19/04/2019, 11:59:01 PM
    Author     : chenyizhe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*" %>
<%@ page import="xml.*" %>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>
        <link rel="stylesheet" href="css/bootstrap.min.css" >
        <link rel="stylesheet" href="css/style.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    </head>
    <body style="background-color: rgb(38, 38, 38);">
        
        <%--Navigation Bar --%>
        <jsp:include page="staffnav.jsp"/>
        <div class="col-sm-2"></div>
        <div class="col-sm-8 container fontcolor btn-group-vertical" align="center">
            <h1>Admin Center</h1>
            
            <a href="upload.jsp" class="btn btn-warning ">Upload New Movie</a>
            <br>
            <a href="#" class="btn btn-primary">Update Current Movies</a>
            <br>
            <a href="#" class="btn btn-default">Delete Current Movies</a>
           
        </div>
    
    </body>
</html>
