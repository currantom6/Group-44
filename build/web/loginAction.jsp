<%-- 
    Document   : loginAction
    Created on : 13/04/2019, 9:56:09 AM
    Author     : chenyizhe
--%>

<%@ page language="java" import="logic.Util" pageEncoding="UTF-8"%>
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
   			String email = request.getParameter("email");
   			String password = request.getParameter("password");
   			int identity = Integer.parseInt(request.getParameter("identity"));
   			
			Object user = Util.login(email,password);;
	 		String nextPage= "";
			switch(identity){
				case 1:
					if (user instanceof Member){
                                        nextPage = request.getContextPath()+"/main.jsp";
					}
					break;
				case 2:
					if (user instanceof Staff){
					nextPage = request.getContextPath()+"/main.jsp";
					}
					break;
			
                       }
			session.setAttribute("user", user);
			response.sendRedirect(nextPage);
		    return ;
   		}catch(Exception e){
   		}
                //error handing code 
    %>
  </body>
</html>

