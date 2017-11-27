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
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/util/common.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/statistics_bd.js"></script>
</head>
<body style="background:#F1F1F3;padding:40px">
	<div class="discus1 f12 discus3">
	    <div class="reat1 ac">
	        <strong class="f16">订阅VIP章节，请先登陆</strong>
	    </div>
	    <div class="reat2 over ac">
	        <dl>
	            <dt><a href="${pageContext.request.contextPath }/user/login?redirectUrl=/book/${book.id}/${chapterId}" id="jsLoginBtn">登录</a></dt>
	        </dl>
	        <dl class="ac">
	            <dt><a href="${pageContext.request.contextPath }/book/${book.id}">返回作品</a></dt>
	        </dl>
	    </div>
	</div>
</body>
<script>
toRightPage();
function toRightPage(){
	var params,randomString,href;
	params=window.location.search;
	if(params!=''){
		randomString=utilCommon.tools.getUrlPara(params).randomString;
		href=$('#jsLoginBtn').attr('href')+'?randomString='+randomString;
		$('#jsLoginBtn').attr('href',href);
	}
}
</script>
</html>
<!--[ERROR403]-->