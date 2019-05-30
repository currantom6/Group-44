<%-- 
    Document   : adminStaffAction
    Created on : 18/05/2019, 7:31:07 PM
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
        Date birthday = sdf.parse(birthdaystr);
        int key = (new Random()).nextInt(999999);
        String ID = "" + key;
       
        //Activate the database add-function once DBManager functions are completed
        DBManager manager = (DBManager)session.getAttribute("manager");
	Object user = null;
	Member m = new Member(ID,name,email,password,birthdaystr,phone);
        //add new member to database
        manager.addMember(ID,name, birthdaystr, email, password,phone);
        String nextPage = request.getContextPath()+"/main.jsp";	
	try{
		response.sendRedirect(nextPage);
		return ;
	}catch(Exception e) 
	{
%>
		
<%
	}
%>	
