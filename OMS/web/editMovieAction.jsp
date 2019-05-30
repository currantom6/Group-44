<%-- 
    Document   : editMovieAction
    Created on : 19/05/2019, 1:50:45 PM
    Author     : xianyulee
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
  <title>Edit Movie</title>
  <link rel="stylesheet" href="css/bootstrap.min.css" >
  <link rel="stylesheet" href="css/style.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
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
    Movie movie = (Movie) session.getAttribute("selectedMovie");
    // error handling message
    String showMsg = "";
    String msg = "Update Movie Details";
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
            
        
          <form action="editMovieAction.jsp" method="post">
          <div class="form-group">
            <label class="fontcolory">Movie Title</label>
            <input value="<%=movie.getTitle()%>" readonly name="title" type="text" class="form-control"  id="title">
          </div>
          <div class="form-group">
            <label class="fontcolory">Movie Genre</label>
            <input value="<%=movie.getGenre()%>" readonly name="genre" type="text" class="form-control"  id="genre">
          </div>
          <div class="form-group">
            <label class="fontcolory">Movie Rating</label>
            <input value="<%=movie.getRating()%>" name="rating" type="text" class="form-control"  id="rating">
          </div>
          <div class="form-group">
            <label class="fontcolory">Movie Year</label>
            <input value="<%=movie.getYear()%>" name="year" type="text" class="form-control"  id="movieyear">
          </div>
          <div class="form-group">
            <label class="fontcolory">Movie Price</label>
            <input value="<%=movie.getPrice()%>" name="price" type="text" class="form-control"  id="price">
          </div>
          <div class="form-group">
            <label class="fontcolory">Movie Copies</label>
            <input value="<%=movie.getCopies()%>" name="copies" type="text" class="form-control"  id="copies">
          </div>
          <div class="form-group">
            <label class="fontcolory">Movie Description</label>
            <textarea name="des" class="form-control" id="des" rows="3"><%=movie.getDescription()%></textarea>
          </div>
          <div class="form-group">
            <label class="fontcolory">Movie Poster URL</label>
            <input value="<%=movie.getUrl()%>" name="url" type="text" class="form-control"  id="url">
          </div>
          
          <%-- submit new account details --%>
         <button type="submit" class="btn btn-primary"> &nbsp; Update &nbsp; </button> 
        </form>
         <%
         //error handling message and 
         //get parameter
        if (request.getParameter("title")!=null){
        String vtitle = request.getParameter("title");
        String vgenre = request.getParameter("genre");
        String rating = request.getParameter("rating");
        String year = request.getParameter("year");
        String price = request.getParameter("price");
        String copies = request.getParameter("copies");
        String vdes = request.getParameter("des");
        String vurl = request.getParameter("url");
        
        if( rating.equals("") || year.equals("") || price.equals("") || copies.equals("") || vdes.equals("") || vurl.equals("")){
            showMsg = "Empty Input";
        } else {
            int vrating = Integer.parseInt(rating);
            int vyear = Integer.parseInt(year);
            int vprice = Integer.parseInt(price);
            int vcopies = Integer.parseInt(copies);
            //update movie details from database
            manager.updateMovie(vtitle, vgenre,vprice,vrating,vcopies,vyear,vdes,vurl);
            showMsg = "Update Success";
        }
    }
    %>
            <% if (!showMsg.equals("")) { %>
            <h3 align="center" class="fontcolory">!【<%=showMsg%>】</h3>
            <% } %>
          <% if (showMsg.equals("Update Success")) { %>
        <%-- transfer to index page automaticaly --%>
        <% response.setHeader("refresh","2;url=editMovie.jsp"); %>
        <% } %>
        </div>
         
       </div>
         
</body>
</html>