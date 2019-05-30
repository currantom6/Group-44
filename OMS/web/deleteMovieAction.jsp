<%-- 
    Document   : deleteMovieAction
    Created on : 05/05/2019, 3:36:27 PM
    Author     : xianyulee
--%>

<%@page import="oms.dao.DBManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="oms.dao.DBConnector"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="oms.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <title>Delete Movies...</title>
  <link rel="stylesheet" href="css/bootstrap.min.css" >
  <link rel="stylesheet" href="css/style.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>

<body style="background-color: rgb(38, 38, 38);">
    <%
        //Activate the database add-function once DBManager functions are completed
    DBManager manager = (DBManager)session.getAttribute("manager");
    %>
<% //check the email then delete the account.
    if (request.getParameter("vtitle") != null && !request.getParameter("vtitle").equals("")){
        String vtitle = request.getParameter("vtitle");
        //delete movie from database
        manager.deleteMovie(vtitle);
    }
%>
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
        
<h2 style = "text-align: center; color:#ff8c1a">Deleting Movies.....</h2>

<%-- transfer to index page automaticaly --%>
<%
    response.setHeader("refresh","1;url=deleteMovie.jsp");//
%>

</body>
</html>

