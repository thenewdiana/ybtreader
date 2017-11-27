<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="消息-雁北堂中文网"></meta>
<meta name="description" content="消息-雁北堂中文网 -www.ebtang.com"></meta>
<title>消息-雁北堂中文网</title>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/user.css"/>
<script type="text/javascript" src="${sessionScope.baseUrl}plugin/jquery-easyui-1.4/jquery.min.js"></script>
<script type="text/javascript">
	function goindex(){
    	$("#form").attr("action","<%=contextPath %>/user/login");
    	$('#form').submit();
    }
</script>
</head>
<body>
<div class="hade-top pos_r over">
	<a href="${pageContext.request.contextPath }/index" class="logo fl">雁北堂</a>
</div>
<!--header begin-->
<%@ include file="../header.jsp"%>
<!--header end-->
<div class="body-bg">
 	<div class="u-bg w1000 f14 over c00" id="mt20">
      <!--left begin-->
      	<form action="" method="post" id="form" name="form">
	    	<div class="repas2">
	        	<p class="dicc"><span>恭喜您，密码成功设置！</span>您可以使用新密码登录雁北堂中文网！</p>
	            <p><input type="button"  value="立即登陆" class="f14 login1" onclick="goindex();"/></p>
	        </div>
   	  	</form>
      <!--left begin-->
        <!--right begin--><!--right begin-->
      <div class="clear"></div>
    </div>
</div>
<%@ include file="../user/user_foot.jsp"%>
</body>
</html>
