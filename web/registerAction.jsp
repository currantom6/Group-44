<%-- 
    Document   : registerAction
    Created on : 12/04/2019, 10:28:05 PM
    Author     : chenyizhe
--%>

<%@ page language="java"  %>
<%@ page import="oms.*" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="logic.Util" %>
<%@ page import="xml.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Date" %>

<%

	//set parameters
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	String passwordCheck = request.getParameter("confirmpassword");
	String name  = request.getParameter("name");
	int identify = Integer.parseInt(request.getParameter("identify"));
	String birthdaystr = request.getParameter("birthday");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
        Date birthday = sdf.parse(birthdaystr);
	int positionIndex = 0;
	if (request.getParameter("position") != null){
		positionIndex = Integer.parseInt(request.getParameter("position"));
	}
	
        String position = "";
	switch (positionIndex){
		case 1:
		    position = "CustomerService";
		    break;
		case 2:
		    position = "Engineering";
		    break;
		case 3:
		    position = "Finance";
		    break;
		case 4:
		    position = "Marketing";
		    break; 
	}

	Object user = null;
	String nextPage= "";
	switch(identify){
		case 1:
			Member m = new Member(name,email,password,birthday);
			user = m;
                        Members members = new ReadXml().readMembers();
			if (members == null){
			    members = new Members();
			    members.setMemberList(new ArrayList<Member>());
			}
			members.getMemberList().add(m);
			new WriteXml().writeMembers(members);
			nextPage = request.getContextPath()+"/main.jsp";
			break;//crear new member
		case 2:
			Staff s = new Staff(name,email,password,position,birthday);
			Staffs staffs = ReadXml.readStaffs();
			if (staffs == null){
			    staffs = new Staffs();
			    staffs.setStaffList(new ArrayList<Staff>());
			}
			staffs.getStaffList().add(s);
			new WriteXml().writeStaffs(staffs);
			user = s;
			nextPage = request.getContextPath()+"/main.jsp";
			break;
                        //creat new staff

	}
		
	try{
		session.setAttribute("user", user);
		response.sendRedirect(nextPage);
		return ;
	}catch(Exception e) 
	{
%>
		
<%
	}
%>	
