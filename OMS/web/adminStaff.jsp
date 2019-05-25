<%-- 
    Document   : adminStaff
    Created on : 18/05/2019, 7:03:26 PM
    Author     : chenyizhe
--%>

<%@page import="oms.Staff"%>
<%@page import="oms.Member"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<%
    Object user = session.getAttribute("user");
    Member m = null;
    Staff s = null;
    if (user instanceof Member){ //check if user is member
        m = (Member)user;
    }else if (user instanceof Staff){ // check if user is staff
        s = (Staff)user;
    }else {
        response.sendRedirect(request.getContextPath() + "/index.jsp");
        return;
    }   
 %>

<html>
  <head>
    <title>Register</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" >
    <link rel="stylesheet" href="css/style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  </head>
  
  <body style="background-color: rgb(38, 38, 38);">
  
  <%--Admin staff Navigation Bar --%>
        <jsp:include page="adminnav.jsp"/>
        
        <h1 align="center" class="fontcolor">Create New Users</h1>
  	<div class="container struct fontcolor" align="center">
				<form action="adminStaffAction.jsp" method="post">
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
						<input id="phone" value="" name="phone" type="text" class="form-control">
					</div>
					
					
					<div>
					    
   						<button type="submit" class="btn btn-primary">Submit </button>
					</div>
				</form>
</div>
  </body>
</html>

