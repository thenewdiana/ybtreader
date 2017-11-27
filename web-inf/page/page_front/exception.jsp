<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>error</title>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/style.css"/>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/statistics_bd.js"></script>
</head>
	<body class="erro">  
	    <div class="w250 ac">
	    	<img src="${sessionScope.baseUrl}pc/images/error.png" width="156" height="141" alt="" />
	        <p class="f16 yahei strong">${msg }</p>
	        <!---->  
	        <div class="over f14 ac mt15">
	        	<a href="${pageContext.request.contextPath }/index"class="fl">返回首页</a>
	        	<a href="javascript:history.go(-1);" title="" class="fr">返回上一页</a>
	        </div>
	        
		</div>    
	</body>
</html>