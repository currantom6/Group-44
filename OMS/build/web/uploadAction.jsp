<%-- 
    Document   : uploadAction
    Created on : 18/04/2019, 5:24:01 PM
    Author     : chenyizhe
--%>

<%@page import="oms.dao.DBManager"%>
<%@page import="java.sql.Connection"%>
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
	//set parameters
	String title = request.getParameter("title");
        String genre = request.getParameter("genre");
	int rating = Integer.parseInt(request.getParameter("rating"));
        int price = Integer.parseInt(request.getParameter("price"));
        int movieyear = Integer.parseInt(request.getParameter("year"));
        int copies = Integer.parseInt(request.getParameter("copies"));
        String description = request.getParameter("description");
        String url = request.getParameter("url");
        
        if (manager.checkMovie(title)!= null ){
		session.setAttribute("errorMessage", "Movie already exist!");
		response.sendRedirect(request.getContextPath()+"/uploadError.jsp");
		return; 
	}

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
