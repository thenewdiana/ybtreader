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
	    	
	    	var rate = parseFloat($("#rate").textbox("getValue"));
	    	if( isNaN(rate) || rate < 0 || rate > 100 ) {
	    		alert("中奖几率格式不正确！");
	    		return;
	    	}
	    	
	    	$("#addForm").attr("action","<%=contextPath %>/admin/lottery/itemadd");	    	
	    	$('#addForm').submit();
	    }
		
		function goback(){
			window.location = "<%=contextPath %>/admin/lottery/itemlist?lotteryId=${lotteryId}";	
		}
		
		$(document).ready(function() {
			$("table tr:odd td:odd").css("backgroundColor","#EFF5FF");
		});
	</script>
</head>

<body class="easyui-layout" fit="true">
	<div region="center" id="center" style="padding:10px;" border="false">		
		<div class="easyui-panel" title="抽奖活动奖项增加" style="width:750px;height:auto">			
			<form id="addForm" name="addForm" method="post" action="">
			<input type="hidden" name="lotteryId" id="lotteryId" value="${lotteryId }"/>
			<table class="promodify" cellspacing="1">
				<tr>
					<td class="info">抽奖活动：</td>
					<td>
						${lottery.name}
					</td>
				</tr>
				<tr>
					<td class="info">奖品：</td>
					<td>
						<select name="itemId" id="itemId">
							<c:forEach var="item" items="${items}">
							<option value="${item.id }">${item.name}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td class="info">总数量：</td>
					<td>
						<input type="text" id="maxNum" name="maxNum" style="width:50px" class="input-text easyui-textbox" data-options="required:true"/> 0表示不限制
					</td>
				</tr>
				<tr>
					<td class="info">每天中奖数量上限：</td>
					<td>
						<input type="text" id="dailyNum" name="dailyNum" style="width:50px" class="input-text easyui-textbox" data-options="required:true"/> 0表示不限制
					</td>
				</tr>
				<tr>
					<td class="info">中奖几率：</td>
					<td>
						<input type="text" id="rate" name="rate" style="width:50px" class="input-text easyui-textbox" data-options="required:true"/>% 百分数。取值0~100
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