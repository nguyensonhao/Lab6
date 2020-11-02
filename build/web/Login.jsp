
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="bootstrap-3.4.1-dist/css/bootstrap-theme.css">
        <link rel="stylesheet" href="bootstrap-3.4.1-dist/css/bootstrap-theme.css.map">
        <link rel="stylesheet" href="bootstrap-3.4.1-dist/css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="bootstrap-3.4.1-dist/css/bootstrap-theme.min.css.map">
        <link rel="stylesheet" href="bootstrap-3.4.1-dist/css/bootstrap.css">
        <link rel="stylesheet" href="bootstrap-3.4.1-dist/css/bootstrap.min.css">
        
        
       `<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <title>Login V3</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>  
    <body>
       
        <div id="login">
             
            <div class="container">
          
            <div id="login-row" class="row justify-content-center align-items-center">
                <div  id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12">
                        <form  id="login-form" class="form" method="post" action="login">
                            <h1  class="text-center text-info">Log in</h1>
                            <div class="form-group">
                                <label for="username" class="text-info">Username:</label><br>
                                <input type="text" name="txtUser" placeholder="Username"class="form-control">
                            </div>

                            <div class="form-group">
                                <label for="password" class="text-info">Password:</label><br>
                                <input type="password" name="txtPassword" placeholder="Password" class="form-control">
                            </div>

                            <div class="form-group">
                              <input type="submit" name="submit" class="btn btn-info btn-md" value="submit">
                              <a  class="btn btn-info btn-md" href="CreateAccount">Dang Ky</a>
                            </div>
                       
                        </form>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </body>
</html>

