<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
  <title>Hostel Management System</title>
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
         <nav class="navbar navbar-expand-md navbar-dark" style="background-color:#52a6fa">
         <div>
            <a href="parcel-index.jsp" class="navbar-brand"> Lucytech Courier Panel </a>
          </div>
        </nav>
      </header>
            <br>
			<div class="row">
                <!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

                <div class="container">
                    <h3 class="text-center">Edit Parcel Details</h3>
                    <hr>
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
       String data = "select * from parcel where id='"+u+"'";
       res = stat.executeQuery(data);
       while(res.next()){
       %>
            <input type="hidden" name="id" value='<%=res.getString("id") %>'/>
   			
   			<div class="form-group">
     			<label>Sender Name:</label>
     			<input type="text" class="form-control" name="sname" value='<%=res.getString("sname") %>'/>
   			</div>
   			<div class="form-group">
     			<label>Sender Address:</label>
     			<input type="text" class="form-control" name="sadd" value='<%=res.getString("sadd") %>'/>
   			</div>
   			<div class="form-group">
   				<label>Sender Number:</label>
				<input type="text" class="form-control" name="snum" value='<%=res.getString("snum") %>'/>
   			</div>
   			<div class="form-group">
     			<label>Receiver Name:</label>
     			<input type="text" class="form-control" name="rname" value='<%=res.getString("rname") %>'/>
   			</div>
   			<div class="form-group">
     			<label>Receiver Address:</label>
     			<input type="text" class="form-control" name="radd" value='<%=res.getString("radd") %>'/>
   			</div>
   			<div class="form-group">
   				<label>Receiver Number:</label>
				<input type="text" class="form-control" name="rnum" value='<%=res.getString("rnum") %>'/>
   			</div>
   			<div class="form-group">
     			<label>Branch:</label>
     			<input type="text" class="form-control" name="bbranch" value='<%=res.getString("bbranch") %>'/>
   			</div>
   			<div class="form-group">
     			<label>Weight:</label>
     			<input type="text" class="form-control" name="weight" value='<%=res.getString("weight") %>'/>
   			</div>
   			<div class="form-group">
   				<label>Height:</label>
				<input type="text" class="form-control" name="height" value='<%=res.getString("height") %>'/>
   			</div>
   			<div class="form-group">
     			<label>Length:</label>
     			<input type="text" class="form-control" name="length" value='<%=res.getString("length") %>'/>
   			</div>
   			<div class="form-group">
     			<label>Width:</label>
     			<input type="text" class="form-control" name="width" value='<%=res.getString("width") %>'/>
   			</div>
   			<div class="form-group">
     			<label>Price:</label>
     			<input type="text" class="form-control" name="price" value='<%=res.getString("price") %>'/>
   			</div>
   			
   			<%
            }
   			%>
   			<a href="parcel-index.jsp" class="btn btn-default">Back</a>
   			<button type="submit" class="btn btn-primary text-center" >Update</button>
   			
   			</form>
   			</div></div>
   			</body>
   			</html>
   			<%
   			String a = request.getParameter("id");
   			String b = request.getParameter("sname");
   			String c = request.getParameter("sadd");
   			String d = request.getParameter("snum");
   			String e = request.getParameter("rname");
   			String f = request.getParameter("radd");
   			String g = request.getParameter("rnum");
   			String h = request.getParameter("bbranch");
   			String i = request.getParameter("weight");
   			String j = request.getParameter("height");
   			String k = request.getParameter("length");
   			String l = request.getParameter("width");
   			String m = request.getParameter("price");
   			
   			if(a!=null && b!=null && c!=null && d!=null && e!=null && f!=null && g!=null && h!=null && i!=null && j!=null && k!=null && l!=null && m!=null){
   				String query = "update parcel set sname=?,sadd=?,snum=?,rname=?,radd=?,rnum=?,bbranch=?,weight=?,height=?,length=?,width=?,price=? where id='"+a+"'";
   				stmt = connection.prepareStatement(query);
   				stmt.setString(1,b);
   				stmt.setString(2,c);
   				stmt.setString(3,d);
   				stmt.setString(4,e);
   				stmt.setString(5,f);
   				stmt.setString(6,g);
   				stmt.setString(7,h);
   				stmt.setString(8,i);
   				stmt.setString(9,j);
   				stmt.setString(10,k);
   				stmt.setString(11,l);
   				stmt.setString(12,m);
   				stmt.setString(1,a);
   				stmt.executeUpdate();
   				response.sendRedirect("parcel-index.jsp");
   			}
   			%>
   			
   			
       
       
       
