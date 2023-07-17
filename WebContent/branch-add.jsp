<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>



<!DOCTYPE html>
<html>
<head>
  <title>Lucytech Courier Panel</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<style type="text/css">
body {
	font-family: "Cardo";
}

.footer_area {
  background-color: #000080;
  position: relative;
  z-index: 9;
  overflow: hidden;
  margin-top: 0px;
  margin-bottom: 0px;}

.footer_shape_1 {
  position: absolute;
  bottom: -30px;
  left: 0;
  z-index: -1; }
  .footer_shape_1 img {
    width: 130px;
    opacity: 0.31; }

@media (max-width: 767px) {
  .footer_widget .footer_logo a img {
    width: 160px; } }
.footer_widget .footer_title {
  margin-top: 30px; }
  .footer_widget .footer_title .title {
    font-size: 52px;
    color: #38424D; }
    @media (max-width: 767px) {
      .footer_widget .footer_title .title {
        font-size: 38px; } }
    .footer_widget .footer_title .title span {
      color: #D59A57; }
.footer_widget .footer_menu {
  margin-top: 30px; }
  .footer_widget .footer_menu li {
    display: inline-block;
    margin: 0 20px; }
    .footer_widget .footer_menu li a {
      font-size: 16px;
      color: #38424D;
      -webkit-transition: all 0.3s ease-out 0s;
      -moz-transition: all 0.3s ease-out 0s;
      -ms-transition: all 0.3s ease-out 0s;
      -o-transition: all 0.3s ease-out 0s;
      transition: all 0.3s ease-out 0s; }
      .footer_widget .footer_menu li a:hover {
        color: #D59A57; }

.footer_copyright {
  border-top: 2px solid #D59A57;
  padding: 40px 0; }

</style>

</head>

<body style="background-color:#cbd2d9">
   <header>
         <nav class="navbar navbar-expand-md navbar-dark" style="background-color: #52a6fa">
         <div>
            <a href="ListUserController" class="navbar-brand"> Lucytech Courier Panel </a>
          </div>
            </nav>
      </header>
            <br>

            <div class="row">
                <!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

                <div class="container">
                    <h3 class="text-center">Add Branch Details</h3>
                    <hr>
					<form action="" method="post">
					   
					   <div class="form-group">
     			<label>Name:</label>
     		     <input type="text" class="form-control" name="bname"/>
     			<br>
   			</div>
   			<div class="form-group">
     			<label>Street:</label>
     			<input type="text" class="form-control" name="bstreet" />
   			</div>
   			<div class="form-group">
     			<label>City:</label>
     			<input type="text" class="form-control" name="bcity" />
   			</div>
   			<div class="form-group">
   				<label>State:</label>
				<input type="text" class="form-control" name="bstate" />
   			</div>
   			<div class="form-group">
   				<label>Zip:</label>
				<input type="text" class="form-control" name="bzip" />
   			</div>
   			<div class="form-group">
   				<label>Country:</label>
				<input type="text" class="form-control" name="bcountry" />
   			</div>
					   <a href="branch-index.jsp" class="btn btn-default text-center">Back</a>
					   <button type="submit" class="btn btn-primary text-center">Add</button>
					   
					</form>
                </div>
                </div>
</body>
</html>
<%

//Integer a = Integer.parseInt(request.getParameter("rmID"));
//String aa = String.valueOf("a");;
		
   			String a = request.getParameter("bname");
   			String b = request.getParameter("bstreet");
   			String c = request.getParameter("bcity");
   			String d = request.getParameter("bstate");
   			String e = request.getParameter("bzip");
   			String f = request.getParameter("bcountry");
//Integer c = Integer.parseInt(request.getParameter("rmCap"));
//String cc = String.valueOf("c");


String jdbcURL = "jdbc:mysql://localhost:3306/java1stprot";
String dbUser = "root";
String dbPassword = "";

Connection conn = null;
PreparedStatement stat = null;
Class.forName("com.mysql.jdbc.Driver");
if(a!=null && b!=null && c!=null && d!=null && e!=null && f!=null){
	Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
	String data = "insert into branch(bname,bstreet,bcity,bstate,bzip,bcountry) values(?,?,?,?,?,?)";
	stat = connection.prepareStatement(data);

	stat.setString(1,a);
	stat.setString(2,b);
	stat.setString(3,c);
	stat.setString(4,d);
	stat.setString(5,e);
	stat.setString(6,f);

	stat.executeUpdate();
	response.sendRedirect("branch-index.jsp");
}
%>


