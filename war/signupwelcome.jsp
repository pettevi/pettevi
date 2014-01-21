<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<html>
  <head>
    <link type="text/css" rel="stylesheet" href="/stylesheets/header.css" />
    <title>Unit 2 Signup</title>
  </head>
  
  <body>
<%
    String username = request.getParameter("username");
    if (username != null)
      pageContext.setAttribute("username", username);
%>

<h2>Welcome, ${username}!</h2>
<br>
  </body>

</html>