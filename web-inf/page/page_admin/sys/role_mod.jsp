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
    <script type="text/javascript" src="${sessionScope.baseUrl}pc/js/tree-extends.js"></script>
	<script type="text/javascript">
		$(function(){
			loadTree();
		});
		
		function loadTree()
		{
			//实例化tree
			$('#tree').tree({ 
				checkbox:true, 
				url:'<%=contextPath %>/admin/sys/role_tree?id=${obj.id}'
			});		
		}
		
		function submitForm(){
	    	if (!$('#modForm').form('validate')) {
	    		return;
	    	}
	    	
	    	$('#tree').setCheckedNodeHtmlByNodeType("paramModuleIds","${moduleNodeType}","moduleIds");
			$('#tree').setCheckedNodeHtmlByNodeType("paramFunctionIds","${functionNodeType}","functionIds");
	    	$("#modForm").attr("action","<%=contextPath %>/admin/sys/role_mod");	    	
	    	$('#modForm').submit();
	    }
		
		function goback(){
			window.location = "<%=contextPath %>/admin/sys/role_list";	
		}				
	</script>
</head>

<body class="easyui-layout" fit="true">
	<div region="center" id="center" style="padding:10px;" border="false">
		<div class="easyui-panel" title="角色修改" style="width:650px;height:auto">			
			<form id="modForm" name="modForm" method="post">
			<input type="hidden" name="id" size="40" value="${obj.id }" />
			<div id="paramModuleIds" style="display:none">			

			</div>
			<div id="paramFunctionIds" style="display:none">			
			</div>
			<table class="promodify" cellspacing="1">
				<tr>
					<td class="info">角色名称：</td>
					<td>
						<input type="text" id="name" name="name" value="${obj.name }" class="input-text easyui-textbox" data-options="required:true"/>						
					</td>
				</tr>
				<tr>
					<td class="info">角色权限：</td>
					<td>
						<ul id="tree"></ul>
					</td>
				</tr>				
			</table>
			</form>		
			<div style="text-align:center;padding:5px">
				<a href="#" class="easyui-linkbutton" onclick="submitForm();">修改</a>
				<a href="#" class="easyui-linkbutton" onclick="goback();">返回</a>		
			</div>
		</div>
	</div>
</body>
</html>