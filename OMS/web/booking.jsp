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
    DBManager manager = (DBManager)session.getAttribute("manager");
    List<Order> orders = manager.listAllOrders(m.getEmail());
  
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
        <% 
        if (request.getParameter("content") != null) {
            String content = request.getParameter("content");
            String title = content;
            String ID = content;
            orders = manager.findOrders(ID);
        }
        %>
        <% if (m != null) { %>
       <%-- member nav bar --%>
        <jsp:include page="membernav.jsp"/>
        <div class="container-fluid text-center fontcolor">
            <div class="row content">
                    <br>
                        <h2 align="center" class="fontcolory">Booking Center</h2>
                         <%-- search movie --%>
                    <form action="booking.jsp" id="login_form" method="post">
                        <div class="form-group fontcolorb" align="center">
                        <label class="fontcolor">Find Order By</label>
                        <input id="name" name="content" type="text"  maxlength="30">
                        <button type="submit"  id="submit_btn" class="btn btn-warning btn-sm">Search</button>
                        <br>
                        <br>
                        <a href="booking.jsp"   id="submit_btn" class="btn btn-danger btn-lg">View All Orders</a>
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
                                <th>Numbers</th>
                                <th>Status</th>
                                <th></th>
                                <th></th>
                            </tr>
                            </thead>
                            <%
                                for (Order o : orders) {
                            %>
                            <tr>
                                <td><%=o.getOrderid()%></td>
                                <td><%=o.getMovieTitle()%></td>
                                <td><%=o.getMemberEmail()%></td>
                                <td><%=o.getOrdernum()%></td>
                                <td><%=o.getOrderStatus()%></td>
                                <%  if (o.getOrderStatus().equals("active")){%>
                                <td>
                                <a style="color:#3281ff" href="<%=request.getContextPath()%>/editOrderAction.jsp?orderid=<%=o.getOrderid()%>">Edit Order</a>
                                </td>
                                <td>
                                <a style="color:red" href="<%=request.getContextPath()%>/cancelOrderAction.jsp?orderid=<%=o.getOrderid()%>&vtitle=<%=o.getMovieTitle()%>&onum=<%=o.getOrdernum()%>">Cancel Order</a>
                                </td>
                                 <% } else { %>
                                <td></td>
                                <td></td>
                                <%}%>
                                
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