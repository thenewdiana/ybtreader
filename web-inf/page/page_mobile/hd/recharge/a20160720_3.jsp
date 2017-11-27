<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../../common_m.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="baidu-site-verification" content="5GyDuFcAyQ" />
<meta property="wb:webmaster" content="d4230f7a301ff22c" />
<meta property="qc:admins" content="255257467665241676375" />
<title>＃雁北堂周年庆回馈用户豪华大礼送不停＃</title>
<meta name="keywords" content="＃雁北堂 周年庆回馈用户豪华大礼送不停＃"></meta>
<meta name="description" content="雁北堂 周年庆回馈用户豪华大礼送不停 2016年7月20日至26日在雁北堂中文网完成注册并激活成功的用户可领200糖豆"></meta>
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="${sessionScope.baseUrl}mobile/css/common.css"/>
<link rel="stylesheet" href="${sessionScope.baseUrl}mobile/css/style.css"/>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/statistics_bd.js"></script>
<script type="text/javascript"  src="${sessionScope.baseUrl}mobile/js/jquery.min.js"></script>
<!--[if lt IE 9]>
<script type="text/javascript"  src="${sessionScope.baseUrl}mobile/js/html5.js"></script>
<![endif]-->
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/jquery.alert.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}mobile/js/main.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}mobile/js/TouchSlide.1.1.js"></script>
</head>
<style type="text/css">
body {
	background-color:white;
	background:url(none);
}
div {
	margin:0 auto;
	width:100%;
}
.a0720 {
	hheight: 2240px;
    background-size: 100% 100%;
    background-repeat:no-repeat;
}
.top {
	margin-top:10px	
}
.userpanel {
    width: 190px;
    height: 40px;
    line-height:30px;
    float: right;
}
.user {
	float: right;
    font-size: 14px;
    font-weight:bold;
    text-align: center;
}
.toplink {
	position: absolute;
    left: 9%;
    width:40%
}
.toplink a {
	font-size:16px;
}
#left {
	height:30px;
	line-height:30px;
	font-weight:bold;
	text-align: center;
    margin-left: auto;
    margin-right: auto;
	width:50px;
	float:left;
}
.selected {
	border-bottom:2px solid red;
}
.toplink .selected a {
	color:red;
}
.toplogo {
    width: 22%;
    float:left;
}
.toplogo a img {
	width:100%
}
.btitle img {
	width:100%
}
#title a {
	font-size:11pt;
}
.bmain {
	margin:0 auto;
	width:100%;
	background-image: url(${sessionScope.baseUrl}pc/images/activity/20160720/back.png);
	background-size: 100% 100%;
    background-repeat:no-repeat;
}
.bmain .mainbody {
	width:80%
}
.bmain .mainbody .tab {
	width: 33.3%;
	float:left;
}
.bmain .mainbody .tab img {
	width:98%
}
.maininfo img {
	width:100%
}
.maininfo .get {
	text-align:center;
	margin-left:auto;
	margin-right:auto;
	background-image: url(${sessionScope.baseUrl}pc/images/activity/20160720/main1-2.png);
	background-size: 100% 100%;
    background-repeat:no-repeat;
}
.maininfo .get img {
	width:40%
}
#main2 {
    position: relative;
}
#rotate {
	position: absolute;
    left: 22%;
    top: 0px;
    height: 100%;
    width: 57%;
}
#line1 {
	height:6.2%
}
#line2 {
	height:29.2%
}
#line3 {
	height:29%;
}
#line4 {
	height:29%
}
.col1 {
	float: left;
    width: 26.5%;
    height: 100%;
}
.col2 {
	float: left;
    width: 46.2%;
    height: 100%;
}
.col3 {
	float:left;
	width:26.3%;
	height:100%;
}
#main3 {
    position: relative;
    background-image:url(${sessionScope.baseUrl}pc/images/activity/20160720/main3-3-2.png);
    background-repeat: no-repeat;
    background-size: 100% 100%;
}
.ruledetail {
	pposition:absolute;
	top:0;
}
#ticket {
	font-size: 18px;
    font-weight: bold;
    color: #D92937;
    height: 85px;
    line-height: 85px;
    width: 62%;
}
#ticket.m {
	font-size: 10px;
    font-weight: bold;
    height: 25px;
    line-height: 25px;
    width: 80%;
}
#ticket div.now {
	float:left;
	width:70%;
	text-align:center;
}
#ticket div.gettimes{
    float: right;
    width: 29%;
    vertical-align: middle;
    line-height: 80px;
    height: 80px;
    display: table-cell;
}
#ticket.m div.now {
	float:left;
	width:70%;
	text-align:center;
}
#ticket.m div.gettimes{
    width: 29%;
    line-height: 25px;
    height: 25px;
}

