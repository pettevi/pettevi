<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="com.google.appengine.api.datastore.DatastoreServiceFactory" %>
<%@ page import="com.google.appengine.api.datastore.DatastoreService" %>
<%@ page import="com.google.appengine.api.datastore.Query" %>
<%@ page import="com.google.appengine.api.datastore.Entity" %>
<%@ page import="com.google.appengine.api.datastore.FetchOptions" %>
<%@ page import="com.google.appengine.api.datastore.Key" %>
<%@ page import="com.google.appengine.api.datastore.KeyFactory" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
  <head>
    <link type="text/css" rel="stylesheet" href="/stylesheets/main.css" />
  </head>
  
  <body>
 
<p>Hello</p>

    <form action="/birthday" method="post">
      <p>What is your birthday?</p>
      <label>Month<input type="text" name=month value="${month}"></label>
      <label>Day<input type="text" name=day value="${day}"></label>
      <label>Year<input type="text" name=year value="${year}"></label>
      <input type="submit">
    </form>

	<%
	String attr = (String) request.getAttribute("validity");
	if (attr != null && attr.compareTo("valid") == 0)
	{
		String bdate = (String) request.getAttribute("bdate");
	%>
		<p>Hey, that's nice. ${bdate} was a good day. Thank you!</p>
	<%
	} else if (attr != null && attr.compareTo("invalid") == 0)
	{
	%>
		<p style="color:red">Oh man, do it again!</p>
	<%
	}
	%>
	

  </body>
</html>