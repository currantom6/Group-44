<%-- 
    Document   : editMovie
    Created on : 19/05/2019, 1:42:53 PM
    Author     : chenyizhe
--%>

<%@page import="oms.dao.DBManager"%>
<%@ page language="java" import="java.util.*" %>
<%@ page language="java" import="oms.*" pageEncoding="UTF-8" %>
<%@ page import="oms.*" %>

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
    
    DBManager manager = (DBManager)session.getAttribute("manager");
    //movie list
    List<Movie> movieList = null;
    movieList = manager.listAllMovies();

%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Movie Page</title>
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
            String genre = content;
            movieList = manager.findMovies(title,genre);
        }
        %>
     
        <%--Navigation Bar --%>
       <% if( s != null && s.getPosition().equals("Admin") ) { %>
       <jsp:include page="adminnav.jsp"/>
       <% } else if ( !s.getPosition().equals("Admin") ) { %>
        <jsp:include page="staffnav.jsp"/>
       <% } %>
        
        <%-- Left column --%>
        <div class="container-fluid text-center">
            <div class="row content">
                <div class="col-sm-2 fontcolor"></div>   
                
              <%-- main body --%>
                <div class="col-sm-8 text-center fontcolor">
                    <h1 class="fontcolory">Edit Current Movies</h1>
                    <%-- search movie --%>
                    <form action="editMovie.jsp" id="login_form" method="post">
                        <div class="form-group fontcolorb" align="center">
                        <label class="fontcolor">Find Movie By</label>
                        <input id="name" name="content" type="text"  maxlength="30">
                        <button type="submit"  id="submit_btn" class="btn btn-warning btn-sm">Search</button>
                        <br>
                        <br>
                        <a href="editMovie.jsp"   id="submit_btn" class="btn btn-danger btn-lg">View All Movies</a>
                        </div>
                    </form>
                    
                    
                   
                    <%-- movie List --%>
                            <%-- Poster display --%>
                            <% if (movieList != null && movieList.size() > 0) { %>
                                <% for(Movie v: movieList){
                                String sta = "available";
                            if (!v.isStatus()) //check isStatus()
                                sta = "unavailable"; 
                             %> 
                            <ul class="list-inline posterul">
                            <li class="posterli" ><a class="posterlia" data-toggle="popover-hover" data-placement="right" ><img src="<%=v.getUrl() %>" alt="poster" style="width: 150px;height: 210px;">
                            <h3><%=v.getTitle() %></h3></a>
                            
                            <%-- if is available, display the add cart button which refer to bookingPage. --%>
                            <% if (v.isStatus()){ %>
                            <a class="btn btn-warning" href="<%=request.getContextPath()%>/editMovieAction.jsp?vtitle=<%=v.getTitle()%>&vgenre=<%=v.getGenre()%>&vrating=<%=v.getRating()%>&vyear=<%=v.getYear()%>&vprice=<%=v.getPrice()%>&vcopies=<%=v.getCopies()%>&vdes=<%=v.getDescription()%>&vurl=<%=v.getUrl()%>">Edit Movie</a>
                            <% }else{ %>
                            <button type="button" class="btn btn-warning" disabled>Rent Out</button>
                            <% } %>
                            </li>
                            </ul>
                            
                            <%-- hover the poster to see the details of the movie --%>
                            <script>
                             $('[data-toggle="popover-hover"]').popover({
                                html: true,
                                trigger: 'hover',
                                placement: 'right',
                                content: function () { return 'Genre: <%=v.getGenre() %><br>Rating: <%=v.getRating() %>/10<span>&#9733;</span><br>Year: <%=v.getYear() %><br>Price: <span>&#36;</span><%=v.getPrice() %><br>Copies: <%=v.getCopies() %><br>Status: <%=sta %><br><hr><%=v.getDescription() %>'; }
                                });
                            </script>
                        <% } %>
                    
                    <% } %>
                    
                </div>
                    
                    
                <%-- Right column --%>  
                <div class="col-sm-2 fontcolor"></div>   
                 
                
              </div> 
               
        </div>
        
    </body>
</html>

