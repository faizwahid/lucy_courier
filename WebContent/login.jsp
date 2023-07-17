<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>
<script type="text/javascript"
    src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.0/dist/jquery.validate.min.js">
</script>

<meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"
        />

        <link rel="stylesheet" href="css/global.css" />
        <link rel="stylesheet" href="css/components/input.css" />
        <link rel="stylesheet" href="css/components/button.css" />
        <link rel="stylesheet" href="css/layouts/login.css" />

        <title>Lucytech Courier Panel</title>
</head>
<body>
   			<a href="front.jsp" class="btn btn-default">LucyTech</a>

<div class="global">

            <div class="login-form center">
            
                <div class="content">
                <h1>Admin Lucytech Courier Panel</h1><br><br>
                   
                    <form method="post" action="login">
                        <div class="field">
                            <label for="email">Email</label>
                            <input
                                id="email"
                                type="email"
                                name="email"
                                size="30"
                                placeholder="you@email.com"
                            />
                        </div>
                        <div class="field">
                            <label for="password">Password</label>
                            <input
                                id="password"
                                type="password"
                                name="password"
                                size="30"
                                placeholder="••••••••"
                            />
                        </div>
						<br>${message}<br>
						<button class="field fluid button" type="submit">Login</button>
                    </form>

                    
                </div>
            </div>

            <div class="ice-breaker"style="background-image: url(images/courier.jpg)">
                <div class="content">
                    <div class="illustration" >
                        
                    </div>
                    
                </div>
            </div>
        </div>
</body>
<script type="text/javascript">
 
    $(document).ready(function() {
        $("#loginForm").validate({
            rules: {
                email: {
                    required: true,
                    email: true
                },
         
                password: "required",
            },
             
            messages: {
                email: {
                    required: "Please enter email",
                    email: "Please enter a valid email address"
                },
                 
                password: "Please enter password"
            }
        });
 
    });
</script>
</html>