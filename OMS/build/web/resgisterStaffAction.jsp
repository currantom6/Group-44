<%-- 
    Document   : resgisterStaffAction
    Created on : 23/05/2019, 4:29:38 PM
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
        String phonestr = request.getParameter("phone");
        
        String position = request.getParameter("position");
	String birthdaystr = request.getParameter("birthday");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        int key = (new Random()).nextInt(999999);
        String ID = "" + key;
        // Data Validator
        Validator v = new Validator();
        //Create a connection and initialize DB conn-field
        DBManager manager = (DBManager)session.getAttribute("manager");
        
        // error handling message
        if (email == null || "".equals(email)){
		session.setAttribute("emailErr", "Please input email!");
                response.sendRedirect("registerStaffForm.jsp");
   		return;//check email
	}
	else if (password==null || "".equals(password) || passwordCheck==null 
	|| "".equals(passwordCheck) || !password.equals(passwordCheck)){
		session.setAttribute("passErr", "Please check password!");
                response.sendRedirect("registerStaffForm.jsp");
   		return; // check password
	}
	else if(name == null || "".equals(name)){
		session.setAttribute("nameErr", "Please input name!");
                response.sendRedirect("registerStaffForm.jsp");
   		return; // check name 
	}
        else if(birthdaystr == null || "".equals(birthdaystr)){
                session.setAttribute("errorMessage", "Please input birthday");
   		response.sendRedirect(request.getContextPath()+"/registerError.jsp");
   		return; // check dob
        }
        else if (!v.validateEmail(email)) {
                session.setAttribute("emailErr", "Email format is incorrect");
                response.sendRedirect("registerStaffForm.jsp");
                return;
        } 
        else if (!v.validatePassword(password)) {
                session.setAttribute("passErr", "Password format is incorrect");
                response.sendRedirect("registerStaffForm.jsp");
                return;
        } 
        else if (!v.validateName(name)) {
                session.setAttribute("nameErr", "Name format is incorrect!");
                response.sendRedirect("registerStaffForm.jsp");
                return;
        }
        else if (phonestr == null || !v.validatePhone(phonestr)) {
                session.setAttribute("phoneErr", "invalid phone number!");
                response.sendRedirect("registerStaffForm.jsp");
                return;
        }
        
        //check if user exits or not
	if (manager.checkMember(email)!= null || manager.checkStaff(email) != null){
		session.setAttribute("errorMessage", "User already exist!");
		response.sendRedirect(request.getContextPath()+"/registerError.jsp");
		return; 
	}
        int phone = Integer.parseInt(request.getParameter("phone"));
	Object user = null;
	String nextPage= "";
	Staff s = new Staff(ID,name,email,password,position,birthdaystr,phone);
        //add new staff to database
        manager.addStaff(ID,name, email, password, birthdaystr, position,phone);
	user = s;
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
