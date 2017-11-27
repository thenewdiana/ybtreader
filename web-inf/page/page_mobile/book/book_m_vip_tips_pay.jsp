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
<link rel="stylesheet" href="${sessionScope.baseUrl}mobile/css/use.css"/>
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
	<c:choose>
		<c:when test="${payType == 0 }">
			<div class="ranking charge">
        	<h1>单章收费</h1>
        	<section class="alipay">
            	<dl>
	            	<dt>${bookChapter.title }</dt>
	                <dd>发布时间：${bookChapter.createTimeFormat}</dd>
	                <dd>章节字数：${bookChapter.words }</dd>
	                <dd>本章价格：<span>${salePrice}(<del>${price}</del>)</span>糖豆</dd>
	                <dd>账号余额：<span>${userWallet.balanceValue == null ? 0 : userWallet.balanceValue }</span>糖豆</dd>
	                <dd class="spa">提示：已购买章节不会重复购买</dd>
            	</dl>
            	<a href="${pageContext.request.contextPath }/m/book/${book.id}/${bookChapter.id}/pay" class="apply-input white ac mt6">购买本章</a>
         	</section>
         
         	<h1>自动订阅</h1>
        	<section class="alipay alipay10">
	            <dl> 
	                <dd>本书：<span>4</span> 糖豆 / 千字</dd>
	                <dd class="spa">提示：开通自动订阅不提示扣费</dd>
	            </dl>
         	</section>
    		</div>
		</c:when>
		<c:otherwise>
			<div class="ranking charge">
			<h1>按本收费</h1>
        	<section class="alipay">
            	<dl>
	            	<dt>${book.name }</dt>
	                <dd>本书价格：<span>${price }</span>糖豆</dd>
	                <dd>账号余额：<span>${userWallet.balanceValue == null ? 0 : userWallet.balanceValue }</span>糖豆</dd>
	                <dd class="spa">提示：已购买本书不会重复购买</dd>
            	</dl>
            	<a href="${pageContext.request.contextPath }/m/book/${book.id}/${bookChapter.id}/pay" class="apply-input white ac mt6">购买本书</a>
         	</section>
         
         	<h1>自动订阅</h1>
        	<section class="alipay">
	            <dl> 
	                <dd>本书：<span>${price }</span> 糖豆</dd>
	                <dd class="spa">提示：开通自动订阅不提示扣费</dd>
	            </dl>
         	</section>
    		</div>
		</c:otherwise>
	</c:choose>
	<dl class="cons_page clearfix">
		<div class="goback"><a class="homes" href="${pageContext.request.contextPath }/m"><img height="16" width="18" alt="返回首页" src="${sessionScope.baseUrl}mobile/images/home.png"></img></a>&gt;<a href="${pageContext.request.contextPath }/m/book/${book.id}" class="col992123"><em></em>${book.name }</a></div>
	</dl>
<!--footer-->
<%@ include file="../footer_m.jsp"%>   
<!--footer-->
<script type="text/javascript">
$(function(){

});
</script>
</body>
</html>