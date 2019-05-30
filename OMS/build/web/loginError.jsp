<%-- 
    Document   : loginError
    Created on : 20/05/2019, 6:04:11 PM
    Author     : chenyizhe
--%>

<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="oms.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <title>Login Error</title>
  <link rel="stylesheet" href="css/bootstrap.min.css" >
  <link rel="stylesheet" href="css/style.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>

<body style="background-color: rgb(38, 38, 38);">
<%
  	String errMessage = (String)session.getAttribute("errMessage");
  	
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
<h2 style = "text-align: center; color:#ff8c1a">Error, wrong email or password <%=errMessage %>!</h2>
<%-- transfer to index page automaticaly --%>
<%
    	response.setHeader("refresh","1;url=loginCenter.jsp");
%>

</body>
</html>