<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
  <head>
    <link type="text/css" rel="stylesheet" href="/stylesheets/main.css" />
  </head>
  
  <body>
  
  <p>version 25.11.2013</p>
 
	<form action="http://www.google.com/search">
	  <input name="q" placeholder='Etippä mulle'>
	  <input type="submit">
	</form>

	<form action="/formtest">
	  <input name="q" placeholder='GET test' value="Google" autocomplete="off" >
	  <input type="submit">
	</form>

  <form class="gc-search" action="http://www.bing.com" method="GET">
      <input type="text" name="q" class="q" id="q" value="Google" placeholder='Etippä mulle' autocomplete="off" />
      <input type="hidden" name="p" id="search_project" value="/appengine" />
	  <input type="submit">
  </form>

	<form action="/formtest" method="POST">
	  <input name="q" placeholder='POST test'>
	  <input type="submit">
	</form>

	<form>
	  <input type="password" name="q" placeholder='password'>
	  <input type="submit">
	</form>

	<form>
	  <input type="checkbox" name="q" checked>
	  <input type="checkbox" name="r">
	  <input type="checkbox" name="s">
	  <input type="submit">
	</form>

	<form>
	  <label>
	    Rom
	    <input type="radio" name="q" value="Rom" checked>
	  </label>
	  <label>
	    Vodka
	    <input type="radio" name="q" value="Vodka">
	  </label>
	  <label>
	    Whisky
	    <input type="radio" name="q" value="Whisky">
	  </label>
	  <input type="submit">
	</form>

	<form>
	  <select name="q">
	  <option value="FirstOption">I love Rom</option>
	  <option value="SecondOption">Vodka is preferred</option>
	  <option value="ThirdOption">Whisky is the best</option>
	  </select>
	  <input type="submit">
	</form>


<p>Here you have a list of random numbers:</p>
	<%
	java.util.Random r = new java.util.Random();
	for (int i=0; i<3; i++) {
		out.print("<LI>");
		out.println(r.nextInt());
	}
	%>

	<%
	String attr = (String) request.getAttribute("testattribute");
	%>
	
	<p>JSTL core annotation test</p>
	<c:set var="x" value="5"/> 
	<c:out value="${x}"/>

<p>

<div style="border:2px solid black;width:300px;">
Got: <b><%= request.getAttribute("testattribute") %></b>
</div>

  </body>

</html>