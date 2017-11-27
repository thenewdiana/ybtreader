<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common_m.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>充值_雁北堂_雁北堂中文网_手机版</title>
<link rel="stylesheet" href="${sessionScope.baseUrl}mobile/css/common.css"/>
<link rel="stylesheet" href="${sessionScope.baseUrl}mobile/css/style.css"/>
<link rel="stylesheet" href="${sessionScope.baseUrl}mobile/css/use.css"/>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/statistics_bd.js"></script>
<script type="text/javascript"  src="${sessionScope.baseUrl}mobile/js/jquery.min.js"></script>
<!--[if lt IE 9]>
<script type="text/javascript"  src="${sessionScope.baseUrl}mobile/js/html5.js"></script>
<![endif]-->
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/util/common.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}mobile/js/main.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}mobile/js/pay-mobile.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/valid.js"></script>
</head>


<body>
<!--header begin-->
<header> 
<jsp:include page="../header_m.jsp">
	 <jsp:param name="menu" value="recharge"/>   
</jsp:include>
</header>
<%@ include file="../header_user_m.jsp"%>
<!--header end-->
<div class="alipay m-pay-content">
	<h1 class="title" id="payTitle">在线充值</h1>
	<section class="pay-type">
  	<form action="" id="alipayRechargeForm">
    	<div class="left">
    		<img class="img" src="${sessionScope.baseUrl}mobile/images/ap-img3.png" width="50">
    	</div>
    	<div class="right">
    		<p class="text"><input type="text" class="input" id="alipayRechargeInput" name="alipayRechargeValue" value="50" maxlength="4" />元</p>
    		<p id="alipayMsg" class="msg"></p>
    		<ul class="note-list">
	    		<li class="item">请输入充值金额，限整数</li>
	    		<li class="item">最低充值20元</li>
	    		<li class="item">1元=100糖豆</li>
       		</ul>
    	</div>
      <a href="javascript:void(0);" id="alipaySubmitButton" class="apply-input white ac mt6">前往充值</a>
    </form>
	</section>
	<section class="pay-type">
    <form action="" id="weixinRechargeForm">
      <div class="left">
	  		<img class="img" src="${sessionScope.baseUrl}mobile/images/weixin71-71.jpg" width="50">
    	</div>
    	<div class="right">
    		<p class="text"><input type="text" class="input" id="weixinRechargeInput" name="weixinRechargeValue" maxlength="4" value="50"/>元</p>
    		<p id="weixinMsg" class="msg"></p>
    		<ul class="note-list">
	    		<li class="item">请输入充值金额，限整数</li>
	    		<li class="item">最低充值20元</li>
	    		<li class="item">1元=100糖豆</li>
        </ul>
    	</div>
      <a href="javascript:void(0);" id="weixinSubmitButton" class="apply-input white ac mt6">前往充值</a>
    </form>
	</section>

	<form action="" id="rechargeForm">
		<input type="hidden" name="rechargeValue" id="rechargeValue">
	</form>
</div>


<div class="u-search ar"><a href="<%=contextPath%>/m/consume/query" title="">消费记录</a> <a href="<%=contextPath%>/m/recharge/query" title="">订单查询</a></div>
<input type="hidden" name="" id="resourcePath" value="${sessionScope.baseUrl}">
<input type="hidden" name="" id="rootPath" value="${pageContext.request.contextPath }">
<!--footer-->
<%@ include file="../footer_m.jsp"%>
<!--footer-->  
</body>
</html>


