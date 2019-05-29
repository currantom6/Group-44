<%-- 
    Document   : editMember
    Created on : 19/05/2019, 12:26:37 AM
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
    //member list
    List<Member> memberList = null;
    memberList = manager.listAllMembers();

%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Member Page</title>
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
            String ID = content;
            memberList = manager.findMembers(title,ID);
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
                    <h1 class="fontcolory">Edit Current Members</h1>
                    <%-- search movie --%>
                    <form action="editMember.jsp" id="login_form" method="post">
                        <div class="form-group fontcolorb" align="center">
                        <label class="fontcolor">Find Member By</label>
                        <input id="name" name="content" type="text"  maxlength="30">
                        <button type="submit"  id="submit_btn" class="btn btn-warning btn-sm">Search</button>
                        <br>
                        <br>
                        <a href="editMember.jsp"   id="submit_btn" class="btn btn-danger btn-lg">View All Members</a>
                        </div>
                    </form>              
                    <%-- member table --%>
                    <table class="table table-dark movies">
                        <thead>
                        <tr>
                            <th>Member ID</th>
                            <th>Member Name</th>
                            <th>Member Email</th>
                            <th>Member Birthday</th>
                            <th>Member Phone</th>
                            <th></th>
                        </tr>
                        </thead>
                        <% if (memberList != null && memberList.size() > 0) { %>
                         <% for(Member member: memberList){ %>
                         
                        <tr>
                            <td><%=member.getID() %></td>
                            <td><%=member.getName() %></td>
                            <td><%=member.getEmail() %></td>
                            <td><%=member.getBirthday() %></td>
                            <td><%=member.getPhone() %></td>
                            <td><a class="fontcolory" href="<%=request.getContextPath()%>/editMemberAction.jsp?mID=<%=member.getID()%>&memail=<%=member.getEmail()%>&mname=<%=member.getName()%>&mdob=<%=member.getBirthday()%>&mpassword=<%=member.getPassword()%>">Edit Member</a></td>
                        
                        <% }} %>
                        </tr>
                    </table>
                    
                    
                </div>
                    
                    
                <%-- Right column --%>  
                <div class="col-sm-2 fontcolor"></div>   
                 
                
              </div> 
               
        </div>
        
    </body>
</html>


