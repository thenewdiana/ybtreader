<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>error</title>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/style.css"/>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/statistics_bd.js"></script>
</head>
	<body class="erro">  
	    <div class="w250 ac">
	    	<img src="${sessionScope.baseUrl}pc/images/error.png" width="156" height="141" alt="" />
	        <p class="f16 yahei strong">
	        <c:choose>
	        	<c:when test="${resBean.msg != null}">${resBean.msg }</c:when>
	        	<c:otherwise>
	        		<c:if test="${resBean.msgKey != null }"><spring:message code="${resBean.msgKey }"></spring:message></c:if>
	        	</c:otherwise>	
	        </c:choose>	        
	        </p>
	        <div class="over f14 ac mt15">
	        	<c:if test="${resBean.error != null }">	        	
	        	<a href="${pageContext.request.contextPath }/${resBean.error.btnUrl}" style="MARGIN-RIGHT:auto;MARGIN-LEFT:auto;">${resBean.error.btnName}</a>
	        	</c:if>
	        	<a href="${pageContext.request.contextPath }/index" style="MARGIN-RIGHT:auto;MARGIN-LEFT:auto;">返回首页</a>
	        </div>	        
		</div>    
	</body>
</html>
<!--[ERROR403]-->