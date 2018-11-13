<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.bean.*"%>
<html>
<head>
<title>Dynamic Drop Down List</title>
</head>
<body>
	<%
		List<JioScoresCircle> circleListDetailsD = (ArrayList<JioScoresCircle>) request.getAttribute("circleListDetailsD");

	%>

<%if (circleListDetailsD!= null) { %>
	<div align="center">
		<h3>Circle Information</h3>
		
		<form action="JCSServlet" method="post">
			Select a Category:&nbsp;
			<select name='myfield' >
				<%
					for (JioScoresCircle i : circleListDetailsD) {
				%>
				<option><%=i.getCircle()%>
				</option>
				<%
					}
				%>
			</select>

			<%System.out.println("print1 before submit"); %>
			<input type="submit" value="Submit" >	
		</form>
	</div>
<% } %>
	
	<%  out.println("<br>" + request.getAttribute("getCircle") + "<br>") ; %>
	<%  out.println("<br>" + request.getAttribute("getCityName") + "<br>") ; %>
	<%  out.println("<br>" + request.getAttribute("getCoveragePercent") + "<br>") ; %>
	<%  out.println("<br>" + request.getAttribute("getCapacityPercent") + "<br>") ; %>
	<%  out.println("<br>" + request.getAttribute("getQosPercent") + "<br>") ; %>
	<%  out.println("<br>" + request.getAttribute("getJCSPercent") + "<br>") ; %>
	<%  out.println("<br>" + request.getAttribute("getES") + "<br>") ; %>

</body>
</html>