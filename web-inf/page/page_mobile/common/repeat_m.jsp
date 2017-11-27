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
        <form action="<%=contextPath%>/m/user/repeat" method="post" id="repeat_form">
        	<input type="hidden" name="emailLoginName" value="${user.emailLoginName}"/>
		    <input type="hidden" name="nick" value="${user.nick}"/>
	        <div class="login mt10">
	            <div class="ac pos-r cookie">
		            <ul>
		            	<li>
		                	<p class="strong p1">邮件已经发送到邮箱   ${user.emailLoginName}</p>
		                </li>
		                <li>
		                	<p>没有收到邮件?  <a  style="cursor:pointer;position:relative" onclick="repeatSubmitForm();">重新发送</a>   </p>
		                </li>
		            </ul>
	            </div>
	        </div>
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
	function repeatSubmitForm(){
    	$('#repeat_form').submit();
    }
</script>
</body>
</html>