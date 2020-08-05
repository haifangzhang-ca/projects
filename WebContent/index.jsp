<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<%
	String errMsg = null;
	//first check whether the form was submitted
	if("POST".equalsIgnoreCase(request.getMethod()) && request.getParameter("submit") != null)
	{%>
<jsp:useBean id="loginBean" class="packt.book.jee_eclipse.ch2.bean.LoginBean">
<jsp:setProperty name="loginBean" property="*"/>
</jsp:useBean>
<% if (loginBean.isValidUser())
{
out.println("<h2> Welcome admin!</h2>");
out.println("You are successfully logged in");
}
else
{
errMsg = "Invalid user id or password. Please try again";
}
 %>	
<% }%>
<body>
	<h2>Login:</h2>
	<!--  Check error message. If it is set, then display it -->
	<%if (errMsg != null) {%>
	<span style="color: red;"><%out.print(errMsg); %></span>
	<%} %>
	<form method="post">
	User Name: <input type="text" name="userName"><br>
	Password: <input type="password" name="password"><br>
	<button type="submit" name="submit">Submit</button>
	<button type="reset">Reset</button>
	</form>
</body>
</html>