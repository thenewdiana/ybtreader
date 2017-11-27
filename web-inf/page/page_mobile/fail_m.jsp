<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="./common_m.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
<title>出错_雁北堂_雁北堂中文网_手机版</title>
<link rel="stylesheet" href="${sessionScope.baseUrl}mobile/css/common.css"/>
<link rel="stylesheet" href="${sessionScope.baseUrl}mobile/css/style.css"/>
<link rel="stylesheet" href="${sessionScope.baseUrl}mobile/css/use.css"/>
</head>
<body>
<header> 
<!--header begin-->
<jsp:include page="./header_m.jsp">  
	<jsp:param name="menu" value="wu"/>   
</jsp:include>
<!--header end-->
</header>
<%@ include file="./header_user_m.jsp"%>

<section class="alipay discuss">
    <div class="ce-c erro ac">
    	<c:choose>
        	<c:when test="${resBean.msg != null}">${resBean.msg }</c:when>
        	<c:otherwise>
        		<c:if test="${resBean.msgKey != null }"><spring:message code="${resBean.msgKey }"></spring:message></c:if>
        	</c:otherwise>	
        </c:choose>
    </div>
</section>
<dl class="cons_page clearfix">
    <dt><a href="javascript:history.go(-1);"><em></em>&gt;返回</a></dt>
</dl>

<!--footer-->
<%@ include file="./footer_m.jsp"%>
<!--footer-->

</body>
</html>