#ticket_num {
	font-size: 20px;
    font-weight: bold;
    color: #D92937;
    font-style: italic;
}
#ticket_num.m {
	font-size: 12px;
    font-weight: bold;
    color: #D92937;
    font-style: italic;
}
#logs {
	width: 60%;
    height: 100px;
    border-style: dashed;
    border-width: 1px;
    border-color: #dd1222;
}

#logs.m {
	width: 80%;
	height:60px;
    border-style: dashed;
    border-width: 1px;
    border-color: #dd1222;
}
marquee ul {
	overflow:hidden;
}
marquee ul li {
	margin-left:10px;
}
.log {
	padding-left: 10px;
    height: 30px;
    line-height: 30px;
    font-size: 14px;
}
.m .log {
	padding-left: 10px;
    height: 20px;
    line-height: 20px;
    font-size: 10px;
}
.time {
	font-size:10px;
	display:none;
}
div .ruleh {
	text-align: center;
    color: black;
    font-family: 黑体;
    font-size: 18px;
    font-weight: bold;
    height: 30px;
    line-height: 30px;
}
div .rulehm {
	text-align: center;
    color: black;
    font-family: 黑体;
    font-size: 12px;
    font-weight: bold;
    height: 20px;
    line-height: 20px;
    border-color: #dd1222;
}
.rulehr {
	height: 1px;
    border-style: dashed none none none;
    border-width: 1px;
    width: 70%;
}
.ruleitem {
	font-size:12px;
	font-weight:bold;
	width:65%;
}
.ruleitem_m {
	font-size:10px;
	width:90%;
}
.ruleitem li {
    list-style: square inside;
    height: 30px;
    line-height: 30px;
}
.ruleitem_m li {
    list-style: square inside;
}
.warn {
	color:#D6132C;
}
#footer {
	margin-top:20px;
}
#footer .left {
	float:left;
	width:210px;
	margin-left:20px;
	color:black;
	font-size:12px;
}
#footer .leftm {
	width:210px;
	margin-left:20px;
	color:black;
	font-size:12px;
}
#footer .left div {
	margin-top:10px;
	font-weight:bold;
	line-height:30px;
}
#footer .leftm div {
	margin-top:10px;
	font-weight:bold;
	line-height:25px;
}
#footer .left img {
	width:135px;
}
#footer .leftm img {
	width:135px;
}
#footer .right {
	float:right;
	width:250px;
	margin-left:20px;
	font-weight:bold;
	font-size:12px;
	color:black;
}
#footer .rightm {
	width:250px;
	margin-left:20px;
	font-weight:bold;
	font-size:12px;
	color:black;
}
#footer .right div {
	line-height:30px;
}
#footer .rightm div {
	line-height:25px;
}
#icp {
	width:350px;
	height:60px;
	line-height:60px;
}

.h15 {height:10px;}
.h30 {height:30px;}
.h35 {height:35px;}
.h70 {height:80px}
.h50 {height:50px}

