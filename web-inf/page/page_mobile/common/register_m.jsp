<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common_m.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
<title>注册_雁北堂_雁北堂中文网_手机版</title>
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

<section class="alipay enroll back">
	<hgroup class="ce-t ac">
    	<h1 class="title"><a href="javascript:history.go(-1);"><img src="${sessionScope.baseUrl}mobile/images/ap-img7.jpg" width="10"></a></h1>
        <img src="${sessionScope.baseUrl}mobile/images/ap-img8.jpg" width="30">
    </hgroup>
    <div class="ce-c">
    	<div class="u-fenx ar">
            <a href="https://graph.qq.com/oauth2.0/authorize?response_type=code&client_id=${qqAppId }&redirect_uri=${qqRedirectUrl}" title="" class="qq">QQ</a>
            <a href="https://api.weibo.com/oauth2/authorize?client_id=${sinaAppId }&redirect_uri=${sinaRedirectUrl}" title="" class="qq sina">新浪</a>
        </div>
        <form action="<%=contextPath%>/m/user/register" method="post" id="register_form">
	        <div class="login mt10 passwd">
	        	<c:if test="${resBean != null && resBean.code != 0}">
	    			<p id="resultError" class="ar reds f14 repass">*<spring:message code="${resBean.msgKey }"></spring:message></p>		
				</c:if>
	        	<p id="error" class="ar reds f14 repass"></p>
	        	<ul class="mt6">
	            	<li>
	                	<input type="text" class="input12" id="name" name="name" placeholder="  请输入您的邮箱" value="${registerForm.name }"/>
	                </li>
	                <li>
	                	<input id="password" name="password" type="password" value="" class="input12" placeholder="  请设置不少于6位的密码" />
	                </li>
	                <li>
	                	<input id="passwordConfirm" name="passwordConfirm" type="password" value="" class="input12" placeholder="  密码确认"/>
	                </li>
	                <li>
	                	<input id="nick" name="nick" type="text" value="${registerForm.nick }" class="input12" placeholder="  请输入您的昵称"/>
	                </li>
	                <li><input id="randomCode" name="randomCode" type="text" class="input12 input14" placeholder="  请输入验证码">
	                <div class="input13"><img src="<%=contextPath%>/kaptcha.jpg" width="78" height="33" alt="" class="mg" id="randomImg"/></div>
	                <a class="fl reds" href="javascript:void();" onclick="refresh_randomImg()">看不清？换一张</a></li>
	            </ul>
	        </div>
        	<a href="javascript:void(0);" id="submitButton" class="apply-input white ac mt6">完成注册</a>
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
			if(!validEmail($('#name').val(),true,100)){
				$("#resultError").html("");
				$("#error").html("*格式必须是邮箱！");
				return false;
			}
			var password = $('#password').val();
			var passwordConfirm = $('#passwordConfirm').val();
			
			if(getLength(password)<6||getLength(password)>16){
				$("#resultError").html("");
				$("#error").html("*用户密码不能小于6位或大于16位！");
				return false;
			}
			if(password!=passwordConfirm){
				$("#resultError").html("");
				$("#error").html("*两次输入密码不一致！");
				return false;
			}
			
			if(!validText($("#nick").val(),true,100)){
				$("#resultError").html("");
				$("#error").html("*昵称不能为空！");
				return false;
			}
			if(!validText($("#randomCode").val(),true,100)){
				$("#resultError").html("");
				$("#error").html("*验证码不能为空！");
				return false;
			}
			if(password != null && password != ''){
				var md5Password = $.md5(password);
				$('#password').val(md5Password);
			}  
			if(passwordConfirm != null && passwordConfirm != ''){
				var md5PasswordConfirm = $.md5(passwordConfirm);
				$('#passwordConfirm').val(md5PasswordConfirm);
			}
		    $('#register_form').submit();
  		});	
	});
	
	function refresh_randomImg() {
		$("#randomImg").attr("src", "<%=contextPath%>/kaptcha.jpg?" + Math.floor(Math.random()*100));
	}
	
</script>

</body>
</html>