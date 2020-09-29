<%@page import="java.util.ArrayList"%>
<%@page import="Object.User"%>
<%@page import="Model.UserModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

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

%>
<!DOCTYPE html>
<style>
    table, th, td {
        border: 1px solid black;
    }
</style>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>

    </head>
    <body>
        <h1 style="text-align: center">Admin Page</h1>
        Welcome <strong><%=Name_User%></strong>!   <a href ="logout">Logout</a><br/>
    </div><br>
    <button type="button" onclick="location.href = 'CreateAccount.jsp'">Add new Account</button>
    <div class="card">
        <h2><strong>Show all user</strong></h2> 
        <!--create new account-->

        <!--add new user-->
        <form role="search" action="dashboard.jsp?s=<%=s%>">
            <div>
                <input type="text"  placeholder="Search" name="s" value="<%=s%>">
                <button>Search</button>
            </div>
        </form>

        <div>
            <ul>
                <a href="index.jsp?tab=">All(<%=countSub + countAdmin%>)</a>
                <a href="index.jsp?tab=1">Administrator(<%=countAdmin%>)</a>
                <a href="index.jsp?tab=2">Subscriber(<%=countSub%>)</a>
            </ul>
        </div>
        <%
            if (session.getAttribute("check") != null) {
                if (session.getAttribute("check").equals("trueAcc")) {
        %>

        <h3 style="color: red"> You can not change your account</h3>
        <%
        } if(session.getAttribute("check").equals("trueNull")) {
        %>
         <h3 style="color: red"> Please check account you want to change !!!!</h3>
        <%
                }
            }
        %>
        <form action="update_user.jsp" id="check">
            <div>
                <!--Change role-->
                <div >
                    <select  name="role">
                        <option value="1">Change Role to Administrator</option>
                        <option value="2">Change Role to Subscriber</option>
                    </select>
                    <button type="submit">Change</button>
                </div><br>


                <!--Change role end-->
            </div>
            <script>
                function toggle(source) {
                    var checkboxes = document.querySelectorAll('input[type="checkbox"]');
                    for (var i = 0; i < checkboxes.length; i++) {
                        if (checkboxes[i] !== source)
                            checkboxes[i].checked = source.checked;
                    }
                }</script>
            <div>
                <table>
                    <thead>
                        <tr>
                            <th <input type="checkbox" onclick="toggle(this)"/>Username</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Role</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
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
                        %>
                        <tr>
                            <td><input type="checkbox" name="User" value="<%=user.getUsername()%>"><%=user.getUsername()%></td>
                            <td><%=Name%></td>
                            <td><%=user.getEmail()%></td>
                            <td><%=Role_Show%></td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </form>
    </div>

</div>
</div>                   
</body>
</html>
