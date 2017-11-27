<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="common.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title><spring:message code="admin.global.title"></spring:message></title>
    <link type="text/css" rel="stylesheet" href="${sessionScope.baseUrl}pc/css/default.css" />
    <link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}plugin/jquery-easyui-1.4/themes/default/easyui.css"/>
    <link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}plugin/jquery-easyui-1.4/themes/icon.css"/>    
    <link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}plugin/jquery-easyui-1.4/themes/color.css"/>
    <script type="text/javascript" src="${sessionScope.baseUrl}plugin/jquery-easyui-1.4/jquery.min.js"></script>
    <script type="text/javascript" src="${sessionScope.baseUrl}plugin/jquery-easyui-1.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${sessionScope.baseUrl}plugin/jquery-easyui-1.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="${sessionScope.baseUrl}pc/js/jquery.md5.js"></script>
	<style type="text/css">
		html,body,table{background-color:#f5f5f5;width:100%;height:500px;text-align:center;}
		.form-signin-heading{font-size:36px;margin-bottom:20px;color:#0663a2;}
      	.form-signin{position:relative;text-align:left;width:300px;padding:25px 29px 29px;margin:0 auto 20px;background-color:#fff;border:1px solid #e5e5e5;
        	-webkit-border-radius:5px;-moz-border-radius:5px;border-radius:5px;-webkit-box-shadow:0 1px 2px rgba(0,0,0,.05);-moz-box-shadow:0 1px 2px rgba(0,0,0,.05);box-shadow:0 1px 2px rgba(0,0,0,.05);}
      	.form-signin .input-label{font-size:16px;line-height:23px;color:#999;}
      	.form-signin .input-block-level{font-size:16px;height:auto;margin-bottom:15px;padding:7px;*width:283px;*padding-bottom:0;_padding:7px 7px 9px 7px;}
      	.form-signin .btn.btn-large{font-size:16px;} 
      	.mid{vertical-align:middle;}
      	.header{height:60px;padding-top:30px;} 
      	.alert{position:relative;width:300px;margin:0 auto;*padding-bottom:0px;}
      	label.error{background:none;padding:2px;font-weight:normal;color:red;margin:0;}
    </style>
	<script type="text/javascript">
		function submitForm(){
	    	if (!$('#login_form').form('validate')) {
	    		return;
	    	}
			var loginPwd = $('#userPassword').val();
			if(loginPwd != null && loginPwd != ''){
				var password = $.md5(loginPwd);
				$('#password').val(password);
			}  
	    	$("#login_form").attr("action","<%=contextPath %>/admin/login");
	    	$('#login_form').submit();
	    }
	    
	    function refresh_randomImg() {
			$("#randomImg").attr("src", "<%=contextPath%>/kaptcha.jpg?" + Math.floor(Math.random()*100));
		}
	</script>
</head>
<body>
	<div class="header">
		<div id="messageBox" class="alert alert-error">
			<label id="loginError" class="error">${msg }</label>
		</div>
	</div>
 	<h1 class="form-signin-heading">后台登陆</h1>
	<form id="login_form" class="form-signin" method="post">
        <label class="input-label" for="username">登录名：</label>
        <input type="text" id="name" name="name" class="input-block-level required easyui-textbox" data-options="required:true" /><br/>
        <label class="input-label" for="password">密&nbsp;码：</label>
        <input type="password" id="userPassword" name="userPassword" class="input-block-level required easyui-textbox" data-options="required:true"/><br/>
        	
        <c:if test="${isValidateCodeLogin}">
        	<label class="input-label" for="randomCode">验证码：</label>
        	<input type="text" id="randomCode" name="randomCode" class="input-block-level required easyui-textbox" data-options="required:true"/>
        	<span><img src="<%=contextPath%>/kaptcha.jpg" width="63" height="32" alt="" class="mg" id="randomImg"/></span>
        	<span class="f12">看不清？ <a href="javascript:void();" onclick="refresh_randomImg()" title="" class="red">换一张</a></span>
        	<br/>
        </c:if>
        <input type="hidden" id="password" name="password"  />
        <br/>
        <input class="btn btn-large btn-primary" type="button" value="登 录" onclick="submitForm();"/>&nbsp;&nbsp;
	</form>
</body>
</html>
