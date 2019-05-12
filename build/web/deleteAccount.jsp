<%-- 
    Document   : deleteAccount
    Created on : 05/05/2019, 3:36:27 PM
    Author     : chenyizhe
--%>

<%@ page language="java" import="logic.Util" pageEncoding="UTF-8"%>
<%@ page import="oms.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <title>Login</title>
  <link rel="stylesheet" href="css/bootstrap.min.css" >
  <link rel="stylesheet" href="css/style.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>

<body style="background-color: rgb(38, 38, 38);">
<% //check the email then delete the account.
    if (request.getParameter("memail") != null && !request.getParameter("memail").equals("")){
        Util.deleteMemberAccount(request.getParameter("memail"));
    }else if (request.getParameter("semail") != null && !request.getParameter("semail").equals("")){
        Util.deleteStaffAccount(request.getParameter("semail"));
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
        
<h2 style = "text-align: center; color:#ff8c1a">Deleting.....</h2>

<%-- transfer to index page automaticaly --%>
<%
    response.setHeader("refresh","1;url=index.jsp");//
%>

</body>
</html>
