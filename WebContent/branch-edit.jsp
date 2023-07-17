<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"
        />

        <link rel="stylesheet" href="css/global.css" />
        <link rel="stylesheet" href="css/components/card.css" />
        <link rel="stylesheet" href="css/components/stats.css" />
        <link rel="stylesheet" href="css/components/input.css" />
        <link rel="stylesheet" href="css/components/header.css" />
        <link rel="stylesheet" href="css/components/badge.css" />
        <link rel="stylesheet" href="css/components/button.css" />
        <link rel="stylesheet" href="css/components/heading.css" />
        <link rel="stylesheet" href="css/components/hamburgers.css" />
        <link rel="stylesheet" href="css/components/calendar.css" />
        <link rel="stylesheet" href="css/layouts/booking.css" />
        <link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
  		<link rel="stylesheet" href="/resources/demos/style.css">
		  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		  <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
		  <script>
		  $( function() {
		    $( "#datepicker" ).datepicker();
		  } );
		  </script>

        <script src="https://kit.fontawesome.com/048645d981.js" crossorigin="anonymous"></script>

        <title>Lucytech Courier Panel</title>
</head>
<body>
	<div class="header overlap" style="background-color:#52a6fa">
            <div class="menu">
                <div class="left">
                    
                </div>
                <div class="middle">
                    <a href="/" class="square logo"></a>
                </div>
                
            </div>
            <div class="content">
                <h1>Edit Branch</h1>
            </div>
        </div>
        
        <div class="body overlap">
            <div class="content">
                <%
       
       String jdbcURL = "jdbc:mysql://localhost:3306/java1stprot";
	   String dbUser = "root";
	   String dbPassword = "";

	   Connection connection = null;
       Statement stat = null;
       ResultSet res = null;
       PreparedStatement stmt = null;
       Class.forName("com.mysql.jdbc.Driver");
	   connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
       %>
       <form action="" method="post">
       <%
       stat = connection.createStatement();
       String u = request.getParameter("u");
       String data = "select * from branch where bid='"+u+"'";
       res = stat.executeQuery(data);
       while(res.next()){
       %>
            <input type="hidden" name="bid" value='<%=res.getString("bid") %>'/>
   			<div class="form-group">
     			<label>Name:</label>s
     		     <input type="text" class="form-control" name="bname" value='<%=res.getString("bname") %>'/>
     			<br>
   			</div>
   			<div class="form-group">
     			<label>Street:</label>
     			<input type="text" class="form-control" name="bstreet" value='<%=res.getString("bstreet") %>'/>
   			</div>
   			<div class="form-group">
     			<label>City:</label>
     			<input type="text" class="form-control" name="bcity" value='<%=res.getString("bcity") %>'/>
   			</div>
   			<div class="form-group">
   				<label>State:</label>
				<input type="text" class="form-control" name="bstate" value='<%=res.getString("bstate") %>'/>
   			</div>
   			<div class="form-group">
   				<label>Zip:</label>
				<input type="text" class="form-control" name="bzip" value='<%=res.getString("bzip") %>'/>
   			</div>
   			<div class="form-group">
   				<label>Country:</label>
				<input type="text" class="form-control" name="bcountry" value='<%=res.getString("bcountry") %>'/>
   			</div>
   			<%
            }
   			%>
   			<a href="branch-index.jsp" class="btn btn-default">Back</a>
   			<button type="submit" class="btn btn-primary text-center" >Update</button>
   			
   			</form>
            </div>
        </div>
</body>
</html>
<%
   			String a = request.getParameter("bid");
   			String b = request.getParameter("bname");
   			String c = request.getParameter("bstreet");
   			String d = request.getParameter("bcity");
   			String e = request.getParameter("bstate");
   			String f = request.getParameter("bzip");
   			String g = request.getParameter("bcountry");
   			if(a!=null && b!=null && c!=null && d!=null){
   				String query = "update branch set bname=?,bstreet=?,bcity=?,bstate=?,bzip=?,bcountry=? where bid='"+a+"'";
   				stmt = connection.prepareStatement(query);
   				stmt.setString(1,b);
   				stmt.setString(2,c);
   				stmt.setString(3,d);
   				stmt.setString(4,e);
   				stmt.setString(5,f);
   				stmt.setString(6,g);
   				
   				stmt.executeUpdate();
   				response.sendRedirect("branch-index.jsp");
   			}
   			%>