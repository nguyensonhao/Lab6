package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.ArrayList;
import Object.User;
import Model.UserModel;

public final class dashboard_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    ArrayList<User> list = new ArrayList<User>();
    ArrayList<User> listU = um.loadAccount();
    String s = ""; //s = search;

    //check search
    if (request.getParameter("s") != null) {
        s = request.getParameter("s");
        list = um.SearchUser(s);//load account with searching
    }

    //check role load
    String tab = "";
    if (request.getParameter("tab") != null) {
        tab = request.getParameter("tab");
    }
    if (s.equals("")) {
        if (tab.equals("")) {
            list = um.loadAccount();
        }
        if (tab.equals("1")) {
            list = um.LoadUserByRoleID(1);
        }
        if (tab.equals("2")) {
            list = um.LoadUserByRoleID(2);
        }
    }

    String Name_User = "";

    //count account in DB
    int countAdmin = 0;
    int countSub = 0;
    if (session.getAttribute("username") != null) {
        String Username = session.getAttribute("username").toString();
        for (User user : listU) {
            if (user.getRoleId() == 1) {
                countAdmin++;
            }

            if (user.getRoleId() == 2) {
                countSub++;
            }
            //get full name of user
            if (Username.equals(user.getUsername())) {
                Name_User += user.getFName() + " " + user.getLName();
            }
        }
    } else {
        response.sendRedirect("Login.jsp");
    }


      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<style>\n");
      out.write("    table, th, td {\n");
      out.write("        border: 1px solid black;\n");
      out.write("    }\n");
      out.write("</style>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Admin Page</title>\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h1 style=\"text-align: center\">Admin Page</h1>\n");
      out.write("        Welcome <strong>");
      out.print(Name_User);
      out.write("</strong>!   <a href =\"logout\">Logout</a><br/>\n");
      out.write("    </div><br>\n");
      out.write("    <button type=\"button\" onclick=\"location.href = 'CreateAccount.jsp'\">Add new Account</button>\n");
      out.write("    <div class=\"card\">\n");
      out.write("        <h2><strong>Show all user</strong></h2> \n");
      out.write("        <!--create new account-->\n");
      out.write("\n");
      out.write("        <!--add new user-->\n");
      out.write("        <form role=\"search\" action=\"dashboard.jsp?s=");
      out.print(s);
      out.write("\">\n");
      out.write("            <div>\n");
      out.write("                <input type=\"text\"  placeholder=\"Search\" name=\"s\" value=\"");
      out.print(s);
      out.write("\">\n");
      out.write("                <button>Search</button>\n");
      out.write("            </div>\n");
      out.write("        </form>\n");
      out.write("\n");
      out.write("        <div>\n");
      out.write("            <ul>\n");
      out.write("                <a href=\"index.jsp?tab=\">All(");
      out.print(countSub + countAdmin);
      out.write(")</a>\n");
      out.write("                <a href=\"index.jsp?tab=1\">Administrator(");
      out.print(countAdmin);
      out.write(")</a>\n");
      out.write("                <a href=\"index.jsp?tab=2\">Subscriber(");
      out.print(countSub);
      out.write(")</a>\n");
      out.write("            </ul>\n");
      out.write("        </div>\n");
      out.write("        ");

            if (session.getAttribute("check") != null) {
                if (session.getAttribute("check").equals("trueAcc")) {
        
      out.write("\n");
      out.write("\n");
      out.write("        <h3 style=\"color: red\"> You can not change your account</h3>\n");
      out.write("        ");

        } if(session.getAttribute("check").equals("trueNull")) {
        
      out.write("\n");
      out.write("         <h3 style=\"color: red\"> Please check account you want to change !!!!</h3>\n");
      out.write("        ");

                }
            }
        
      out.write("\n");
      out.write("        <form action=\"update_user.jsp\" id=\"check\">\n");
      out.write("            <div>\n");
      out.write("                <!--Change role-->\n");
      out.write("                <div >\n");
      out.write("                    <select  name=\"role\">\n");
      out.write("                        <option value=\"1\">Change Role to Administrator</option>\n");
      out.write("                        <option value=\"2\">Change Role to Subscriber</option>\n");
      out.write("                    </select>\n");
      out.write("                    <button type=\"submit\">Change</button>\n");
      out.write("                </div><br>\n");
      out.write("\n");
      out.write("\n");
      out.write("                <!--Change role end-->\n");
      out.write("            </div>\n");
      out.write("            <script>\n");
      out.write("                function toggle(source) {\n");
      out.write("                    var checkboxes = document.querySelectorAll('input[type=\"checkbox\"]');\n");
      out.write("                    for (var i = 0; i < checkboxes.length; i++) {\n");
      out.write("                        if (checkboxes[i] !== source)\n");
      out.write("                            checkboxes[i].checked = source.checked;\n");
      out.write("                    }\n");
      out.write("                }</script>\n");
      out.write("            <div>\n");
      out.write("                <table>\n");
      out.write("                    <thead>\n");
      out.write("                        <tr>\n");
      out.write("                            <th <input type=\"checkbox\" onclick=\"toggle(this)\"/>Username</th>\n");
      out.write("                            <th>Name</th>\n");
      out.write("                            <th>Email</th>\n");
      out.write("                            <th>Role</th>\n");
      out.write("                        </tr>\n");
      out.write("                    </thead>\n");
      out.write("                    <tbody>\n");
      out.write("                        ");

                            int i = 0;
                            //show all users
                            for (User user : list) {
                                String Name = user.getFName() + " " + user.getLName();
                                String Role_Show = "";
                                if (user.getRoleId() == 1) {
                                    Role_Show = "Administrator";
                                } else if (user.getRoleId() == 2) {
                                    Role_Show = "Subscriber";
                                }
                        
      out.write("\n");
      out.write("                        <tr>\n");
      out.write("                            <td><input type=\"checkbox\" name=\"User\" value=\"");
      out.print(user.getUsername());
      out.write('"');
      out.write('>');
      out.print(user.getUsername());
      out.write("</td>\n");
      out.write("                            <td>");
      out.print(Name);
      out.write("</td>\n");
      out.write("                            <td>");
      out.print(user.getEmail());
      out.write("</td>\n");
      out.write("                            <td>");
      out.print(Role_Show);
      out.write("</td>\n");
      out.write("                        </tr>\n");
      out.write("                        ");

                            }
                        
      out.write("\n");
      out.write("                    </tbody>\n");
      out.write("                </table>\n");
      out.write("            </div>\n");
      out.write("        </form>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("</div>\n");
      out.write("</div>                   \n");
      out.write("</body>\n");
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