.border div.b {
	width:100%;
	height:100%;
	border-color: white;
    border-style: solid;
	border-width: 2px;  
    moz-border-radius: 3px 3px 3px 3px;
    -webkit-border-radius: 3px 3px 3px 3px;
    border-radius: 3px 3px 3px 3px;
}
.toolconmask {
	width: 100%;
	height: 100%;
	z-index: 99999;
	position: fixed;
	top: 0px;
	left: 0px;
	opacity: 0.4;
	background-color: rgb(241, 241, 243);
	display:none;
}
.toolcon {
	z-index: 999999;
	width: 495px;
	height: 250px;
	border: 7px solid rgb(223, 223, 224);
	color: rgb(0, 0, 0);
	font-size: 14px;
	box-shadow: rgb(0, 0, 0) 0px 0px 18px;
	opacity: 1;
	border-radius: 8px;
	position: fixed; 
	top: 263.5px; 
	left: 427px;
	background-image: url(${sessionScope.baseUrl}pc/images/activity/20160720/popback.png);
	background-color:white;
	background-repeat: no-repeat;
    background-size: 100%;
	display:none
}
.nodot {-webkit-user-select: none;}
.circle-btn {
    border-radius: 5px;
    transition: all 0.4s;
    -moz-transition: all 0.4s ease;
    -o-transition: all 0.4s ease;
    -webkit-transition: all 0.4s ease;
    transition: all 0.4s ease;
    vertical-align: middle;
    line-height:20px;
    font-size:14px;
}
.selected {
	border: 2px solid #808080;
}
.circle-btn.active {
    border-width: 5px;
    border-color: #1dace8;
}
.cost {
	color:#FF771C;
	font-size:14px;
}
.costdesc {
	font-size:10px;
}
.confirmgold {background:rgb(250,250,250)}
.confirmgold p {color:black}
.confirmgold .costprice {height:40px;padding-left:30px;line-height:40px;background-color:lightgray}
.confirmbomb {background:rgb(0,0,0)}
.confirmbomb p {color:white}
.confirmbomb .costprice {height:40px;padding-left:30px;line-height:40px;background-color:gray}
#dlgContent {
	text-align: center;
    height: 130px;
    line-height: 60px;
}
#dlgConfirm {
	text-align: center;
    height: 130px;
    line-height: 30px;
    display:none;
}
#tbConsumeTicketNum {
	width: 80px;
    text-align: center;
    border-style: none;
}
span.rinput {
	position:relative;
	width:82px;
    line-height:21px;
    height:21px;
    border: 1px solid #95B8E7;
    display: inline-block;
    white-space: nowrap;
}
.rbox {
	moz-border-radius: 3px 3px 3px 3px;
    -webkit-border-radius: 3px 3px 3px 3px;
    border-radius: 3px 3px 3px 3px;
}
.incbtn {
	position: absolute;
    width: 16px;
    height: 16px;
    line-height: 16px;
    vertical-align: middle;
    text-align: center;
    margin: 0 auto;
}
.inc {
	right:2px;
	top:2px;
	background-image: url(${sessionScope.baseUrl}pc/images/activity/20160720/inc.png);
	background-repeat: no-repeat;
    background-size: 100%;
}
.dec {
	left:2px;
	top:2px;
	background-image: url(${sessionScope.baseUrl}pc/images/activity/20160720/dec.png);
	background-repeat: no-repeat;
    background-size: 100%;
}
.mydlgbtn {
	cursor: pointer;
    color: rgb(49, 46, 36);
    line-height: 24px;
    padding: 3px 40px;
    border: 1px solid rgb(167, 156, 126);
    border-radius: 15px;
    margin: 0px 10px;
    background: rgb(226, 225, 223);
}
.btnselected {
	background: rgb(255, 62, 1);
	color: rgb(252, 255, 254);
}
</style>
<script type="text/javascript">
function addFav(url, sitename){
	try {
		if( window.sidebar ) {
			sidebar.addPanel(sitename, url, '');
		}
		else {
			external.addFavorite(url, sitename);
		}
  	} catch(e) {
  		alert("加入收藏失败，请按Ctrl+D进行添加");
  	}
  	
  	return false;
}

function setHome(obj,url){
    try{
        obj.style.behavior = 'url(#default#homepage)';
        obj.setHomePage(url);
    }catch(e){
        if(window.netscape){
            try{
                netscape.security.PrivilegeManager.enablePrivilege('UniversalXPConnect');
            }catch(e){
                alert('抱歉，此操作被浏览器拒绝！\n\n请在浏览器地址栏输入“about:config”并回车\n\n然后将[signed.applets.codebase_principal_support]的值设置为true，双击即可。');
            }
            var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components.interfaces.nsIPrefBranch);
            prefs.setCharPref('browser.startup.homepage',url);
        }else{
            alert('抱歉，您所使用的浏览器无法完成此操作。\n\n您需要手动将【' + url + '】设置为首页。');
        }
    }
}

