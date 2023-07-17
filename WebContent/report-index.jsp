<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement" %>

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
        <link rel="stylesheet" href="css/components/badge.css" />
        <link rel="stylesheet" href="css/components/input.css" />
        <link rel="stylesheet" href="css/components/header.css" />
        <link rel="stylesheet" href="css/components/button.css" />
        <link rel="stylesheet" href="css/components/heading.css" />
        <link rel="stylesheet" href="css/components/table.css" />
        <link rel="stylesheet" href="css/components/hamburgers.css" />
        <link rel="stylesheet" href="css/layouts/listing.css" />

        <script src="https://kit.fontawesome.com/048645d981.js" crossorigin="anonymous"></script>

        <title>Lucytech Courier Panel</title>
</head>
<body>
	<div class="header overlap" style="background-color: #52a6fa">
            <div class="menu">
                <div class="left">
                    <div id="hamburger" class="hamburger hamburger--spin" onclick="openMenu()">
                        <span class="hamburger-box">
                            <span class="hamburger-inner"></span>
                        </span>
                    </div>
                    <nav id="menu">
                        <ul>
                            <li><a href="indexStaff.jsp">Back</a></li>
                            
                        
                        </ul>
                    </nav>
                </div>
                <div class="middle">
                    <a href="/" class="square logo"></a>
                </div>
                
            </div>
            <div class="content">
                <h1>Report List</h1>
            </div>
        </div>

        <div class="body overlap">
            <div class="content">
                <div class="listing card">
                    <div class="table-header collapses">
                        <div>
                        <a href="report-add.jsp" class="white small button" role="button">
                                ADD REPORT
                            </a>
                            <br>
                            <form action="" method="get">
								<input type="text" class="form-control" name="q" placeholder="Search here.."/>
							</form>
                        </div>
                    </div>
                    <div class="table-container">
                        <table>
                            <thead>
                                <tr>
                                    <th style="width: 5%">Report ID</th>
                                    <th style="width: 5%">Report Name</th>
                                    <th style="width: 5%">Report Desc</th>
                                    <th style="width: 5%">Report by</th>
                                    <th style="width: 5%">rdate</th>
                                    <th style="width: 20%">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
       String jdbcURL = "jdbc:mysql://localhost:3306/java1stprot";
	   String dbUser = "root";
	   String dbPassword = "";

       Connection connection = null;
       Statement stat = null;
       ResultSet res = null;
       Class.forName("com.mysql.jdbc.Driver");
	   connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
       stat = connection.createStatement();
       String query = request.getParameter("q");
       String data;
       if(query != null){
    	   data = "select * from report where rid like '%"+query+"%' or rnamr like '%"+query+"%'";
       } else{
    	   data = "select * from report order by rid";
       }
       res = stat.executeQuery(data);
       while(res.next()){
       %>
       <tr>
         <td><%=res.getInt("rid")%></td>
         <td><%=res.getString("rname")%></td>
         <td><%=res.getString("rdesc")%></td>
         <td><%=res.getString("rstaff")%></td>
         <td><%=res.getString("rdate")%></td>
         <td class="text-center">
           <a href='report-edit.jsp?u=<%=res.getString("rid")%>'>Edit</a>
         </td>
        </tr>
        <%
       }
        %>
         
    </tbody>
                        </table>
                    </div>
                    <div class="table-footer">
                        <div>Showing <b></b>  <b></b></div>
                    </div>
                </div>
            </div>
        </div>
</body>
</html>