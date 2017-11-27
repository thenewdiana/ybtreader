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
	    	if (!$('#mod_form').form('validate')) {
	    		return;
	    	}
	    	$("#mod_form").attr("action","<%=contextPath %>/admin/user/modify_password");
	    	$('#mod_form').submit();
	    }
	</script>
</head>

<body class="easyui-layout" fit="true">
	<div region="center" id="center" style="padding:10px;" border="false">		
		<div class="easyui-panel" title="修改密码" style="width:450px;height:auto">			
			<form id="mod_form" name="addForm" method="post">
			<input type="hidden" name="id" id="id"  value="${sessionScope.sessionBean.userId }"/>
			<table class="promodify" cellspacing="1">
				<tr>
					<td class="info">旧密码：</td>
					<td>
						<input class="easyui-textbox" type="password" name="oldPassword" data-options="required:true"></input>
					</td>
				</tr>
				<tr>
					<td class="info">新密码：</td>
					<td>
						<input class="easyui-textbox" type="password" name="newPassword" data-options="required:true"></input>
					</td>
				</tr>				 				
			</table>
			</form>		
			<div style="text-align:center;padding:5px">
				<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">修改</a>
			</div>
		</div>
	</div>			
</body>
</html>