function getLoginUrl() {
	if( location.href.indexOf("/m/") > 0 ) {
		return "${pageContext.request.contextPath }/m/user/login?redirectUrl=" + location.href;			
	}
	else {
		return "${pageContext.request.contextPath }/user/login?redirectUrl=" + location.href;		
	}
}

function getLogoutUrl() {
	if( location.href.indexOf("/m/") > 0 ) {
		return "${pageContext.request.contextPath }/m/user/logout";			
	}
	else {
		return "${pageContext.request.contextPath }/user/logout";		
	}
}

function isLogin() {
	var userId = "${sessionScope.sessionFrontBean.userId}";
	if (userId == null || userId == "") {
		window.location.href = getLoginUrl();
		return false;
	}
	
	return true;
}

function goRecharge() {
	hideInputDialog();
	if( location.href.indexOf("/m/") > 0 ) {
		location.href = "${pageContext.request.contextPath }/m/recharge";
	}
	else {
		location.href = "${pageContext.request.contextPath }/recharge/index";
	}
}

function hideInputDialog() {
	$("#gold_box").hide();
	$("#gold_con").hide();
}

function setAlertSize() {
	if($(window).width() < 800 ) {
		$(".toolcon").css("left","10%").css("width","80%");
	}
}

function confirmThis(msg, okfunc) {
	$("#dlgContent").hide();
	$("#dlgConfirm").html(msg).show();
	$("#gold_box").show();
	$("#gold_con").show();
	$("#gold_btn_ok").unbind("click").bind("click", okfunc);
	
	var w = parseInt($(window).width() * 0.8);
	if (w > 495 ) {
		w = 495;
	}
	$("#gold_con").css({width : w+"px", left : (document.documentElement.clientWidth-w)/2+"px"});
}

function alertThis(msg) {
	confirmThis(msg, hideInputDialog);
}

function checkMobileNo(str) {
    var re = /^1\d{10}$/;
    if( re.test(str) ) return true;
    return false;
}

function checkAndUploadMobile() {
	var tel = $("#tbMobile").val();
	if( !checkMobileNo(tel) ) {
		hideInputDialog();
		//$.MsgBox.Alert("提示","您输入的手机号格式不正确。请进入用户管理-个人设置中进行设置");
		alertThis("您输入的手机号格式不正确。请进入用户管理-个人设置中进行设置");
		return;
	}
	
	$.ajax({
		type : "POST",
		dataType : "json",
		async:true,
		url : "${pageContext.request.contextPath }/lottery/setmobile?mobile=" + tel,
		success : function(json) {
			if (json.resBean.code != 0) {
				//$.MsgBox.Alert("提示", "手机号保存失败。您可以进入用户管理-个人设置中进行设置");
				alertThis("手机号保存失败。您可以进入用户管理-个人设置中进行设置");
				return;
			}
			
			//$.MsgBox.Alert("提示", "手机号保存成功。您可以进入用户管理-个人设置中进行修改");
			alertThis("手机号保存成功。您可以进入用户管理-个人设置中进行修改");
		},
	});
}

function inputMobile(item, mobile) {
	var no = (mobile == null || mobile == "null") ? "" : mobile;
	var html = "<span class='warn'>哇！人品爆棚啦，恭喜您获得" + item.name + " 1个</span><br/><span style='font-weight:bold;'>请输入手机号，方便客服人员联系您</span><br/><span><input id='tbMobile' style='text-align:center' value='" + no + "'/></span><br/><span>客服QQ：806311453</span>";
	confirmThis(html, checkAndUploadMobile);
}

function showLogs(logs) {
	if( logs == null || typeof(logs) === "undefined" ) return;
	for(var i = logs.length-1; i >= 0; i --) {
		var log = logs[i]; 
		var html = "<ul><li><span class='warn'>" + log.userNick + "</span> 幸运的抽中了 <span class='warn'>" + log.itemName + "</span> x1 <span class='time'>[" + log.timeStr + "]</span></li></ul>";
		$(html).insertBefore($("marquee ul:eq(0)"));
	}
}

