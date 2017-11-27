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
		$(document).ready(function(){
			$("#targetChannel").hide();
			$("#targetId").hide();
			
			$("#posType").change(function() {
				var val = $("#posType").val();
				if( val == -1 || val > 100 ) {
					$("#posId").show();
				}
				else {
					$("#posId").hide();
				}
			});
		});
		
		function submitForm(){
	    	if (!$('#modForm').form('validate')) {
	    		return;
	    	}
	    	$("#modForm").attr("action","<%=contextPath %>/admin/links/linkmod");	    	
	    	$('#modForm').submit();
	    }
		
		function goback(){
			window.location = "<%=contextPath %>/admin/links/linklist?groupId=${obj.groupId}";	
		}
	</script>
</head>

<body class="easyui-layout" fit="true">
	<div region="center" id="center" style="padding:10px;" border="false">		
		<div class="easyui-panel" title="站内链接组修改" style="width:750px;height:auto">			
			<form id="modForm" name="modForm" method="post" action="">
			<input type="hidden" name="id" value="${obj.id }" />
			<input type="hidden" name="groupId" value="${obj.groupId }" />
			<table class="promodify" cellspacing="1">
				<tr>
					<td class="info">说明信息：</td>
					<td>
						<input type="text" id="linkName" name="linkName" value="${obj.linkName }" class="input-text easyui-textbox" data-options="required:true"/>
					</td>
				</tr>
				<tr>
					<td class="info">所在位置：</td>
					<td>
						<select id="posType" name="posType">
							<option value="-2" <c:if test="${obj.posType == -2 }">selected</c:if>>所有页面</option>
							<option value="-1" <c:if test="${obj.posType == -1 }">selected</c:if>>频道内所有页面</option>
							<option value="0" <c:if test="${obj.posType == 0 }">selected</c:if>>网站首页</option>
							<option value="201" <c:if test="${obj.posType == 201 }">selected</c:if>>频道首页</option>
							<option value="1" <c:if test="${obj.posType == 1 }">selected</c:if>>书库首页</option>
							<option value="101" <c:if test="${obj.posType == 101 }">selected</c:if>>书籍首页</option>
							<option value="102" <c:if test="${obj.posType == 102 }">selected</c:if>>书籍阅读</option>
						</select>
						<select id="posId" name="posId">
							<option value="0">--所有频道--</option>
						<c:forEach items="${channels}" var="ch">
							<option value='<c:out value="${ch.id}"/>' <c:if test="${ch.id==obj.posId}">selected</c:if>><c:out value="${ch.name}"/></option>
						</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td class="info">显示文本：</td>
					<td>
						<input type="text" id="linkText" name="linkText" value="${obj.linkText }" class="input-text easyui-textbox" data-options="required:true"/>
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
						<input type="text" id="targetUrl" name="targetUrl" value="${obj.targetUrl }" class="input-text easyui-textbox" data-options="required:true"/>
					</td>
				</tr>
				<tr>
					<td class="info">开始显示时间：</td>
					<td>
						<input type="text" id="startTimeStr" name="startTimeStr" value="${obj.startTimeStr }" class="input-text easyui-textbox Wdate" onClick="WdatePicker()" data-options="required:false"/>
						<label for="startTimeStr">不输入表示不限制。格式:2015-08-25，或2015-08-25 12:00:00</label>
					</td>
				</tr>
				<tr>
					<td class="info">停止显示时间：</td>
					<td>
						<input type="text" id="endTimeStr" name="endTimeStr" value="${obj.endTimeStr }" class="input-text easyui-textbox Wdate" onClick="WdatePicker()" data-options="required:false"/>
						<label for="startTimeStr">不输入表示不限制。格式:2015-08-25，或2015-08-25 12:00:00</label>
					</td>
				</tr>
				<tr>
					<td class="info">在web上显示：</td>
					<td>
						<input type="radio" name="webEnabled" id="webEnabled1" value="1" <c:if test="${obj.webEnabled == 1 }">checked="checked"</c:if>/><label for="webEnabled1">显示</label>
						<input type="radio" name="webEnabled" id="webEnabled0" value="0" <c:if test="${obj.webEnabled == 0 }">checked="checked"</c:if>/><label for="webEnabled0">不显示</label>
					</td>
				</tr>		
				<tr>
					<td class="info">在手机上显示：</td>
					<td>
						<input type="radio" name="mobEnabled" id="mobEnabled1" value="1" <c:if test="${obj.mobEnabled == 1 }">checked="checked"</c:if>/><label for="mobEnabled1">显示</label>
						<input type="radio" name="mobEnabled" id="mobEnabled0" value="0" <c:if test="${obj.mobEnabled == 0 }">checked="checked"</c:if>/><label for="mobEnabled0">不显示</label>
					</td>
				</tr>		
				<tr>
					<td class="info">在app上显示：</td>
					<td>
						<input type="radio" name="appEnabled" id="appEnabled1" value="1" <c:if test="${obj.appEnabled == 1 }">checked="checked"</c:if>/><label for="appEnabled1">显示</label>
						<input type="radio" name="appEnabled" id="appEnabled0" value="0" <c:if test="${obj.appEnabled == 0 }">checked="checked"</c:if>/><label for="appEnabled0">不显示</label>
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