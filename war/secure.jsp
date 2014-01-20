<!DOCTYPE html>
<head>

<style type="text/css"> 
html{overflow-y:scroll;}

body,p,input {font-family:verdana,helvetica,arial,sans-serif;}

body {font-size:14px;color:#555555;background-color:#f1f1f1;margin:0px;}

a.btn {text-align:center;display:block;width:170px;margin:10px auto;background-color:#f1f1f1;border:1px solid #e3e3e3;padding:8px;border-radius:4px;font-size:16px;color:#555555;text-decoration:none;}
a.btn:hover {background-color:#555555;color:#ffffff;border:1px solid #555555;}

</style>
</head>

<body>

<%
if (request.getUserPrincipal() != null) {
    out.println("<h2>Hello, " + request.getUserPrincipal().getName() + "</h2>");
} else {
    out.println("<p>Please sign in first</p>");
}
%>

<p>You do not see this page unless you sign in first.</p>

<a class="btn" href="index.html" target="_top">Back to start page</a>

<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%
if (request.getUserPrincipal() != null) {
	String thisURL = request.getRequestURI();
	UserService userService = UserServiceFactory.getUserService();
	String logoutURL = userService.createLogoutURL(thisURL);
	out.println("<a class=\"btn\" href=\"" + logoutURL + "\" target=\"_top\">Log out</a>");
}
%>

</body>
</html>