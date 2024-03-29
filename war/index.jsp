<!DOCTYPE html>
<!-- This is html5 -->

<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<link href="stylesheets/header.css" rel="stylesheet" type="text/css" /> 
	<link href="stylesheets/contactbox.css" rel="stylesheet" type="text/css" />
	<link href="stylesheets/hover.css" rel="stylesheet" type="text/css" />
	<link href="menucool/js-image-slider.css" rel="stylesheet" type="text/css" />
	<script src="menucool/js-image-slider.js" type="text/javascript"></script>
    <title>HTML5 is fun!</title>
  </head>

  <body>

	<div id="fb-root"></div>
	<script>
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id))
				return;
			js = d.createElement(s);
			js.id = id;
			js.src = "//connect.facebook.net/fi_FI/all.js#xfbml=1";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
	</script>

	<div id="container">
    
<div id="header" class="test-header-section">
<ul id="shop-navigation-bar">
<li id="menu"><a id="menu" href="http://localhost:8080/_ah/admin">Admin Console</a></li>
<li id="menu"><a id="menu" href="html5button.html">Link Looks Like A Button</a></li>
<li id="menu"><a id="menu" href="secure.jsp">Secure Section</a></li>
<li id="menu"><a id="menu" href="javascript:void(0)" onclick="document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'">Get in Touch!</a></li>
</ul>
</div>

<a href="http://ianlunn.co.uk/articles/hover-css-tutorial-introduction/">
<div id="floating-frame" class="glow">
</div>
</a>

<div id="light" class="clearfix">
	<div id="close">
        <a href="javascript:void(0)" id="closebutton" onclick="document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'">
        <img src="close.png">
        </a>
	</div>

    <h1>Get In Touch!</h1>
    <h2>Fill out this super swanky HTML5 contact form to get in touch with us! Please provide your real name and email address and we'll get back to you a.s.a.p.</h2>  
    <ul id="errors" class="">
        <li id="info">There were some problems with your form submission:</li>  
    </ul>  
    <p id="success">Thanks for your message! We will get back to you ASAP!</p>  
    
    <form method="post" action="/processcontact">  
        <label for="name">Name <span class="required">*</span></label>  
        <input type="text" id="name" name="name" value="John Doe" placeholder="John Doe" required="required" autofocus="autofocus" />  
        <label for="email">Email Address <span class="required">*</span></label>  
        <input type="email" id="email" name="email" value="test@example.com" placeholder="johndoe@example.com" required="required" />

        <label for="message">Message <span class="required">*</span></label>  
        <textarea id="message" name="message" placeholder="Type your message here" required="required">Type your message here</textarea>  
          
        <span id="loading"></span>
        <input type="submit" value="Send" id="submit-button" />  
        <p id="req-field-desc"><span class="required">*</span> indicates a required field</p>  
    </form>

</div>

<div id="fade" class="black_overlay"></div>

<div id="main">

<a href="https://twitter.com/share" class="twitter-share-button" data-count="none">Tweet</a>
<script>
	!function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0], p = /^http:/
				.test(d.location) ? 'http' : 'https';
		if (!d.getElementById(id)) {
			js = d.createElement(s);
			js.id = id;
			js.src = p + '://platform.twitter.com/widgets.js';
			fjs.parentNode.insertBefore(js, fjs);
		}
	}(document, 'script', 'twitter-wjs');
</script>

<div id="fbframe" class="fb-like"
	data-href="https://developers.facebook.com/docs/plugins/"
	data-layout="standard" data-action="like" data-show-faces="false"
	data-share="false">
</div>


<div id="sliderFrame">
    <div id="slider">
       <img src="menucool/image1.jpg">
       <img src="menucool/image2.jpg" alt="">
       <img src="menucool/image3.jpg" alt="">
       <img src="menucool/image4.jpg" alt="">
       <img src="menucool/image5.jpg" alt="">
    </div>
</div>

<div id="userFrame">
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%
if (request.getUserPrincipal() != null) {
	String thisURL = request.getRequestURI();
	UserService userService = UserServiceFactory.getUserService();
	String logoutURL = userService.createLogoutURL(thisURL);
    out.println("<p>Hello, " + request.getUserPrincipal().getName() + ". <a href=\"" + logoutURL + "\">Sign out.</a></p>");
} else {
	String thisURL = request.getRequestURI();
	UserService userService = UserServiceFactory.getUserService();
	String loginURL = userService.createLoginURL(thisURL);
	out.println("<p>Please <a href=\"" + loginURL + "\">sign in</a>.</p>");
}
%>