function buyTicket() {
	var val = parseInt($("#tbConsumeTicketNum").val());
	if( val <= 0 ) return;
	
	if (!isLogin()) {
		return;
	}
	hideInputDialog();
	$.ajax({
		type : "POST",
		dataType : "json",
		async:true,
		url : "${pageContext.request.contextPath }/lottery/buyticket?ticketNum=" + val,
		success : function(json) {
			if( typeof(json.ticketNum) != "undefined" )
				$("#ticket_num").text(""+json.ticketNum);
			
			if( json.resBean.code == 2 ) {
				confirmThis("您的糖豆不足，是否继续充值？", goRecharge);
				return;
			}
			
			if (json.resBean.code != 0) {
				//$.MsgBox.Alert("提示", json.resBean.msg);
				alertThis(json.resBean.msg);
				return;
			}
			
			showLogs(json.log);
			
			//$("#logs").html(html);
			//$.MsgBox.Alert("提示", "兑换成功 ");
			alertThis("兑换成功");
		}
	});
}

var _gotItem = null;
var _mobile = "";
var _step = 50;
var lastGrid = null;
var _stopRotate = false;
var _calloutId = -1;
var _finished = false;
var _finishMsg = "";

var initstep = 100;
var incstep = 20;
var finishspeed = 800;

function stopRotate() {
	clearTimeout(_calloutId);
	if( lastGrid != null ) {
		lastGrid.removeClass("border");
	}
	_calloutId = -1;
	_stopRotate = true;
	_step = initstep;
	_gotItem = null;
	_mobile = "";
	lastGrid = null;
}

function startRotate() {
	clearTimeout(_calloutId);
	$("div.rotate").removeClass("border");
	_step = initstep;
	_stopRotate = false;
	_finished = false;
	_finishMsg = "";
	
	_gotItem = null;
	_mobile = "";
	lastGrid = null;
	
	rotate_loop();
}

function isThisGrid(grid) {
	var item = _gotItem;
	
	if( isGotGift() ) {
		var itemId = item.itemId;
		var itemName = item.name;
		
		var gridId = grid.attr("itemid");
		var gridname = grid.attr("itemname");
		
		if( itemId == gridId ) return true;
		if( itemName == gridname ) return true;
		return false;
	}
	
	return grid.attr("itemname") == "thankyou";
}

function isRotateEnd() {
	return _gotItem != null || _finished == true;
}

function isGotGift() {
	return _gotItem != null;
}

function rotate_loop() {
	var idx;
	if( lastGrid != null ) {
		idx = lastGrid.attr("rotateindex");
		lastGrid.removeClass("border");
	}
	else {
		idx = 0;
	}
	
	if( _stopRotate ) {
		lastGrid = null;
		return;
	}
	
	idx = parseInt(idx) + 1;
	if( idx > 8 ) {
		idx = 1;
	}
	
	if( isRotateEnd() ) {
		_step += incstep;
	}
	
	lastGrid = $("div.rotate[rotateindex=" + idx + "]");
	lastGrid.addClass("border");

	// 速度未达到，再转一圈
	if( _step <= finishspeed || !isRotateEnd() || !isThisGrid(lastGrid) ) {
		_calloutId = setTimeout("rotate_loop()", _step);
		return;
	}
	
	_calloutId = -1;
	
	if( !isGotGift() ) {
		alertThis(_finishMsg);
		return;
	}
	
	// 实物，需要记录手机号
	if( _gotItem.itemType == 3) {
		inputMobile(_gotItem, _mobile);
	}
	else {
		confirmThis("哇！人品爆棚啦，恭喜您获得 " + _gotItem.name + " 1个", hideInputDialog);
	}
}

function rotateToItem(item, mobile) {
	_gotItem = item;
	_mobile = mobile;
	
	rotate();
}

