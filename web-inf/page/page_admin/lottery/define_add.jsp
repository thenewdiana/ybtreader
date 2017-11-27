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
	    	$("#addForm").attr("action","<%=contextPath %>/admin/lottery/itemdefineadd");	    	
	    	$('#addForm').submit();
	    }
		
		function goback(){
			window.location = "<%=contextPath %>/admin/lottery/itemdefinelist";	
		}
		
		function showMsgContent() {
			var str = $("#useMsg").textbox("getValue");
			var name = $("#name").textbox("getValue");
			
			str = str.replace("{nick}","翠花").replace("{itemName}",name).replace("{num}","1");
			
			$("#tbMsgContent").text(str);
		}
		
		function showItemTypes() {
			var v = $("input[name='itemType']:checked").val();
			if( v == "1" ) {
				$("#addValue").textbox("readonly",false);
				var num = $("#addValue").textbox("getValue");
				$("#addValue").textbox("setValue",""+parseInt(num));
			}
			else {
				$("#addValue").textbox("readonly",true);
				$("#addValue").textbox("setValue","0");
			}
		}
		
		$(document).ready(function() {
			$("#useMsg").textbox({onChange: showMsgContent});
			$("#name").textbox({onChange: showMsgContent});
			
			$("#tbMsgContent").click(showMsgContent);
			
			$("input[name='itemType']").change(showItemTypes);
			showItemTypes();
			
			$("table tr:odd td:odd").css("backgroundColor","#EFF5FF");
		});
	</script>
</head>

<body class="easyui-layout" fit="true">
	<div region="center" id="center" style="padding:10px;" border="false">		
		<div class="easyui-panel" title="奖品库奖品增加" style="width:750px;height:auto">			
			<form id="addForm" name="addForm" method="post" action="">
			<table class="promodify" cellspacing="1">
				<tr>
					<td class="info">奖品名称：</td>
					<td>
						<input type="text" id="name" name="name" class="input-text easyui-textbox" data-options="required:true"/>
					</td>
				</tr>
				<tr>
					<td class="info">奖品类型：</td>
					<td>
						<input type="radio" name="itemType" id="itemType1" value="0" checked/><label for="itemType1">谢谢合作</label>
						<input type="radio" name="itemType" id="itemType2" value="1"/><label for="itemType2">糖豆</label>
						<input type="radio" name="itemType" id="itemType3" value="2"/><label for="itemType3">系统道具</label>
						<input type="radio" name="itemType" id="itemType4" value="3"/><label for="itemType4">实物</label>
						<input type="radio" name="itemType" id="itemType5" value="4"/><label for="itemType5">其它</label>
					</td>
				</tr>
				<tr>
					<td class="info">赠送糖豆值：</td>
					<td>
						<input type="text" id="addValue" name="addValue" class="input-text easyui-textbox" data-options="required:true"/>
					</td>
				</tr>
				<tr>
					<td class="info">图片地址：</td>
					<td>
						<input type="text" id="picture" name="picture" style="width:300px" class="input-text easyui-textbox" data-options="required:false"/>
					</td>
				</tr>
				<tr>
					<td class="info">中奖提示信息：</td>
					<td>
						<input type="text" id="useMsg" name="useMsg" style="width:350px" class="input-text easyui-textbox" data-options="required:true" value="{nick} 幸运的抽中了 {itemName} x{num}"/><br/>
						<span id="tbMsgContent" title="点击刷新"></span>
					</td>
				</tr>
				<tr>
					<td class="info">关闭状态：</td>
					<td>
						<input type="radio" name="isClosed" id="isClosed1" value="1" checked/><label for="isClosed1">已关闭</label>
						<input type="radio" name="isClosed" id="isClosed0" value="0"/><label for="isClosed0">公开</label>
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