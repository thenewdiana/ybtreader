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
	    	$("#addForm").attr("action","<%=contextPath %>/admin/lottery/lotteryadd");	    	
	    	$('#addForm').submit();
	    }
		
		function goback(){
			window.location = "<%=contextPath %>/admin/lottery/lotterylist";	
		}
		
		$(document).ready(function() {
			$("table tr:odd td:odd").css("backgroundColor","#EFF5FF");
		});
	</script>
</head>

<body class="easyui-layout" fit="true">
	<div region="center" id="center" style="padding:10px;" border="false">		
		<div class="easyui-panel" title="抽奖活动增加" style="width:800px;height:auto">			
			<form id="addForm" name="addForm" method="post" action="">
			<table class="promodify" cellspacing="1">
				<tr>
					<td class="info" style="width:250px">活动名称：</td>
					<td>
						<input type="text" id="name" name="name" class="input-text easyui-textbox" data-options="required:true"/>
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
					<td class="info">活动开始时间：</td>
					<td>
						<input type="text" id="startTimeStr" name="startTimeStr" class="input-text easyui-textbox Wdate" onclick="WdatePicker()" data-options="required:true"/>
						<label for="startTimeStr">不输入表示不限制。格式:2015-08-25，或2015-08-25 12:00:00</label>
					</td>
				</tr>
				<tr>
					<td class="info">活动停止时间：</td>
					<td>
						<input type="text" id="endTimeStr" name="endTimeStr" class="input-text easyui-textbox Wdate" onclick="WdatePicker()" data-options="required:true"/>
						<label for="endTimeStr">不输入表示不限制。格式:2015-08-25，或2015-08-25 12:00:00</label>
					</td>
				</tr>
				<tr>
					<td class="info">每日免费领抽奖券的VIP级别（含）：</td>
					<td>
						<input type="text" id="limitVipValue" name="limitVipValue" style="width:30px" class="input-text easyui-textbox" data-options="required:true"/> -1表示所有用户每日都可领取免费的抽奖券
					</td>
				</tr>
				<tr>
					<td class="info">VIP每日免费领抽的奖券数量：</td>
					<td>
						<input type="text" id="vipDailyTicketNum" name="vipDailyTicketNum" style="width:30px" class="input-text easyui-textbox" data-options="required:true"/>
					</td>
				</tr>
				<tr>
					<td class="info">VIP每日领取的免费奖券的有效期：</td>
					<td>
						<input type="radio" name="isVipExpiredDaily" id="isVipExpiredDaily1" value="0" checked/><label for="isVipExpiredDaily1">长期有效</label>
						<input type="radio" name="isVipExpiredDaily" id="isVipExpiredDaily2" value="1"/><label for="isVipExpiredDaily2">当天有效</label>
					</td>
				</tr>
				<tr>
					<td class="info">打赏时是否赠送抽奖券：</td>
					<td>
						<input type="radio" name="rewardTicketType" id="rewardTicketType1" value="0" checked/><label for="rewardTicketType1">不赠送</label>
						<input type="radio" name="rewardTicketType" id="rewardTicketType2" value="1"/><label for="rewardTicketType2">仅赠送一次</label>
						<input type="radio" name="rewardTicketType" id="rewardTicketType3" value="2"/><label for="rewardTicketType3">重复赠送</label>
					</td>
				</tr>
				<tr>
					<td class="info">打赏的糖豆数：</td>
					<td>
						<input type="text" id="rewardValue" name="rewardValue" style="width:60px" class="input-text easyui-textbox" data-options="required:true"/>
					</td>
				</tr>
				<tr>
					<td class="info">打赏赠送的奖券数：</td>
					<td>
						<input type="text" id="rewardTicketNum" name="rewardTicketNum" style="width:30px" class="input-text easyui-textbox" data-options="required:true"/>
					</td>
				</tr>
				<tr>
					<td class="info">打赏赠送的抽奖券的有效期：</td>
					<td>
						<input type="radio" name="isRewardExpiredDaily" id="isRewardExpiredDaily1" value="0" checked/><label for="isRewardExpiredDaily1">长期有效</label>
						<input type="radio" name="isRewardExpiredDaily" id="isRewardExpiredDaily2" value="1"/><label for="isRewardExpiredDaily2">当天有效</label>
					</td>
				</tr>
				<tr>
					<td class="info">消费时是否赠送抽奖券：</td>
					<td>
						<input type="radio" name="consumeTicketType" id="consumeTicketType1" value="0" checked/><label for="consumeTicketType1">不赠送</label>
						<input type="radio" name="consumeTicketType" id="consumeTicketType2" value="1"/><label for="consumeTicketType2">仅赠送一次</label>
						<input type="radio" name="consumeTicketType" id="consumeTicketType3" value="2"/><label for="consumeTicketType3">重复赠送</label>
					</td>
				</tr>
				<tr>
					<td class="info">消费的糖豆数：</td>
					<td>
						<input type="text" id="consumeValue" name="consumeValue" style="width:70px" class="input-text easyui-textbox" data-options="required:true"/>
					</td>
				</tr>
				<tr>
					<td class="info">消费赠送的奖券数：</td>
					<td>
						<input type="text" id="consumeTicketNum" name="consumeTicketNum" style="width:30px" class="input-text easyui-textbox" data-options="required:true"/>
					</td>
				</tr>
				<tr>
					<td class="info">消费赠送的抽奖券的有效期：</td>
					<td>
						<input type="radio" name="isConsumeExpiredDaily" id="isConsumeExpiredDaily1" value="0" checked/><label for="isConsumeExpiredDaily1">长期有效</label>
						<input type="radio" name="isConsumeExpiredDaily" id="isConsumeExpiredDaily2" value="1"/><label for="isConsumeExpiredDaily2">当天有效</label>
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