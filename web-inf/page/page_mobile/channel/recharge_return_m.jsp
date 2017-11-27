<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common_m.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>成功_雁北堂_雁北堂中文网_手机版</title>
<link rel="stylesheet" href="${sessionScope.baseUrl}mobile/css/common.css"/>
<link rel="stylesheet" href="${sessionScope.baseUrl}mobile/css/style.css"/>
<link rel="stylesheet" href="${sessionScope.baseUrl}mobile/css/use.css"/>
<script type="text/javascript"  src="${sessionScope.baseUrl}mobile/js/jquery.min.js"></script>
<!--[if lt IE 9]>
<script type="text/javascript"  src="${sessionScope.baseUrl}mobile/js/html5.js"></script>
<![endif]-->
<script type="text/javascript" src="${sessionScope.baseUrl}mobile/js/main.js"></script>
</head>
<body>
<section class="alipay enroll back">
	<hgroup class="ce-t ac">
    	<h1 class="title"><img src="${sessionScope.baseUrl}mobile/images/ap-img7.jpg" width="10"></h1>
        <img src="${sessionScope.baseUrl}mobile/images/ap-img16.jpg" width="60">
    </hgroup>
    <div class="ce-c">
    <ul>
    	<li><strong>状态：</strong>
    	<c:choose>
    		<c:when test="${orderStatus == 1 }">成功</c:when>
    		<c:otherwise>失败</c:otherwise>
    	</c:choose>                    	
    	</li>
        <li><strong>订单号：</strong>${orderNo}</li>
        <li><strong>支付宝交易号：</strong>${tradeNo}</li>
        <a href="<%=contextPath%>/m" class="apply-input white ac mt6">返回首页</a>
    </ul>
    </div>
    
</section>
<!--footer-->
<%@ include file="../footer_m.jsp"%>
<!--footer-->
</body>
</html>
