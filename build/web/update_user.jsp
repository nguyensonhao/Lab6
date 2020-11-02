<!----Update User->

<%@page import="Model.UserModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
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


%>
