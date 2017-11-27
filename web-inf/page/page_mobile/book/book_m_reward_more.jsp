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
<hgroup class="daS_jl"><b class="f14">打赏用户记录</b></hgroup>
<section class="cons_cont">
	<ul class="daS_tab clearfix">
    	<li <c:if test="${sortType.equals('money') }">class="daS_current"</c:if> id="money">按金额排序</li>
    	<li <c:if test="${sortType.equals('time') }">class="daS_current"</c:if> id="time">按时间排序</li>
  	</ul>
  	<div class="daS_cont" style="display:block;">
  		<c:forEach items="${userRewardList }" var="item">
	    <div class="daS_more clearfix">
	    	<p class="f12 col898989">${item.createTimeFormat }</p>
	      	<p>
	      		<a href="${pageContext.request.contextPath }/m/userCenter/${item.fromUserId}"><span class="cole8441b">${item.fromUserNick }</span></a>
	      		<span class="b_num v_${item.vipValues.id }"></span>
	      		豪气万丈的打赏了
	      		<span class="daS_img ml5"><c:if test="${empty item.reward.image}"><img src="${item.rewardImage}" width="30" height="30"></c:if>
    <c:if test="${not empty item.reward.image}"><img src="${sessionScope.customUrl}reward/${item.reward.image}" width="30" height="30"></c:if></span>
	      		<span class="cola21812 pl5">×${item.rewardCount }</span>
	      	</p>
	      	<p class="f12 col595757">${item.rewardDesc }</p>
	    </div>
	    </c:forEach>    
  	</div>
</section>
<div class="goback"><a class="homes" href="${pageContext.request.contextPath }/m"><img height="16" width="18" alt="返回首页" src="${sessionScope.baseUrl}mobile/images/home.png"></img></a>&gt;<a href="${pageContext.request.contextPath }/m/book/${book.id}" class="col992123"><em></em>${book.name }</a></div>
<page:mpagination pageAttr="pagination"></page:mpagination>
<!--footer-->
<%@ include file="../footer_m.jsp"%>
<form action="${pageContext.request.contextPath }/m/book/${book.id}/reward/more" method="post" id="bookRewardForm">
	<input type="hidden" id="sortType" name="sortType" value="${sortType }"/>
	<input type="hidden" id="page" name="page" value="${pagination.currPage }"/>
    <input type="hidden" id="rows" name="rows" value="${pagination.pageSize }"/>
</form>    
<!--footer-->
<script type="text/javascript">
$(function(){
	$('.daS_tab li').click(function(){
		var id = $(this).attr("id");
		$(this).addClass('daS_current').siblings('li').removeClass('daS_current');
		$("#sortType").attr("value", id);
		paper(1, 20);
	});
});

function paper(pageNoValue, pageSizeValue){
	$('#page').val(pageNoValue);
	$('#rows').val(pageSizeValue);
	$("#bookRewardForm").submit();
}
</script>
</body>
</html>