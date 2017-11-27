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
	    	if (!$('#modForm').form('validate')) {
	    		return;
	    	}
	    	$("#modForm").attr("action","<%=contextPath %>/admin/sys/dictdata_mod");	    	
	    	$('#modForm').submit();
	    }
		
		function goback(){
			$("#modForm").attr("action","<%=contextPath %>/admin/sys/dictdata_list");	    	
	    	$('#modForm').submit();
		}
	</script>
</head>

<body class="easyui-layout" fit="true">
	<div region="center" id="center" style="padding:10px;" border="false">		
		<div class="easyui-panel" title="分类修改" style="width:550px;height:auto">			
			<form id="modForm" name="modForm" method="post" action="">
			<input type="hidden" name="id" size="40" value="${obj.id }" />
			<input type="hidden" name="dictId" size="40" value="${obj.dictId }" />
			<table class="promodify" cellspacing="1">
				<tr>
					<td class="info">字典值Key：</td>
					<td>
						<input type="text" id="dataKey" name="dataKey" class="input-text easyui-textbox" value="${obj.dataKey }" data-options="required:true"/>
					</td>
				</tr>
				<tr>
					<td class="info">字典值Value：</td>
					<td>
						<input type="text" id="dataValue" name="dataValue" class="input-text easyui-textbox" value="${obj.dataValue }" data-options="required:true"/>
					</td>
				</tr>
				<tr>
					<td class="info">字典值排序：</td>
					<td>
						<input type="text" id="dataSort" name="dataSort" class="input-text easyui-textbox" value="${obj.dataSort }" data-options="required:true"/>
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