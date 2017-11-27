<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>提示-雁北堂-雁北堂中文网</title>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/style.css"/>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/statistics_bd.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/uaredirect.js" ></script>
<script type="text/javascript">uaredirect("http://m.ebtang.com/m/error");</script>
</head>


<body class="erro">  
    <div class="w250 ac">
    	<img src="${sessionScope.baseUrl}pc/images/error.png" width="156" height="141" alt="" />
        <p class="f16 yahei strong">抱歉！您访问的页面不存在！</p>
        <div class="over f14 ac mt15">
        	<a href="${pageContext.request.contextPath }/index" title="" class="fl">返回首页</a>
            <a href="javascript:history.go(-1);" title="" class="fr">返回上一页</a>
        </div>
</div>
    
</body>
</html>