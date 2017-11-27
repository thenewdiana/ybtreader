<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../common.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=contextPath%>">
    <title>结果</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" rel="stylesheet" href="${sessionScope.baseUrl}pc/css/default.css" />
    <link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}plugin/jquery-easyui-1.4/themes/default/easyui.css"/>
    <link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}plugin/jquery-easyui-1.4/themes/icon.css"/>    
    <link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}plugin/jquery-easyui-1.4/themes/color.css"/>
    <script type="text/javascript" src="${sessionScope.baseUrl}plugin/jquery-easyui-1.4/jquery.min.js"></script>
    <script type="text/javascript" src="${sessionScope.baseUrl}plugin/jquery-easyui-1.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${sessionScope.baseUrl}plugin/jquery-easyui-1.4/locale/easyui-lang-zh_CN.js"></script>
  </head>
  
  <body>
  	<script type="text/javascript">
  		jQuery(function(){
  			var data = '${result.result}';
  			if('${result.result}' == 'true'){
				$.messager.alert('提示','${result.msg}','info',function(){
					location.href = '<%=contextPath%>'+'${result.gobackUrl}';
				});
				$(".panel-tool-close").hide();
			}else{
				$.messager.alert('提示','${result.msg}','error',function(){
					history.go(-1);
				});
				$(".panel-tool-close").hide();
			}
  		});
  		
  	</script>
  </body>
</html>
