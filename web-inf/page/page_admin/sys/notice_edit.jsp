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
    
    
    <%-- <link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}plugin/ueditor1_4_3/themes/default/css/ueditor.css" />
    <script type="text/javascript" charset="utf-8" src="${sessionScope.baseUrl}plugin/ueditor1_4_3/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${sessionScope.baseUrl}plugin/ueditor1_4_3/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="${sessionScope.baseUrl}plugin/ueditor1_4_3/lang/zh-cn/zh-cn.js"></script> --%>
    
    <link rel="stylesheet" type="text/css" href="/ueditor1_4_3/themes/default/css/ueditor.css" />
    <script type="text/javascript" charset="utf-8" src="/ueditor1_4_3/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="/ueditor1_4_3/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="/ueditor1_4_3/lang/zh-cn/zh-cn.js"></script>
</head>

<body class="easyui-layout" fit="true">
	<div region="center" id="center" style="padding:10px;" border="false">		
		<div class="easyui-panel" title="公告修改" style="width:800px;height:auto">			
			<form id="editForm" name="editForm" method="post" action="">
			<input type="hidden" id="id" name="id" value="${sysNotice.id}" />
			<table class="promodify" cellspacing="1">
				<tr>
					<td class="info">类型：</td>
					<td>
						<select class="easyui-combobox" id="noticeType"
							name="noticeType" style="width:150px;"
							data-options="editable:false,onLoadSuccess:function(){$('#noticeType').combobox('select','${sysNotice.noticeType}')}">
							<option value=1>公告</option>
							<option value=2>专题</option>
							<option value=3>书评</option>
							<option value=4>访谈</option>
							<option value=5>八卦</option>
							<option value=6>活动</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="info">标题：</td>
					<td>
						<input type="text" id="title" name="title" value="${sysNotice.title}" class="input-text easyui-textbox" data-options="required:true,validType:['length[1,99]']"/>
					</td>
				</tr>				
				<tr>
					<td class="info">描述：</td>
					<td>
						<script type="text/plain" id="myEditor" style="width:600px;height:400px;">${sysNotice.content}
						</script>
						<input type="hidden" id="text" name="text"  value=""/>
						<input type="hidden" id="content" name="content"  value=""/>
					</td>
				</tr>					 
			</table>
			</form>		
			<div style="text-align:center;padding:5px">
				<a href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="submitForm();">修改</a>
				<a href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-back',plain:true" onclick="goback();">返回</a>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		//实例化编辑器
		window.onload = function () {
			//window.UEDITOR_CONFIG.initialFrameWidth = 500;
			//window.UEDITOR_CONFIG.initialFrameHeight = 500;
			UE.getEditor('myEditor');
		}
		
		UE.Editor.prototype._bkGetActionUrl = UE.Editor.prototype.getActionUrl;
		UE.Editor.prototype.getActionUrl = function(action) {
		    if (action == "uploadimage") {
		        return "${contextPath}/ueditor/uploadImage";
		    } else {
		        return this._bkGetActionUrl.call(this, action);
		    }
		}
		
		function getContent() {
	        return UE.getEditor('myEditor').getContent();
	    }
	    
	    function getContentTxt() {
	        return UE.getEditor('myEditor').getContentTxt();
	    }
		
		function goback(){
			window.location = "<%=contextPath %>/admin/notice/list";	
		}
		
		function submitForm(){
	    	if (!$('#editForm').form('validate')) {
	    		return;
	    	}
	    	$("#text").val(getContentTxt());
	    	$("#content").val(getContent());
	    	$("#editForm").attr("action","<%=contextPath %>/admin/notice/edit");
	    	$('#editForm').submit();
	    }
	</script>		
</body>
</html>