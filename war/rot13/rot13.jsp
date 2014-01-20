<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
  <head>
    <link type="text/css" rel="stylesheet" href="/stylesheets/main.css" />
  </head>
  
  <body>
  
  <p>version 27.11.2013</p>

<form action="/rot13" method="post">
<textarea name="text" placeholder="type something" rows="10" cols="">${fn:escapeXml(usertext)}</textarea>
<input type="submit">  
</form>

  </body>

</html>