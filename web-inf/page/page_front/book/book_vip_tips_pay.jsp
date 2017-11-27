<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><spring:message code="front.global.title"></spring:message></title>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/style.css"/>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/dialog.css"/>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/statistics_bd.js"></script>
</head>
<body style="background:#F1F1F3;padding:40px">
	<div class="discus1 f12 discus3">
	    <div class="reat over">
	        <h2 class="fl f14">订阅VIP章节</h2>
	        <a href="${pageContext.request.contextPath }/recharge/index" class="fr">点击充值</a>
	        <p class="fr">您的账户余额：<strong class="sp1">${userWallet.balanceValue == null ? 0 : userWallet.balanceValue }</strong>雁北糖豆</p>
	    </div>
	    
	    <div class="reat1 ac">
	        <strong class="f16">《${book.name }》</strong><span>${priceTip }<strong class="sp1">${salePrice}(<del>${price}</del>)</strong>雁北糖豆</span>
	    </div>
	    <div class="reat2 over ac">
	        <dl>
	        	<c:choose>
	        		<c:when test="${userWallet.balanceValue == null || userWallet.balanceValue < price }">
	        			<dt><a href="${pageContext.request.contextPath }/recharge/index" >购买</a></dt>
	        		</c:when>
	        		<c:otherwise>
	        			<dt><a href="${pageContext.request.contextPath }/book/${book.id}/${chapterId}/pay" >购买</a></dt>
	        		</c:otherwise>
	        	</c:choose>	            
	        </dl>
	        <dl class="ac">
	            <dt><a href="${pageContext.request.contextPath }/book/${book.id}">返回作品</a></dt>
	        </dl>
	    </div>
	</div>    
</body>
</html>
<!--[ERROR403]-->
