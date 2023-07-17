<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Lucytech Courier Panel</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<style type="text/css">
.footer_area {
  background-color: #191d21;
  position: relative;
  z-index: 9;
  overflow: hidden;}
  
.footer_copyright text-center {
  position: relative;}

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
  margin-top: 30px;}
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
  padding: 40px 0;}
body {
  font-family: "Cardo";
  font-weight: normal;
  font-style: normal;
   }
  
 .table {
    width: 100%;
    margin-bottom: 1rem;
    color: #212529;
    background-color: #17a2;}
 .btn-primary{
 color: #52606d;
  background-color: #fff; 
 border-color: #cbd2d9;}       
.table td, .table th{
    padding: 0.3rem;
    vertical-align: top;}
 
 .et-hero-tabs,
.et-slide {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    height: 100vh;
    position: relative;
    background: #eee;
    text-align: center;
    padding: 0 2em;
    h1 {
        font-size: 2rem;
        margin: 0;
        letter-spacing: 1rem;
    }
    h3 {
        font-size: 1rem;
        letter-spacing: 0.3rem;
        opacity: 0.6;
    }
    margin-bottom: 30px;
}

.et-hero-tabs-container {
    display: flex;
    flex-direction: row;
    position: absolute;
    bottom: 0;
    width: 100%;
    height: 70px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
    background: #fff;
    z-index: 10;
     position: fixed; /* Set the navbar to fixed position */
  bottom: 0; /* Position the navbar at the bottom of the page */
  width: 100%; /* Full width */

}

.et-hero-tab {
    display: flex;
    justify-content: center;
    align-items: center;
    flex: 1;
    color: #000;
    transition: all 0.5s ease;
    font-size: 0.95rem;
    &:hover {
      color:white;
      background: rgba(102,177,241,0.8);
      transition: all 0.5s ease;
    }
}

.et-hero-tab-slider {
    position: absolute;
    bottom: 0;
    width: 0;
    height: 6px;
    background: #66B1F1;
    transition: left 0.3s ease;
}

@media (min-width: 800px) {
  .et-hero-tabs,
  .et-slide {
    h1 {
        font-size: 3rem;
    }
    h3 {
        font-size: 1rem;
    }
  }
  .et-hero-tab {
    font-size: 1rem;
  }
}
  
}</style>
</head>
<body style="background-color:#cbd2d9">
<div class="et-hero-tabs-container">

	
      <a class="et-hero-tab" href="staff-index.jsp">Staff</a>
      <a class="et-hero-tab" href="branch-index.jsp">Branch</a>
    		<a class="et-hero-tab" href="reportAdmin-index.jsp">Report</a>
  

      <span class="et-hero-tab-slider"></span>
    </div>
   <header> 
         <nav class="navbar navbar-expand-md navbar-dark text-center" style="background-color: #52a6fa">
         <div>
            
            <h1 style="color:#000000;">Admin, ${user.fullname} </h1>
            <h5>Welcome to Lucytech Courier Panel</h5>
            <h3><a href="logout">Logout</a></h3>
            
          </div>
            </nav>
      </header>
            <br>
			
			
			
            <div style="background-color:#cbd2d9" class="row">
                <!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->
				
			
				
                <div class="container">
                <img src="images/logo.png" class="img-fluid" alt=""><br><br><br><br>
                    <h3 class="text-center">List of Admin</h3>
                    <div style="background-color:#cbd2d9" class="text-center">
			</div>
                    <hr>
    <div class="text-center">
         <a href="user-add.jsp" class="btn btn-primary" >Add New Admin</a>
    </div>
<p></p>
    
        <table style="background-color:#fff" class="table table-bordered table-striped table-hover">
            <thead style="background-color: #fff">
            	<tr style="color: #7b8794">
                <th>ID</th>
                <th>Full Name</th>
                <th>Email</th>
                <th>Password</th>
                <th>Action</th>
            	</tr>
    		</thead>
    		<tbody>
            <c:forEach items="${users}" var="u" varStatus="users">
            <tr>
              <td><c:out value="${u.id}"/> </td>
              <td><c:out value="${u.fullname}"/> </td>
              <td><c:out value="${u.email}"/></td>
              <td><c:out value="${u.password}"/></td>
          
              <td>
              <a href="UpdateUserController?id=<c:out value="${u.id}"/>" class="btn btn-warning" style= "color: #fff; background-color: #00af91; border-color: #00af91 ;">Edit</a>
              <a href="DeleteUserController?id=<c:out value="${u.id}"/>" onclick="return confirm('Do you really want to delete it?')" class="btn btn-danger" style="background-color:#ec5858;">Delete</a>
              </td>
            </tr>
            </c:forEach>
            </tbody>
        </table>
        <script>
		function confirmation(id){					  		 
			  console.log(id);
			  var r = confirm("Are you sure you want to delete?");
			  if (r == true) {				 		  
				  alert("User successfully deleted");			
			  } else {				  
			      return false;	
			  }
		}
		</script>
		</div></div>
<br><br><br><br><br>
</body>
</html>
