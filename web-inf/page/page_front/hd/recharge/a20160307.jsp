<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="baidu-site-verification" content="5GyDuFcAyQ" />
<meta property="wb:webmaster" content="d4230f7a301ff22c" />
<meta property="qc:admins" content="255257467665241676375" />
<title>＃雁北堂寰宇公测一周年＃</title>
<meta name="keywords" content="＃雁北堂寰宇公测一周年 周年庆回馈粉丝 充多少送多少，赶快来抢！＃"></meta>
<meta name="description" content="雁北堂寰宇公测一周年 周年庆回馈粉丝 充多少送多少，赶快来抢！"></meta>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/slideBox.css"/>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/style.css"/>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/images/vote/vote.css"/>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/jquery.alert.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/main.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/tabs.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/slideBox.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/time.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/statistics_bd.js"></script>

<style type="text/css">
.css_img_reward_type_on {border:2px solid #FAC23B;margin:0 1px 4px; display:block;}
.css_img_reward_type {margin:0 1px 4px; display:block;}
.a20160307 {
	margin:0 auto;
	width:1280px;
	hheight: 2240px;
    background-image: url(${sessionScope.baseUrl}pc/images/activity/20160307/a20160307-2.jpg);
    background-size: 100%
}
.topmenua {
	
}
.toplogo {
	float:left;
	margin-left:15%;
	height:250px;
}
.topmenu {background-image: url(${sessionScope.baseUrl}pc/images/activity/20160307/title.png);
    width: 430px;
    height: 30px;
    float: right;
    background-size: 446px 43px;}
.topmenuitem {float: right;
    font-size: 12px;
    font-weight:bold;
    width: 70px;
    height: 30px;
    line-height:30px;
    text-align: center;}
.a1dep {
	height:180px;
}
.a1 {
	text-align:center;
	width:800px;
	margin:0 auto;
}
.imga1 {
	width:85%
}
.a1 .date {
	font-size:32px;
	font-weight:bold;
	color:#ff3334;
}
.h70 {height:80px}
.h50 {height:50px}
.recharge1 {text-align:center}
.recharge2 {margin: 0 auto;
    text-align: center;
    width: 75%;
    height:170px;
}
.recharge2 .rule{
	width:33%;
	float:left;
}
.rec1but {
	wwidth:303px;
}
.rec2but {
	wwidth:198px;
	width:85%
}
.rec2dep {height:147px}
.adetail {
	padding-top: 20px;
	margin: 0 auto;
	width: 86%;
	background-image: url(${sessionScope.baseUrl}pc/images/activity/20160307/textback.png)
}
.adetail div {
	text-indent: 30px;
	font-size:20px;
	hheight:43px;
	line-height:43px;
	background-repeat: no-repeat;
	background-image: url(${sessionScope.baseUrl}pc/images/activity/20160307/nobg.png)
}
.adetail .no {
	font-size:20px;
	float: left;
    text-indent: 15px;
    color : #FFDA0D;
}
.adetail div span {
	color:#ff2e4d;
}
.spanline {
	display: block;
    padding-left: 25px;
}
.adetail div.nextline2 {
	background-image: none;
	text-indent: 55px;
}
.info {
	width: 70%;
    margin: 0 auto;
    background-color: #FFCC33;
    background-repeat: no-repeat;
}
.imginfo {
	padding-left: 5%;
    background-size: 800px 44px;
    background-repeat: repeat-x;
	background-image: url(${sessionScope.baseUrl}pc/images/activity/20160307/infobglight.png)
}
.darkyellow {
	background-color: #FFCC33;
}
.lightyellow{
	background-color: #FFE111;
}
.companyinfo {
	margin: 0 auto;
	width: 800px;
	background-color:white;
}
.companyleft {
	float:left;
	width:420px
}
</style>
<script>
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
</script>
</head>

<body>

<div class="a20160307">
	<!--header begin-->
	<div class="topmenua">
		<div class="toplogo">
			<a href="/"><img src="${sessionScope.baseUrl}pc/images/logo-s.png"/></a>
		</div>
		<div class="topmenu">
			<div class="topmenuitem" style="width:50px"></div>
			<div class="topmenuitem"><a href="javascript:AddFavorite('雁北堂文学网',location.href)"><font style="font-family:宋体;color:black">收藏本站</font></a></div>
           	<div class="topmenuitem"><a href="javascript:setHome(this,window.location);"><font style="font-family:宋体;color:black">设为首页</font></a></div>
      	   	<div class="clear"></div>
	    </div>
	    <div class="clear"></div>
	</div>
	<div class="a1dep"></div>
	<div class="a1">
		<a href="../recharge/index?recharge_value=10&channel=3"><img class="imga1" src="${sessionScope.baseUrl}pc/images/activity/20160307/a1.png"/></a>
		<div class="date">2016年03月08日——03月18日</div>
	</div>
	<div class="h30"></div>
	<div>
            <div class="recharge1">
            	<a target="_blank" href="../recharge/index?recharge_value=10&channel=3">
            		<img class="rec1but"  src="${sessionScope.baseUrl}pc/images/activity/20160307/recharge1.png"/><br/>
            	</a>
            </div>
            <div class="h70"></div>
            <div class="recharge2">
            	<div class="rule">
            		<a href="../recharge/index?recharge_value=20">
            			<img class="rec2but"  src="${sessionScope.baseUrl}pc/images/activity/20160307/r20.jpg"/>
            		</a>
            	</div>
            	<div class="rule">
            		<a href="../recharge/index?recharge_value=30">
            			<img class="rec2but"  src="${sessionScope.baseUrl}pc/images/activity/20160307/r30.jpg"/>
            		</a>
            	</div>
            	<div class="rule">
            		<a href="../recharge/index?recharge_value=50">
            			<img class="rec2but"  src="${sessionScope.baseUrl}pc/images/activity/20160307/r50.jpg"/>
            		</a>
            	</div>
            	<div class="clear"></div>
            </div>
            <div class="h50"></div>
            <div class="recharge2">
            	<div class="rule">
            		<a href="../recharge/index?recharge_value=100">
            			<img class="rec2but"  src="${sessionScope.baseUrl}pc/images/activity/20160307/r100.jpg"/>
            		</a>
            	</div>
            	<div class="rule">
            		<a href="../recharge/index?recharge_value=200">
            			<img class="rec2but"  src="${sessionScope.baseUrl}pc/images/activity/20160307/r200.jpg"/>
            		</a>
            	</div>
            	<div class="rule">
            		<a href="../recharge/index?recharge_value=300">
            			<img class="rec2but"  src="${sessionScope.baseUrl}pc/images/activity/20160307/r300.jpg"/>
            		</a>
            	</div>
            	<div class="clear"></div>
            </div>
            <div class="clear"></div>
        </div>
        <div class="h70"></div>
        <div class="info">
        	<div class="imginfo"><img src="${sessionScope.baseUrl}pc/images/activity/20160307/info.png"/></div>
	        <div class="adetail">
	        	<div>
	        		<div class="no">1</div>
	        		活动期限：<span>2016年03月08日——03月18日</span>
	        	</div>
	        	<div>
	        		<div class="no">2</div>
	        		用户范围：<span>雁北堂中文网注册用户均可参加</span></div>
	        	<div>
	        		<div class="no">3</div>
	        		活动仅限于以下充值总额度及返赠额度，充值越多，优惠越多
	        		<div class="clear"></div>
	        		<span class="spanline">充2000糖豆送2000糖豆</span>
	        		<span class="spanline">充5000糖豆送5000糖豆</span>
	        		<span class="spanline">充10000糖豆送10000糖豆</span>
	        		<span class="spanline">充20000糖豆送20000糖豆</span>
	        		<span class="spanline">充30000糖豆送30000糖豆</span></div>
	        	<div>
	        		<div class="no">4</div>
	        		赠送糖豆根据用户在活动期间的充值总金额进行计算，</div>
	        	<div class="nextline2">活动结束后一周内将发送至充值账户</div>
	        	<div class="nextline2">本活动最终解释权归雁北堂中文网所有。</div>
	        	<div class="nextline2">&nbsp;</div>
	        </div>
	    </div>
        <div style="height:120px"></div>
        <div class="companyinfo">
        	<div class="companyleft">
        		<div><b>雁北堂（北京）文化传媒有限公司</b></div>
        		<div>客服邮箱:<a href="mailto://ebtang@ebtang.com">ebtang@ebtang.com</a>   QQ:154306295</div>
        		<div>联系电话:010-62962136</div>
        		<div>地址：北京市西城区德胜门外大街83号1201-04</div>
        	</div>
        	<div style="float:left">
        		<div style="height:25px"></div>
	        	<!-- JiaThis Button BEGIN -->
				<div class="jiathis_style">
					<!-- <span class="jiathis_txt">分享到：</span> -->
					<a class="jiathis_button_tsina"></a>
					<a class="jiathis_button_kaixin001"></a>
					<a class="jiathis_button_tqq"></a>
					<a class="jiathis_button_renren"></a>
					<a class="jiathis_button_weixin"></a>
					<a class="jiathis_button_xiaoyou"></a>
					<a href="http://www.jiathis.com/share" class="jiathis jiathis_txt jiathis_separator jtico jtico_jiathis" target="_blank">更多</a>
				</div>
				<div class="clear"></div>
				<div>
					Copyright 2015 雁北堂中文网 版权所有 京ICP证161342号
				</div>
			</div>
			<div class="clear"></div>
    	</div>
    </div>
    
<!--footer-->

<script type="text/javascript" src="http://v3.jiathis.com/code_mini/jia.js?uid=" charset="utf-8"></script>
<!-- JiaThis Button END -->
</body>
</html>