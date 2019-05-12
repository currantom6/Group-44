<%-- 
    Document   : booking
    Created on : 06/05/2019, 6:56:10 PM
    Author     : chenyizhe
--%>

<%@ page language="java" import="java.util.*" %>
<%@ page import="xml.*" %>
<%@ page language="java" import="oms.*" pageEncoding="UTF-8" %>
<%@ page import="oms.*" %>
<%@ page import="logic.Util" %>
<!DOCTYPE html>

<% 
    Object user = session.getAttribute("user");
    Member m = null;
    Staff s = null;
    if (user instanceof Member) { //check if user is member
        m = (Member) user;
    } else if (user instanceof Staff) { //check if user is staff
        s = (Staff) user;
    } else {
        response.sendRedirect(request.getContextPath() + "/index.jsp");
        return;
    }
    String msg = "";
    String memail = "";
    String vtitle = "";
    
    List<Order> orders = null;
    if (m != null) {
        memail = m.getEmail();
        String select = null;
        if (request.getParameter("vtitle") != null) {
            vtitle = request.getParameter("vtitle"); //get movie title
        }
        if (request.getParameter("title") != null) {
            vtitle = request.getParameter("title"); //get movie title
            select = request.getParameter("action"); //get select action
        }
        if (select != null) { //check if the member input movie title
            if (vtitle.equals("")) { //if student did not input 
                msg = "Please Input Movie Title"; 
            } else {
                if (select.equals("0") && Util.createOrder(memail, vtitle)) {
                    msg = "Book Success";
                } else if (select.equals("1") && Util.cancelOrder(memail, vtitle)) {
                    msg = "Cancel Success";
                } else {
                    msg = "Fail";
                }
            }
        }
        orders = Util.getAllOrdersMember(m.getEmail());
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
                <div class="login_box">
                    <div class="login_logo">
                        <h2 align="center">Member【<%=m.getName()%>】Booking center</h2>
                        <% if (!msg.equals("")) { %> 
                        <!-- Display the status message after student has selected -->
                        <h4 align="center" class="fontcolory">!【<%=msg%>】</h4> 
                        <% }
                        %>
                        <form action="booking.jsp" id="login_form" method="post">
                            <div class="form-group">
                                <label>Movie Title</label>
                                <input id="temail" class="fontcolorb" value="<%=vtitle%>" name="title" type="text"  maxlength="30">
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
                                        class="btn btn-primary btn-lg"> &nbsp;submit&nbsp; </button>
                            </div>
                        </form>
                        <%
                            if (orders != null && orders.size() > 0) { // if there is at least one booking
                        %>

                        <h3 align="center">Order History List</h3>
                        <table class="t1" align="center" border="3" width="400">
                            <tr>
                                <th>Order Id</th>
                                <th>Movie Title</th>
                                <th>Member Email</th>
                                <th>Movie Price</th>
                                <th>Status</th>
                            </tr>
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
                                
                                                    </div>
                                                    </div>
                                                    </div>
                                                    </div>
                                
                             
        
                            <%-- xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx --%>
                           <%//if user is Staff
                                } else { 
                                %>
                                <jsp:include page="ttop.jsp"/>
                            <div class="page-container">
                                <div class="main_box">
                                    <div class="login_box">
                                        <div class="login_logo">
                                            <h2 align="center">Tutor【<%=s.getName()%>】Viewall center</h2>
                                            <%
                                                if (!msg.equals("")) {%> <!--Same as above-->
                                            <h4 align="center">Status【<%=msg%>】</h4>
                                            <%}
                                            %>
                                            <form action="booking.jsp" id="login_form" method="post">
                                                <div class="form-group">
                                                    <label>Student Email</label>
                                                    <input id="semail" value="<%=memail%>" name="name" type="text"  maxlength="30">
                                                </div>
                                                <div class="form-group">
                                                    <label>action</label>
                                                    <select name="action" width="15px" >
                                                        <option value="0" selected="selected">cancel</option>
                                                        <option value="1">complete</option>
                                                    </select>
                                                </div>
                                                <div>
                                                    <button type="submit"  id="tsubmit_btn"
                                                            class="btn btn-primary btn-lg"> &nbsp;submit&nbsp; </button>
                                                </div>

                                            </form>
                                            <%
                                                if (orders != null && orders.size() > 0) {
                                            %>

                                            <h3 align="center">Book List</h3>
                                            <table class="t1" align="center" border="1" width="400">
                                                <tr>
                                                    <th>Order Id</th>
                                                    <th>Movie Title</th>
                                                    <th>Member Email</th>
                                                    <th>Movie Price</th>
                                                    <th>Status</th>
                                                </tr>
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
                                                 </div>
                                                    </div>
                                                    </div>
                                                    </div>
                                                    <%
                                                        }
                                                    %>


                                             </body>
                                           </html>