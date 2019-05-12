<%-- 
    Document   : uploadAction
    Created on : 18/04/2019, 5:24:01 PM
    Author     : chenyizhe
--%>

<%@ page language="java"  %>
<%@ page import="oms.*" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="logic.Util" %>
<%@ page import="xml.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Date" %>

<%

	//set parameters
	String title = request.getParameter("title");
	int rating = Integer.parseInt(request.getParameter("rating"));
        int price = Integer.parseInt(request.getParameter("price"));
        int year = Integer.parseInt(request.getParameter("year"));
        int copies = Integer.parseInt(request.getParameter("copies"));
        String description = request.getParameter("description");
        String url = request.getParameter("url");
	
	int genreIndex = 0;
	if (request.getParameter("genre") != null){
		genreIndex = Integer.parseInt(request.getParameter("genre"));
	}
	
        String genre = "";
	switch (genreIndex){
		case 1:
		    genre = "Comedy";
		    break;
		case 2:
		    genre = "Action";
		    break;
		case 3:
		    genre = "Horror";
		    break;
		case 4:
		    genre = "Romance";
		    break; 
                case 5:
                    genre = "Fantasy";
		    break;
                case 6:
                    genre = "Animation";
		    break;
                case 7:
                    genre = "Crime";
		    break;
                case 8:
                    genre = "Drama";
		    break;
                case 9:
                    genre = "War";
		    break;
                case 10:
                    genre = "Adventure";
		    break;
                case 11:
                    genre = "Family";
		    break;
	}

	Object movie = null;
	String nextPage= "";
        
			Movie o = new Movie(title,genre,price,copies,rating,year,description,url);
			Movies movies = ReadXml.readMovies();
			if (movies == null){
			    movies = new Movies();
			    movies.setMovieList(new ArrayList<Movie>());
			}
			movies.getMovieList().add(o);
			new WriteXml().writeMovies(movies);
			nextPage = request.getContextPath()+"/main.jsp";
                        //creat new staff
		
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
