<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="baidu-site-verification" content="5GyDuFcAyQ" />
<meta property="wb:webmaster" content="d4230f7a301ff22c" />
<meta property="qc:admins" content="255257467665241676375" />
<title>＃雁北堂年终大决战＃</title>
<meta name="keywords" content="＃雁北堂年终大决战＃"></meta>
<meta name="description" content="2015雁北堂好书年度人气评选，快来为您喜欢的作品投上宝贵的一票吧～"></meta>
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
.log ul li {float:left;margin: 0 10px 0 0;line-height:15px}
.log ul li .user {border: 1px solid #A5A5A5; width:35px}
.log ul li.t20 {margin-top:12px}
.log ul li.ml20 {margin-top:12px;margin-left:2px}
.pkteam {width: 650px;margin: 0 auto;}
.crown{
  position: absolute;
  margin-left: -50px;
  margin-top: -440px;
  height: 99px;
  width: 99px;
  background-image: url('${sessionScope.baseUrl}pc/images/vote/crown.png');
}
.pktop {width:220px;float:left;margin-top:33px}
.pktop .box {width:194px;float:left;margin-top:10px;padding-left:13px}
.pktop .book {margin:0 auto;text-align:center}
.pksize {border: 1px solid #626262;width: 190px;height: 250px;}
.pksize img {width:190px;height:250px }
.vs {float:left;font-size:60px;width:150px;padding-left:50px;padding-top:140px;color:black}
.bgold {float:left;height:50px;padding-top:8px}
.bgold img{ width:55px}
.bbomb {float:right}
.bbomb img {width:65px}
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
	color: rgb(255, 255, 255);
	font-size: 14px;
	box-shadow: rgb(0, 0, 0) 0px 0px 18px;
	opacity: 0.9;
	border-radius: 8px;
	position: fixed; 
	top: 263.5px; 
	left: 427px; 
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
.log {font-size:14px;padding-left:70px}
.log .book {color:#FF771C}
.confirmgold {background:rgb(250,250,250)}
.confirmgold p {color:black}
.confirmgold .costprice {height:40px;padding-left:30px;line-height:40px;background-color:lightgray}
.confirmbomb {background:rgb(0,0,0)}
.confirmbomb p {color:white}
.confirmbomb .costprice {height:40px;padding-left:30px;line-height:40px;background-color:gray}
.f21 {font-size:21px}
</style>
</head>

<body>

<!--中间-->
<div class="body-bg">
<!--header begin-->
<%@ include file="./header.jsp"%>
<!--header end-->
        <div class="rule-body">
            <div class="h15"></div>
            <div class="topm">
                <div><a href="rule2015"><img style="width:400px" src="${sessionScope.baseUrl}pc/images/vote/rule.png" /></a><a href="pk2015"><img style="width:400px" src="${sessionScope.baseUrl}pc/images/vote/bestbook.png" /></a></div>
                <div class="h30"></div>
                <div id="logs" class="log">
                	<marquee direction="up" width="650" height="130" loop="infinite" scrollamount="2" onmouseover=this.stop() onmouseout=this.start()>
                       	<c:forEach items="${tools }" var="tool">
	                    	<ul style="overflow:hidden">
	                        	<li><img class="user" src="${tool.displayUserPic }" onerror="this.src='${sessionScope.customUrl}defaultAvatar/man.jpg'"/></li>
	                            <li class="t20"><strong>${tool.displayUserName }</strong></li>
	                            <li class="ml20">为<span class="book">《${tool.book.name}》</span></li>
	                            <li class="red strong">${tool.performStr}</li>
	                            <li class="t20" style="float:right">${tool.useTimeStr}</li>
	                        </ul>
                        </c:forEach>
                    </marquee>
                </div>
                <c:forEach items="${pks }" var="pk">
                <div class="rule-method" style="height:550px">
                    <div class="rule-method-title f21">${pk.voteName}</div>
                    <div class="pkteam">
                    	<div class="pktop">
                    		<div class="book">
                                <a href="/book/${pk.book0.book.id }" title="${pk.book0.book.name }"><div class="f20b colorblack">《${pk.book0.topName}》</div></a>
                            </div>
	                        <div class="box">
	                            <div class="pksize p1">
	                                <a href="/book/${pk.book0.book.id }"><img src="${pk.book0.book.bigCoverImage}" onerror="this.src='${sessionScope.customUrl}book/simgs/default_book.jpg'" alt="" /></a>
	                            </div>
	                            <a class="votelink" href="javascript:void();" bookId="${pk.book0.book.id}"><div class="votenum">投票 / ${pk.book0.voteNum} </div></a>
	                            <div class="h15"></div>
	                            <div>
	                            	<div class="bgold"><a href="javascript:void();" class="toolgold" bookId="${pk.book0.book.id}"><img src="${sessionScope.baseUrl}pc/images/vote/gold.png"/></a></div>
	                            	<div class="bbomb"><a href="javascript:void();" class="toolbomb" bookId="${pk.book0.book.id}"><img src="${sessionScope.baseUrl}pc/images/vote/bomb.png"/></a></div>
	                            	<div class="clear"></div>
	                            </div>
	                        </div>
	                        <div class="clear"></div>
	                        <c:if test="${pk.book0.voteNum > pk.book1.voteNum }">
	                        <div class="crown"></div>
	                        </c:if>
	                   	</div>
                    	<div class="vs">VS</div>
                    	<div class="pktop">
                    	<div class="book">
	                                <a href="/book/${pk.book1.book.id }" title="${pk.book1.book.name }"><div class="f20b colorblack">《${pk.book1.topName}》</div></a>
	                            </div>
	                        <div class="box">
	                        	
	                            <div class="pksize p1">
	                                <a href="/book/${pk.book1.book.id }"><img src="${pk.book1.book.bigCoverImage}" onerror="this.src='${sessionScope.customUrl}book/simgs/default_book.jpg'" alt="" /></a>
	                            </div>
	                            
	                                <a class="votelink" href="javascript:void();" bookId="${pk.book1.book.id}"><div class="votenum">投票 / ${pk.book1.voteNum}</div></a>
	                            
	                            <div class="h15"></div>
	                            <div>
	                            	<div class="bgold"><a href="javascript:void();" class="toolgold" bookId="${pk.book1.book.id}"><img src="${sessionScope.baseUrl}pc/images/vote/gold.png"/></a></div>
	                            	<div class="bbomb"><a href="javascript:void();" class="toolbomb" bookId="${pk.book1.book.id}"><img src="${sessionScope.baseUrl}pc/images/vote/bomb.png"/></a></div>
	                            	<div class="clear"></div>
	                            </div>
	                        </div>
                        	<div class="clear"></div>
                        	<c:if test="${pk.book0.voteNum < pk.book1.voteNum }">
	                        <div class="crown"></div>
	                        </c:if>
                   		</div>
                    	<div class="clear"></div>
                	</div>
                </div>
                </c:forEach>
            </div>
            <div class="h30"></div>
			<div class="rule-bg-corp f20">
                <img src="${sessionScope.baseUrl}pc/images/vote/logoybt.png" /><br />
                <a href="http://www.iqiyi.com">爱奇艺</a> / <a href="http://www.letv.com">乐视</a> /
				<a href="http://cctv.cntv.cn">央视影视频道</a> / <a href="http://www.hezhongruike.com">合众睿客</a> /
				<a href="http://www.lujiangpub.com">鹭江出版社</a> / <a href="http://www.bjlhcb.com">北京联合出版社</a><br />
                <a href="http://www.tourpress.cn">广东旅游出版社</a> / <a href="http://www.pup.cn">北京大学出版社</a> /
                <a href="http://www.bhzwy.com">百花洲文艺出版社</a>
            </div>
            <div class="rule-bg-server f20 t30">
                	客服：油焖小鳄鱼：3223285096 栗子君：806311453
            </div>
        </div>
    </div>
    <div id="gold_box" class="toolconmask"></div>
    <div id="gold_con" class="toolcon">
    	<p id="gold_msg" style="padding: 20px 0px; line-height: 50px; text-align: center;font-size:16px">
    		我要<span id="lbToolAct">打赏</span> <input type="text" id="tbGoldNum" style="border-radius:6px" size="2" maxlength="10"/> 个<span id="lbToolName">大元宝</span>
    		<span class="cost" id="tbGoldCost">(需要糖豆0个)</span>
    		<br/>
    		<input id="ckGoldNick" type="checkbox"/>匿名
    		<input type="radio" name="nickName" value="热心网友" id="nickName0" style="display:none"/><label for="nickName0"><span class="circle-btn" style="background-color:#65CD00">热心网友</span></label>
    		<input type="radio" name="nickName" value="朝阳群众" id="nickName1" style="display:none"/><label for="nickName1"><span class="circle-btn" style="background-color:#FF6700">朝阳群众</span></label>
    		<input type="radio" name="nickName" value="国民老公" id="nickName2" style="display:none"/><label for="nickName2"><span class="circle-btn" style="background-color:#0FBDFD">国民老公</span></label>
    		<input type="radio" name="nickName" value="广场舞大妈" id="nickName3" style="display:none"/><label for="nickName3"><span class="circle-btn" style="background-color:#D59C00">广场舞大妈</span></label>
    		<input type="hidden" id="tbGoldBookId"/>
    		<input type="hidden" id="tbGoldNickName"/>
    		<input type="hidden" id="toolId"/>
    		<input type="hidden" id="tbPrice"/>
    	</p>
	    <div id="mb_btnbox" style="overflow: hidden; zoom: 1; text-align: center;">
		    <span><input id="gold_btn_ok" style="cursor: pointer; color: rgb(86, 77, 54); line-height: 24px; padding: 3px 35px; border: 1px solid rgb(167, 156, 126); border-radius: 6px; margin: 0px 10px; background: rgb(209, 203, 191);" type="button" value="确定"/></span>
		    <span><input id="gold_btn_no" style="cursor: pointer; color: rgb(86, 77, 54); line-height: 24px; padding: 3px 35px; border: 1px solid rgb(167, 156, 126); border-radius: 6px; margin: 0px 10px; background: rgb(209, 203, 191);" type="button" value="取消"/></span>
	   </div>
	   <div class="h15"></div>
	   <div class="costprice" id="lbPriccDesc">1个元宝=1票(100糖豆)</div>
	   <div class="costdesc">温馨提示：打赏道具收益分成归打赏书籍所有。请大家务必理智消费，冲动消费有风险~</div>
   </div>
<!--footer-->
<!-- JiaThis Button BEGIN -->
<div class="jiathis_share_slide jiathis_share_24x24" id="jiathis_share_slide" style="display:none">
<div class="jiathis_share_slide_top" id="jiathis_share_title"></div>
<div class="jiathis_share_slide_inner">
<div class="jiathis_style_24x24">
<a class="jiathis_button_cqq"></a>
<a class="jiathis_button_tsina"></a>
<a class="jiathis_button_weixin"></a>
<a class="jiathis_button_qzone"></a>
<a class="jiathis_button_"></a>
<a href="http://www.jiathis.com/share" class="jiathis jiathis_txt jtico jtico_jiathis" target="_blank"></a>
<script type="text/javascript">
var jiathis_config = {
/*
	slide:{
		divid:'ybtframe',
		pos:'right',
		gt:'true'
	}
*/
	summary:"",
	shortUrl:false,
	hideMore:false
};
</script>
<script type="text/javascript" src="http://v3.jiathis.com/code/jia.js" charset="utf-8"></script>	
<script type="text/javascript" src="http://v3.jiathis.com/code/jiathis_slide.js" charset="utf-8"></script>
</div></div></div>
<!-- JiaThis Button END -->
<script type="text/javascript">
	function hideInputDialog() {
		$("#gold_box").hide();
		$("#gold_con").hide();
	}
	
$(function(){
	initVote();
	
	$(".votetoolimg").attr("src", function() {
		return "${sessionScope.baseUrl}" + $(this).attr("path");
	}).css("height","40px");
	
	$("#tbGoldNum").change(function() {
		var val = $("#tbGoldNum").val();
		var price = $("#tbPrice").val();
		if( isNaN(val) ) $("#tbGoldCost").text("(需要糖豆0个)");
		else $("#tbGoldCost").text("(需要糖豆" + (parseInt(val) * parseInt(price)) + "个)");
	}).keyup(function() {
		var val = $("#tbGoldNum").val();
		var price = $("#tbPrice").val();
		if( isNaN(val) ) $("#tbGoldCost").text("(需要糖豆0个)");
		else $("#tbGoldCost").text("(需要糖豆" + (parseInt(val) * parseInt(price)) + "个)");
	});
	
	$("#gold_btn_no").click(hideInputDialog);
	
	$("#gold_btn_ok").click(function() {
		if (!isLogin()) {
			return;
		}
		
		var val = $("#tbGoldNum").val();
		if( val == "" || isNaN(val) ) {
			hideInputDialog();
			$.MsgBox.Alert("提示", "请输入打赏数量！");
			return;
		}
		
		var nickName = $("#tbGoldNickName").val();
		if( $("#ckGoldNick").is(":checked") == false ) {
			nickName = "";
		}
		
		hideInputDialog();
		
		var bookId = $("#tbGoldBookId").val();
		var toolId = $("#toolId").val();
		
		var obj = $(".votelink[bookId=" + bookId + "]");
		$.ajax({
			type : "POST",
			dataType : "json",
			data : "toolId=" + toolId + "&bookId=" + bookId + "&num=" + val + "&nickName=" + nickName,
			async:true,
			url : "${pageContext.request.contextPath }/vote/usetool",
			success : function(json) {
				if (json.resBean.code != 0) {
					$.MsgBox.Alert("提示", json.resBean.msg);
				} else {
					$("#lbMyGoldNum").text(json.goldNum);
					$("#lbMyBombNum").text(json.bombNum);
					$("#lbMyVoteNum").text(json.myVoteNum);
					$(obj).html("<div class='votenum'>投票 / " + json.voteNum + "</div>");
				}
			}
		});
	});
	
	$(".circle-btn").click(function() {
		if( $("#ckGoldNick").is(":checked") == true ) {
			$(".circle-btn").removeClass("selected");
			$(this).addClass("selected");
			$("#tbGoldNickName").val($(this).text());
		}
	});
	
	$("#jiathis_share_slide").hide();
	
	setTimeout("loadToolLogs", 1000);
});

function loadToolLogs() {
	$.ajax({
			type : "POST",
			dataType : "json",
			data : "voteId=" + $(obj).attr("bookid"),
			async:true,
			url : "${pageContext.request.contextPath }/vote/vote2015",
			success : function(json) {
				if (json.resBean.code != 0) {
					$.MsgBox.Alert("提示", json.resBean.msg);
				} else {
					if( $(obj).parent()[0].tagName == "DIV") {
						$(obj).text("投票 / " + json.voteNum);
					} else {
						$(obj).html("<div class='votenum limc'>投票 / " + json.voteNum + "</div>");
					}
				}
			}
		});
}

function initVote() {
	$(".votelink").bind("click", function() {
		if (!isLogin()) {
			return;
		}
		var obj = $(this);
		$.ajax({
			type : "POST",
			dataType : "json",
			data : "bookId=" + $(obj).attr("bookid"),
			async:true,
			url : "${pageContext.request.contextPath }/vote/vote2015",
			success : function(json) {
				hideInputDialog();
				if (json.resBean.code != 0) {
					$.MsgBox.Alert("提示", json.resBean.msg);
				} else {
					$("#lbMyVoteNum").text(json.myVoteNum);
					$(obj).html("<div class='votenum'>投票 / " + json.voteNum + "</div>");
				}
			}
		});
	});
	
	$(".toolgold").bind("click", function() {
		var obj = $(this);
		var bookId = $(obj).attr("bookid");
		
		
		$("#lbToolName").text("大元宝");
		$("#lbToolAct").text("打赏");
		$("#tbPrice").val(100);
		$("#toolId").val(1);
		$("#tbGoldCost").text("(需要糖豆0个)");
		$("#tbGoldNum").val("");
		$("#lbPriccDesc").html("<span class='cost'>1个元宝=1票（100糖豆）</span>");
		
		$("#gold_con").removeClass("confirmbomb");
		$("#gold_con").addClass("confirmgold");
		
		$("#tbGoldBookId").val(bookId);
		$("#gold_box").show();
		$("#gold_con").show();
	});
	$(".toolbomb").bind("click", function() {
		var obj = $(this);
		var bookId = $(obj).attr("bookid");
		
		$("#lbToolName").text("炸弹");
		$("#lbToolAct").text("扔");
		$("#tbPrice").val(10000);
		$("#toolId").val(2);
		$("#tbGoldCost").text("(需要糖豆0个)");
		$("#tbGoldNum").val("");
		$("#lbPriccDesc").html("<span>1个炸弹减50票（10000糖豆）</span>");
		
		$("#gold_con").removeClass("confirmgold");
		$("#gold_con").addClass("confirmbomb");
		
		$("#tbGoldBookId").val(bookId);
		$("#gold_box").show();
		$("#gold_con").show();
	});
}


function isLogin() {
	var userId = "${sessionScope.sessionFrontBean.userId}";
	if (userId == null || userId == "") {
<c:if test="${is_mob==0}">
	var redirectUrl = "${pageContext.request.contextPath }/vote/pk2015";
	window.location.href="${pageContext.request.contextPath }/user/login?redirectUrl=" + redirectUrl;	
	return false;
</c:if>
<c:if test="${is_mob==1}">
	var redirectUrl = "${pageContext.request.contextPath }/m/vote/pk2015";
	window.location.href="${pageContext.request.contextPath }/m/user/login?redirectUrl=" + redirectUrl;	
	return false;
</c:if>
	}
	
	return true;
}
</script>
</body>
</html>