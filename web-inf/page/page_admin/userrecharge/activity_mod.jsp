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
	    	if (!$('#modForm').form('validate')) {
	    		return;
	    	}
	    	$("#modForm").attr("action","<%=contextPath %>/admin/activity/activitymod");	    	
	    	$('#modForm').submit();
	    }
		
		function goback(){
			window.location = "<%=contextPath %>/admin/activity/activitylist";	
		}
		
		function hideOrShowPointType() {
			var val = $("input[name='activityType']:checked").val();
			if( val == "0" ) {
				$("#trPointType").show();
				$("#trDeliverType").show();
			}
			else {
				$("#trPointType").hide();
				$("#trDeliverType").hide();
			}
		}
		
		function showMsgContent() {
			var val = $("input[name='activityType']:checked").val();
			if( val == "0" ) {
				$("#tbMsgContent").text("站短实际内容：" + $("#giftMsg").val() + "充值xxxx糖豆，获得系统免费赠送xx糖豆。");
			}
			else {
				$("#tbMsgContent").text("站短实际内容：" + $("#giftMsg").val() );
			}
		}
		
		function showPointTypeOfLatelyDeliver() {
			$("#pointType0").next("label").text("按活动期间充值总金额计算");
			$("#pointType1").next("label").text("按活动期间首次充值金额计算");
			$("#pointType2").show();
			$("#pointType2").next("label").show();
		}
		
		function showPointTypeOfJITDeliver() {
			$("#pointType0").next("label").text("累加活动期间充值总额，从低到高依次发放所有符合条件的档次的糖豆");
			$("#pointType1").next("label").text("每次充值都发且仅发符合条件的最高档次的糖豆");
			$("#pointType2").hide();
			$("#pointType2").next("label").hide();
			
			var val = $("input[name='pointType']:checked").val();
			if( val == "2" ) {
				$("#pointType1")[0].checked=true;
			}
		}
		
		function showPointTypes() {
			var val = $("input[name='deliverType']:checked").val();
			if( val == "0" ) {
				showPointTypeOfLatelyDeliver();
			}
			else {
				showPointTypeOfJITDeliver();
			}
		}
		
		$(document).ready(function() {
			$("input[name='activityType']").change(hideOrShowPointType);
			hideOrShowPointType();
			
			$("input[name='deliverType']").change(showPointTypes);
			showPointTypes();
			
			$("#giftMsg").change(showMsgContent).keyup(showMsgContent).blur(showMsgContent);
			$("#tbMsgContent").click(showMsgContent);
			
			showMsgContent();
		});
	</script>
</head>

<body class="easyui-layout" fit="true">
	<div region="center" id="center" style="padding:10px;" border="false">		
		<div class="easyui-panel" title="充值送糖豆活动修改" style="width:750px;height:auto">			
			<form id="modForm" name="modForm" method="post" action="" enctype="multipart/form-data">
			<input type="hidden" name="id" size="40" value="${obj.id }" />
			<table class="promodify" cellspacing="1">
				<tr>
					<td class="info">活动名称：</td>
					<td>
						<input type="text" id="name" name="name" class="input-text easyui-textbox" value="${obj.name }" data-options="required:true"/>
					</td>
				</tr>
				<tr>
					<td class="info">活动类型：</td>
					<td>
						<input type="radio" name="activityType" id="activityType1" value="0" <c:if test="${obj.activityType == 0 }">checked="checked"</c:if>/><label for="activityType1">充值送糖豆</label>
						<input type="radio" name="activityType" id="activityType2" value="1" <c:if test="${obj.activityType == 1 }">checked="checked"</c:if>/><label for="activityType2">注册送糖豆</label>
						<input type="radio" name="activityType" id="activityType3" value="2" <c:if test="${obj.activityType == 2 }">checked="checked"</c:if>/><label for="activityType3">免费领糖豆</label>
						<input type="radio" name="activityType" id="activityType4" value="3" <c:if test="${obj.activityType == 3 }">checked="checked"</c:if>/><label for="activityType4">其它活动</label>
					</td>
				</tr>
				<tr>
					<td class="info">关闭状态：</td>
					<td>
						<input type="radio" name="isClosed" id="isClosed1" value="1" <c:if test="${obj.isClosed == 1 }">checked="checked"</c:if>/><label for="isClosed1">已关闭</label>
						<input type="radio" name="isClosed" id="isClosed0" value="0" <c:if test="${obj.isClosed == 0 }">checked="checked"</c:if>/><label for="isClosed0">公开</label>
					</td>
				</tr>
				<tr>
					<td class="info">活动开始时间：</td>
					<td>
						<input type="text" id="rechargeStartStr" name="rechargeStartStr" value="${obj.rechargeStartStr }" class="input-text easyui-textbox Wdate"  onclick="WdatePicker()" data-options="required:true"/>不输入表示不限制。格式:2015-08-25，或2015-08-25 12:00:00
					</td>
				</tr>
				<tr>
					<td class="info">活动停止时间：</td>
					<td>
						<input type="text" id="rechargeEndStr" name="rechargeEndStr" value="${obj.rechargeEndStr }" class="input-text easyui-textbox Wdate"  onclick="WdatePicker()" data-options="required:true"/>不输入表示不限制。格式:2015-08-25，或2015-08-25 12:00:00
					</td>
				</tr>
				<tr>
					<td class="info">送糖豆提示信息：</td>
					<td>
						<input type="text" id="giftMsg" name="giftMsg"  value="${obj.giftMsg }" class="input-text easyui-textbox" data-options="required:true"/><br/>
						<span id="tbMsgContent" title="点击刷新">站短实际内容:</span>
					</td>
				</tr>
				<tr id="trDeliverType">
					<td class="info">奖励发放方式：</td>
					<td>
						<input type="radio" name="deliverType" id="deliverType0" value="0" <c:if test="${obj.deliverType == 0 }">checked="checked"</c:if>/><label for="deliverType0">活动结束后统一手动发放</label>
						<input type="radio" name="deliverType" id="deliverType1" value="1" <c:if test="${obj.deliverType == 1 }">checked="checked"</c:if>/><label for="deliverType1">充值完成立刻到账</label>
					</td>
				</tr>
				<tr id="trPointType">
					<td class="info">充值金额判定方式：</td>
					<td>
						<input type="radio" name="pointType" id="pointType0" value="0" <c:if test="${obj.pointType == 0 }">checked="checked"</c:if>/><label for="pointType0">按活动期间充值总金额计算</label>
						<input type="radio" name="pointType" id="pointType1" value="1" <c:if test="${obj.pointType == 1 }">checked="checked"</c:if>/><label for="pointType1">按活动期间首次充值金额计算</label>
						<input type="radio" name="pointType" id="pointType2" value="2" <c:if test="${obj.pointType == 2 }">checked="checked"</c:if>/><label for="pointType2">按活动期间最高充值金额计算</label>
					</td>
				</tr>
				<tr>
					<td class="info">活动图片：</td>
					<td><input id="myfile" type="file" name="myfile"/>
						<span class="notice"></span>
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