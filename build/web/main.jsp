<%-- 
    Document   : main
    Created on : 12/04/2019, 10:16:55 PM
    Author     : chenyizhe
--%>

<%-- 
    Document   : index
    Created on : 12/04/2019, 8:35:33 PM
    Author     : chenyizhe
--%>
<%@ page language="java" import="java.util.*" %>
<%@ page import="xml.*" %>
<%@ page language="java" import="oms.*" pageEncoding="UTF-8" %>
<%@ page import="oms.*" %>
<%@ page import="logic.Util" %>

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
    
    //movie list
    List<Movie> movieList = null;
    if (m!=null){
        if (request.getParameter("name") != null) {
            Integer selectType =Integer.parseInt(request.getParameter("selectType")); // identify selectTyoe
            String content = request.getParameter("name");
            
            String title = null;
            String genre = null;
            int price = 0;
            int rating = 0;
            int year = 0;
            String url = null;
            Boolean status = null;
            
            //.trim(): delete all blank before and after 
            if (selectType ==1 && !content.trim().equals("")) { // search by movie title
                title = content;
            }else if (selectType == 2 && !content.trim().equals("")){ //search by genre
                genre = content;
            }else if (selectType == 3 && !content.trim().equals("")){ //search by price
                price = Integer.parseInt(content);
            }else if (selectType == 4 && !content.trim().equals("")){ //search by rating
                rating = Integer.parseInt(content);
            }else if (selectType == 5 && !content.trim().equals("")){ //search by year
                year = Integer.parseInt(content);
            }else if (selectType == 6 && !content.trim().equals("")){ //search by status
                if (content.toLowerCase().equals("available")){
                    status = true;
                }else if (content.toLowerCase().equals("unavailable")){
                    status = false;
                }
            }
            movieList = Util.getMovie(title, genre, price, rating, year, status,url);
        }
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
        <% if(m != null) {%>
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
        
                        <select name="selectType" >
                        <option value="0"></option>
                        <option value="1">Title</option>
                        <option value="2">Genre</option>
                        <option value="3">Price</option>
                        <option value="4">Rating</option>
                        <option value="5">Year</option>
                        <option value="6">Status</option>
                        </select>
                        <input id="name" name="name" type="text"  maxlength="30">
                        <button type="submit"  id="submit_btn" class="btn btn-warning btn-sm">Search</button>
                        <br>
                        <br>
                        <button type="submit"  id="submit_btn" class="btn btn-danger btn-lg">View All Movies</button>
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
                            <a class="btn btn-default" href="<%=request.getContextPath()%>/booking.jsp?memail=<%=m.getEmail()%>&vtitle=<%=v.getTitle()%>">Add Cart</a>
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
                            
                            <%-- Dropdown to the right side --%>
                            <%-- 
                            <ul class="dropdown-menu rightMenu">
                                <li><h5>Genre: <%=v.getGenre() %></h5></li>
                                <li><h5>Rating: <%=v.getRating() %>/10<span>&#9733;</span></h5></li> 
                                <li><h5>Year: <%=v.getYear() %></h5></li>
                                <li><h5>Price: <span>&#36;</span><%=v.getPrice() %></h5></li>
                                <li><h5>Status: <%=sta %></h5></li>
                                <li><h5><a class="btn btn-default" href="#">Add Cart</a></h5></li>
                            </ul>
                               --%> 
                        
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
        <% } else { %>
        
        <jsp:include page="staffnav.jsp"/>
        <div class="container fontcolor" align="center">
            <h1 class="fontcolory">Welcome to OMS - <%=s.getName() %>[Staff]</h1>
            <h3>You can manage movies now!</h3>
            
        </div>
        <% } %>
        
        
    </body>
</html>

