

<%@page import="java.util.ArrayList"%>
<%@page import="Object.User"%>
<%@page import="Model.UserModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    UserModel um = new UserModel();
    String Name_User = "";
    //get username
    String Username = session.getAttribute("username").toString();
    ArrayList<User> list = um.LoadUserByUserName(Username);//load information with username
    if (session.getAttribute("username") != null) {
        for (User user : list) {
            //get full name user
            if (Username.equals(user.getUsername())) {
                Name_User += user.getFName() + " " + user.getLName();
            }
        }
    }

%>

<!DOCTYPE html>
<style>
table, th, td {
  border: 1px solid black;
}
</style>
<html>
    <head>
        <meta http-equiv="Contents-Type" content="text/html; charset=UTF-8">

        <title>User Page</title>
    </head>
    <body>
        <div class="page-header">
            <h1 style="text-align: center">User Page</h1>
            Welcome <strong><%=Name_User%></strong>! <a href="logout.jsp" class="btn btn-info" role="button"> Logout </a><br/>                                

            <div class="card"><h2><strong>Show all user</strong></h2>
                <form class="navbar-form" role="search"></form>
                <div class="collapse navbar-collapse navbar-ex1-collapse">
                </div>
                <form>
                    <table>
                        <thead >
                            <tr>
                                <th style="text-align: center">No.</th>
                                <th>Username</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Role</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                int i = 0;
                                //load infomation of account user
                                for (User user : list) {
                                    String Name = user.getFName() + " " + user.getLName();
                                    String Role_Show = "";
                                    if (user.getRoleId() == 1) {
                                        Role_Show = "Administrator";
                                    } else if (user.getRoleId() == 2) {
                                        Role_Show = "Subscriber";
                                    }
                            %>
                            <tr>
                                <td><%=++i%></td>
                                <td><%=user.getUsername()%></td>
                                <td><%=Name%></td>
                                <td><%=user.getEmail()%></td>
                                <td><%=Role_Show%></td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>
    </body>
</html>

