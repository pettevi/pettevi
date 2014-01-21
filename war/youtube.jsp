<!DOCTYPE html>
<html lang="en-us">
<head>
<meta charset="utf-8">

<link href="stylesheets/hover.css" rel="stylesheet" media="all">

<style type="text/css"> 
html{overflow-y:scroll;}
body,p,input {font-family:verdana,helvetica,arial,sans-serif;}
body {font-size:14px;color:#555555;background-color:#f1f1f1;margin:0px;}

#playerframe {background-color:#ffffff;margin:20px auto;width:640px;height:390px;position:relative;box-shadow: 0px 10px 20px 3px #d3d3d3;}
a.btn-border-fade {display:block;width:170px;margin-bottom:10px;background-color:#ffffff;padding:8px;border-radius:4px;font-size:16px;color:#555555;text-decoration:none;text-align:center;width:100px;float:left;margin-left:20px;}
a.btn-border-fade:hover {background-color:#ffffff}
#padframe {width:640px;height:30px;margin:20px 20px 20px 20px;}

</style>


    <script>
      // 2. This code loads the IFrame Player API code asynchronously.
      var tag = document.createElement('script');

      tag.src = "https://www.youtube.com/iframe_api";
      var firstScriptTag = document.getElementsByTagName('script')[0];
      firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

      // 3. This function creates an <iframe> (and YouTube player)
      //    after the API code downloads.
      var player;
      function onYouTubeIframeAPIReady() {
        player = new YT.Player('player', {
            height: '390',
            width: '640',
            videoId: 'ney29ZnP_BE',
          events: {
            'onReady': onPlayerReady,
            'onStateChange': onPlayerStateChange
          }
        });
      }

      // 4. The API will call this function when the video player is ready.
      function onPlayerReady(event) {
        event.target.playVideo();
      }

      // 5. The API calls this function when the player's state changes.
      //    The function indicates that when playing a video (state=1),
      //    the player should play for six seconds and then stop.
      var done = false;
      function onPlayerStateChange(event) {
        if (event.data == YT.PlayerState.PLAYING && !done) {
          //setTimeout(stopVideo, 6000);
          //done = true;
        }
      }
      
      function stopVideo() {
        player.stopVideo();
      }
      
      function newvid1() {
    	player.loadVideoById({'videoId': 'I5PQSsAVhno'});
      }
      
      function newvid2() {
       	player.loadVideoById({'videoId': 'ney29ZnP_BE'});
      }

    </script>
    
</head>

<body>

    <!-- 1. The <iframe> (and video player) will replace this <div> tag. -->
    <div id="playerframe">

    <iframe id="player" type="text/html" width="640" height="390"
  src="http://www.youtube.com/embed/ney29ZnP_BE?enablejsapi=1&autoplay=1&controls=0&rel=0&showinfo=0&modestbranding=1" frameborder="0"></iframe>

	<div id="padframe">
	<h2>See also our other offering</h2>
	</div>

    <a class="btn-border-fade border-fade" href="javascript:void(0);" onclick="newvid1();">Alternative Animation</a>
    <a class="btn-border-fade border-fade" href="javascript:void(0);" onclick="newvid2();">Main Theme</a>
    </div>

  </body>
  
</html>