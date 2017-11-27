<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common_m.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
<title>成功_雁北堂_雁北堂中文网_手机版</title>
<link rel="stylesheet" href="${sessionScope.baseUrl}mobile/css/common.css"/>
<link rel="stylesheet" href="${sessionScope.baseUrl}mobile/css/style.css"/>
<link rel="stylesheet" href="${sessionScope.baseUrl}mobile/css/use.css"/>
<!--[if lt IE 9]>
<script type="text/javascript"  src="${sessionScope.baseUrl}mobile/js/html5.js"></script>
<![endif]-->
</head>
<body>
<header> 
<!--header begin-->
<jsp:include page="../header_m.jsp">  
	<jsp:param name="menu" value="wu"/>   
</jsp:include>
<!--header end-->
</header>

<section class="alipay enroll back">
    <hgroup class="ce-t ac">
    	<h1 class="title"><img src="${sessionScope.baseUrl}mobile/images/ap-img7.jpg" width="10"></h1>
        <img src="${sessionScope.baseUrl}mobile/images/ap-img10.jpg" width="60">
    </hgroup>
    <div class="ce-c">
    	<p class="reds f16 succ ac"><spring:message code="${resBean.msgKey }"></spring:message></p>
        <a href="<%=contextPath%>/m/user/login" class="apply-input white ac mt6">立即登录</a>
    </div>
    
</section>

<!--footer-->
<%@ include file="../footer_m.jsp"%>
<!--footer-->
<script type="text/javascript"  src="${sessionScope.baseUrl}mobile/js/jquery.min.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}mobile/js/main.js"></script>
</body>
</html>
