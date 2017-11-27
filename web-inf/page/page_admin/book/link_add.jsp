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
    	$(document).ready(function() {
    		// 为简单起见，目前暂时只支持链接到URL地址
    		$("#targetChannel").hide();
    		$("#targetId").hide();
    		$("#posId").hide();
    		
    		$("#targetType").change(function() {
    			if($("#targetType").val()==0) {
    				$("#targetUrl").show();
    				$("#targetId").hide();
    			}
    		});
    		
    		$("#posType").change(function() {
    			var val = $("#posType").val();
    			// 所有页面、网站首页、书库首页
    			if( val == -2 || val == 0 || val == 1 ) {
    				$("#posId").hide();
    			}
    			// 频道里的所有页面、频道首页
    			else {
    				$("#posId").show();
    			}
    			/*
    			if( val == -1 || val == 201) {
    				$("#posId").empty();
    				$("#posId").show();
    				$.ajax({
    					type:"GET",
    					url : "<%=contextPath %>/admin/links/channellist_json",
    					dataType:"json",
    					success:function(data) {
	    					for(var i = 0; i < data.rows.length; i ++ ) {
	    						var row = data.rows[i];
	    						$("#posId").append("<option value='" + row.id + "'>" + row.name + "</option>");
	    					}
    					}
    				});
    			}
    			// 书籍介绍或书籍阅读
    			else if( val == 101 || val == 102 ) {
    				$("#posId").empty();
    			}
    			*/
    		});
    	});
    	
		function submitForm(){
	    	if (!$('#addForm').form('validate')) {
	    		return;
	    	}
	    	$("#addForm").attr("action","<%=contextPath %>/admin/links/linkadd");	    	
	    	$('#addForm').submit();
	    }
		
		function goback(){
			window.location = "<%=contextPath %>/admin/link/linklist";	
		}
	</script>
</head>

<body class="easyui-layout" fit="true">
	<div region="center" id="center" style="padding:10px;" border="false">		
		<div class="easyui-panel" title="站内链接增加" style="width:750px;height:auto">			
			<form id="addForm" name="addForm" method="post" action="">
			<table class="promodify" cellspacing="1">
				<tr>
					<td class="info">说明信息：</td>
					<td>
						<input type="text" id="linkName" name="linkName" class="input-text easyui-textbox" data-options="required:true"/>
					</td>
				</tr>
				<tr>
					<td class="info">所在位置：</td>
					<td>
						<select id="posType" name="posType">
							<option value="-2">所有页面</option>
							<option value="-1">频道内所有页面</option>
							<option value="0">网站首页</option>
							<option value="201">频道首页</option>
							<option value="1">书库首页</option>
							<option value="101">书籍首页</option>
							<option value="102">书籍阅读</option>
						</select>
						<select id="posId" name="posId">
							<option value="0">--所有频道--</option>
						<c:forEach items="${channels}" var="ch">
							<option value='<c:out value="${ch.id}"/>'><c:out value="${ch.name}"/></option>
						</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td class="info">显示文本：</td>
					<td>
						<input type="text" id="linkText" name="linkText" class="input-text easyui-textbox" data-options="required:true"/>
					</td>
				</tr>
				<tr>
					<td class="info">指向地址：</td>
					<td>
						<select id="targetType" name="targetType">
							<option value="0">URL</option>
							<!--<option value="101">书籍首页</option>-->
						</select>
						<select id="targetChannel" name="targetChannel"></select>
						<select id="targetId" name="targetId"></select>
						<input type="text" id="targetUrl" name="targetUrl" class="input-text easyui-textbox" data-options="required:true"/>
					</td>
				</tr>
				<tr>
					<td class="info">开始显示时间：</td>
					<td>
						<input type="text" id="startTimeStr" name="startTimeStr" class="input-text easyui-textbox Wdate" onClick="WdatePicker()"/>
						<label for="startTimeStr">不输入表示不限制。格式:2015-08-25，或2015-08-25 12:00:00</label>
					</td>
				</tr>
				<tr>
					<td class="info">停止显示时间：</td>
					<td>
						<input type="text" id="endTimeStr" name="endTimeStr" class="input-text easyui-textbox Wdate" onClick="WdatePicker()"/>
						<label for="startTimeStr">不输入表示不限制。格式:2015-08-25，或2015-08-25 12:00:00</label>
					</td>
				</tr>
				<tr>
					<td class="info">在web上显示：</td>
					<td>
						<input type="radio" name="webEnabled" id="webEnabled1" checked value="1"/><label for="webEnabled1">显示</label>
						<input type="radio" name="webEnabled" id="webEnabled0" value="0"/><label for="webEnabled0">不显示</label>
					</td>
				</tr>		
				<tr>
					<td class="info">在手机上显示：</td>
					<td>
						<input type="radio" name="mobEnabled" id="mobEnabled1" value="1"/><label for="mobEnabled1">显示</label>
						<input type="radio" name="mobEnabled" id="mobEnabled0" checked value="0"/><label for="mobEnabled0">不显示</label>
					</td>
				</tr>		
				<tr>
					<td class="info">在app上显示：</td>
					<td>
						<input type="radio" name="appEnabled" id="appEnabled1" value="1"/><label for="appEnabled1">显示</label>
						<input type="radio" name="appEnabled" id="appEnabled0" checked value="0"/><label for="appEnabled0">不显示</label>
					</td>
				</tr>						 
			</table>
			<input type="hidden" name="groupId" id="groupId" value="${groupId}"/>
			</form>		
			<div style="text-align:center;padding:5px">
				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="submitForm();">保存</a>
				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-back',plain:true" onclick="goback();">返回</a>
			</div>
		</div>
	</div>			
</body>
</html>