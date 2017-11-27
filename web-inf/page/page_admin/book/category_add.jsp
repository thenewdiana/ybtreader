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
		function submitForm(){
	    	if (!$('#addForm').form('validate')) {
	    		return;
	    	}
	    	$("#addForm").attr("action","<%=contextPath %>/admin/category/add");	    	
	    	$('#addForm').submit();
	    }
		
		function goback(){
			window.location = "<%=contextPath %>/admin/category/list";	
		}
	</script>
</head>

<body class="easyui-layout" fit="true">
	<div region="center" id="center" style="padding:10px;" border="false">		
		<div class="easyui-panel" title="分类增加" style="width:550px;height:auto">			
			<form id="addForm" name="addForm" method="post" action="">
			<table class="promodify" cellspacing="1">
				<tr>
					<td class="info">分类名称：</td>
					<td>
						<input type="text" id="name" name="name" class="input-text easyui-textbox" data-options="required:true"/>
					</td>
				</tr>
				<tr>
					<td class="info">分类描述：</td>
					<td>
						<input type="text" id="description" name="description" class="input-text easyui-textbox" data-options="required:true"/>
					</td>
				</tr>
				<tr>
					<td class="info">腾讯分类ID：</td>
					<td><input type="text" id="txCategoryId" name="txCategoryId" class="easyui-numberbox" data-options="required:true,min:0" />
					</td>
				</tr>	
				<tr>
					<td class="info">腾讯分类名称：</td>
					<td>
						<input type="text" id="txCategoryName" name="txCategoryName" class="easyui-textbox" data-options="required:true"/>
					</td>
				</tr>
				<tr>
					<td class="info">塔读分类ID：</td>
					<td><input type="text" id="tdCategoryId" name="tdCategoryId" class="easyui-numberbox" data-options="required:true,min:0" />
					</td>
				</tr>	
				<tr>
					<td class="info">塔读分类名称：</td>
					<td>
						<input type="text" id="tdCategoryName" name="tdCategoryName" class="easyui-textbox" data-options="required:true"/>
					</td>
				</tr>
				<tr>
					<td class="info">91分类ID：</td>
					<td><input type="text" id="pandaCategoryId" name="pandaCategoryId" class="easyui-numberbox" data-options="required:true,min:0" />
					</td>
				</tr>	
				<tr>
					<td class="info">91分类名称：</td>
					<td>
						<input type="text" id="pandaCategoryName" name="pandaCategoryName" class="easyui-textbox" data-options="required:true"/>
					</td>
				</tr>	
				<tr>
					<td class="info">新浪分类ID：</td>
					<td><input type="text" id="sinaCategoryId" name="sinaCategoryId" class="easyui-numberbox" data-options="required:true,min:0" />
					</td>
				</tr>	
				<tr>
					<td class="info">新浪分类名称：</td>
					<td>
						<input type="text" id="sinaCategoryName" name="sinaCategoryName" class="easyui-textbox" data-options="required:true"/>
					</td>
				</tr>														 
			</table>
			</form>		
			<div style="text-align:center;padding:5px">
				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="submitForm();">保存</a>
				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-back',plain:true" onclick="goback();">返回</a>
			</div>
		</div>
	</div>			
</body>
</html>