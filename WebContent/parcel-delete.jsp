<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
String a = request.getParameter("d");

String jdbcURL = "jdbc:mysql://localhost:3306/java1stprot";
String dbUser = "root";
String dbPassword = "";

Class.forName("com.mysql.jdbc.Driver");
Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
Statement stat = connection.createStatement();
stat.executeUpdate("delete from parcel where id='"+a+"'");
response.sendRedirect("parcel-index.jsp");
%>

