<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Index|LUCYTECH</title>
</head>
<body>
<meta name="viewport" content="width=device-width, initial-scale=1">
    <style>

        body, html {
            height: 100%;
            margin: 0;
            font-family: Arial, Helvetica, sans-serif;
        }

        * {
            box-sizing: border-box;
        }

        .bg-image {
            /* The image used */
            background-image: url("https://files.wallpaperpass.com/2019/10/low%20poly%20wallpaper%20048%20-%202000x2000-768x432.jpg");

            /* Add the blur effect */
            filter: blur(8px);
            -webkit-filter: blur(8px);

            /* Full height */
            height: 100%;

            /* Center and scale the image nicely */
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
        }

        /* Position text in the middle of the page/image */
        .bg-text {
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0, 0.4); /* Black w/opacity/see-through */
            color: white;
            font-weight: bold;
            border: 3px solid #f1f1f1;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            z-index: 2;
            width: 80%;
            padding: 20px;
            text-align: center;
        }

        .button {
            background-color: #4CAF50; /* Green */
            border: none;
            color: white;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            margin: 4px 2px;
            cursor: pointer;
        }

        .button5 {
            background-color: #555555;} /* Black */
        img {
            opacity: 0.1;
        }
    </style>
    <img src="https://i.ytimg.com/vi/UBj3rJTGV3E/maxresdefault.jpg">
<div class="bg-image"></div>


<div class="bg-text">
    <h2>GROUP PROJECT PROTOTYPE</h2>
    <h1 style="font-size:50px">COURIER MANAGEMENT SYSTEM</h1>
    <p>by:Lucyt3ch</p>
    <a href="login.jsp"> <button class="button button5">Admin</button></a>
    <a href="loginStaff.jsp"> <button class="button button5">Staff</button></a>
</div>
</body>
</html>




