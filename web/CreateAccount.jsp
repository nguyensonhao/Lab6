

<%@page import="java.util.Objects"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Object.User"%>
<%@page import="Model.UserModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>

        <title>Create Account</title>
    </head>
    <body>
        <%
            if (session.getAttribute("erorr")!=null) {%>
                    <h2 style="color: red" ><%=session.getAttribute("erorr")%></h2>
                    <%
                }
        %>
        
        <a class="black-text" href="dashboard.jsp">Back to Admin Page</a>
        <h1>Create New User</h1>


        <form onsubmit="validateMyForm()" class="form-horizontal" id="form" action="addNEW" method="POST">
            <div>
                Username: <input type="text"name="txtUser" required>
            </div><br>
            <div>
                Email:
                    <input type="email" name="email" required>
            </div><br>
            <div>
                First Name:
                    <input type="text" name="fname" required>
            </div><br>

            <div >
                Last Name:
                    <input type="text" name="lname" required>
            </div><br>
            <div>
                    Website: <input type="text"name="website" required>
            </div><br>
            <div>
                    Password: <input type="password" name="password" required>
            </div><br>
            <div>
                Send User Notification:
                <label>
                    <input type="checkbox">
                    Send notification to user
                </label>
            </div><br>
            <div>
                Role:
                <select name="role">
                    <option value="1">Administrator</option>
                    <option value="2">Subscriber</option>
                </select>
            </div><br>
            <div>
                    <button type="submit">Save</button>
            </div><br>

        </form>
    </body>
</html>
