<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common_m.jsp" %>

<!DOCTYPE html>
<html>
<head>
<title>${book.name}_${book.name}全文阅读，${book.authorNick }的小说_雁北堂_阅读江湖新力量_手机版</title>
<meta name="keywords" content="${book.name}_${book.name}全文阅读，${book.authorNick }的小说_手机版"></meta>
<meta name="description" content="${book.name}是${book.authorNick }在雁北堂的原创独家首发小说, 请密切关注雁北堂中文网_手机版"></meta>
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
<script type="text/javascript" src="${sessionScope.baseUrl}mobile/js/main.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}mobile/js/tip.js"></script>

</head>
<body>
<header> 
<!--header begin-->
<jsp:include page="../header_m.jsp">
	 <jsp:param name="menu" value="index"/>   
</jsp:include>
<!--header end-->
</header>
<%@ include file="../header_user_m.jsp"%>
<%@ include file="../header_tips.jsp"%>
<hgroup class="daS_jl"><b class="f16">打赏</b></hgroup>
<section class="cons_cont">
	<form id="bookRewardForm" onsubmit="return false;">
	<ul class="daS_list">
		<li>
	    <c:if test="${not empty rewardToolReward }">
	    	<label>
	    		<span class="daS_radio"><input name="rewardType" type="radio" value="${rewardToolReward.type }"/></span> 
	    		<span class="daS_img"><img src="${rewardToolReward.image}" width="30" height="30"></span> 
	    		<span class="daS_name">${rewardToolReward.nick }</span> 
	    		<span class="cole8451a">${rewardToolReward.rewardValue }</span> 
	    		<span>糖豆 / ${rewardToolReward.unit }</span>
	    	</label>
	    </c:if>  
	    </li>
		<c:forEach items="${rewardList }" var="item" varStatus="status">
	    <li <c:if test="${status.last}">class="no"</c:if> >
	    	<label>
	    		<span class="daS_radio"><input name="rewardType" type="radio" value="${item.reward.id }"/></span> 
	    		<span class="daS_img"><img src="${sessionScope.customUrl}reward/${item.reward.image}" width="30" height="30"></span> 
	    		<span class="daS_name">${item.reward.nick }</span> 
	    		<span class="cole8451a">${item.reward.rewardValue }</span> 
	    		<span>糖豆 / ${item.reward.unit }</span>
	    	</label>
	    </li>
	    </c:forEach>  
	    
  	</ul>
  	<div class="daS_form">
    	<h2 class="ar">您本次打赏共需 <span class="cole8451a"></span> 糖豆</h2>
    	<p>
    		<span class="daS_span">数量</span>
      		<input name="rewardCount" type="text" value="1" class="daS_input">
    	</p>
    	<p>
    		<span class="daS_span">贺词</span>
      		<textarea name="rewardDesc" cols="" rows="4" class="daS_text">保护原创，抵制抄袭</textarea>
    	</p>
    	<button class="daS_btn">打 赏</button>
  	</div>
  	</form>
</section>
<dl class="cons_page clearfix">
	<div class="goback"><a class="homes" href="${pageContext.request.contextPath }/m"><img height="16" width="18" alt="返回首页" src="${sessionScope.baseUrl}mobile/images/home.png"></img></a>&gt;<a href="${pageContext.request.contextPath }/m/book/${book.id}" class="col992123"><em></em>${book.name }</a></div>
</dl>
<!--footer-->
<%@ include file="../footer_m.jsp"%> 
<!--footer-->
<script type="text/javascript">
$(function(){
	$("input:radio[name='rewardType']").eq(0).attr('checked',true);
	totalReward()
	$("input:radio[name='rewardType']").bind("click", function() {
		totalReward();
	});
	
	$("input[name='rewardCount']").bind("blur", function() {
		console.log('hi');
		totalReward();
	});
	
	$(".daS_btn").bind("click", function() {
		if (!isLogin()) {
			return;
		}
		var formData = $("#bookRewardForm").serialize();
		$.ajax({
			type : "POST",
			dataType : "json",
			data : formData,
			async:true,
			url : "${pageContext.request.contextPath }/m/book/${book.id}/reward",
			success : function(json) {	
				if (json.resBean.code == 0) {	
					window.location.href="${pageContext.request.contextPath }/m/book/${book.id}/reward/succ";	
				} else {
					$.MsgTip.fail(json.resBean.msg);
				}
			}
		});
	});
});

function totalReward() {
	var rewardType = $("input:radio[name='rewardType']:checked");
	var rewardValue = $(rewardType).parent().parent().find(".cole8451a").text();
	var rewardCount = $("input[name='rewardCount']").val();
	$(".ar .cole8451a").text(rewardValue * rewardCount);
}

function isLogin() {
	var userId = "${sessionScope.sessionFrontBean.userId}";
	if (userId == null || userId == "") {
		var redirectUrl = "/m/book/${book.id}/reward";
		window.location.href="${pageContext.request.contextPath }/m/user/login?redirectUrl=" + redirectUrl;	
		return false;
	}
	
	return true;
}
</script>
</body>
</html>