<%-- 
    Document   : admin
    Created on : 19/04/2019, 11:59:01 PM
    Author     : xianyulee
--%>

<%@page import="oms.Staff"%>
<%@page import="oms.Member"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*" %>
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>
        <link rel="stylesheet" href="css/bootstrap.min.css" >
        <link rel="stylesheet" href="css/style.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    </head>
    <body style="background-color: rgb(38, 38, 38);">
        
        <%--Navigation Bar --%>
       <% if( s != null && s.getPosition().equals("Admin") ) { %>
       <jsp:include page="adminnav.jsp"/>
       <% } else if ( !s.getPosition().equals("Admin") ) { %>
        <jsp:include page="staffnav.jsp"/>
       <% } %>
       <br>
       <h1 style="text-align: center" class="fontcolory">Movie Management Center</h1>
        <div class="col-sm-4"></div>
        <div class="col-sm-4 container fontcolor btn-group-vertical" align="center">
            <br>
            <a href="upload.jsp" class="btn btn-warning ">Upload New Movie</a>
            <br>
            <br>
            <a href="editMovie.jsp" class="btn btn-primary">Update Current Movies</a>
            <br>
            <br>
            <a href="deleteMovie.jsp" class="btn btn-danger">Delete Current Movies</a>
           
        </div>
    
    </body>
</html>