function rotateTicket() {
	if( _calloutId != -1 ) return;
	
	startRotate();
	
	$.ajax({
		type : "POST",
		dataType : "json",
		async:true,
		url : "${pageContext.request.contextPath }/lottery/useticket",
		success : function(json) {
			if( typeof(json.ticketNum) != "undefined" )
				$("#ticket_num").text(""+json.ticketNum);
			
			if (json.resBean.code != 0) {
				//$.MsgBox.Alert("提示", json.resBean.msg);
				//stopRotate();
				//alertThis(json.resBean.msg);
				_finishMsg = json.resBean.msg;
				_finished = true;
				return;
			}
			
			showLogs(json.log);
			
			_gotItem = json.item;
			_mobile = json.mobile;
			
			/*
			if( json.item.itemType == 3) {
				inputMobile(json.item, json.mobile);
			}
			else {
				confirmThis("哇！人品爆棚啦，恭喜您获得 " + json.item.name + " 1个", hideInputDialog);
			}
			*/
			//$.MsgBox.Alert("提示", "哇！人品爆棚啦，恭喜您获得 " + json.item.name + " 1个");
		}
	});
}
</script>
<script type="text/javascript">
	$(document).ready(function() {
		setAlertSize();
		
		$(".inc").click(function() {
			var consumeValue = $("#lkGetTimes").attr("consumevalue");
			var num = $("#lkGetTimes").attr("ticketnum");
			var val = $("#tbConsumeTicketNum").val();
			$("#tbConsumeTicketNum").val(num*parseInt(val/num+1));
			val = $("#tbConsumeTicketNum").val();
			$("#lbConsumeValue").text(""+parseInt(consumeValue*val/num));
		});
		$(".dec").click(function(){
			var consumeValue = $("#lkGetTimes").attr("consumevalue");
			var num = parseInt($("#lkGetTimes").attr("ticketnum"));
			var val = parseInt($("#tbConsumeTicketNum").val()) - num;
			if( val < num ) val = num;
			$("#tbConsumeTicketNum").val(num*parseInt(val/num));
			val = $("#tbConsumeTicketNum").val();
			$("#lbConsumeValue").text(""+parseInt(consumeValue*val/num));
		});
		
		$("div #left").mouseover(function(){
			$(this).addClass("selected");
		})
		.mouseout(function() {
			$(this).removeClass("selected");
		});
		
		$("#login").attr("href", getLoginUrl());
		$("#logout").attr("href", getLogoutUrl());
		
		$("#addfav").click(function() {
			addFav(location.href,'雁北堂文学网');
		});
		$("#goebtang").click(function() {
			window.top.location.href = "${pageContext.request.contextPath }/";
		});
		
		$("#gohome").click(function() {
			if( location.href.indexOf("/m/") > 0 )
				window.top.location.href = "${pageContext.request.contextPath }/m";
			else
				window.top.location.href = "${pageContext.request.contextPath }/";
		});
		
		$("#lkGetTimes").bind("click", function() {
			var obj = $(this);
			var consumeValue = $(obj).attr("consumevalue");
			var num = $(obj).attr("ticketnum");
			
			$("#dlgContent").show();
			$("#dlgConfirm").hide();
			$("#gold_box").show();
			$("#gold_con").show();
			
			$("#gold_btn_ok").unbind("click").bind("click",buyTicket);
		});
	
		$("#gold_btn_no").click(hideInputDialog);
		
		$("#lkGetBonus").click(function() {
	   		if (!isLogin()) {
				return;
			}
			rotateTicket();
		});
		
		$(".mydlgbtn").mouseover(function() {
			$(this).addClass("btnselected");
		}).mouseout(function(){
			$(this).removeClass("btnselected");	
		});
	});
   	</script>
</head>

