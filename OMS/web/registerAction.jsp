<%-- 
    Document   : registerAction
    Created on : 12/04/2019, 10:28:05 PM
    Author     : chenyizhe
--%>

<%@ page import="oms.dao.DBManager"%>
<%@ page import="oms.controller.*"%>
<%@ page import="oms.dao.*"%>
<%@ page import="java.sql.*"%>
<%@ page language="java"  %>
<%@ page import="oms.*" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Date" %>

<%

    	//set parameters
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	String passwordCheck = request.getParameter("confirmpassword");
	String name  = request.getParameter("name");
        int phone = Integer.parseInt(request.getParameter("phone"));
	String birthdaystr = request.getParameter("birthday");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        int key = (new Random()).nextInt(999999);
        String ID = "" + key;
        //Create a connection and initialize DB conn-field
        DBManager manager = (DBManager)session.getAttribute("manager");
        // error handling message
        if (email == null || "".equals(email)){
		session.setAttribute("errorMessage", "Please inpute email");
   		response.sendRedirect(request.getContextPath()+"/registerError.jsp");
   		return;//check email
	}
	else if (password==null || "".equals(password) || passwordCheck==null 
	|| "".equals(passwordCheck) || !password.equals(passwordCheck)){
		session.setAttribute("errorMessage", "Password is different");
   		response.sendRedirect(request.getContextPath()+"/registerError.jsp");
   		return; // check password
	}
	else if(name == null || "".equals(name)){
		session.setAttribute("errorMessage", "Please input name");
   		response.sendRedirect(request.getContextPath()+"/registerError.jsp");
   		return; // check name 
	}
        else if(birthdaystr == null || "".equals(birthdaystr)){
                session.setAttribute("errorMessage", "Please input birthday");
   		response.sendRedirect(request.getContextPath()+"/registerError.jsp");
   		return; // check dob
        }
        
	if (manager.checkMember(email)!= null || manager.checkStaff(email) != null){
		session.setAttribute("errorMessage", "User already exist!");
		response.sendRedirect(request.getContextPath()+"/registerError.jsp");
		return; 
	}

	Object user = null;
	String nextPage= "";
	Member m = new Member(ID,name,email,password,birthdaystr,phone);
	user = m;
        //add new member to database
        manager.addMember(ID,name, birthdaystr, email, password,phone);
        nextPage = request.getContextPath()+"/main.jsp";
	try{
		session.setAttribute("user", user);
		response.sendRedirect(nextPage);
		return ;
	}catch(Exception e) 
	{
%>
	<h2 style ="color:orange">Error?<%=e.getMessage() %></h2>	
<%
	}
%>	
