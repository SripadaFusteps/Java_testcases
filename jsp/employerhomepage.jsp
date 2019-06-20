<%@page import="com.mongodb.QueryBuilder"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.util.*"
	import="org.bson.Document" import="com.mongodb.DBCollection"%>
<%@ page import="com.jcg.mongodb.servlet.*"%>
<%@ page import="java.util.regex.Pattern"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" type="text/css" href="resource/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="resource/css/bootstrap.css">
<script src="resource/js/bootstrap.min.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" type="text/css" href="resource/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="resource/css/bootstrap.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script> 
  <link rel="stylesheet" type="text/css" href="resource/css/styleemphp.css">
</head>



<body style='background-image: url("img/bgplane.jpg")';>
<div class="header" style="background-color: black;">
    <a href="#default" class="logo" style="color: white">CompanyLogo</a>
     <form method="post" action="searchServlet">
     <input style="width: 40%;margin-left:5%;border-radius: 10px" type="text" placeholder="search using keywords separated by comma" name="keytext" id="keytext" >
     <button type="submit"  style=" border-radius: 100px; width:12em;background-color: #555555;"><b>search Candidates</b></button>
    <div class="header-right" style="margin-top: 1em">
      <a style="color: white" href="jobposting.jsp">Post Job </a>
      <a href="premium.jsp" style="color: white">Premium</a>
      <a onclick="document.getElementById('id01').style.display='block'" style="color: white">Profile</a>
   <a href="index.jsp" style="color: white">Logout</a>
    </div></form>

  <div id="id01" class="modal">
    <form class="modal-content animate"  id="user_login_form" name="loginForm" method="post" action="loginServlet">
 

      <div class="imgcontainer">
        <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
       <img src="img/employerloginpic.jpg" alt="Avatar" class="avatar">
      </div>

      <div class="container">
        <label for="employername"><b>Username</b></label>
        <input type="text" placeholder="Enter Username" name="login_id" id="login_id" required>
        <label for="employerpsw"><b>Password</b></label>
          <input type="password" placeholder="Enter Password" name="login_pwd" id="login_pwd" required>        
               <button type="submit"  style=" border-radius: 100px; width:10em">Login</button>
      <div>
      <label>
        <input type="checkbox" checked="checked" name="remember"> Remember me
      </label>
      </div>
      </div>

    <div class="container" style="background-color:#f1f1f1">
      <button type="button" onclick="document.getElementById('id01').style.display='none'" style=" border-radius: 10px;" class="cancelbtn">Cancel</button>
      <button type="button" style=" border-radius: 10px;" onclick="change_home()" class="cancelbtn">forgot password</button>
    </div>
  </form>
</div>



</div>




<h1><b><center>Dashboard</center></b> </h1>


   <div class="col-md-5" style="float:left; margin-top: 2em ;background-color: white;font-size: 2em;border-radius: 50px;margin-left: 1em">
      
    </div>


     <div class="col-md-5" style="float:right; margin-top: 2em ;background-color: white;font-size: 2em;border-radius: 50px;margin-right: 2em">
        <form >
         <div style="margin-left: 2em;margin-top: 1em;margin-bottom: 1em">
            <h1><center>Consultancies</center></h1>
              <div class="col-xs-3">
                <a href=""target="_blank">
                  <img  style="width:60%" src="img/logo2.jpg"/>
                </a>
                <a href=""target="_blank">
                  <img  style="width:60%" src="img/logo1.jpg"/>
                </a>
                <a href=""target="_blank">
                  <img  style="width:60%" src="img/logo3.jpg"/>
                </a>
            </div>
            <div class="col-xs-3">
                <a href=""target="_blank">
                  <img  style="width:60%" src="img/logo2.jpg"/>
                </a>
                <a href=""target="_blank">
                  <img  style="width:60%" src="img/logo1.jpg"/>
                </a>
                <a href=""target="_blank">
                  <img  style="width:60%" src="img/logo3.jpg"/>
                </a>
            </div>
            <div class="col-xs-3">
                <a href=""target="_blank">
                  <img  style="width:60%" src="img/logo2.jpg"/>
                </a>
                <a href=""target="_blank">
                  <img  style="width:60%" src="img/logo1.jpg"/>
                </a>
                <a href=""target="_blank">
                  <img  style="width:60%" src="img/logo3.jpg"/>
                </a>
            </div>
            <div class="col-xs-3">
                <a href=""target="_blank">
                  <img  style="width:60%" src="img/logo2.jpg"/>
                </a>
                <a href=""target="_blank">
                  <img  style="width:60%" src="img/logo1.jpg"/>
                </a>
                <a href=""target="_blank">
                  <img  style="width:60%" src="img/logo3.jpg"/>
                </a>
            </div>
          </div>
        </form>
    </div>







    <footer>
        <p>© 2018 Fusteps</p>
    </footer>

</body>
</html>