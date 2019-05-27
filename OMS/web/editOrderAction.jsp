<%-- 
    Document   : editOrderAction
    Created on : 26/05/2019, 7:49:30 PM
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
  <title>Edit Order</title>
  <link rel="stylesheet" href="css/bootstrap.min.css" >
  <link rel="stylesheet" href="css/style.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
 <% 
     //Activate the database add-function once DBManager functions are completed
    DBManager manager = (DBManager)session.getAttribute("manager");
         if (request.getParameter("orderid") != null) {    
            Order selectedOrder = manager.findOrder(request.getParameter("orderid"));
            if (selectedOrder != null) {
            session.setAttribute("selectedOrder", selectedOrder);
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
    Order order = (Order) session.getAttribute("selectedOrder");
    // error handling message
    String showMsg = "";
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
            <div class="col-sm-4"></div>
            <%-- --%>
           <h1 align="center" class="fontcolor">Update Order Details</h1>
            
          
          <form action="editOrderAction.jsp" method="post">
          <div class="form-group">
            <label class="fontcolory">Order ID [Read Only]</label>
            <input value="<%=order.getOrderid()%>" readonly name="id" type="text" class="form-control"  id="title">
          </div>
          <div class="form-group">
            <label class="fontcolory">Movie [Read Only]</label>
            <input value="<%=order.getMovieTitle()%>" readonly name="title" type="text" class="form-control"  id="genre">
          </div>
          <div class="form-group">
            <label class="fontcolory">Status [Read Only]</label>
            <input value="<%=order.getOrderStatus()%>" readonly name="status" type="text" class="form-control"  id="rating">
          </div>
          <div class="form-group">
            <label class="fontcolory">Ordered Movie Copies</label>
            <input value="<%=order.getOrdernum()%>" name="copies" type="text" class="form-control"  id="movieyear">
          </div>
          <%-- submit new account details --%>
         <button type="submit" class="btn btn-primary"> &nbsp; Update &nbsp; </button> 
        </form>
         
         <%
         //error handling message and 
         //get parameter
        if (request.getParameter("id")!=null){
        String id = request.getParameter("id");
        String copies = request.getParameter("copies");
        
        if( copies.equals("")){
            showMsg = "Empty Input";
        } else {
            int ocopies = Integer.parseInt(copies);
            //update movie details from database
            manager.updateOrder(id,ocopies);
            showMsg = "Update Success";
            }
        }
        %>
        
            <% if (!showMsg.equals("")) { %>
            <h3 align="center" class="fontcolory">!【<%=showMsg%>】</h3>
            <% } %>
          <% if (showMsg.equals("Update Success")) { %>
        <%-- transfer to index page automaticaly --%>
        <% response.setHeader("refresh","1;url=main.jsp"); %>
        <% } %>
        
         </div>
       </div>
         
</body>
</html>