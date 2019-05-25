<%-- 
    Document   : index
    Created on : 12/04/2019, 8:35:33 PM
    Author     : chenyizhe
--%>
<%@ page language="java" import="java.util.*" %>


<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Online Movie System</title>
       
        <link rel="stylesheet" href="css/bootstrap.min.css" >
        <link rel="stylesheet" href="css/style.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
 
    </head>
    <body style="background-color: rgb(38, 38, 38);">
        <%-- Navigation Bar --%>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a href="index.jsp">
                    <img src="images/logo.png" alt="logo" style="width: 120px;height: 65px;">
                    </a>
                </div>
                <div class="nav navbar-header">
                <h3 class="fontcolor">Welcome to OMS</h3>
                </div>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="register.jsp"><span class="glyphicon glyphicon-user btn btn-warning "></span> Sign Up</a></li>
            <li><a href="loginCenter.jsp"><span class="glyphicon glyphicon-log-in btn btn-success "></span> Login</a></li>
            </ul>
            </div>
        </nav>
        
        <%-- Main Body --%>
        <div class="container-fluid text-center">    
  <div class="row content">
      <div class="col-sm-1"></div>
        <div class="col-sm-10">
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
       <li data-target="#myCarousel" data-slide-to="2"></li>
        <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      
        <div class="item active">
            <img src="images/shazamBig.jpg" class="img-rounded" alt="shazam">
        <div class="carousel-caption">
          <h3>Shazam</h3>
          <h4></h4>
        </div>      
      </div>

      <div class="item">
        <img src="images/avengers.jpg" class="img-rounded" alt="avengers">
        <div class="carousel-caption">
          <h3>Avengers 4</h3>
          <h4>Endgame</h4>
        </div>      
      </div>
        
      <div class="item">
        <img src="images/captainmarvelBig.jpg" class="img-rounded" alt="captainmarvel">
        <div class="carousel-caption">
          <h3>Captain Marvel</h3>
          <h4></h4>
        </div>      
      </div>
        
        <div class="item">
        <img src="images/blackpanther.jpg" class="img-rounded" alt="blackpanther">
        <div class="carousel-caption">
          <h3>Black Panther</h3>
          <h4></h4>
        </div>      
      </div>
        
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
    
</div>
</div>
  </div>
        </div>
        <%-- view all movies --%>
        <br>
        <div class="container text-center">
        <a href="<%=request.getContextPath()%>/main.jsp" class="btn btn-lg btn-danger">View All Movies</a>
        </div>
        <br>
        <%-- Team information --%>
        <hr>
        <br>
        <div class="container text-center col-sm-12 fontcolor" style="background-color: rgb(38, 38, 38);">
            <div class="row">
                <div class="col-sm-4">
                    <h4>About Us</h4>
                    <p>The online
                         application will allow the users to register and login into the application using their user id and password. 
                         Once logged in, the application will allow the authorized
                         MS staff users to manage the movie collection online and track customer orders, and allow
                        customer users to browser, search, order movies online and track their orders. The
                        authorised MS staff should be able to manage users and application access logs.</p>
                </div>
                <div class="col-sm-4"> 
                    <h4>Management Team</h4>  
                    <p><br>Matthew Choy<br>Xianyu Li<br>Yizhe CHEN<br>Ryan Ahadizad<br>Tom Curran<br></p>
                </div>
                <div class="col-sm-4">
                    <div class="col-sm-3"></div>
                    <div>
                        <img src="images/follow.png" class="img-responsive" style="width:50%;" alt="media">
                    </div>
                    
                </div>
            </div>
        </div><br>

        <footer class="container-fluid text-center" style="background-color: rgb(38, 38, 38);">
            <div class="fontcolor"> Copyright &copy; Online Movie System(2019) <a href="index.jsp">Welcome</a></div>
        </footer>
        <jsp:include page="/ConnServlet" flush="true" />
    </body>
</html>
