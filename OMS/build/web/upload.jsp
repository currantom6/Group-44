<%-- 
    Document   : upload
    Created on : 18/04/2019, 5:08:59 PM
    Author     : chenyizhe
--%>

<%@page import="oms.Staff"%>
<%@page import="oms.Member"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<%
    Object user = session.getAttribute("user");
    Member m = null;
    Staff s = null;
    if (user instanceof Member){ //check if user is member
        m = (Member)user;
    }else if (user instanceof Staff){ // check if user is staff
        s = (Staff)user;
    }else {
        response.sendRedirect(request.getContextPath() + "/index.jsp");
        return;
    }   
 %>
<html>
  <head>
    <title>Upload Movie</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" >
    <link rel="stylesheet" href="css/style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  </head>
  
  <body style="background-color: rgb(38, 38, 38);">
  <%--Navigation Bar --%>
         <%--Navigation Bar --%>
       <% if( s != null && s.getPosition().equals("Admin") ) { %>
       <jsp:include page="adminnav.jsp"/>
       <% } else if ( !s.getPosition().equals("Admin") ) { %>
        <jsp:include page="staffnav.jsp"/>
       <% } %>
        
        <h1 align="center" class="fontcolor">Upload New Movie</h1>
  	<div class="container struct fontcolor" align="center">
				<form action="uploadAction.jsp" method="post">
					<div class="form-group">
						<label>Title</label>
						<input id="title" value="" name="title" type="text" class="form-control" placeholder="Enter movie title">
					</div>
                                        <div class="form-group">
						<label>Genre</label>
						<select class="form-control" name = "genre">
							<option value ="SCI-FI">SCI-FI</option>
							<option value ="Comedy">Comedy</option>
							<option value ="Action">Action</option>
							<option value ="Horror">Horror</option>
							<option value ="Romance">Romance</option>
                                                        <option value ="Fantasy">Fantasy</option>
                                                        <option value ="Animation">Animation</option>
                                                        <option value ="Crime">Crime</option>
                                                        <option value ="Drama">Drama</option>
                                                        <option value ="War">War</option>
                                                        <option value ="Adventure">Adventure</option>
                                                        <option value ="Family">Family</option>
						</select>
					</div>
					<div class="form-group">
						<label>Rating</label>
						<input id="rating" value="" name="rating" type="number" class="form-control" placeholder="(Max 10) Eg: 8 ">
					</div>
                                        <div class="form-group">
						<label>Price</label>
						<input id="price" value="" name="price" type="number" class="form-control" placeholder="Eg:30 ">
					</div>
                                        <div class="form-group">
						<label>Year</label>
						<input id="year" value="" name="year" type="number" class="form-control" placeholder="Eg:2018 ">
					</div>
                                        <div class="form-group">
						<label>Copies</label>
						<input id="copies" value="" name="copies" type="number" class="form-control" placeholder="Eg:15 ">
					</div>
                                        <div class="form-group">
                                             <label>Movie Description</label>
                                             <textarea name="description" class="form-control" id="description" rows="3"></textarea>
                                        </div>
                                        <div class="form-group">
						<label>Poster URL</label>
						<input id="title" value="" name="url" type="url" class="form-control" placeholder="Enter Image URL">
                                       </div>
                                       
					<div>
					    
   						<button type="submit" class="btn btn-primary">Upload</button>
					</div>
                               
				</form>
           
</div>
  </body>
</html>


