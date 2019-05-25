<%-- 
    Document   : loginAction
    Created on : 13/04/2019, 9:56:09 AM
    Author     : chenyizhe
--%>

<%@page import="oms.dao.DBManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="oms.dao.DBConnector"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="oms.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>Login</title>

  </head>
  
  <body>
   <%
	   //response.sendRedirect(request.getContextPath()+"/"
            try{
                //Create a connection and initialize DB conn-field
                DBManager manager = (DBManager)session.getAttribute("manager");
                String email = request.getParameter("email");
   		String password = request.getParameter("password");
                //login date parameter
                Date date = new java.util.Date();
                DateFormat dateFormat = new SimpleDateFormat("yyy-MM-dd HH:mm:ss");
                String datestr = dateFormat.format(date);
                        
                //login error messgae
                if (email==null || "".equals(email)){
                    session.setAttribute("errorMessage", "Please input email");
                    response.sendRedirect(request.getContextPath()+"/loginError.jsp");
                    return;
   		}
   		else if(password==null || "".equals(password)){
                    session.setAttribute("errorMessage", "Please input password");
                    response.sendRedirect(request.getContextPath()+"/loginError.jsp");
                    return;
   		}
                
                String nextPage= "";                   
                Member member = manager.findMember(email,password);
		if (member != null){
                //once user login, register a log access information.
                Log l = new Log(email,datestr);
                //add logdate to database
                manager.addLog(email, datestr);
                //transfer to next page
                nextPage = request.getContextPath()+"/main.jsp";
		}
                // transfer to error page
                if (nextPage.equals("")){
                    nextPage = request.getContextPath()+"/loginError.jsp";
                    session.setAttribute("errorMessage", member.toString());
		}
                
		session.setAttribute("user", member);
		response.sendRedirect(nextPage);
		    return ;
   		}catch(Exception e){
                    session.setAttribute("errorMessage", e.toString());
                    response.sendRedirect(request.getContextPath()+"/loginError.jsp");
   		}
                //error handing code 
    %>
  </body>
</html>

