<%-- 
    Document   : main
    Created on : 12/04/2019, 10:16:55 PM
    Author     : chenyizhe
--%>

<%@page import="oms.dao.DBManager"%>
<%-- 
    Document   : index
    Created on : 12/04/2019, 8:35:33 PM
    Author     : chenyizhe
--%>
<%@ page language="java" import="java.util.*" %>
<%@ page language="java" import="oms.*" pageEncoding="UTF-8" %>
<%@ page import="oms.*" %>


<% 
    Object user = session.getAttribute("user");
    Member m = null;
    Staff s = null;
    //check if user is member
    if (user instanceof Member){ 
        m = (Member)user;
    // check if user is staff
    }else if (user instanceof Staff){ 
        s = (Staff)user;
    }else {
        m = null;
        s = null;
    }
    DBManager manager = (DBManager)session.getAttribute("manager");
    //movie list
    List<Movie> movieList = null;
    movieList = manager.listAllMovies();     
%>

<% 
        if (request.getParameter("content") != null) {
            String content = request.getParameter("content");
            String title = content;
            String genre = content;
            movieList = manager.findMovies(title,genre);
        }
        %>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Main Page</title>
        <link rel="stylesheet" href="css/bootstrap.min.css" >
        <link rel="stylesheet" href="css/style.css">
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    </head>
    <body style="background-color: rgb(38, 38, 38);">
        
     
        <%-- Main Body --%>
        <% if(m != null) { %>
        <%-- member nav bar --%>
        <jsp:include page="membernav.jsp"/>
        <%-- Left column --%>
        <div class="container-fluid text-center">
            <div class="row content">
                <div class="col-sm-2 fontcolor">
                    <h3>Coming Soon</h3>
                    <div>
                        <p><img src="images/shazam.png" alt="shazam" style="width: 150px;height: 210px;"></p>
                    </div>
                    <div>
                        <p><img src="images/hellboy.png" alt="hellboy" style="width: 150px;height: 210px;"></p>
                    </div>
                </div>   
                
              <%-- main body --%>
                <div class="col-sm-8 text-center fontcolor">
                    <h1 class="fontcolory">Welcome - <%=m.getName() %>[Member]</h1>
                    <%-- search movie --%>
                    <form action="main.jsp" id="login_form" method="post">
                        <div class="form-group fontcolorb" align="center">
                        <label class="fontcolor">Find Movie By</label>
                        <input id="name" value="" name="content" type="text"  maxlength="30">
                        <button type="submit"  id="submit_btn" class="btn btn-warning btn-sm">Search</button>
                        <br>
                        <br>
                        <a href="main.jsp" id="submit_btn" class="btn btn-danger btn-lg">View All Movies</a>
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
                            <a class="btn btn-default" href="<%=request.getContextPath()%>/booking.jsp?memail=<%=m.getEmail()%>&vtitle=<%=v.getTitle()%>&vprice=<%=v.getPrice()%>">Order</a>
                            <% }else{ %>
                            <button type="button" class="btn btn-warning" disabled>Out of Stock</button>
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
                <div class="col-sm-2 fontcolor">
                    <h3>Coming Soon</h3>
                    <div>
                        <p><img src="images/skyscraper.jpg" alt="skyscraper" style="width: 150px;height: 210px;"></p>
                    </div>
                    <div>
                        <p><img src="images/captainmarvel.png" alt="captainmarvel" style="width: 150px;height: 210px;"></p>
                    </div>
                </div>   
                 
                
              </div> 
               
        </div>
           
        <%-- else login as staff --%>
        <% } else if( s != null && s.getPosition().equals("Admin") ) { %>
        <jsp:include page="adminnav.jsp"/>
        <div class="container fontcolor" align="center">
            <h1 class="fontcolory">Welcome to OMS - <%=s.getName() %>[Staff]</h1>
            <h3>Welcome, Admin Staff! </h3>
            <h3>You can manage movies now!</h3>
        </div>
        <% } else if ( s != null && !s.getPosition().equals("Admin") ) { %>
        <jsp:include page="staffnav.jsp"/>
        <div class="container fontcolor" align="center">
            <h1 class="fontcolory">Welcome to OMS - <%=s.getName() %>[Staff]</h1>
            <h3>Welcome, Normal Staff!</h3>
            <h3>You can manage movies now!</h3>
        </div>
        
        <% } else if (m == null && s == null){ %>
       <%-- anonymous user nav bar --%>
        <jsp:include page="anonymousnav.jsp"/>
        <%-- view as Anonymous User --%>
        <%-- Left column --%>
        <div class="container-fluid text-center">
            <div class="row content">
                <div class="col-sm-2 fontcolor">
                    <h3>Coming Soon</h3>
                    <div>
                        <p><img src="images/shazam.png" alt="shazam" style="width: 150px;height: 210px;"></p>
                    </div>
                    <div>
                        <p><img src="images/hellboy.png" alt="hellboy" style="width: 150px;height: 210px;"></p>
                    </div>
                </div>   
                
              <%-- main body --%>
                <div class="col-sm-8 text-center fontcolor">
                    <h1 class="fontcolory">Welcome to OMS</h1>
                    <%-- search movie --%>
                    <form action="main.jsp" id="login_form" method="post">
                        <div class="form-group fontcolorb" align="center">
                        <label class="fontcolor">Find Movie By</label>
                        <input id="name" value="" name="content" type="text"  maxlength="30">
                        <button type="submit"  id="submit_btn" class="btn btn-warning btn-sm">Search</button>
                        <br>
                        <br>
                        <a href="main.jsp" id="submit_btn" class="btn btn-danger btn-lg">View All Movies</a>
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
                            <a class="btn btn-default" href="#">Book</a>
                            <% }else{ %>
                            <button type="button" class="btn btn-warning" disabled>Out of Stock</button>
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
                <div class="col-sm-2 fontcolor">
                    <h3>Coming Soon</h3>
                    <div>
                        <p><img src="images/skyscraper.jpg" alt="skyscraper" style="width: 150px;height: 210px;"></p>
                    </div>
                    <div>
                        <p><img src="images/captainmarvel.png" alt="captainmarvel" style="width: 150px;height: 210px;"></p>
                    </div>
                </div>   
                 
                
              </div> 
               
        </div>
        <% } %>
        
        
    </body>
</html>

