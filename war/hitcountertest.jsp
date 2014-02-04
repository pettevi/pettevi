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

<!DOCTYPE html>

<html>
  <head>
    <link type="text/css" rel="stylesheet" href="/stylesheets/header.css" />

<style type="text/css"> 
  html{overflow-y:scroll;}
  
  body,p {font-family:verdana,helvetica,arial,sans-serif;}
  
  body {font-size:14px;color:#555555;background-color:#f1f1f1;margin:0px;}
  p {margin:20px;}
  
  a.btn {text-align:center;display:block;width:170px;margin:10px auto;background-color:#f1f1f1;border:1px solid #e3e3e3;padding:8px;border-radius:4px;font-size:16px;color:#555555;text-decoration:none;}
  a.btn:hover {background-color:#555555;color:#ffffff;border:1px solid #555555;}

  #container {
    text-align:center;
    margin: 50px auto;
    position:relative;
  }
</style>
  </head>
  
  <body>


<div id="container">
<p>Counter: ${counter}</p>
<p>Try reloading page</p>
Check also the <a href="https://appengine.google.com/">Development Console</a>
</div>

<a class="btn" href="index.jsp" target="_top">Back to start page</a>


  </body>
</html>