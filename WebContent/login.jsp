<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>
<html>
   <head>
      <!-- Add Material CSS, replace Bootstrap CSS -->
      <link href="css/material.css" rel="stylesheet">
      <link href="css/toolbar.css" rel="stylesheet">
      <link href="css/score-cards.css" rel="stylesheet">
      <link href="css/maptest.css" rel="stylesheet">
      <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
      <title>Login JSP</title>
   </head>
   <body>
      <style>
         body {
         background-color: #E1E7EA;
         padding-top: 104px;
         overflow-x: hidden;
         }
         .navbar-fixed-top {
         box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.14), 0 4px 5px 0
         rgba(0, 0, 0, 0.12), 0 1px 10px 0 rgba(0, 0, 0, 0.2);
         position: fixed;
         right: 0;
         left: 0;
         z-index: 40;
         }
         .main-bg {
         background-color: #E1E7EA;
         }
         .h {
         font-size: 1.2em;
         }
         .navbar-brand {
         font-size: 1.25rem;
         font-weight: 500;
         letter-spacing: 0.02em;
         line-height: 1.4;
         -ms-flex-align: center;
         align-items: center;
         color: inherit;
         display: -ms-inline-flexbox;
         display: inline-flex;
         height: 2.25rem;
         position: relative;
         white-space: nowrap;
         }
      </style>
      <div class=" navbar-fixed-top">
      <nav
         class="navbar main-navbar navbar-expand-lg navbar-dark bg-primary d-flex">
         <a class="navbar-brand" href="#">
            <img
               src="images/logos/jio_white_text.png" width="24" height="24"
               class="d-inline-block align-top mr-2 rounded" alt="">
            <div>
               &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
               &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
               &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
               &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
               JCS
            </div>
         </a>
         <div>
            <ul class="navbar-nav mr-auto">
            </ul>
         </div>
         <img src="images/buttons/user.png" width="24" height="24"
            class="d-inline-block align-top  ml-auto " alt="">
      </nav>
      <div class="d-flex align-items-stretch toolbar">
         <div class="mr-auto p-2 bd-highlight">
            <%@ page import="java.sql.*"%>
            <%@ page import="javax.sql.*"%>
            <%
               String userid = request.getParameter("usr");
               session.setAttribute("userid", userid);
               String pwd = request.getParameter("pwd");
               Class.forName("com.mysql.jdbc.Driver");
               java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jcs", "admin", "admin");
               Statement st = con.createStatement();
               ResultSet rs = st.executeQuery("select * from JCSUser where Username='" + userid + "'");
               if (rs.next()) {
               	if (rs.getString(2).equals(pwd)) {
               		out.println("&nbsp&nbsp&nbsp" + "Welcome " + "&nbsp" + userid + "! &nbsp&nbsp&nbsp"
               				+ " Please go to Home, to view Dashboard!!");
               
               	} else {
               		out.println("Invalid password try again. Go to Login!");
               	}
               }
               %>
            <br />
            <div class="form-group h">
               <a href="login.html"><span
                  style="color: blue; font-weight: bold">Login</span></a>
            </div>
            <div class="form-group h">
               <a href="http://localhost:8080/jcs/JCSServlet"><span
                  style="color: blue; font-weight: bold">Home</span></a>
            </div>
         </div>
      </div>
   </body>
</html>