<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
        <title>Lucytech Courier Panel</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
 <link rel="stylesheet" href="css/components/calendar.css" />
        <link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
  		<link rel="stylesheet" href="/resources/demos/style.css">
		  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		  <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
		  <script>
		  $( function() {
		    $( "#datepicker" ).datepicker();
		  } );
		  </script>
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
       String data = "select * from report where rid='"+u+"'";
       res = stat.executeQuery(data);
       while(res.next()){
       %>
            <input type="hidden" name="rid" value='<%=res.getString("rid") %>'/>
   			
   			<div class="form-group">
     			<label>Report Name:</label>
     			<input type="text" class="form-control" name="rname" value='<%=res.getString("rname") %>'/>
   			</div>
   			<div class="form-group">
     			<label>Report Desc:</label>
     			<input type="text" class="form-control" name="rdesc" value='<%=res.getString("rdesc") %>'/>
   			</div>
   			<div class="form-group">
   				<label>Report by:</label>
				<input type="text" class="form-control" name="rstaff" value='<%=res.getString("rstaff") %>'/>
   			</div>
   			 <div class="form-group">
                   <label>Report Date<input type="text" class="form-control" name="rdate" id="datepicker" value='<%=res.getString("rdate") %>'/></label>
                                    
                                </div>
   			<%
            }
   			%>
   			<a href="report-index.jsp" class="btn btn-default">Back</a>
   			<button type="submit" class="btn btn-primary text-center" >Update</button>
   			
   			</form>
   			</div></div>
   			</body>
   			</html>
   			<%
   			String a = request.getParameter("rid");
   			String b = request.getParameter("rname");
   			String c = request.getParameter("rdesc");
   			String d = request.getParameter("rstaff");
   			String e = request.getParameter("rdate");
   			
   			
   			if(a!=null && b!=null && c!=null && d!=null && e!=null ){
   				String query = "update report set rname=?,rdesc=?,rstaff=?,rdate=? where rid='"+a+"'";
   				stmt = connection.prepareStatement(query);
   				stmt.setString(1,b);
   				stmt.setString(2,c);
   				stmt.setString(3,d);
   				stmt.setString(4,e);
   				
   				stmt.executeUpdate();
   				response.sendRedirect("report-index.jsp");
   			}
   			%>
   			
   			
       
       
       
