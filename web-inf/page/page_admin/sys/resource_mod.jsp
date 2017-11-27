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
	    	$("#modForm").attr("action","<%=contextPath %>/admin/sys/resource_mod");	    	
	    	$('#modForm').submit();
	    }
		
		function goback(){
			window.location = "<%=contextPath %>/admin/sys/resource_list?functionId=${obj.functionId}";	
		}
	</script>
</head>

<body class="easyui-layout" fit="true">
	<div region="center" id="center" style="padding:10px;" border="false">		
		<div class="easyui-panel" title="资源修改" style="width:550px;height:auto">			
			<form id="modForm" name="modForm" method="post" action="">
			<input type="hidden" name="id" size="40" value="${obj.id }" />
			<input type="hidden" name="functionId" size="40" value="${obj.functionId }" />
			<table class="promodify" cellspacing="1">
				<tr>
					<td class="info">资源名称：</td>
					<td>
						<input type="text" id="name" name="name" class="input-text easyui-textbox" value="${obj.name }" data-options="required:true"/>
					</td>
				</tr>
				
				<tr>
					<td class="info">资源URL：</td>
					<td>
						<input type="text" id="url" name="url" class="input-text easyui-textbox" value="${obj.url }" data-options="required:true"/>
					</td>
				</tr>
				<tr>
                   <td class="info">是否记录日志：</td>
                   <td><input type="radio" name="logRecord" value="0" <c:if test="${obj.logRecord == 0 }" >checked="checked"</c:if> />不记录<input type="radio" name="logRecord" value="1" <c:if test="${obj.logRecord == 1 }" >checked="checked"</c:if> />记录</td>
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


