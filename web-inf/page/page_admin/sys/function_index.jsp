<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title><spring:message code="admin.global.title"></spring:message></title>
    <link type="text/css" rel="stylesheet" href="${sessionScope.baseUrl}pc/css/default.css" />
    <link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}plugin/jquery-easyui-1.4/themes/default/easyui.css"/>
    <link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}plugin/jquery-easyui-1.4/themes/icon.css"/>    
    <link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}plugin/jquery-easyui-1.4/themes/color.css"/>
    <script type="text/javascript" src="${sessionScope.baseUrl}plugin/jquery-easyui-1.4/jquery.min.js"></script>
    <script type="text/javascript" src="${sessionScope.baseUrl}plugin/jquery-easyui-1.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${sessionScope.baseUrl}plugin/jquery-easyui-1.4/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript">
	$(function(){
		$(document.body).layout();
		loadTree();
	});
	
	function loadTree()
	{
		//实例化tree
		$('#tree').tree({  
			url:'<%=contextPath %>/admin/sys/function_tree',
			onClick:function(node){
				var time = new Date().getTime();
				$("#iframe").attr("src","<%=contextPath %>/admin/sys/function_list?moduleId=" + node.id + "&time=" + time);
			}
		});	
	}
	
	function refreshTree() {
		$("#tree").tree("reload");
	}
	</script>
</head>

<body>  
	<script type="text/javascript" src="<%=contextPath %>/js/loading.js"></script>
    <div data-options="region:'west',split:true,title:' '" style="width:260px">
    	<ul id="tree"></ul>
    </div>  
    <div data-options="region:'center',title:' ',iconCls:'icon-list'" style="overflow:hidden;">
    	<iframe name="iframe" id="iframe" width="100%" height="100%" frameborder="0" scrolling="no" ></iframe>	    	    	
    </div>   
</body> 
</html>
