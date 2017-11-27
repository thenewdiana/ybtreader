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
		<div class="easyui-panel" title="修改" style="width:800px;height:auto">			
			<form id="editForm" name="editForm" method="post" action="<%=contextPath %>/admin/iosCheck/edit">
			<input type="hidden" id="id" name="id" value="${iosCheck._id}" />
			<table class="promodify" cellspacing="1">
				<tr>
					<td class="info">版本编号：</td>
					<td>
						<input type="text" id="versionNumber" name="versionNumber" value="${iosCheck.versionNumber}" class="input-text easyui-textbox" data-options="required:true"/>
					</td>
				</tr>
				<tr>
					<td class="info">版本名称：</td>
					<td>
						<input type="text" id="versionName" name="versionName" value="${iosCheck.versionName}" class="input-text easyui-textbox" data-options="required:true"/>
					</td>
				</tr>	
				<tr>
					<td class="info">审核状态：</td>
					<td>
						<input type="radio" name="auditStatus" value=1 <c:if test="${iosCheck.auditStatus==1}">checked="checked"</c:if> />审核中
						<input type="radio" name="auditStatus" value=0 <c:if test="${iosCheck.auditStatus==0}">checked="checked"</c:if> />正常
					</td>
				</tr>				 
			</table>
			</form>		
			<div style="text-align:center;padding:5px">
				<a href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="submitForm();">修改</a>
				<a href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-back',plain:true" onclick="goback();">返回</a>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function goback(){
			window.location = "<%=contextPath %>/admin/iosCheck/list";	
		}
		
		function submitForm(){
	    	if (!$('#editForm').form('validate')) {
	    		return;
	    	}
	    	<%-- $("#editForm").attr("action","<%=contextPath %>/admin/iosCheck/edit");	    	
	    	$('#editForm').submit(); --%>
	    	var params = $("#editForm").serializeArray();
			$.ajax({
				type: "POST",
				url:$("#editForm").attr("action"),
				dataType: "json",
				data:params,
				success:function(data){
					if(data.result){
						$.messager.alert('提示',data.msg,'info',function(){
							location.href = '<%=contextPath%>/admin/iosCheck/list?isReset=1';
						});
						$(".panel-tool-close").hide();
					}else{
						$.messager.alert('提示',data.msg,'error');
					}
				}
			});
	    }
	</script>		
</body>
</html>