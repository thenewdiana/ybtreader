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
<style type="text/css">
pre{
white-space:pre-wrap;
white-space:-moz-pre-wrap;
white-space:-pre-wrap;
white-space:-o-pre-wrap;
word-wrap:break-word;
}
</style>
</head>
<body ondragstart="return false" oncopy="return false;" oncut="return false;" oncontextmenu="return false">
<c:if test="${source == 'app' }">
	<jsp:include page="../common/awaken_app_m.jsp"></jsp:include>
</c:if>
<header> 
<!--header begin-->
<jsp:include page="../header_m.jsp">
	 <jsp:param name="menu" value="index"/>   
</jsp:include>
<!--header end-->
</header>
<%@ include file="../header_user_m.jsp"%>
<%@ include file="../header_tips.jsp"%>
	<div class="detail_sc"><a href="javascript:void(0);"><em></em>己有${book.collValue }收藏</a></div>
	<div class="detail_wz clearfix">
	<dl><dt><em></em><span class="col991e23"><a href="${pageContext.request.contextPath }/m/book/${book.id}" class="col991e23">正在阅读</a> > ${book.name }</span></dt>
	<dd><a href="${pageContext.request.contextPath }/m/book/${book.id }/directory"><span class="d_kz"><em></em></span></a><span class="d_Add"><em></em></span><span class="d_Ajj"><em></em></span></dd>
	</dl>
	</div>
	<div class="d_cont">
	<h2>${bookChapter.title }</h2>
	<h3>${bookChapter.createTimeFormat}发布  ${bookChapter.words }字</h3>
	<article class="d_font18" id="d_kzFont">
		<pre>${bookChapter.content }</pre>
	</article>
	<div class="d_pl">
		<a href="${pageContext.request.contextPath }/m/book/chapter/comment?callBackUrl=m/book/${book.id}/${bookChapter.id }&bookId=${book.id}&chapterId=${bookChapter.id}" class="col991e23">我要评论</a>  
		<a href="${pageContext.request.contextPath }/m/book/${book.id }/chapter/comment/more" class="col991e23 ml10">回复（${commentCount }）</a>
	</div>
	<div class="d_page">
		<c:if test="${preId > 0 }">
			<a href="${pageContext.request.contextPath }/m/book/${book.id}/${preId}">&lt; 上一章</a>
		</c:if>
		<a href="${pageContext.request.contextPath }/m/book/${book.id}/directory" class="ml10 mr10">回目录</a>
		<c:if test="${nextId > 0 }">
			<a href="${pageContext.request.contextPath }/m/book/${book.id}/${nextId}">下一章 &gt;</a>
		</c:if>
	</div>
	</div>
<!--footer-->
<%@ include file="../footer_m.jsp"%>   
<!--footer-->
<script type="text/javascript">
$(function(){
	$(".detail_sc").bind("click", function() {
		if (!isLogin()) {
			return;
		}
		
		var obj = $(this);
		$.ajax({
			type : "POST",
			dataType : "json",
			data : "bookId=${book.id}",
			async:true,
			url : "${pageContext.request.contextPath }/m/book/collect",
			success : function(json) {
				if (json.resBean.code != 0) {
					$.MsgTip.fail(json.resBean.msg);
				} else {
					$(obj).html("<a href=\"javascript:void(0);\"><em></em>己有" + json.collectValue + "收藏</a>");
				}
			}
		});
	});
});

function isLogin() {
	var userId = "${sessionScope.sessionFrontBean.userId}";
	if (userId == null || userId == "") {
		var redirectUrl = "/m/book/${book.id}/${bookChapter.id}";
		window.location.href="${pageContext.request.contextPath }/m/user/login?redirectUrl=" + redirectUrl;	
		return false;
	}
	return true;
}
</script>
</body>
</html>