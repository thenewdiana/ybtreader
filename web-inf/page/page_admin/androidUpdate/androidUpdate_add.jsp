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
   

</head>

<body class="easyui-layout" fit="true">
	<div region="center" id="center" style="padding:10px;" border="false">		
		<div class="easyui-panel" title="增加" style="width:800px;height:auto">			
			<form id="addForm" name="addForm" method="post" action="" enctype="multipart/form-data">
			<table class="promodify" cellspacing="1">
				<tr>
					<td class="info">版本编号：</td>
					<td>
						<input type="text" id="versionNumber" name="versionNumber" class="input-text easyui-textbox" data-options="required:true"/>
					</td>
				</tr>
				<tr>
					<td class="info">版本名称：</td>
					<td>
						<input type="text" id="versionName" name="versionName" class="input-text easyui-textbox" data-options="required:true"/>
					</td>
				</tr>
				<tr>
					<td class="info">发布日志：</td>
					<td>
						<textarea rows="5" cols="50"  name="releaseNote" id="releaseNote"></textarea>
					</td>
				</tr>
				<tr>
					<td class="info">是否强制升级：</td>
					<td>
						<input type="radio" name="coerceUpdate" value=1 checked="checked"  />是
						<input type="radio" name="coerceUpdate" value=0 />否
					</td>
				</tr>
				<tr>
					<td class="info">app上传：</td>
					<td><input id="myfile" type="file" name="myfile" />
						<span class="notice"></span>
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
	<script type="text/javascript">
		
		function submitForm(){
	    	if (!$('#addForm').form('validate')) {
	    		return;
	    	}
	    	if($('#myfile').val()==''){
				$.messager.alert('提示',"请选择需要上传的app文件！",'info');
				return;
			}
	    	$("#addForm").attr("action","<%=contextPath %>/admin/androidUpdate/add");	    	
	    	$('#addForm').submit();
	    }
		
		function goback(){
			window.location = "<%=contextPath %>/admin/androidUpdate/list";	
		}
	</script>		
</body>
</html>