<%-- 
    Document   : adminCenter
    Created on : 18/05/2019, 9:06:35 PM
    Author     : chenyizhe
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
        <h1 style="text-align: center" class="fontcolory">Membership Management Center</h1>
        <div class="col-sm-4"></div>
        <div class="col-sm-4 container fontcolor btn-group-vertical" align="center">
            <br>
            <a href="adminStaff.jsp" class="btn btn-warning ">Create New Member</a>
            <br>
            <br>
            <a href="editMember.jsp" class="btn btn-primary">Edit Current Members</a>
            <br>
            <br>
            <a href="deleteMember.jsp" class="btn btn-danger">Delete Current Members</a>
           
        </div>
    
    </body>
</html>
