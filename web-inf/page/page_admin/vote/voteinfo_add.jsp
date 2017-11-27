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
	    	$("#addForm").attr("action","<%=contextPath %>/admin/vote/voteadd");	    	
	    	$('#addForm').submit();
	    }
		
		function goback(){
			window.location = "<%=contextPath %>/admin/vote/votelist";	
		}
	</script>
</head>

<body class="easyui-layout" fit="true">
	<div region="center" id="center" style="padding:10px;" border="false">		
		<div class="easyui-panel" title="投票活动增加" style="width:750px;height:auto">			
			<form id="addForm" name="addForm" method="post" action="">
			<table class="promodify" cellspacing="1">
				<tr>
					<td class="info">投票活动名称：</td>
					<td>
						<input type="text" id="voteName" name="voteName" class="input-text easyui-textbox" data-options="required:true"/>
					</td>
				</tr>
				<tr>
					<td class="info">活动类型：</td>
					<td>
						<input type="radio" name="voteType" id="voteType1" value="1"/><label for="voteType1">年度最佳书籍</label>
						<input type="radio" name="voteType" id="voteType2" value="2" checked/><label for="voteType2">普通投票</label>
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
					<td class="info">ID/IP限制：</td>
					<td>
						<input type="radio" name="limitIdType" id="limitIdType0" value="0" checked/><label for="limitIdType0">按ID</label>
						<input type="radio" name="limitIdType" id="limitIdType1" disabled value="1"/><label for="limitIdType1">按IP（未实现）</label>
					</td>
				</tr>
				<tr>
					<td class="info">投票身份限制：</td>
					<td>
						<input type="radio" name="limitUserType" id="limitUserType0" disabled value="0"/><label for="limitUserType0">游客可投（未实现）</label>
						<input type="radio" name="limitUserType" id="limitUserType1" value="1" checked/><label for="limitUserType1">读者可投</label>
						<input type="radio" name="limitUserType" id="limitUserType2" disabled value="2"/><label for="limitUserType2">作者可投（未实现）</label>
					</td>
				</tr>
				<tr>
					<td class="info">投票频率限制：</td>
					<td>
						<input type="radio" name="limitVoteFrequency" id="limitVoteFrequency0" value="0" checked/><label for="limitVoteFrequency0">仅可投一次</label>
						<input type="radio" name="limitVoteFrequency" id="limitVoteFrequency1" value="1"/><label for="limitVoteFrequency1">每天都可投</label>
					</td>
				</tr>
				<tr>
					<td class="info">每日可投次数：</td>
					<td>
						<input type="text" id="limitVoteTimes" name="limitVoteTimes" class="input-text easyui-textbox" data-options="required:true" value="1"/>
					</td>
				</tr>
				<tr>
					<td class="info">每次选择项数：</td>
					<td>
						最小:<input type="text" id="limitMinItemNum" name="limitMinItemNum" class="input-text easyui-textbox" data-options="required:true"/>
						最大:<input type="text" id="limitMaxItemNum" name="limitMaxItemNum" class="input-text easyui-textbox" data-options="required:true"/>
					</td>
				</tr>
				<tr>
					<td class="info">开始显示时间：</td>
					<td>
						<input type="text" id="startTimeStr" name="startTimeStr" class="input-text easyui-textbox Wdate" onclick="WdatePicker()" data-options="required:false"/>
						<label for="startTimeStr">不输入表示不限制。格式:2015-08-25，或2015-08-25 12:00:00</label>
					</td>
				</tr>
				<tr>
					<td class="info">停止显示时间：</td>
					<td>
						<input type="text" id="endTimeStr" name="endTimeStr" class="input-text easyui-textbox Wdate" onclick="WdatePicker()" data-options="required:false"/>
						<label for="startTimeStr">不输入表示不限制。格式:2015-08-25，或2015-08-25 12:00:00</label>
					</td>
				</tr>
				<tr>
					<td class="info">在web上显示：</td>
					<td>
						<input type="radio" name="webEnabled" id="webEnabled1" value="1" checked/><label for="webEnabled1">显示</label>
						<input type="radio" name="webEnabled" id="webEnabled0" value="0"/><label for="webEnabled0">不显示</label>
					</td>
				</tr>		
				<tr>
					<td class="info">在手机上显示：</td>
					<td>
						<input type="radio" name="mobEnabled" id="mobEnabled1" value="1"/><label for="mobEnabled1">显示</label>
						<input type="radio" name="mobEnabled" id="mobEnabled0" value="0"  checked/><label for="mobEnabled0">不显示</label>
					</td>
				</tr>		
				<tr>
					<td class="info">在app上显示：</td>
					<td>
						<input type="radio" name="appEnabled" id="appEnabled1" value="1"/><label for="appEnabled1">显示</label>
						<input type="radio" name="appEnabled" id="appEnabled0" value="0"  checked/><label for="appEnabled0">不显示</label>
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