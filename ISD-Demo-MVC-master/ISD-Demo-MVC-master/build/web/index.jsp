<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="uts.isd.controller.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/demo.css">
        <script type="text/javascript" src="js/script.js"></script>
        <title>Home Page</title>       
    </head>
     <body onload="startTime()">
         <div><span class="time" id="time" ></span></div>      
        <h1 align="center">ISD Demo - University Enrollment System</h1>  
        <div align="center"> 
            <a class="link" href="register.jsp"> Register </a> 
            &emsp; 
            <a class="link" href="login.jsp">Login</a>
            &emsp; 
            <a class="link" href="math.jsp">Math Page</a> 
        </div>
        <jsp:include page="/ConnServlet" flush="true" />
    </body>
</html>
