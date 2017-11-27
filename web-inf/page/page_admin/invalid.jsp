<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title><spring:message code="admin.global.title"></spring:message></title>
<link type="text/css" rel="stylesheet" href="${sessionScope.baseUrl}pc/css/default.css" />
<script type="text/javascript" src="${sessionScope.baseUrl}plugin/jquery-easyui-1.4/jquery.min.js"></script>

<script type="text/javascript">
$(function(){
	$(":button[name='relogin']").click(function(){
		goPageLogin();
	});
});

function goPageLogin(){	
	top.location.replace('<%=contextPath%>/admin/login');
}
</script>
</head>
<body>
<div id="dialog">
	<div class="information">
		<p>${msg }</p>
		<p class="buttons">
		<input style="cursor: pointer;" type="button" name="relogin" value="重新登录" />
		</p>
	</div>
</div>
</body>
</html>