<body>
<div>
	<!--header begin-->
	<div class="top">
		<div class="toplink">
			<div class="toplogo">
				<a id="goebtang" href="javascript:void();" title="返回首页"><img src="${sessionScope.baseUrl}pc/images/activity/20160720/logo.png"/></a>
			</div>
			<div id="left">
				<a id="gohome" href="javascript:void();">首页</a>
			</div>
			<div id="left">
				<a id="addfav" rel="sidebar" href="javascript:void();">收藏</a>
			</div>
			<div class="clear"></div>
		</div>
		<div class="btitle">
			<div>
				<div class="userpanel">
					<div class="user">
					<c:choose>
					<c:when test="${sessionScope.sessionFrontBean != null}">
   						<a href="${pageContext.request.contextPath }/user">${sessionScope.sessionFrontBean.userNick}</a> [<a id="logout" href="#">退出</a>]
   					</c:when>
   					<c:otherwise>
   						[<a id="login" href="#">登陆</a>]
   					</c:otherwise>
   					</c:choose>
					</div>
		      	   	<div class="clear"></div>
			    </div>
			</div>
		    <div>
		    	<img src="${sessionScope.baseUrl}pc/images/activity/20160720/banner-3_02.png">
		    </div>
	    </div>
	    <div class="clear"></div>
	</div>
	<div class="bmain">
		<div class="h35"></div>
		<div class="mainbody">
			<div>
				<div class="tab">
					<a href="a20160720"><img src="${sessionScope.baseUrl}pc/images/activity/20160720/btn1-g.png"></a>
				</div>
				<div class="tab">
					<a href="a20160727"><img src="${sessionScope.baseUrl}pc/images/activity/20160720/btn2-g.png"></a>
				</div>
				<div class="tab">
					<a href="a20160803"><img src="${sessionScope.baseUrl}pc/images/activity/20160720/btn3.png"></a>
				</div>
				<div class="clear"></div>
			</div>
			<div class="h30"></div>
			<div class="maininfo">
				<img src="${sessionScope.baseUrl}pc/images/activity/20160720/main3-1.png">
				<div id="main2">
					<img src="${sessionScope.baseUrl}pc/images/activity/20160720/main3-2.png">
					<div id="rotate">
						<div id="line1">
						</div>
						<div id="line2">
							<div class="col1 rotate" rotateindex="1" itemid="0" itemname="ipadmini">
								<div class="b"></div>
							</div>
							<div class="col2 rotate" rotateindex="2" itemid="0" itemname="500糖豆">
								<div class="b"></div>
							</div>
							<div class="col3 rotate" rotateindex="3" itemid="0" itemname="大宗师折扇">
								<div class="b"></div>
							</div>
							<div class="clear"></div>
						</div>
						<div id="line3">
							<div class="col1 rotate" rotateindex="8" itemid="0" itemname="玉螟蛉">
								<div class="b"></div>
							</div>
							<div class="col2">
								<a href="javascript:void()" id="lkGetBonus">
									<img src="${sessionScope.baseUrl}pc/images/activity/20160720/btn-getbonus.png" style="opacity: 0;filter: alpha(opacity=0);width:95%">
								</a>
							</div>
							<div class="col3 rotate" rotateindex="4" itemid="0" itemname="iphone 6s">
								<div class="b"></div>
							</div>
							<div class="clear"></div>
						</div>
						<div id="line4">
							<div class="col1 rotate" rotateindex="7" itemid="0" itemname="200糖豆">
								<div class="b"></div>
							</div>
							<div class="col2 rotate" rotateindex="6" itemid="0" itemname="斯格拉柔达T恤">
								<div class="b"></div>
							</div>
							<div class="col3 rotate" rotateindex="5" itemid="0" itemname="thankyou">
								<div class="b"></div>
							</div>
							<div class="clear"></div>
						</div>
					</div>
				</div>
				<div id="main3">
					<!-- <img src="${sessionScope.baseUrl}pc/images/activity/20160720/main3-3-2.png"> -->
					<!-- 
					<div class='gettimes'>
						<c:if test="${lottery != null}">
						<a id='lkGetTimes' href="javascript:void()" consumevalue="${lottery.consumeValue}" ticketnum="${lottery.consumeTicketNum }"><img src="${sessionScope.baseUrl}pc/images/activity/20160720/btn-gettimes.png"></a>
						</c:if>
					</div>
					 -->
					<div class="ruledetail">
						<div id="ticket" <c:if test="${is_mobile==1}">class="m"</c:if>>
							<div class="now">
								<span>今日抽奖机会：</span>
								<span id="ticket_num" <c:if test="${is_mobile==1}">class="m"</c:if>>${ticketNum}次</span>
							</div>
							<div class="gettimes">
								<a id='lkGetTimes' href="javascript:void()" consumevalue="${lottery.consumeValue}" ticketnum="${lottery.consumeTicketNum }">
									<img style="vertical-align: middle;" src="${sessionScope.baseUrl}pc/images/activity/20160720/btn-gettimes.png">
								</a></div>
							<div class="clear"></div>
						</div>
						<div id="logs" <c:if test="${is_mobile==1}">class="m"</c:if>>
							<!--
							<c:forEach var="log" items="${logs}">
								<div class="log"><span class="warn">${ log. userNick}</span> 幸运的抽中了 <span class="warn">${log.itemName }</span> x1 <span class="time">[${log.timeStr }]</span></div>
							</c:forEach>
							-->
							<marquee direction="up" width="100%" height="100%" loop="infinite" behavior="scroll" scrollamount="1" onmouseover=this.stop() onmouseout=this.start()>
		                       	<c:forEach items="${logs }" var="log">
			                    	<ul>
			                        	<li><span class="warn">${ log. userNick}</span> 幸运的抽中了 <span class="warn">${log.itemName }</span> x1 <span class="time">[${log.timeStr }]</span></li>
			                        </ul>
		                        </c:forEach>
		                    </marquee>
						</div>
						<div>
							<div  <c:if test="${is_mobile==1}">class="rulehm"</c:if> <c:if test="${is_mobile!=1}">class="ruleh"</c:if>>活动规则</div>
							<div class="rulehr"></div>
							<div  <c:if test="${is_mobile==1}">class="ruleitem_m"</c:if> <c:if test="${is_mobile!=1}">class="ruleitem"</c:if>>
								<ul>
									<li>活动时间为 <span class="warn">2016年8月3日起</span></li>
									<li><span class="warn">V4用户及以上每日可免费获得1次抽奖机会，当日清零</span></li>
									<li>每打赏500糖豆可获得<span class="warn">1次抽奖机会</span></li>
									<li>每消耗1千糖豆可获得<span class="warn">3次抽奖机会</span>，当日次数无上限</li>
									<!-- <li>打赏额度及抽奖机会均<span class="warn">限定当日所有</span>，不累计，过期清零重计</li> -->
									<li><span class="warn">在法律允许的范围内，雁北堂公司保留对本次活动解释的权利</span></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="footer">
				<div class='<c:if test="${is_mobile == 1 }">leftm</c:if><c:if test="${is_mobile != 1 }">left</c:if>'>
					<img src="${sessionScope.baseUrl}pc/images/logo.png">
					<div>雁北堂（北京）文化传媒有限公司</div>
				</div>
				<div class='<c:if test="${is_mobile == 1 }">rightm</c:if><c:if test="${is_mobile != 1 }">right</c:if>'>
					<div>客服邮箱:<a href="mailto://ebtang@ebtang.com">ebtang@ebtang.com</a>   QQ:806311453</div>
	        		<div>联系电话:010-82060189</div>
	        		<div>地址：北京市西城区德胜门外大街83号1201-04</div>
				</div>
				<div class="clear"></div>
				<div id="icp">
					Copyright 2015 雁北堂中文网 版权所有 京ICP证161342号
				</div>
			</div>
		</div>
	</div>
