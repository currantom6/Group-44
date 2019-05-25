<%-- 
    Document   : booking
    Created on : 06/05/2019, 6:56:10 PM
    Author     : chenyizhe
--%>

<%@page import="oms.dao.DBManager"%>
<%@page import="oms.dao.DBManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="oms.dao.DBConnector"%>
<%@ page language="java" import="java.util.*" %>
<%@ page language="java" import="oms.*" pageEncoding="UTF-8" %>
<%@ page import="oms.*" %>
<!DOCTYPE html>

<% 
    Object user = session.getAttribute("user");
    Member m = null;
    Staff s = null;
    //check if user is member
    if (user instanceof Member) { 
        m = (Member) user;
    //check if user is staff
    } else if (user instanceof Staff) { 
        s = (Staff) user;
    } else {
        response.sendRedirect(request.getContextPath() + "/index.jsp");
        return;
    }
    //Activate the database add-function once DBManager functions are completed
    DBManager manager = (DBManager)session.getAttribute("manager");
    String msg = "";
    String vtitle = "";
    String price = "";
    int vprice = 0;
    int key = (new Random()).nextInt(999999);
    String ID = "" + key;
    
    List<Order> orders = null;
    
        String memail = m.getEmail();
        String status = "active";
        String select = null;
        if (request.getParameter("vtitle") != null) {
            //get movie title
            vtitle = request.getParameter("vtitle"); 
        }
        if (request.getParameter("vprice") != null) {
            //get movie price
            vprice = Integer.parseInt(request.getParameter("vprice")); 
        }
        
        //get input value
        if (request.getParameter("title") != null) {
            //get movie title
            vtitle = request.getParameter("title"); 
            //get select action
            select = request.getParameter("action"); 
            price = request.getParameter("price");
            vprice = Integer.parseInt(request.getParameter("price"));
        }
        
        orders = manager.listAllOrders(m.getEmail());
  
%>
           <%-- Error handling message --%>
<% 
        //check if the member input movie title
        if (select != null) { 
        //if student did not input, error handling message
        if (vtitle.equals("")) { 
        msg = "Please Input Movie Title"; 
        } else if (price.equals("")) {
          msg = "Please Input Movie Price";
        } else {
          if (select.equals("0")) {
        //add new member to database
          manager.addOrder(ID,vtitle,memail,vprice,status);
          msg = "Book Success";
        } else if (select.equals("1")) {
                 manager.cancelOrder(vtitle, "cancelled");
            msg = "Cancel Success";
        } else {
            msg = "Fail";
             }
           }
      }
 %>

<html>
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booking Page</title>
        <link rel="stylesheet" href="css/bootstrap.min.css" >
        <link rel="stylesheet" href="css/style.css">
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    </head>

    <body style="background-color: rgb(38, 38, 38);">
        <% if (m != null) { %>
       <%-- member nav bar --%>
        <jsp:include page="membernav.jsp"/>
        <div class="container-fluid text-center fontcolor">
            <div class="row content">
                    <br>
                        <h2 align="center" class="fontcolory">Member【<%=m.getName()%>】Booking Center</h2>
                        <% if (!msg.equals("")) { %> 
                        <!-- Display the status message after student has selected -->
                        <h4 align="center" class="fontcolory">!【<%=msg%>】</h4> 
                        <% }
                        %>
                        
                        
                        <form action="booking.jsp" id="login_form" method="post">
                            <div class="form-group">
                                <label>Movie Title</label>
                                <input id="temail" class="fontcolorb" value="<%=vtitle%>" name="title" type="text" maxlength="30">
                                &#36;<input style="text-align: center" class="fontcolorb" value="<%=vprice%>" readonly name="price" size="3" type="text" maxlength="3">
                            </div>
                            <div class="form-group">
                                <label>Action</label>
                                <select name="action" class="fontcolorb" >
                                    <option value="0" selected="selected">Order</option>
                                    <option value="1">Cancel</option>
                                </select>
                            </div>
                            <div>
                                <button type="submit"  id="submit_btn"
                                        class="btn btn-primary btn-lg"> &nbsp;Submit&nbsp; </button>
                            </div>
                        </form>
                        <%
                            if (orders != null && orders.size() > 0) { // if there is at least one booking
                        %>
                        <br>
                        <h3 align="center">Order History List</h3>
                        <div class="col-sm-2"></div>
                        <div class="col-sm-8 text-center fontcolor">
                        <table class="table table-dark movies">
                            <thead>
                            <tr>
                                <th>Order Id</th>
                                <th>Movie Title</th>
                                <th>Member Email</th>
                                <th>Movie Price</th>
                                <th>Status</th>
                            </tr>
                            </thead>
                            <%
                                for (Order o : orders) {
                            %>
                            <tr>
                                <td><%=o.getOrderid()%></td>
                                <td><%=o.getMovieTitle()%></td>
                                <td><%=o.getMemberEmail()%></td>
                                <td><%=o.getMoviePrice()%></td>
                                <td><%=o.getOrderStatus().toString()%></td>
                                <%
                                        }
                                    }
                                %>
                            </tr>
                        </table>
                        <br>
                       </div>  
                      
                    </div>
                  </div>
             <% }  %>
                                
 </body>
 </html>