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
</head>

<body>
	<div class="easyui-layout" data-options="fit:true" >
		<div id="center" data-options="region:'center',border:false"
			style="padding:5px;">
			<div id="planPanel" title="编辑推荐URL" class="easyui-panel"
				data-options="border:true" style="padding:5px;">
				
				<form id="modForm" name="modForm" method="post" action="<%=contextPath%>/admin/subject/hotwords_mod">
					<input type="hidden" id="id" name="id" value="${channelSubjectBookResBean.id}" />
					<input type="hidden" id="subjectId" name="subjectId" value="${channelSubjectBookResBean.subjectId}" />
					<table class="promodify" cellspacing="1">
						<tr>
							<td class="info">热词：</td>
							<td><input type="text" id="recommTitle" name="recommTitle" value="${channelSubjectBookResBean.recommTitle}" class="easyui-textbox" data-options="required:true"/>
								<span class="notice"></span>
							</td>
						</tr>
					    <tr>
							<td class="info">链接：</td>
							<td><input type="text" id="recommUrl" name="recommUrl" value="${channelSubjectBookResBean.recommUrl}" class="easyui-textbox"/>
								<span class="notice"></span>
							</td>
						</tr>
<!-- 						<tr> -->
<!-- 							<td class="info">排序：</td> -->
<!-- 							<td><input type="text" id="sort" name="sort" class="easyui-numberbox" value="${channelSubjectBookResBean.sort}" data-options="required:true,min:0" /> -->
<!-- 							</td> -->
<!-- 						</tr> -->
					</table>
					<div align="center">
						<a id="submitBtn" onclick="mod()" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" >保存</a> 
						<a id="goback" onclick="goback();" class="easyui-linkbutton" data-options="iconCls:'icon-back',plain:true">返回</a>
					</div>
				</form>
			</div>
			<div id="tipsPanel" class="easyui-panel" title="提示" data-options="border:true" style="padding:5px;">
				<span style="font-weight: bold;">热词 注意事项：</span><br/>
				1、如果单独推送热词，请不要填写“链接”字段<br/>
				2、如果推送url，请务必填写“链接”字段,并填写完整的url，例如：http://www.ebtang.com<br/>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function mod(){
	    	if ($('#modForm').form('validate')) {
	    		var params = $("#modForm").serializeArray();
				$.ajax({
					type: "POST",
					url:$("#modForm").attr("action"),
					dataType: "json",
					data:params,
					success:function(data){
						if(data.result){
							$.messager.alert('提示',data.msg,'info',function(){
								location.href = '<%=contextPath%>/admin/subject/book_list/'+$("#subjectId").val();
							});
							$(".panel-tool-close").hide();
						}else{
							$.messager.alert('提示',data.msg,'error');
						}
					}
				});
	    	}
		}
		function goback(){
			window.location.href='<%=contextPath%>/admin/subject/book_list/'+$("#subjectId").val();
		}	
		
	</script>

</body>
</html>
