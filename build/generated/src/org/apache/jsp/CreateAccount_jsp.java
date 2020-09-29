package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.Objects;
import java.util.ArrayList;
import Object.User;
import Model.UserModel;

public final class CreateAccount_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("\n");
      out.write("        <title>Create Account</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");

            if (session.getAttribute("erorr")!=null) {
      out.write("\n");
      out.write("                    <h2 style=\"color: red\" >");
      out.print(session.getAttribute("erorr"));
      out.write("</h2>\n");
      out.write("                    ");

                }
        
      out.write("\n");
      out.write("        \n");
      out.write("        <a class=\"black-text\" href=\"dashboard.jsp\">Back to Admin Page</a>\n");
      out.write("        <h1>Create New User</h1>\n");
      out.write("\n");
      out.write("\n");
      out.write("        <form onsubmit=\"validateMyForm()\" class=\"form-horizontal\" id=\"form\" action=\"addNEW\" method=\"POST\">\n");
      out.write("            <div>\n");
      out.write("                Username: <input type=\"text\"name=\"txtUser\" required>\n");
      out.write("            </div><br>\n");
      out.write("            <div>\n");
      out.write("                Email:\n");
      out.write("                    <input type=\"email\" name=\"email\" required>\n");
      out.write("            </div><br>\n");
      out.write("            <div>\n");
      out.write("                First Name:\n");
      out.write("                    <input type=\"text\" name=\"fname\" required>\n");
      out.write("            </div><br>\n");
      out.write("\n");
      out.write("            <div >\n");
      out.write("                Last Name:\n");
      out.write("                    <input type=\"text\" name=\"lname\" required>\n");
      out.write("            </div><br>\n");
      out.write("            <div>\n");
      out.write("                    Website: <input type=\"text\"name=\"website\" required>\n");
      out.write("            </div><br>\n");
      out.write("            <div>\n");
      out.write("                    Password: <input type=\"password\" name=\"password\" required>\n");
      out.write("            </div><br>\n");
      out.write("            <div>\n");
      out.write("                Send User Notification:\n");
      out.write("                <label>\n");
      out.write("                    <input type=\"checkbox\">\n");
      out.write("                    Send notification to user\n");
      out.write("                </label>\n");
      out.write("            </div><br>\n");
      out.write("            <div>\n");
      out.write("                Role:\n");
      out.write("                <select name=\"role\">\n");
      out.write("                    <option value=\"1\">Administrator</option>\n");
      out.write("                    <option value=\"2\">Subscriber</option>\n");
      out.write("                </select>\n");
      out.write("            </div><br>\n");
      out.write("            <div>\n");
      out.write("                    <button type=\"submit\">Save</button>\n");
      out.write("            </div><br>\n");
      out.write("\n");
      out.write("        </form>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
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
