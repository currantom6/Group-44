<%-- 
    Document   : registerForm
    Created on : 12/04/2019, 9:59:50 PM
    Author     : chenyizhe
--%>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
  <head>
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
        
        <h1 align="center" class="fontcolor">Register as Member</h1>
  	<div class="container struct fontcolor" align="center">
				<form action="registerAction.jsp" method="post">
					<div class="form-group">
						<label>Email</label>
						<input id="email" value="" name="email" type="text" class="form-control" placeholder="Enter email">
					</div>
					<div class="form-group">
						<label>Password</label>
						<input id="password" value="" name="password" type="password" class="form-control" placeholder="Enter password">
					</div>
					<div class="form-group">
						<label>Confirm Password</label>
						<input id="checkpassword" value="" name="confirmpassword" type="password" class="form-control" placeholder="Confirm password">
					</div>
					<div class="form-group">
						<label>Name</label>
						<input id="name" value="" name="name" type="text" class="form-control" placeholder="Enter name">
					</div>
					<div class="form-group">
						<label>Birthday</label>
						<input id="birthday" value="" name="birthday" type="date" class="form-control">
					</div>
                                        <div class="form-group">
						<label>Phone Number</label>
						<input id="birthday" value="" name="phone" type="text" class="form-control">
					</div>
					
					<div>
					    
   						<button type="submit" class="btn btn-primary">Submit </button>
					</div>
				</form>
</div>
  </body>
</html>
