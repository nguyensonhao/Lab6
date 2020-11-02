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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="bootstrap-3.4.1-dist/css/bootstrap-theme.css">
        <link rel="stylesheet" href="bootstrap-3.4.1-dist/css/bootstrap-theme.css.map">
        <link rel="stylesheet" href="bootstrap-3.4.1-dist/css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="bootstrap-3.4.1-dist/css/bootstrap-theme.min.css.map">
        <link rel="stylesheet" href="bootstrap-3.4.1-dist/css/bootstrap.css">
        <link rel="stylesheet" href="bootstrap-3.4.1-dist/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <title>Admin Page</title>
        <script>
            $(document).ready(function () {
                $('#checkBoxAll').click(function () {
                    if ($(this).prop("checked") == true) {
                        $("input:checkbox").attr('checked', true);
                        $("#uncheck").attr('checked', false);
                    } else if ($(this).prop("checked") == false) {
                        $("input:checkbox").attr('checked', false);
                    }
                });
            });
        </script>
    </head>
    <body>
        <div class="container">
            <div class="jumbotron">
                <h1 style="text-align: center">Admin Page</h1>
            </div>
            <div class="alert alert-success">
                Welcome <strong><%=Name_User%></strong>!   <a href ="logout"><span class="label label-danger">Logout</span></a><br/>
                <button type="button" class="btn btn-primary" onclick="location.href = 'CreateAccount.jsp'">Add new Account</button>
            </div>
            <div class="well well-lg">
                <h2><strong>Show all user</strong></h2> 
                <!--create new account-->

                <!--add new user-->
                <form class="navbar-form" role="search" action="dashboard.jsp?s=<%=s%>">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search" name="s" id="srch-term" value="<%=s%>">
                        <div class="input-group-btn">
                            <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>                </div>
                    </div>
                </form>

                <div class="collapse navbar-collapse navbar-ex1-collapsecollapse">
                    <ul class="nav navbar-nav">
                        <li><a class="alert alert-warning" href="index.jsp?tab=">All(<%=countSub + countAdmin%>)</a></li>
                        <li><a class="alert alert-warning" href="index.jsp?tab=1">Administrator(<%=countAdmin%>)</a></li>
                        <li><a class="alert alert-warning" href="index.jsp?tab=2">Subscriber(<%=countSub%>)</a></li>
                    </ul>
                </div>
                <%
                    if (session.getAttribute("check") != null) {
                        if (session.getAttribute("check").equals("trueAcc")) {
                %>

                <h3 style="color: red"> You can not change your account</h3>
                <%
                    }
                    if (session.getAttribute("check").equals("trueNull")) {
                %>
                <h3 style="color: red"> Please check account you want to change !!!!</h3>
                <%
                        }
                    }
                %>
                <form action="update_user.jsp" id="check">
                    <div>
                        <!--Change role-->
                        <div>
                            <select  name="role">
                                <option value="1">Change Role to Administrator</option>
                                <option value="2">Change Role to Subscriber</option>
                            </select>
                             <input id="check" name="" type="submit" value="Submit"> 
                           
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
                  
                   <table class="table table-condensed">
                        <thead>
                            <tr>
                                <th>No.</th>
                                <th <input type="checkbox" onclick="toggle(this)"/>Username</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Role</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                int NumCount = 0;
                                //show all users
                                for (User user : list) {
                                    NumCount++;
                                    String Name = user.getFName() + " " + user.getLName();
                                    String Role_Show = "";
                                    if (user.getRoleId() == 1) {
                                        Role_Show = "Administrator";
                                    } else if (user.getRoleId() == 2) {
                                        Role_Show = "Subscriber";
                                    }
                            %>
                            <tr>
                                <td><%=NumCount%></td>
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
                </form>
            </div>
        </div>            
    </body>
</html>
