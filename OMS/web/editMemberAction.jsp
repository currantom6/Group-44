<%-- 
    Document   : editMemberAction
    Created on : 19/05/2019, 12:44:41 AM
    Author     : chenyizhe
--%>

<%@page import="oms.dao.DBManager"%>
<%@page import="oms.dao.DBManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="oms.dao.DBConnector"%>
<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ page import="oms.*" %>
<%@ page language="java" import="java.util.*" %>
<!DOCTYPE html>


<html>
<head>
  <title>Edit Member</title>
  <link rel="stylesheet" href="css/bootstrap.min.css" >
  <link rel="stylesheet" href="css/style.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>


<% 
     //Activate the database add-function once DBManager functions are completed
    DBManager manager = (DBManager)session.getAttribute("manager");
         if (request.getParameter("memail") != null) {    
            Member selectedMember = manager.editMember(request.getParameter("memail"));
            if (selectedMember != null) {
            session.setAttribute("selectedMember", selectedMember);
            }   
        }
%>

<body style="background-color: rgb(38, 38, 38);">
   <%
    Object user = (Object)session.getAttribute("user");
    
    Member m = null;
    Staff s = null;
    if (user instanceof Member){ 
        m = (Member)user;
    }else if (user instanceof Staff){
        s = (Staff)user;
    }
    Member member = (Member) session.getAttribute("selectedMember");
    // error handling message
    String showMsg = "";
    String msg = "Update Member Details";
    
%>

    <%--Navigation Bar --%>

    <% if (m!=null){ %>
      <jsp:include page="membernav.jsp"/>
    <% } else if( s != null && s.getPosition().equals("Admin") ) { %>
        <jsp:include page="adminnav.jsp"/>
    <% } else if ( !s.getPosition().equals("Admin") ) {%>
      <jsp:include page="staffnav.jsp"/>
    <% } %>  
     
    <div class="container struct fontcolor" align="center">
        <div class="row content">
            <div class="col-sm-2"></div>
            <%-- --%>
                
            
            <h1 align="center" class="fontcolor"><%=msg%></h1>
            <% if (!showMsg.equals("")) { %>
            <h3 align="center" class="fontcolory">!【<%=showMsg%>】</h3>
            <% } %>
        
          <form action="editMemberAction.jsp" method="post">
            <div class="form-group">
            <label class="fontcolory">User ID</label>
            <h4><%=member.getID()%></h4>
          </div>
          <div class="form-group">
            <label class="fontcolory">User Email</label>
            <input value="<%=member.getEmail()%>" readonly name="email" type="text" class="form-control"  id="email">
          </div>
          <div class="form-group">
            <label class="fontcolory">New Name</label>
            <input value="<%=member.getName()%>" name="name" type="text" class="form-control"  id="name">
          </div>
          <div class="form-group">
            <label class="fontcolory">New Password</label>
            <input value="<%=member.getPassword()%>" name="password" type="password" class="form-control" id="password" >
          </div>
          <div class="form-group">
            <label class="fontcolory">Confirm Password</label>
            <input value="<%=member.getPassword()%>" name="checkpassword" type="password" class="form-control" id="password" >
          </div>
          <div class="form-group">
            <label class="fontcolory">Date of Birth</label>
            <input id="birthday" value="<%=member.getBirthday()%>" name="birthday" type="date" class="form-control">
          </div>
          <div class="form-group">
            <label class="fontcolory">Phone Number</label>
            <input value="<%=member.getPhone()%>" name="phone" type="text" class="form-control" id="password" placeholder="Enter your phone number">
          </div>
          <%-- submit new account details --%>
         <button type="submit" class="btn btn-primary"> &nbsp; Update &nbsp; </button> 
        </form>
         <% 
         if (request.getParameter("email")!=null){
        String memail = request.getParameter("email");
        String mname = request.getParameter("name");
        String mpassword = request.getParameter("password");
        String checkPassword = request.getParameter("checkpassword");
        String birthday = request.getParameter("birthday");
        int phone = Integer.parseInt(request.getParameter("phone"));
        
        if (mname.equals("") || memail.equals("") || mpassword.equals("") || birthday.equals("")){
            showMsg = "Empty Input";
        }   else if (mpassword != null && !mpassword.equals(checkPassword)){
            showMsg = "Please Check Password";
        }   else {
            //edit from java database
            manager.updateMember(memail,mname,mpassword,birthday,phone);
            showMsg = "Update Success";
            }
        }
        %>
         <% if (!showMsg.equals("")) { %>
         <h3 align="center" class="fontcolory">!【<%=showMsg%>】</h3>
         <% } %>
        <% if (showMsg.equals("Update Success")) { %>
        <%-- transfer to index page automaticaly --%>
        <% response.setHeader("refresh","1;url=editMember.jsp"); %>
        <% } %>
        </div>
         
       </div>
         
</body>
</html>