</div>

	<div id="popular-theme">

      <div id="todays-specials">
      <a href="image.jsp">Image upload <span id="spanlink"></span></a> - Upload image to DB and display it
      </div>

      <div id="todays-specials">
      <a href="cookies.jsp">Cookies <span id="spanlink"></span></a> - Test about how to read, write and delete cookies.
      </div>

      <div id="todays-specials">
      <a href="ad.jsp">Ads <span id="spanlink"></span></a> - Advertising ad-ons from newspapers, jobs, latest ice hockey results and other plug-ins from snsstatic.fi 
      </div>

      <div id="todays-specials">
      <a href="youtube.jsp">YouTube <span id="spanlink"></span> integration</a> - How to integrate and display customised YouTube video on web page
      </div>

      <div id="todays-specials">
      <a href="googlemap.jsp">Maps <span id="spanlink"></span></a> - How to use different map services from Google, Microsoft, Nokia and others
      </div>

      <div id="todays-specials">
      <a href="forwarding.jsp">Server <span id="spanlink"></span> forwarding</a> - Server side forwarding and error handling
      </div>

      <div id="todays-specials">
      <a href="guestbook.jsp">Guestbook<span id="spanlink"></span></a> - Very very simply guestbook example to demonstrate user log in
      </div>
      
      <div id="todays-specials">
      <a href="formtest/formtest.jsp">Form test<span id="spanlink"></span></a> - Different forms and input controls just for testing
      </div>
      
      <div id="todays-specials">
      <a href="birthday.jsp">Birthday surprise<span id="spanlink"></span></a> - How to read server side form data and respond back to browser depending on the input
      </div>

      <div id="todays-specials">
      <a href="rot13/rot13.jsp">ROT13<span id="spanlink"></span></a> - Simple cypher encryption that replaces each English letter with the one 13 places forward or back along the alphabet
      </div>
      
      <div id="todays-specials">
      <a href="signup.jsp">Signup test<span id="spanlink"></span></a> - Sing-in, never sign-out, verifies your credentials on server side
      </div>
      
      <div id="todays-specials">
      <a href="titlegenerator.jsp">Job Title Generator<span id="spanlink"></span></a> - Get yourself a new job title, randomised
      </div>
      
      <div id="todays-specials">
      <a href="missiongenerator.jsp">Mission Statement Generator<span id="spanlink"></span></a> - Is your company missing proper mission? Get a new one here!
      </div>

      <div id="todays-specials">
      <a href="hitcounter">Page hit counter<span id="spanlink"></span></a> - See if somebody cares to visit you and how many times, a small example how to use AppEngine Datastore
      </div>
      
      <div id="todays-specials">
      <a href="http://localhost:8080/_ah/admin">Admin console<span id="spanlink"></span></a>
      </div>


</div>
</div>
</div>

<p></p>

<div id="bottom-banner">
<h3>SECURITY</h3>
<p>
When you sign up to us for a membership, no personal data safety guarantees can be made to any level of security available. We have not been trusted to deploy best of class anti-hacker protection, enabling visitors to verify the site's authenticity or to communicate with it securely via a high level of encryption, which should protect data such as user's name, password, credit card, addresses and shipping information from interception and hacking.
</p>
<br>
<h3>BROWSER REQUIREMENTS</h3>
<p>
Supported Browsers: 
<p>Internet Explorer: IE8, IE9</p> 
<p>Firefox: FF5.0 and current version</p>
<p>Google Chrome: current version</p>
<p>Safari: Current version on Mac OS (Safari is not fully supported on Windows)</p>
<br>
<p>
Supported Operating Systems: Windows 7, Windows XP, MAC
</p>
<br>
<p>
System Requirements: JavaScript enabled, Cookies accepted, Flash is not required nor wanted for optimal site performance
</p>

</div>

<div id="floatingFooter">
<div id="floatingFooterText">
<a href="privacypolicy.jsp">Privacy Policy</a>
</div>
</div>

  </body>
</html>
