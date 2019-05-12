<%-- 
    Document   : account
    Created on : 05/05/2019, 2:04:19 PM
    Author     : chenyizhe
--%>

<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ page import="oms.*" %>
<%@ page import="logic.Util" %>
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
    String msg = "";
    if (m != null){
        msg = "Update " + m.getName() + "'s Details";
    }else{
        msg = "Update " + s.getName() + "'s Details";
    }
    String showMsg = "";
    if (request.getParameter("name")!=null){
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String checkPassword = request.getParameter("checkpassword");
        if (name.equals("")){
            name = null;
        }
        if (password.equals("")){
            password = null;
        }
        if (name ==null && password ==null){
            showMsg = "Empty Input";
        }
        else if (password != null && !password.equals(checkPassword)){
            showMsg = "Please Check Password";
        }else {
            if (m != null){
                Util.editMember(m.getEmail(),name,password);
            }else {
                Util.editStaff(s.getEmail(),name,password);
            }
            showMsg = "Update Success";
        }
    }
%>

    <%--Navigation Bar --%>

    <% if (m!=null){ %>
      <jsp:include page="membernav.jsp"/>
    <% }else{ %>
      <jsp:include page="staffnav.jsp"/>
    <% } %>  
     
    <div class="container-fluid fontcolor">
        <div class="row content">
            
            
            <div class="col-sm-2"></div>
            <% if (m!=null){ %>
            <div class="col-sm-4"> 
              <h1 align="center" class="fontcolor">Account Details</h1>
              <label class="fontcolory">Member Email:</label>
              <h4><%=m.getEmail() %></h4>
              <label class="fontcolory">Member Name: </label>
              <h4><%=m.getName() %></h4>
              <label class="fontcolory">Member Password: </label>
              <h4><%= m.getPassword() %></h4>
              <label class="fontcolory">Member DoB: </label>
              <h4><%= m.getBirthday()%></h4>   
            </div>
            <% }else{ %>
            <div class="col-sm-4"> 
              <h1 align="center" class="fontcolor">Account Details</h1>
              <label class="fontcolory">Staff Email:</label>
              <h4><%=s.getEmail() %></h4>
              <label class="fontcolory">Staff Name: </label>
              <h4><%=s.getName() %></h4>
              <label class="fontcolory">Staff Password: </label>
              <h4><%= s.getPassword() %></h4>
              <label class="fontcolory">Staff Position: </label>
              <h4><%= s.getPosition()%></h4>
              <label class="fontcolory">Staff DoB: </label>
              <h4><%= s.getBirthday()%></h4>  
              
            </div>
            <% } %>  
                
                    <div class="col-sm-4 text-center">
            <h1 align="center" class="fontcolor"><%=msg%></h1>
            <% if (!showMsg.equals("")) { %>
     
            <h3 align="center" class="fontcolory">!【<%=showMsg%>】</h3>
     
            <% } %>
        <form action="account.jsp" method="post">
          <div class="form-group">
            <label>New Name</label>
            <input value="" name="name" type="text" class="form-control" placeholder="Enter name" id="email">
          </div>
          <div class="form-group">
            <label>New Password</label>
            <input value="" name="password" type="password" class="form-control" id="password" placeholder="Enter password">
          </div>
          <div class="form-group">
            <label>Confirm Password</label>
            <input value="" name="checkpassword" type="password" class="form-control" id="password" placeholder="Confirm password">
          </div>
          <%-- submit new account details --%>
         <button type="submit" class="btn btn-primary"> &nbsp; Update &nbsp; </button> 
        </form>
        <% if (showMsg.equals("Update Success")) { %>
        <%-- transfer to index page automaticaly --%>
        <% response.setHeader("refresh","1;url=index.jsp"); %>
        <% } %>
        </div>
         
       </div>
        <hr>
        <%-- Delete Account --%>
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
    </div>
         
</body>
</html>