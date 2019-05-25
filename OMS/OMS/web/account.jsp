<%-- 
    Document   : account
    Created on : 05/05/2019, 2:04:19 PM
    Author     : chenyizhe
--%>

<%@page import="oms.dao.DBManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="oms.dao.DBConnector"%>
<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ page import="oms.*" %>
<%@ page language="java" import="java.util.*" %>
<!DOCTYPE html>


<html>
<head>
  <title>Account</title>
  <link rel="stylesheet" href="css/bootstrap.min.css" >
  <link rel="stylesheet" href="css/style.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>

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
    //Activate the database add-function once DBManager functions are completed
    DBManager manager = (DBManager)session.getAttribute("manager");
%>

<% 
String showMsg = "";
    if (request.getParameter("name")!=null){
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String checkPassword = request.getParameter("checkpassword");
        String birthday = request.getParameter("birthday");
        int phone = Integer.parseInt(request.getParameter("phone"));
    //error handling msg    
    if (name.equals("") || password.equals("") || birthday.equals("")){
            showMsg = "Empty Input";
        }
    //error handling message
        else if ( !password.equals("") && !password.equals(checkPassword)){
            showMsg = "Please Check Password";
        }else {
            if (m != null){
                //update member account details from database
                manager.updateMember(m.getEmail(),name,password,birthday,phone);
            }else {
                //update staff account details from database
                manager.updateStaff(s.getEmail(),name,password,birthday,phone);
            }
            showMsg = "Update Success";
        }
    }
%>

    <%--Navigation Bar --%>

    <% if (m!=null){ %>
      <jsp:include page="membernav.jsp"/>
    <% } else if( s != null && s.getPosition().equals("Admin") ) { %>
        <jsp:include page="adminnav.jsp"/>
    <% } else if ( !s.getPosition().equals("Admin") ) {%>
      <jsp:include page="staffnav.jsp"/>
    <% } %>  
     
    <div class="container-fluid fontcolor">
        <div class="row content">
           <h1 align="center" class="fontcolor">Account Details</h1> 
            <% if (!showMsg.equals("")) { %>
            <h3 align="center" class="fontcolorr">!【<%=showMsg%>】</h3>
            <% } %>
            <div class="col-sm-4"></div>
            <% if (m!=null){ %>
            <div class="col-sm-4" style="text-align: center">
            <form action="account.jsp" method="post">
          <div class="form-group">
            <label class="fontcolory">Member ID:</label>
            <h4><%=m.getID() %></h4>
          </div>
          <div class="form-group">
            <label class="fontcolory">Member Email:</label>
            <h4><%=m.getEmail() %></h4>
          </div>
          <div class="form-group">
            <label class="fontcolory">Member Name</label>
            <input value="<%=m.getName() %>" name="name" type="text" class="form-control" placeholder="Enter name" id="email">
          </div>
          <div class="form-group">
            <label class="fontcolory">New Password</label>
            <input value="<%=m.getPassword() %>" name="password" type="password" class="form-control" id="password" placeholder="Enter password">
          </div>
          <div class="form-group">
            <label class="fontcolory">Confirm Password</label>
            <input value="<%=m.getPassword() %>" name="checkpassword" type="password" class="form-control" id="password" placeholder="Confirm password">
          </div>
          <div class="form-group">
            <label class="fontcolory">Date of Birth</label>
            <input id="birthday" value="<%= m.getBirthday()%>" name="birthday" type="date" class="form-control">
          </div>
          <div class="form-group">
            <label class="fontcolory">Phone Number</label>
            <input value="<%= m.getPhone()%>" name="phone" type="text" class="form-control" id="password" placeholder="Enter your phone number">
          </div>
          <%-- submit new account details --%>
         <button type="submit" class="btn btn-primary"> &nbsp; Update &nbsp; </button> 
        </form>
         </div>
            <% }else{ %>
            <div class="col-sm-4" style="text-align: center">
           <form action="account.jsp" method="post">
          <div class="form-group">
            <label class="fontcolory">Staff ID:</label>
            <h4><%=s.getID() %></h4>
          </div>
          <div class="form-group">
            <label class="fontcolory">Staff Email:</label>
            <h4><%=s.getEmail() %></h4>
          </div>
          <div class="form-group">
            <label class="fontcolory">Staff Position:</label>
            <h4><%=s.getPosition() %></h4>
          </div>
          <div class="form-group">
            <label class="fontcolory">Staff Name</label>
            <input value="<%=s.getName() %>" name="name" type="text" class="form-control" placeholder="Enter name" id="email">
          </div>
          <div class="form-group">
            <label class="fontcolory">New Password</label>
            <input value="<%=s.getPassword() %>" name="password" type="password" class="form-control" id="password" placeholder="Enter password">
          </div>
          <div class="form-group">
            <label class="fontcolory">Confirm Password</label>
            <input value="<%=s.getPassword() %>" name="checkpassword" type="password" class="form-control" id="password" placeholder="Confirm password">
          </div>
          <div class="form-group">
            <label class="fontcolory">Date of Birth</label>
            <input id="birthday" value="<%=s.getBirthday()%>" name="birthday" type="date" class="form-control">
          </div>
          <div class="form-group">
            <label class="fontcolory">Phone Number</label>
            <input value="<%= s.getPhone()%>" name="phone" type="text" class="form-control" id="password" placeholder="Enter your phone number">
          </div>
          <%-- submit new account details --%>
         <button type="submit" class="btn btn-primary"> &nbsp; Update &nbsp; </button> 
        </form>
         </div>
        <% } %>  
   
        <% if (showMsg.equals("Update Success")) { %>
        <%-- transfer to index page automaticaly --%>
        <% response.setHeader("refresh","1;url=index.jsp"); %>
        <% } %>
       </div>
    </div>
       <%-- Delete Account --%>
        <hr>
         <div class="text-center">
         <p class="fontcolory">Warning! Want to delete your account?</p>
         <% if (m!= null){ %>
         <a class="btn btn-danger" href="<%=request.getContextPath()%>/deleteAccount.jsp?memail=<%=m.getEmail()%>">Delete Account</a>
         <% }else{ %>
         <a class="btn btn-danger" href="<%=request.getContextPath()%>/deleteAccount.jsp?semail=<%=s.getEmail()%>">Delete Account</a>
         <% } %>
         <br>
         <br>
        </div>
         
</body>
</html>