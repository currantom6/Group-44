<%-- 
    Document   : upload
    Created on : 18/04/2019, 5:08:59 PM
    Author     : chenyizhe
--%>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE html>
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
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a href="main.jsp">
                    <img src="images/logo.png" alt="logo" style="width: 120px;height: 65px;">
                    </a>
                </div>
                <div class="nav navbar-header">
                <h3 class="fontcolor">Welcome to OMS</h3>
                </div>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="index.jsp"><span class="glyphicon glyphicon-log-in btn btn-danger "></span> Log Out</a></li>
            </ul>
            <ul class="nav navbar-nav btn navbar-right">
                <li><a href ="<%=request.getContextPath()%>/main.jsp">Main</a></li>
                <li><a href ="<%=request.getContextPath()%>/admin.jsp">Admin</a></li>
                <li><a href ="<%=request.getContextPath()%>/account.jsp">Account</a></li>
            </ul>
            </div>
        </nav>
        
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
							<option value ="0"> </option>
							<option value ="1">Comedy</option>
							<option value ="2">Action</option>
							<option value ="3">Horror</option>
							<option value ="4">Romance</option>
                                                        <option value ="5">Fantasy</option>
                                                        <option value ="6">Animation</option>
                                                        <option value ="7">Crime</option>
                                                        <option value ="8">Drama</option>
                                                        <option value ="9">War</option>
                                                        <option value ="10">Adventure</option>
                                                        <option value ="11">Family</option>
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


