<%@ page language="java" import="java.util.*"%>

  <html>
  <head>
      <link type="text/css" rel="stylesheet" href="/stylesheets/header.css">
  <title>Show Saved Cookie</title>
  <style>
  p {
  margin: 10px;
  }
  label {
  display: block;
  margin: auto 10px;
  }
  input {
  margin: 2px 10px;
  }
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

<form action="/cookies" method="post">
<p>Create a new cookie</p>
<label>Item 1<input type="text" placeholder='First string' maxlength="20" name=a></label>
<label>Item 2<input type="text" placeholder='Second string' maxlength="20" name=b></label>
<label>Item 3<input type="text" placeholder='Third string' maxlength="20" name=c></label>
<input type="submit" value="Create cookie">
</form>

<form action="/cookies" method="post">
<p>Delete a cookie</p>
<label>Cookie Name<input type="text" placeholder='Qualified name' name=delete></label>
<input type="submit" value="Delete cookie">
</form>

<%
	Cookie cookies[] = request.getCookies();
	if (cookies != null) {
		for (int i = 0; i < cookies.length; i++) {
				  out.println("<p><b>Cookie name: " + cookies[i].getName() + "<br>");
          out.println("Cookie value: " + cookies[i].getValue() + "</b><br>");
          out.println("Cookie comment: " + cookies[i].getComment() + "<br>");
          out.println("Cookie domain: " + cookies[i].getDomain() + "<br>");
          out.println("Cookie version: " + cookies[i].getVersion() + "<br>");
          out.println("Cookie secure: " + cookies[i].getSecure() + "<br>");
          out.println("Cookie path: " + cookies[i].getPath() + "<br>");
          out.println("Cookie max age: " + cookies[i].getMaxAge() + "</p>");          
			}
		}
  %>
  
    
</body>

</html>
  