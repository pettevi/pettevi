<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>

<html>
  <head>
    <link type="text/css" rel="stylesheet" href="/stylesheets/header.css" />
  </head>
  
  <body>
  
  <p>version 27.11.2013</p>

<form action="/signup" method="post">
<label>Username
	<input name="username" placeholder='name' autocomplete="off">
	<font style="color:red">${usernameerror}</font>
</label>
<br>
<label>Password
	<input name="password" type="password" placeholder='passwd1'>
	<font style="color:red">${passworderror}</font>
</label>
<br>
<label>Verify Password
	<input name="verify" type="password" placeholder='passwd2'>
	<font style="color:red">${verifyerror}</font>
</label>
<br>
<label>Email (optional)
	<input name="email" placeholder='email'>
	<font style="color:red">${emailerror}</font>
</label>
<br>
	<input type="submit">  
</form>

  </body>

</html>