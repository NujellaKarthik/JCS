<%-- <%@page import="com.bean.JioScoresCircle"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div id="wrapper">
		<div id="header">
			<h2>Circle Details</h2>
		</div>
	</div>

	<div id="container">
		<form action="JCSServlet" method="GET">

			<input type="hidden" name="command" value="ADD" />

			<table>
				<tbody>

					<tr>
						<td><label>Circle:</label></td>
						<td><input type="text" name="Circle" /></td>

					</tr>

					<tr>
						<td><label>CityName:</label></td>
						<td><input type="text" name="CityName" /></td>

					</tr>
					<tr>
						<td><label>Cluster:</label></td>
						<td><input type="text" name="Cluster" /></td>

					</tr>
					<tr>
						<td><label>JioCenter:</label></td>
						<td><input type="text" name="JioCenter" /></td>

					</tr>
					<tr>
						<td><label>CoveragePercent:</label></td>
						<td><input type="number" name="CoveragePercent" /></td>

					</tr>
					<tr>
						<td><label></label></td>
						<td><input type="button" value="Save" /></td>

					</tr>

				</tbody>
			</table>
		</form>
		<div style="clear: both;"></div>
		<p>
			<a href="JCSServlet">back to list</a>

		</p>
	</div>
</body>
</html>
 --%>