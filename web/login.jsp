<%-- 
    Document   : login
    Created on : 12/04/2019, 8:40:10 PM
    Author     : chenyizhe
--%>

<%@ page language="java" import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
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
      
     <h1 align="center" class="fontcolor">Login</h1>

      <div class="container struct fontcolor" align="center">
        <form action="loginAction.jsp" method="post">
          <div class="form-group">
            <label>Email</label>
            <input value="" name="email" type="text" class="form-control" placeholder="Enter email" id="email">
          </div>
          <div class="form-group">
            <label>Password</label>
            <input value="" name="password" type="password" class="form-control" id="password" placeholder="Enter password">
          </div>
          <%-- Identify --%>
          <div class="form-group">
            <label>User Identify</label>
            <select class="form-control" name = "identity" >
              <option value ="1" selected="selected">Member</option>
              <option value ="2">Staff</option>
            </select>
          </div>
         
            <button type="submit" class="btn btn-primary"> &nbsp;Login&nbsp; </button> 
        </form>
          <br>
          <p>Not a member? Click here to register</p>
          <p><a href="register.jsp">Register</a></p>
      </div>
   
</body>
</html>

