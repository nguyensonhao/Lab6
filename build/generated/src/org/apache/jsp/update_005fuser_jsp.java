package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import Model.UserModel;

public final class update_005fuser_jsp extends org.apache.jasper.runtime.HttpJspBase
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

    UserModel um = new UserModel();
    //get role 
    int role = Integer.parseInt(request.getParameter("role"));
    //get username
    String User = session.getAttribute("username").toString();
    //get all user was check on checkbox
    String[] userlist = request.getParameterValues("User");
    if (session.getAttribute("check")!=null) {
            session.setAttribute("check", null);
        }
    session.setAttribute("check", "false");
    boolean check = false;
    if (userlist != null) {
        for (String u : userlist) {
            //if choose yourself account
            if (User.equals(u)) {
                check = true;
                session.setAttribute("check", "trueAcc");
              break;
            }
        }
        for (String u : userlist) {
            
            if (!check) {
                um.updateAccount(u, role);
            }
        }
    }else{//if don't choose checkbox
        
        session.setAttribute("check","trueNull");
    }
    response.sendRedirect("dashboard.jsp");



      out.write('\n');
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
