package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;

public final class loginStaff_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("  <title>Login</title>\n");
      out.write("  <link rel=\"stylesheet\" href=\"css/bootstrap.min.css\" >\n");
      out.write("  <link rel=\"stylesheet\" href=\"css/style.css\">\n");
      out.write("  <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js\"></script>\n");
      out.write("  <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js\"></script>\n");
      out.write("  <script type=\"text/javascript\" src=\"js/time.js\"></script>\n");
      out.write("</head>\n");
      out.write("<body style=\"background-color: rgb(38, 38, 38);\" onload=\"startTime()\">\n");
      out.write("\n");
      out.write("    ");
      out.write("\n");
      out.write("        <nav class=\"navbar navbar-inverse\">\n");
      out.write("            <div class=\"container-fluid\">\n");
      out.write("                <div class=\"navbar-header\">\n");
      out.write("                    <a href=\"index.jsp\">\n");
      out.write("                    <img src=\"images/logo.png\" alt=\"logo\" style=\"width: 120px;height: 65px;\">\n");
      out.write("                    </a>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"nav navbar-header\">\n");
      out.write("                <h3 class=\"fontcolor\">Welcome to OMS</h3>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </nav>\n");
      out.write("        ");
      out.write("\n");
      out.write("        <div class=\"fontcolory\" style=\"text-align: right\"><span class=\"time\" id=\"time\" ></span></div>\n");
      out.write("      \n");
      out.write("     <h1 align=\"center\" class=\"fontcolor\">Login</h1>\n");
      out.write("\n");
      out.write("      <div class=\"container struct fontcolor\" align=\"center\">\n");
      out.write("        <form action=\"loginAction.jsp\" method=\"post\">\n");
      out.write("          <div class=\"form-group\">\n");
      out.write("            <label>Email</label>\n");
      out.write("            <input value=\"\" name=\"email\" type=\"text\" class=\"form-control\" placeholder=\"Enter email\" id=\"email\">\n");
      out.write("          </div>\n");
      out.write("          <div class=\"form-group\">\n");
      out.write("            <label>Password</label>\n");
      out.write("            <input value=\"\" name=\"password\" type=\"password\" class=\"form-control\" id=\"password\" placeholder=\"Enter password\">\n");
      out.write("          </div>\n");
      out.write("          ");
      out.write("\n");
      out.write("          <div class=\"form-group\">\n");
      out.write("            <label>User Identify</label>\n");
      out.write("            <select class=\"form-control\" name = \"identity\" >\n");
      out.write("              <option value =\"1\" selected=\"selected\">Member</option>\n");
      out.write("              <option value =\"2\">Staff</option>\n");
      out.write("            </select>\n");
      out.write("          </div>\n");
      out.write("         \n");
      out.write("            <button type=\"submit\" class=\"btn btn-primary\"> &nbsp;Login&nbsp; </button> \n");
      out.write("        </form>\n");
      out.write("          <br>\n");
      out.write("          <p>Not a member? Click here to register</p>\n");
      out.write("          <p><a href=\"register.jsp\">Register</a></p>\n");
      out.write("      </div>\n");
      out.write("   \n");
      out.write("</body>\n");
      out.write("</html>\n");
      out.write("\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
