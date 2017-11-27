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
    <script type="text/javascript" src="${sessionScope.baseUrl}plugin/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript">
		function submitForm(){
	    	if (!$('#addForm').form('validate')) {
	    		return;
	    	}
	    	$("#addForm").attr("action","<%=contextPath %>/admin/rewardtool/rewardtooladd");	    	
	    	$('#addForm').submit();
	    }
		
		function goback(){
			window.location = "<%=contextPath %>/admin/rewardtool/rewardtoollist";	
		}
		
				
		$(document).ready(function() {				
			$("table tr:odd td:odd").css("backgroundColor","#EFF5FF");
		});
	</script>
</head>

<body class="easyui-layout" fit="true">
	<div region="center" id="center" style="padding:10px;" border="false">		
		<div class="easyui-panel" title="打赏道具增加" style="width:750px;height:auto">			
			<form id="addForm" name="addForm" method="post" action="" enctype="multipart/form-data">
			<table class="promodify" cellspacing="1">
				<tr>
					<td class="info">打赏道具名称：</td>
					<td>
						<input type="text" id="nick" name="nick" class="input-text easyui-textbox" data-options="required:true"/>
					</td>
				</tr>
				<tr>
					<td class="info">打赏值：</td>
					<td>
						<input type="text" id="rewardValue" name="rewardValue" class="input-text easyui-textbox" data-options="required:true"/>
					</td>
				</tr>
				<tr>
				<td class="info">hot值：</td>
					<td>
						<input type="text" id="hotValue" name="hotValue" class="input-text easyui-textbox" data-options="required:true"/>
					</td>
				</tr>
				<tr>
					<td class="info">关闭状态：</td>
					<td>
						<input type="radio" name="isClosed" id="isClosed1" value="1" checked/><label for="isClosed1">已关闭</label>
						<input type="radio" name="isClosed" id="isClosed0" value="0"/><label for="isClosed0">公开</label>
					</td>
				</tr>
				<tr>
					<td class="info"> 有效开始时间：</td>
					<td>
						<input type="text" id="startTimeStr" name="startTimeStr" class="input-text easyui-textbox Wdate" onclick="WdatePicker()" data-options="required:true"/>
						<label for="startTimeStr">不输入表示不限制。格式:2015-08-25，或2015-08-25 12:00:00</label>
					</td>
				</tr>
				<tr>
					<td class="info">有效停止时间：</td>
					<td>
						<input type="text" id="endTimeStr" name="endTimeStr" class="input-text easyui-textbox Wdate" onclick="WdatePicker()" data-options="required:true"/>
						<label for="endTimeStr">不输入表示不限制。格式:2015-08-25，或2015-08-25 12:00:00</label>
					</td>
				</tr>
				<tr>
					<td class="info">道具单位：</td>
					<td>
						<input type="text" id="unit" name="unit" class="input-text easyui-textbox" data-options="required:true"/>
					</td>
				</tr>
				<tr>
					<td class="info">打赏道具图片：</td>
					<td><input id="myfile" type="file" name="myfile"/>
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
</body>
</html>