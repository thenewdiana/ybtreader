<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title><spring:message code="front.global.title"></spring:message>-登陆</title>
		<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/common.css"/>
		<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/user.css"/>
		<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/uaredirect.js" ></script>
		<script type="text/javascript">uaredirect("http://m.ebtang.com/m/user/login");</script>
		<script type="text/javascript" src="${sessionScope.baseUrl}plugin/jquery-easyui-1.4/jquery.min.js"></script>
		<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/jquery.md5.js"></script>
		<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/statistics_bd.js"></script>
		<script type="text/javascript">
			function repeatSubmitForm(){
		    	$("#repeat_form").attr("action","<%=contextPath %>/user/repeat");
		    	$('#repeat_form').submit();
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
		      	<form id="repeat_form" method="post">
		      	<input type="hidden" name="emailLoginName" value="${user.emailLoginName}"/>
		      	<input type="hidden" name="nick" value="${user.nick}"/>
		      	<div class="u-grl fl ac">
		            <ul>
		            	<li>
		                	<p class="strong p1">邮件已经发送到邮箱   ${user.emailLoginName}</p>
		                </li>
		                <li>
		                	<p>没有收到邮件?  <a  style="cursor:pointer" onclick="repeatSubmitForm();">重新发送</a>   </p>
		                </li>
		            </ul>
		        </div>
		        </form>	   	  
		      	<!--left begin-->
		        <!--right begin-->
		        <div class="u-grf fl ac">
		        	<p>没有账号？马上注册一个吧<a href="<%=contextPath%>/user/register" title="" class="succes1 white strong">轻松注册</a></p>
		            <p class="strong p1">使用合作网站账号直接登录,快速完成注册！</p>
		            <p><a href="https://api.weibo.com/oauth2/authorize?client_id=${sinaAppId }&redirect_uri=${sinaRedirectUrl}"><img src="${sessionScope.baseUrl}pc/images/pic/z-img1.jpg" width="120" height="24" /></a></p>		            
		            <p><a href="https://graph.qq.com/oauth2.0/authorize?response_type=code&client_id=${qqAppId }&redirect_uri=${qqRedirectUrl}" title=""><img src="${sessionScope.baseUrl}pc/images/pic/z-img3.jpg" width="124" height="24" /></a></p>
		            <p><a href="<%=contextPath%>/user/third/weixin/login"><img src="${sessionScope.baseUrl}pc/images/pic/weixin.png" width="120" height="24" /></a></p>		            
		            <p><a href="<%=contextPath%>/user/third/baidu/login" title=""><img src="${sessionScope.baseUrl}pc/images/pic/baidu.png" width="124" height="24" /></a></p>
		        </div>  
		        <!--right begin-->
		      	<div class="clear"></div>
		    </div>
		</div>
		<%@ include file="./user_foot.jsp"%>
	</body>		
</html>