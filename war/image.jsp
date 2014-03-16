<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
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
<%@ page import="com.google.appengine.api.datastore.Blob" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>

<html>
  <head>
    <meta charset="UTF-8">
  </head>

<style type="text/css"> 
html{overflow-y:scroll;color:#555555;font-family:verdana,helvetica,arial,sans-serif;}
input {font-family:verdana,helvetica,arial,sans-serif;}
body {font-size:14px;background-color:#f9f9f9;margin:0;padding:0}
p {margin:0 0 10px 0}

form {
	display: block;
	margin-top: 0em;
}

label{
    display: inline-block;
    clear: left;
    width: 130px;
    text-align: left;
}

input {
  display: inline-block;
  width: 250px;
}

a {
  color: #0057ab;
  text-decoration: none;
}

a:hover {
  color: #2279cd;
  text-decoration: underline;
}

#title {
  display: inline-block;
  width: 110px;
  text-align: left;
  margin: 0 0 4px 0;
}
    
#value {
  display: inline-block;
  width: 220px;
  text-align: left;
}

#deletelink
{ 
	display: inline-block;
	margin: 80px 0 0 0;
	bottom: 0;
	vertical-align:bottom;
	text-align: bottom;
}

.required {
  font-weight:bold;
  font-size:10px;
  color:#F00; 
}

#req-field-desc {
  font-style:italic;
  margin: 20px 0 0 0;
}

#slogan {font-family:verdana,helvetica,arial,sans-serif;color:#F0CCFF;text-align:center;font-size:26px;font-style:italic;margin:0 }

#topframe {background-color:#C526FF;margin:0;width:100%;height:160px}
#bottomframe {background-color:#C526FF;margin:0;width:100%;height:160px}
#inputframe {background-color:#ffffff;margin:20px}
#logoframe {margin:0 auto;width:750px;height:160px}

#frame {background-color:#ffffff;margin:0 auto;padding:10px 20px;width:750px}
#hline {background-color:#C526FF;color:#fff;line-height:26px;margin:10px auto;height:26px;width:100%}
#petframe {background-color:#ffffff;border:1px solid #cccccc;margin:20px auto;width:600px;height:240px;box-shadow: 0px 10px 20px 3px #d3d3d3;-webkit-box-shadow: 0px 10px 20px 3px #d3d3d3;-moz-box-shadow: 0px 10px 20px 3px #d3d3d3;}
#petdetails {background-color:#ffffff;margin:20px;height:200px}
#petimage {background-color:#ffffff;width:200px; height:200px;background-repeat:no-repeat;background-position: center center;border:1px solid #cccccc;float: left;margin:20px}
#error {background-color:#ffffff;border:1px solid #f00;margin:20px auto;padding: 20px;width:600px;}
</style>

<body>
  
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/fi_FI/all.js#xfbml=1";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>

<div id="topframe">
	<div id="logoframe">
	  <img style=";margin:0" src="logo.png">
	  <p id="slogan">Where pets go get found</p>
    <div style="float:right;" class="fb-like" data-href="http://hello-pettevi.appspot.com" data-width="110" data-layout="button" 
    data-action="like" data-show-faces="false" data-share="false"></div>
	</div>
</div>

<div id="frame">

<div id="inputframe">
  <p>Report lost pet</p>

  <form action="fileupload" method="post" enctype="multipart/form-data">
	    <label for="animalname">Pet name <span class="required">*</span></label>
		  <input type="text" value="Kukka" name="animalname" autocomplete="off">
		  <br>

		  <label for="identification">Identification</label>
	    <input type="text" value="Tail missing" name="identification" autocomplete="off">
      <br>

	    <label for="lastseen">Last seen</label>
	    <input type="text" value="Oulu, Jylkynkangas" name="lastseen" autocomplete="off">
      <br>

	    <label for="ownername">Owner name <span class="required">*</span></label>
	    <input type="text" value="Roger Moore" name="ownername" autocomplete="off">
      <br>

	    <label for="tel">Telephone <span class="required">*</span></label>
	    <input type="text" value="040 123456" name="tel" autocomplete="off">
      <br>

	    <label for="email">Email <span class="required">*</span></label>
	    <input type="text" value="pete.hamalainen@gmail.com" name="email">
	    <span style="font-style:italic;">Not shown in announcement</span>
      <br>

	    <label for="filename">Photo <span class="required">*</span></label>
		  <input type="file" name="filename">
      <br>

	    <label for="submit">&nbsp;</label>
	    <input type="submit" name="submit" value="Post Announcement">

	  <!-- p id="req-field-desc"><span class="required">*</span> indicates a required field</p>  -->
	  <%
	  String attr = (String) request.getAttribute("error");
	  if (attr != null) {
	  %>
	  <div id="error">
      <span style="color:red">${error}</span>
	  </div>
	  <% } %>
  </form>
</div>

<%
    DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
    // Run an ancestor query to ensure we see the most up-to-date
    // view of the Greetings belonging to the selected Guestbook.
    Query query = new Query("Animal");
    List<Entity> animals = datastore.prepare(query).asList(FetchOptions.Builder.withLimit(15));
    if (animals.isEmpty()) {
        %>
        <p>No messages.</p>
        <%
    } 
    else 
    {
    	  String numberofmessages = Integer.toString( animals.size() );
    	  pageContext.setAttribute("numberofmessages", numberofmessages);
        %>
        <div id="hline">
        Have you seen these pets?
        </div>
        <%
        for (Entity animal : animals) 
        {
            pageContext.setAttribute("animalname", animal.getProperty("AnimalName"));
            pageContext.setAttribute("identification", animal.getProperty("Identification"));
            pageContext.setAttribute("lastseen", animal.getProperty("Lastseen"));
            pageContext.setAttribute("ownername", animal.getProperty("Ownername"));
            pageContext.setAttribute("tel", animal.getProperty("Tel"));
            pageContext.setAttribute("email", animal.getProperty("Email"));
            Blob b = (Blob)animal.getProperty("Image");

            long key = animal.getKey().getId();
            
            pageContext.setAttribute("key", key);
            %>
            <div id="petframe">
	            <div id="petimage" style="background-image:url('image?id=<%=key%>');">
	            </div>
	            <div id="petdetails">
		            <span id="title">Pet name</span><span id="value">${fn:escapeXml(animalname)}</span>
		            <br>
		            <span id="title">Identification</span><span id="value">${fn:escapeXml(identification)}</span>            
                <br>
                <span id="title">Last seen</span><span id="value">${fn:escapeXml(lastseen)}</span>            
		            <br>
		            <span id="title">Owner name</span><span id="value">${fn:escapeXml(ownername)}</span>
		            <br>
		            <span id="title">Telephone</span><span id="value">${fn:escapeXml(tel)}</span>
		            <a id="deletelink" href="deletepost?id=<%=key%>">Remove announcement</a>
	            </div>
            </div>
            
            <%
        }
     }
%>
</div>
<div id="bottomframe">
</div>

  </body>
</html>