</div>
<div id="gold_box" class="toolconmask"></div>
<div id="gold_con" class="toolcon">
  	<p id="gold_msg" style="padding: 30px 0px; line-height: 50px; text-align: center;font-size:16px">
  		<div id="dlgContent">
  			兑换 <span class="rinput rbox">
  				<input id="tbConsumeTicketNum" readonly value="3">
  				<input type="button" class="rbox incbtn dec">
  				<input type="button" class="rbox incbtn inc">
  			</span> 次抽奖机会，需消耗 <span id="lbConsumeValue" class="warn">1000</span> 糖豆
  		</div>
  		<div id="dlgConfirm"></div>
  	</p>
   <div id="mb_btnbox" style="overflow: hidden; zoom: 1; text-align: center;">
    <span><input id="gold_btn_ok" class="mydlgbtn" type="button" value="确定"/></span>
    <span><input id="gold_btn_no" class="mydlgbtn" type="button" value="取消"/></span>
  </div>
</div>
<!--footer-->

<!-- JiaThis Button BEGIN -->
<script type="text/javascript" >
var jiathis_config={
	siteNum:5,
	sm:"tsina,weixin,qzone,cqq",
	summary:"",
	showClose:true,
	shortUrl:false,
	hideMore:false
}
</script>
<script type="text/javascript" src="http://v3.jiathis.com/code_mini/jiathis_r.js?btn=r5.gif&move=1" charset="utf-8"></script>
<!-- JiaThis Button END -->

</body>
</html>