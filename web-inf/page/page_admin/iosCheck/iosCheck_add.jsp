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
			<form id="addForm" name="addForm" method="post" action="<%=contextPath %>/admin/iosCheck/add" >
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
					<td class="info">审核状态：</td>
					<td>
						<input type="radio" name="auditStatus" value=1 checked="checked"  />审核中
						<input type="radio" name="auditStatus" value=0 />正常
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
	    	console.log("asdfasdfasdf");
	    	<%-- $("#addForm").attr("action","<%=contextPath %>/admin/iosCheck/add");	    	
	    	$('#addForm').submit(); --%>
	    	var params = $("#addForm").serializeArray();
			console.log(params);
			$.ajax({
				type: "POST",
				url:$("#addForm").attr("action"),
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
		
		function goback(){
			window.location = "<%=contextPath %>/admin/iosCheck/list";	
		}
	</script>		
</body>
</html>