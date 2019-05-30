<%-- 
    Document   : uploadAction
    Created on : 18/04/2019, 5:24:01 PM
    Author     : chenyizhe
--%>

<%@page import="oms.dao.DBManager"%>
<%@page import="java.sql.Connection"%>
<%@ page import="oms.controller.*"%>
<%@page import="oms.dao.DBConnector"%>
<%@ page language="java"  %>
<%@ page import="oms.*" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Date" %>

<%
        //Activate the database add-function once DBManager functions are completed
        DBManager manager = (DBManager)session.getAttribute("manager");
	//get parameters
	String title = request.getParameter("title");
        String genre = request.getParameter("genre");
        String ratingstr = request.getParameter("rating");
        String pricestr = request.getParameter("price");
        String yearstr = request.getParameter("year");
        String copystr = request.getParameter("copies");
        String description = request.getParameter("description");
        String url = request.getParameter("url");
        
        // Data Validator
        Validator v = new Validator();
        
        if (title == null || "".equals(title)){
		session.setAttribute("titleErr", "Please input movie title");
                response.sendRedirect("upload.jsp");
   		return;//check title
	}
	else if (ratingstr==null || "".equals(ratingstr) || !v.validateMovie(ratingstr) || !v.validateMovieRating(ratingstr)){
		session.setAttribute("ratingErr", "Please check movie rating");
                response.sendRedirect("upload.jsp");
   		return; // check rating
	}
        else if (pricestr==null || "".equals(pricestr) || !v.validateMovie(pricestr)){
		session.setAttribute("priceErr", "Please check movie price");
                response.sendRedirect("upload.jsp");
   		return; // check rating
	}
        else if (yearstr==null || "".equals(yearstr) || !v.validateMovie(yearstr)){
		session.setAttribute("yearErr", "Please check movie year");
                response.sendRedirect("upload.jsp");
   		return; // check rating
	}
        else if (copystr==null || "".equals(copystr) || !v.validateMovie(copystr)){
		session.setAttribute("copyErr", "Please check movie copies");
                response.sendRedirect("upload.jsp");
   		return; // check rating
	}
        else if (description==null || "".equals(description)){
		session.setAttribute("desErr", "Please input movie description");
                response.sendRedirect("upload.jsp");
   		return; // check rating
	}
        else if (url==null || "".equals(url)){
		session.setAttribute("urlErr", "Please input movie poster url");
                response.sendRedirect("upload.jsp");
   		return; // check rating
	} 
        
        if (manager.checkMovie(title)!= null ){
		session.setAttribute("errorMessage", "Movie already exist!");
		response.sendRedirect(request.getContextPath()+"/uploadError.jsp");
		return; 
	}
        // convert string parameter to int 
        int rating = Integer.parseInt(request.getParameter("rating"));
        int price = Integer.parseInt(request.getParameter("price"));
        int movieyear = Integer.parseInt(request.getParameter("year"));
        int copies = Integer.parseInt(request.getParameter("copies"));
	Object movie = null;
	String nextPage= "";
	Movie o = new Movie(title,genre,price,copies,rating,movieyear,description,url);
        //add new movie to database
        manager.addMovie(title,genre,price,rating,copies,movieyear,description,url);
        nextPage = request.getContextPath()+"/main.jsp";
		
	try{
            session.setAttribute("movie", movie);
            response.sendRedirect(nextPage);
            return ;
	}catch(Exception e) 
	{
%>
		
<%
	}
%>	
