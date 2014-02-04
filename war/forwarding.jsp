<!DOCTYPE html>

<html>
  <head>
    <link type="text/css" rel="stylesheet" href="/stylesheets/header.css" />

<style type="text/css">
div {
  display: inline-block;
  margin: 20px;
}

li {
  display: inline-block;
  vertical-align: top;
  border: 0 solid black;  
}

input[type="submit"]{
  margin: 20px 0;
  display: block;
}

p {
  margin: 20px;
}
</style>
  </head>

  <body>
 

<p>Select the type of forwarding</p>

    <ul id="listtable">
    <li id="listitem">
    <div id="section">
      <h1>3xx Redirection</h1>
      <form action="/forwarding" method="post">
      <label><input type="radio" name="redirection" value="300" checked>HTTP 300 Multiple Choices</label><br>
      <label><input type="radio" name="redirection" value="301">HTTP 301 Moved Permanently</label><br>
      <label><input type="radio" name="redirection" value="302">HTTP 302 Found</label><br>
      <label><input type="radio" name="redirection" value="303">HTTP 303 See Other</label><br>
      <label><input type="radio" name="redirection" value="304">HTTP 304 Not Modified</label><br>
      <label><input type="radio" name="redirection" value="305">HTTP 305 Use Proxy</label><br>
      <label><input type="radio" name="redirection" value="306">HTTP 306 Switch Proxy</label><br>
      <label><input type="radio" name="redirection" value="307">HTTP 307 Temporary Redirect</label><br>
      <input type="submit">
      </form>
     </div>
     </li>
     <li>
     <div>
     <h1>4xx Client Error</h1>
      <form action="/forwarding" method="post">
      <label><input type="radio" name="clienterror" value="400" checked>HTTP 400 Bad Request</label><br>
      <label><input type="radio" name="clienterror" value="401">HTTP 401 Unauthorized</label><br>
      <label><input type="radio" name="clienterror" value="402">HTTP 402 Payment Required</label><br>
      <label><input type="radio" name="clienterror" value="403">HTTP 403 Forbidden</label><br>
      <label><input type="radio" name="clienterror" value="404">HTTP 404 Not Found</label><br>
      <label><input type="radio" name="clienterror" value="405">HTTP 405 Method Not Allowed</label><br>
      <label><input type="radio" name="clienterror" value="406">HTTP 406 Not Acceptable</label><br>
      <label><input type="radio" name="clienterror" value="407">HTTP 407 Proxy Authentication Required</label><br>
      <label><input type="radio" name="clienterror" value="408">HTTP 408 Request Timeout</label><br>
      <label><input type="radio" name="clienterror" value="409">HTTP 409 Conflict</label><br>
      <label><input type="radio" name="clienterror" value="410">HTTP 410 Gone</label><br>
      <label><input type="radio" name="clienterror" value="411">HTTP 411 Length Required</label><br>
      <label><input type="radio" name="clienterror" value="412">HTTP 412 Precondition Failed</label><br>
      <label><input type="radio" name="clienterror" value="413">HTTP 413 Request Entity Too Large</label><br>
      <label><input type="radio" name="clienterror" value="414">HTTP 414 Request-URI Too Long</label><br>
      <label><input type="radio" name="clienterror" value="415">HTTP 415 Unsupported Media Type</label><br>
      <label><input type="radio" name="clienterror" value="416">HTTP 416 Requested Range Not Satisfiable</label><br>
      <label><input type="radio" name="clienterror" value="417">HTTP 417 Expectation Failed</label><br>
      <input type="submit">
      </form>
     </div>
     </li>
     <li>
     <div>
     <h1>5xx Server Error</h1>
      <form action="/forwarding" method="post">
      <label><input type="radio" name="servererror" value="500" checked>HTTP 500 Internal Server Error</label><br>
      <label><input type="radio" name="servererror" value="501">HTTP 501 Not Implemented</label><br>
      <label><input type="radio" name="servererror" value="502">HTTP 502 Bad Gateway</label><br>
      <label><input type="radio" name="servererror" value="503">HTTP 503 Service Unavailable</label><br>
      <label><input type="radio" name="servererror" value="504">HTTP 504 Gateway Timeout</label><br>
      <label><input type="radio" name="servererror" value="505">HTTP 505 HTTP Version Not Supported</label><br>
      <input type="submit">
      </form>
     </div>
     </li>
    </ul>
  </body>
</html>