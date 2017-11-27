<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common_m.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
<title>重置密码_雁北堂_雁北堂中文网_手机版</title>
<link rel="stylesheet" href="${sessionScope.baseUrl}mobile/css/common.css"/>
<link rel="stylesheet" href="${sessionScope.baseUrl}mobile/css/style.css"/>
<link rel="stylesheet" href="${sessionScope.baseUrl}mobile/css/use.css"/>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/statistics_bd.js"></script>
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
        <img src="${sessionScope.baseUrl}mobile/images/ap-img11.jpg" width="60">
    </hgroup>
    
    <div class="ce-c">
    	<form action="<%=contextPath%>/m/user/updatePassword" method="post" id="resetPwd_form">
	        <div class="login mt15 passwd">
	        	<c:if test="${resBean != null && resBean.code != 0}">
	    			<p id="resultError" class="ar reds f14 repass">*<spring:message code="${resBean.msgKey }"></spring:message></p>		
				</c:if>
	        	<p id="error" class="ar reds f14 repass"></p>
	        	<ul class="mt6">
	            	<li>
	                	<input id="password" name="password" type="password" value="" placeholder="新密码"  class="input12"/>
	                </li>
	               <li>
	                	<input id="passwordConfirm" name="passwordConfirm" type="password" value="" placeholder="再次输入" class="input12"/>
	                </li>
	                <li class="f12 replace">
	                	<p>1.为保证您的安全，新密码必须与旧密码不同。</p>
						<p>2.密码由6-16位字符（字母、数字、符号）组合而成。</p>
	                </li>
	            </ul>
	        </div>
	        <a href="javascript:void(0);" id="submitButton" class="apply-input white ac mt6">提交</a>
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
			var password = $('#password').val();
			var passwordConfirm = $('#passwordConfirm').val();
			
			if(getLength(password)<6||getLength(password)>16){
				$("#resultError").html("");
				$("#error").html("用户密码应该在6-16位！");
				return false;
			}
			if(password!=passwordConfirm){
				$("#resultError").html("");
				$("#error").html("两次输入密码不一致！");
				return false;
			}
			if(password != null && password != ''){
				var md5Password = $.md5(password);
				$('#password').val(md5Password);
			}
		    $('#resetPwd_form').submit();
  		});	
	});
</script>
</body>
</html>
