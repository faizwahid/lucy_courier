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
                    <h3 class="text-center">Edit Admin Details</h3>
                    <hr>
<br>
<div class="center" >
  </div>
  <p></p>
 <div class="center">
  <div class="container">
        <form action="UpdateUserController" method="post">
            <div class="user-details">
                <div class="form-group">
                    <label for="details"> Full Name: </label>
                    <input type="text" class="form-control" id="fullname" value="<c:out value="${u.fullname}"/>" name="fullname" required>
                </div>
                <div class="form-group">
                    <label for="details">Email: </label>
                    <input type="text" class="form-control" id="email" value="<c:out value="${u.email}"/>" name="email" required>
                </div>
                <div class="form-group">
                    <label for="details">Password: </label>
                    <input type="password" class="form-control" id="password" value="<c:out value="${u.password}"/>" name="password" required>
                </div>
                <input type="hidden" name="id" value="<c:out value="${u.id}"/>"/><br><br>
            </div>
            <a href="index.jsp" class="btn btn-default">Back</a>
            <div class="btn btn-warning" style="background-color: #007bff; color:#ffff;">
                <input type="submit" value="Update">
            </div>
             </form>
          </div>     
    </div>
</body>
</html>