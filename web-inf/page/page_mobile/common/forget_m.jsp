<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common_m.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
<title>找回密码_雁北堂_雁北堂中文网_手机版</title>
<link rel="stylesheet" href="${sessionScope.baseUrl}mobile/css/common.css"/>
<link rel="stylesheet" href="${sessionScope.baseUrl}mobile/css/style.css"/>
<link rel="stylesheet" href="${sessionScope.baseUrl}mobile/css/use.css"/>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/statistics_bd.js"></script>
<script type="text/javascript"  src="${sessionScope.baseUrl}mobile/js/jquery.min.js"></script>
<!--[if lt IE 9]>
<script type="text/javascript"  src="${sessionScope.baseUrl}mobile/js/html5.js"></script>
<![endif]-->
<script type="text/javascript" src="${sessionScope.baseUrl}mobile/js/main.js"></script>
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
        <img src="${sessionScope.baseUrl}mobile/images/ap-img6.jpg" width="58">
    </hgroup>
    
    <div class="ce-c">
    	<div class="u-fenx ar">
            <a href="#" title="" class="qq">QQ</a><a href="#" title="" class="qq sina">新浪</a>
        </div>
        <form action="<%=contextPath%>/m/user/forget" method="post" id="forget_form">
	        <div class="login mt10 passwd">
	        	<c:if test="${resBean != null && resBean.code != 0}">
	    			<p id="resultError" class="ar reds f14 repass">*<spring:message code="${resBean.msgKey }"></spring:message></p>		
				</c:if>
	        	<p id="error" class="ar reds f14 repass"></p>
	        	<ul class="mt6">
	            	<li>
	                	<input type="text" placeholder=" 请输入您的邮箱" value="" name="email" id="email"  class="input12"/>
	                </li>
	               	<li>
	                	<input type="text" class="input12" placeholder=" 请输入验证码" name="randomCode" id="randomCode" >
	                </li>
	                <li><div class="input13"><img src="<%=contextPath%>/kaptcha.jpg" width="78" height="33" alt="" class="mg" id="randomImg"/></div>
	                <a class="fl reds" href="javascript:void();" onclick="refresh_randomImg()">看不清？换一张</a></li>
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
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/valid.js"></script>
<script type="text/javascript">
	$(function(){
		$("#submitButton").bind("click", function(){
			if(!validEmail($('#email').val(),true,100)){
				$("#resultError").html("");
				$("#error").html("*账号必须是邮箱！");
				return false;
			}
			if(getLength($("#randomCode").val())!=4){
				$("#resultError").html("");
				$("#error").html("*验证码必须是4位！");
				return false;
			}
		   	$('#forget_form').submit();
  		});	
	});
	
	function refresh_randomImg() {
		$("#randomImg").attr("src", "<%=contextPath%>/kaptcha.jpg?" + Math.floor(Math.random()*100));
	}
	
</script>
</body>
</html>
