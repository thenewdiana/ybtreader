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
    	<h1 class="title"><img src="${sessionScope.baseUrl}mobile/images/ap-img7.jpg" width="10"></h1>
        <img src="${sessionScope.baseUrl}mobile/images/ap-img8.jpg" width="30">
    </hgroup>
    <div class="ce-c">
        <form action="<%=contextPath%>/m/user/third/register_submit" method="post" id="register_form">
        	<input type="hidden" name="name" value="${registerForm.name }"/>
        	<input type="hidden" name="thirdNick" value="${registerForm.thirdNick }"/>
		    <input type="hidden" name="userSource" value="${registerForm.userSource }"/>
		    <input type="hidden" name="headImage" value="${registerForm.headImage }"/>
	        <div class="login mt10 passwd">
	        	<c:if test="${resBean != null && resBean.code != 0}">
	    			<p id="resultError" class="ar reds f14 repass">*<spring:message code="${resBean.msgKey }"></spring:message></p>		
				</c:if>
	        	<p id="error" class="ar reds f14 repass"></p>
	        	<ul class="mt6">
	            	<li>
	            		<input id="nick" name="nick" type="text" value="${registerForm.nick }"  class="input12"/>	                	
	                </li>	                
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
			if(!validText($("#nick").val(),true,100)){
				$("#resultError").html("");
				$("#error").html("*昵称不能为空！");
				return false;
			}
			
		    $('#register_form').submit();
  		});	
	});
</script>

</body>
</html>