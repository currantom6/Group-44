<%-- 
    Document   : loginAction
    Created on : Aug 11, 2018, 9:34:47 PM
    Author     : George
--%>

<%@page import="uts.isd.model.dao.*"%>
<%@page import="uts.isd.controller.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.*" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Action Page</title>
    </head>
    <body>

        <%
            //Activate the database search-validate once DBManager functions are completed
            //DBManager manager = (DBManager)session.getAttribute("manager");
            String ID = request.getParameter("ID");
            String password = request.getParameter("password");            
            //Student student = manager.findStudent(ID, password);
            Student student = new Student("ID","name","email","password","dob","white");
            if (student != null) {
                session.setAttribute("studentLogin", student);
                response.sendRedirect("loginWelcome.jsp");                        
            }else{
                session.setAttribute("existErr", "Student profile does not exist!");
                response.sendRedirect("login.jsp");                               
            }             
        %>
        
    </body>
</html>
