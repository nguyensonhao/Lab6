

<%@page import="java.util.Objects"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Object.User"%>
<%@page import="Model.UserModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
        <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js"></script>
        <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js" type="text/javascript"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <script src="https://code.jquery.com/ui/1.11.3/jquery-ui.js"></script>
        <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.min.js"></script>
        
        
        
        <title>Create Account</title>
        <script>
            $(document).ready(function () {
                $("#form").validate({
                    rules: {
                        /**
                         * check password input cannot null, min length 8 and max length 30, 
                         * and check password must have a lowercase, a uppercase letter, a digit and special characters
                         */
                        password: {
                            required: true,
                            minlength: 8,
                            maxlength: 100,
                            checkpass: true
                        },
                        //check re_password
                        ConfirmPassword: {
                            required: true,
                            equalTo: "#password"
                        },
                        //check email not null and must valid email
                        email: {
                            required: true,
                            maxlength: 30,
                            checkemail: true
                        },
                        phone: {
                            required: true,
                            maxlength: 15,
                            checkphone: true
                        },
                        //check firstname not null
                        fullname: {
                            required: true,
                            minlength: 3,
                            maxlength: 100,
                            checkfullname: true
                        }

                    },
                    messages: {
                        //message warning input password
                        password: {
                            required: "Please enter password",
                            minlength: "Password must be greater than 8 characters",
                            maxlength: "Password must be smaller than 100 characters",
                            checkpass: "Please enter strong password"
                        },
                        //message warning input re-password
                        ConfirmPassword: {
                            required: "Please enter re-password",
                            equalTo: "Re-password incorrect"
                        },
                        phone: {
                            required: "Please enter phone",
                            maxlength: "Numberphone must be smaller than 10 characters",
                            checkphone: "Invalid number phone!"
                        },
                        //message warning input email
                        email: {
                            required: "Please enter email",
                            maxlength: "Email must be smaller than 30 characters",
                            checkemail: "Email wrong format please enter again"
                        },
                        //message warning input first name
                        fullname: {
                            required: "Please enter your name",
                            minlength: "Enter your name",
                            maxlength: "Enter your name",
                            checkfullname: "Invalid name"
                        }

                    }
                });
                //check password
                $.validator.addMethod("checkpass", function (value) {
                    var passReg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
                    return passReg.test(value); // check consists of only these
                });
                //check phone
                $.validator.addMethod("checkphone", function (value) {
                    var phone = /^(0|\+84)(\s|\.)?((3[2-9])|(5[689])|(7[06-9])|(8[1-689])|(9[0-46-9]))(\d)(\s|\.)?(\d{3})(\s|\.)?(\d{3})$/;
                    return phone.test(value); //check phone
                });
                //check email valid
                $.validator.addMethod("checkemail", function (value) {
                    var emailReg = /^[a-zA-z0-9]+([.-_][a-zA-z0-9]+)*@[a-zA-z0-9]+([.-_][a-zA-z0-9]+)*(.[a-zA-z0-9]{2,})$/; // regex check email
                    return emailReg.test(value);
                });
                //check fullname
                $.validator.addMethod("checkfullname", function (value) {
                    var fullnameReg = /^[A-Za-z]+(( )[A-Za-z]+)+$/; // regex check fullname
                    return fullnameReg.test(value);
                });
                //create check click checkbox send or not 
                $("#send").click(function (evt) {
                    if ($("input[type=checkbox]").is(":unchecked")) {
                        document.getElementById("send-error").style.display = "block";
                        evt.preventDefault();
                    }
                });
            });
        </script>
        
        <style>
            #email-error{
                width: max-content;
                font-weight: normal;
                color: red;
            }
            #fullname-error{
                width: max-content;
                font-weight: normal;
                color: red;
            }
            #phone-error{
                width: max-content;
                font-weight: normal;
                color: red;
            }

            #password-error{
                width: max-content;
                font-weight: normal;
                color: red;
            }
            #send-error{
                width: max-content;
                font-weight: normal;
                color: red;
            }
            #ConfirmPassword-error {
                width: max-content;
                font-weight: normal;
                color: red;
            }
            
        </style>
        </script>
    </head>
    <body>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" 
              integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <div class="container" >
            <div class="jumbotron" >
                <h1 align="center"  >Add new user</h1>
                <p align="center" >Create a brand new user and add them to this site</p>
            </div>
            <%
                if (session.getAttribute("erorr") != null) {%>
            <div class="controls">
                <h5 class="input-xlarge" style="color: red"><%=session.getAttribute("erorr")%></h5>
            </div>
            <%
                }
            %>
            <form class="form-horizontal" onsubmit="validateMyForm()" class="form-horizontal" id="form" action="addNEW" method="POST">
                <fieldset>
                    <div id="legend" class="ab">
                        <legend align="center">Register</legend>
                    </div>


                    <div class="control-group">
                        <!---user name-->
                        <label class="control-label" for="username">UserName</label>
                        <div class="controls">
                            <input id="txtUser" type="text"name="txtUser" placeholder="" class="input-xlarge" value="">
                        </div>
                    </div>

                    <div class="control-group">
                        <!--Email:-->
                        <label class="control-label" for="email">E-mail</label>
                        <div class="controls">
                            <input type="email" id="email" name="email" placeholder="" class="input-xlarge">
                        </div>
                    </div>

                    <div class="control-group">
                        <!-- Username -->
                        <label class="control-label"  for="fname">First Name</label>
                        <div class="controls">
                            <input type="text" id="fullname"  name="fullname" placeholder="" class="input-xlarge">
                        </div>
                    </div>

                    <div class="control-group">
                        <!-- E-mail -->
                        <label class="control-label" for="lname">Last Name</label>
                        <div class="controls">
                            <input type="text" id="fullname" name="fullname" placeholder="" class="input-xlarge">
                        </div>
                    </div>

                    <div class="control-group">

                        <div class="control-group">
                            <!-- Username -->
                            <label class="control-label"  for="web">Website</label>
                            <div class="controls">
                                <input type="text" id="website" name="website" placeholder="" class="input-xlarge">
                            </div>
                        </div>
                    </div>

                    <div class="control-group">
                        <!-- Password-->
                        <label class="control-label" for="password">Password</label>
                        <div class="controls">
                            <input type="password" id="password" name="password" placeholder="" class="input-xlarge">
                        </div>
                    </div>

                    <div class="control-group">
                        <!-- Password -->
                        <label class="control-label"  for="password_confirm">Password (Confirm)</label>
                        <div class="controls">
                            <input type="password" id="ConfirmPassword" name="ConfirmPassword" placeholder="" class="input-xlarge">
                        </div>
                    </div>

                    <!--- check--->
                    <div class="control-group">    
                        <label class="control-label" for="checksend"> Send User Notification:</label>
                        <div class="controls">
                            <div class="checkbox">
                                <label>   
                                    <input type="checkbox">
                                    Send the new user an email about their account
                                </label>
                            </div>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label" for="checkrole">Role</label>
                        <div class="controls">
                            <select name="role">
                                <option value="1">Administrator</option>
                                <option value="2">Subscriber</option>
                            </select>
                        </div>
                    </div>
                    <div class="control-group">
                    <div class="controls">
                        <button class="btn btn-success" type="submit">Save</button>
                    </div>
                    </div>

                </fieldset>
            </form>
        </div>
    </body>
</html>
