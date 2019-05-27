<%-- 
    Document   : order
    Created on : 26/05/2019, 5:12:03 PM
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
     //Activate the database add-function once DBManager functions are completed
    DBManager manager = (DBManager)session.getAttribute("manager");
         if (request.getParameter("vtitle") != null) {    
            Movie selectedMovie = manager.findMovie(request.getParameter("vtitle"));
            if (selectedMovie != null) {
            session.setAttribute("selectedMovie", selectedMovie);
            }   
        }
%>

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
    String showMsg = "";
    Movie movie = (Movie) session.getAttribute("selectedMovie");
%>

<html>
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Page</title>
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
                <br>
                <div class="col-sm-4"></div>
                <div class="col-sm-2">
                <a class="posterlia" data-toggle="popover-hover" data-placement="right" ><img src="<%=movie.getUrl() %>" alt="poster" style="width: 150px;height: 210px;">
                </a>
                </div>
                    <div class="col-sm-2">
                         <form action="order.jsp" method="post">
                            <div class="form-group">
                                <label class="fontcolory">Movie Title</label>
                                <input value="<%=movie.getTitle()%>" readonly name="title" type="text" class="form-control"  id="title">
                            </div>
                            <div class="form-group">
                                <label class="fontcolory">Movie Price</label>
                                <input value="<%=movie.getPrice()%>" readonly name="price" type="text" class="form-control"  id="price">
                            </div>
                            <div class="form-group">
                                <label class="fontcolory">How Many?</label>
                                <input value="" name="copies" type="text" class="form-control"  id="copies" placeholder="Number of copies">
                            </div>
                            <%-- submit order details --%>
                            <button type="submit" class="btn btn-primary"> &nbsp; Save &nbsp; </button>
                            <a href="main.jsp" class="btn btn-danger">Cancel</a>
                        </form>
                            <%
                            //error handling message and 
                            //get parameter
                            if (request.getParameter("title")!=null){
                                int key = (new Random()).nextInt(999999);
                                String ID = "" + key;
                                String status = "active";
                                String title = request.getParameter("title");
                                String copies = request.getParameter("copies");
                                if( copies.equals("")){
                                    showMsg = "Empty Input";
                                } else {
                                    int vcopies = Integer.parseInt(copies);
                                //add order to databse
                                manager.addOrder(ID,title,m.getEmail(),vcopies,status); 
                                showMsg = "Update Success";
                                    }
                                }
                            %>  
                            <% if (!showMsg.equals("")) { %>
                            <h4 align="center" class="fontcolorr">!【<%=showMsg%>】</h4>
                            <% } %>
                            <% if (showMsg.equals("Update Success")) { %>
                                <%-- transfer to index page automaticaly --%>
                            <% response.setHeader("refresh","1;url=main.jsp"); %>
                            <% } %>       
                    </div>     
                    <br>
            </div>  
                      
        </div>
             <% }  %>
                                
 </body>
 </html>