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
			function submitForm(){
				var loginPwd = $('#passwordShow').val();
				if(loginPwd != null && loginPwd != ''){
					var password = $.md5(loginPwd);
					$('#password').val(password);
				}  
		    	$("#login_form").attr("action","<%=contextPath %>/user/login_submit");
		    	$('#login_form').submit();
		    }
			
			function refresh_randomImg() {
				$("#randomImg").attr("src", "<%=contextPath%>/kaptcha.jpg?" + Math.floor(Math.random()*100));
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
		      	<form id="login_form" method="post">
		      	<input type="hidden" name="redirectUrl" value="${loginForm.redirectUrl }"/>
		      	<input type="hidden" name="password" id="password"/>
		    	<div class="u-grl  fl">
		        	<ul>
		            	<li>
		                	<label>账 号</label><input id="name" name="name" type="text" value="${loginForm.name }" class="inputw"/>
		                </li>
		                <li>
		                	<label>密 码</label><input id="passwordShow" name="passwordShow" type="password" value="" class="inputw"/>
		                </li>
		                <c:if test="${isValidateCodeLogin}">
		                	 <li>
			                	<label>验证码</label><input name="randomCode" type="text" value="" class="inputw input2"/>
			                	<span><img src="<%=contextPath%>/kaptcha.jpg" width="63" height="32" alt="" class="mg" id="randomImg"/></span>
			                	<span class="f12">看不清？ <a href="javascript:void();" onclick="refresh_randomImg()" title="" class="red">换一张</a></span>
			                </li>
		                </c:if>
		              	<li class="last1">
			              	<c:if test="${resBean != null && resBean.code != 0}">
			              	<p class="fl"><span class="red" id="error" ><spring:message code="${resBean.msgKey }"></spring:message></span></p>
	    					<br/>
	    					</c:if>
		              	</li>
		              	<li class="last1"><input type="button"  value="立即登陆" class="f14 login1" style="cursor:pointer;" onclick="submitForm();"/>
		              	<a href="<%=contextPath%>/user/forget" title="忘记密码" class="red f14 ml10">忘记密码</a></li>
		            </ul>
		        </div>
		        </form>	   	  
		      	<!--left begin-->
		        <!--right begin-->
		        <div class="u-grf fl ac">
		        	<p>没有账号？马上注册一个吧<a href="<%=contextPath%>/user/register" title="" class="succes1 white strong">轻松注册</a></p>
		            <p class="strong p1">使用合作网站账号直接登录,快速完成注册！</p>
		            <p><a href="<%=contextPath%>/user/third/sina/login" title="微博登录"><img src="${sessionScope.baseUrl}pc/images/pic/z-img1.jpg" width="120" height="24" /></a></p>		            
		            <p><a href="<%=contextPath%>/user/third/qq/login" title="QQ登录"><img src="${sessionScope.baseUrl}pc/images/pic/z-img3.jpg" width="124" height="24" /></a></p>
		            <p><a href="<%=contextPath%>/user/third/weixin/login" title="微信登录"><img src="${sessionScope.baseUrl}pc/images/pic/weixin.png" width="120" height="24" /></a></p>		            
		            <p><a href="<%=contextPath%>/user/third/baidu/login" title="百度登录"><img src="${sessionScope.baseUrl}pc/images/pic/baidu.png" width="124" height="24" /></a></p>
		        </div>  
		        <!--right begin-->
		      	<div class="clear"></div>
		    </div>
		</div>
		<%@ include file="./user_foot.jsp"%>
	</body>		
</html>