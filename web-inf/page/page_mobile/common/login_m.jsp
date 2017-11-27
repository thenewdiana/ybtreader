<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common_m.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
<title>登录_雁北堂_雁北堂中文网_手机版</title>
<link rel="stylesheet" href="${sessionScope.baseUrl}mobile/css/common.css"/>
<link rel="stylesheet" href="${sessionScope.baseUrl}mobile/css/style.css"/>
<link rel="stylesheet" href="${sessionScope.baseUrl}mobile/css/use.css"/>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/statistics_bd.js"></script>

</head>
<body>
<header> 
<!--header begin-->
<jsp:include page="../header_m.jsp">  
	<jsp:param name="menu" value="index"/>   
</jsp:include>
<!--header end-->
</header>

<section class="alipay enroll">
	<hgroup class="ce-t">
    	<h1 class="fl"><img src="${sessionScope.baseUrl}mobile/images/ap-img5.jpg" width="110"></h1>
        <div class="fr f14"><a href="<%=contextPath%>/m/user/register" title="">注册</a></div>
    </hgroup>
    <div class="ce-c">
    	<div class="u-fenx ar">
            <a href="<%=contextPath%>/m/user/third/baidu/login" title="百度登录" class="baidu">百度</a>
            <a href="<%=contextPath%>/m/user/third/qq/login" title="QQ登录" class="qq">QQ</a>
            <a href="<%=contextPath%>/m/user/third/sina/login" title="微博登录" class="sina">新浪</a>
        </div>
        <form action="<%=contextPath%>/m/user/login" method="post" id="login_form">
        	<input type="hidden" name="password" id="password"/>
        	<input type="hidden" name="redirectUrl" value="${loginForm.redirectUrl }"/>
	        <div class="login mt10">
	        	<c:if test="${resBean != null && resBean.code != 0}">
	    			<p id="resultError" class="ar reds f14 repass">*<spring:message code="${resBean.msgKey }"></spring:message></p>		
				</c:if>
	        	<p id="error" class="ar reds f14 repass"></p>
	        	<ul>
	            	<li>
	                	<label><img src="${sessionScope.baseUrl}mobile/images/user1.png" width="32"></label><span><input type="text" id="name" name="name" class="input12" value="${loginForm.name }" placeholder=" 请用邮箱登录" value=""></span>
	                </li>
	                <li>
	                	<label><img src="${sessionScope.baseUrl}mobile/images/user2.png" width="32"></label><span><input type="password" name="passwordShow" id="passwordShow" placeholder=" 密码" class="input12"></span>
	                </li>
	                <c:if test="${isValidateCodeLogin}">
		                <li>
		                	<label><img src="${sessionScope.baseUrl}mobile/images/vCode.png" width="32"></label><span><input type="text" name="randomCode" id="randomCode" placeholder=" 请输入验证码" class="input12" style="width:50%">
		                	<div class="input13"><img src="<%=contextPath%>/kaptcha.jpg" width="78" height="33" alt="" class="mg" id="randomImg"/></div>
		                	<a class="fl reds" href="javascript:void();" onclick="refresh_randomImg()">看不清？换一张</a>
		                	</span>
		                	
		                </li>
	                </c:if>
	            </ul>
	            <div class="ac pos-r cookie">
	            	<input name="keepLogin" id="keepLogin" type="checkbox" checked="checked">记住我<span> *需支持cookie</span>
	                <a href="<%=contextPath%>/m/user/forget" title="忘记密码？">忘记密码？</a>
	            </div>
	        </div>
        	<a href="javascript:void(0);" id="submitButton" class="apply-input white ac mt6">登 录</a>
        </form>
    </div>
</section>

<!--footer-->
<%@ include file="../footer_m.jsp"%>
<!--footer-->

<script type="text/javascript"  src="${sessionScope.baseUrl}mobile/js/jquery.min.js"></script>
<!--[if lt IE 9]>
<script type="text/javascript"  src="${sessionScope.baseUrl}mobile/js/html5.js"></script>
<![endif]-->
<script type="text/javascript" src="${sessionScope.baseUrl}mobile/js/main.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/jquery.md5.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/valid.js"></script>
<script type="text/javascript">
	$(function(){
		$("#submitButton").bind("click", function(){
			if(!validText($("#name").val(),true,100)){
				$("#resultError").html("");
				$("#error").html("*用户名不可以为空");
				return false;
			}
			if(!validText($("#passwordShow").val(),true,100)){
				$("#resultError").html("");
				$("#error").html("*密码不可以为空");
				return false;
			}
			var loginPwd = $('#passwordShow').val();
			if(loginPwd != null && loginPwd != ''){
				var password = $.md5(loginPwd);
				$('#password').val(password);
			}  
	    	$('#login_form').submit();
  		});	
	});
	
	function refresh_randomImg() {
		$("#randomImg").attr("src", "<%=contextPath%>/kaptcha.jpg?" + Math.floor(Math.random()*100));
	}

</script>
</body>
</html>