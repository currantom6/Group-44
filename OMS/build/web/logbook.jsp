<%-- 
    Document   : AccessLog
    Created on : 17/05/2019, 7:21:32 PM
    Author     : chenyizhe
--%>

<%@page import="oms.dao.DBManager"%>
<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ page import="oms.*" %>
<%@ page language="java" import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>LogBook</title>
        <link rel="stylesheet" href="css/bootstrap.min.css" >
        <link rel="stylesheet" href="css/style.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    </head>
    <body style="background-color: rgb(38, 38, 38);">
       <% 
        Object user = (Object)session.getAttribute("user");
        //access log list
        List<Log> logList = null;
        String date = null;
        Member m = null;
        Staff s = null;
        DBManager manager = (DBManager)session.getAttribute("manager");
        if (user instanceof Member){ 
        m = (Member)user;
            }else if (user instanceof Staff){
        s = (Staff)user;
        }
        if (m != null){
        logList = manager.listAllLogs(m.getEmail());
            }else{
        logList = manager.listAllLogs(s.getEmail());
        }
       %>
       
       <%--Navigation Bar --%>

    <% if (m!=null){ %>
      <jsp:include page="membernav.jsp"/>
    <% } else if( s != null && s.getPosition().equals("Admin") ) { %>
        <jsp:include page="adminnav.jsp"/>
    <% } else if ( !s.getPosition().equals("Admin") ) {%>
        <jsp:include page="staffnav.jsp"/>
    <% } %>
    
    <div class="container-fluid fontcolor">
        <div class="row content">
        <br>
        <h2 align="center" class="fontcolory">LogBook Center</h2>
        <br>
        <div class="col-sm-2"></div>
        <div class="col-sm-8 text-center fontcolor">
         <%-- member table --%>
         <table class="table table-dark movies">
                        <thead>
                        <tr>
                            <th>User Email</th>
                            <th>Login Date</th>
                            <th></th>
                        </tr>
                        </thead>
                        <% if (logList != null && logList.size() > 0) { %>
                         <% for(Log log: logList){ %>
                         
                        <tr>
                            <td><%=log.getEmail() %></td>
                            <td><%=log.getLogDate() %></td>
                            <td><a style="color:red" href="<%=request.getContextPath()%>/deleteLogAction.jsp?logdate=<%=log.getLogDate()%>">Delete Log</a></td>
                        
                        <%  }
                          }
                        %>
                        </tr>
                        
                  </table>
                   <br>
              </div>
        </div>
    </div>
    
    </body>
    
    
</html>
