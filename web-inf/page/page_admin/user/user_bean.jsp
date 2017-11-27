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
    <script type="text/javascript" src="${sessionScope.baseUrl}pc/js/paginationUtil.js"></script>
    <script type="text/javascript" src="${sessionScope.baseUrl}pc/js/valid.js"></script>
    <script type="text/javascript" src="${sessionScope.baseUrl}pc/js/arrayExt.js"></script>
    <script type="text/javascript" src="${sessionScope.baseUrl}pc/js/easyuiExt.js"></script>
</head>

<body>
	<div class="easyui-layout" data-options="fit:true" >
		<div id="center" data-options="region:'center',border:false"
			style="padding:5px;">
			<div id="planPanel" title="系统赠豆" class="easyui-panel"
				data-options="border:true" style="padding:5px;">
				
				<form id="modForm" name="modForm" method="post"
					action="<%=contextPath%>/admin/user/user_bean">
					<input type="hidden" name="userId" id="userId" value="${user.id}" />
					<table class="promodify" cellspacing="1">
					    <tr>
							<td class="info">昵称：</td>
							<td>${user.nick}
							</td>
						</tr>
						<tr>
							<td class="info">赠送豆数量：</td>
							<td><input type="text" id="rechargeValue" name="rechargeValue" class="easyui-textbox" data-options="required:true,validType:['length[1,9]']" />
								<span class="notice"></span>
							</td>
						</tr>
					</table>
					<div align="center">
						<a id="submitBtn" onclick="mod()" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true">确定</a> 
						<a id="goback" onclick="goback();" class="easyui-linkbutton" data-options="iconCls:'icon-back',plain:true">返回</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		
		function mod(){
			if (!$('#modForm').form('validate')) {
	    		return;
	    	}
			var params = $("#modForm").serializeArray();
			$.ajax({
				type: "POST",
				url:$("#modForm").attr("action"),
				dataType: "json",
				data:params,
				success:function(data){
					if(data.result){
						$.messager.alert('提示',data.msg,'info',function(){
							location.href = '<%=contextPath%>/admin/user/frontList';
						});
						$(".panel-tool-close").hide();
					}else{
						$.messager.alert('提示',data.msg,'error');
					}
				}
			});
		}
		
		function goback(){
			window.location.href='<%=contextPath%>/admin/user/frontList';
		}	
		
	</script>

</body>
</html>
