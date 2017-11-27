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
    <script type="text/javascript" src="${sessionScope.baseUrl}pc/js/valid.js"></script>

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
		<div class="easyui-panel" title="站内信增加" style="width:800px;height:auto">			
			<form id="addForm" name="addForm" method="post" action="">
			<table class="promodify" cellspacing="1">
				<tr>
					<td class="info">标题：</td>
					<td>
						<input type="text" id="title" name="title" class="input-text easyui-textbox" data-options="required:true,validType:['length[1,50]']"/>
					</td>
				</tr>
				<tr>
					<td class="info">发送目标：</td>
					<td>
						<input type="radio" name="targetType" value="1" checked="checked"/>指定用户
						<input type="radio" name="targetType" value="0" />全部用户
						<br/>
						<span id="targetTypeSpan">
						<input type="text" id="toUserNick" name="toUserNick" class="input-text"/>（用户昵称多个使用,隔开）
						<span class="notice"></span>
						</span>
					</td>
				</tr>
				<tr>
					<td class="info">描述：</td>
					<td>
						<script type="text/plain" id="myEditor" style="width:600px;height:400px;">
						</script>
						<input type="hidden" id="content" name="content" />
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
	
		$("input[name='targetType']").bind("click", function(){
			var obj = $(this);
			var id = obj.attr("value");
			if (id == 0) {
				$("#targetTypeSpan").hide();
			} else {
				$("#targetTypeSpan").show();
			}
		});
		
		function submitForm(){
	    	if (!$('#addForm').form('validate')) {
	    		return;
	    	}
	    	if(isEmpty(getContent())){
	    		$('#content').next(".notice").text("内容不能为空！").show();
	    		return;
	    	}
	    	if(getLength(getContent())>=4000){
                $('#content').next(".notice").text("内容超过最大输入限制！").show();
                return;
            }
	    	$("#content").val(getContent());
	    	$("#addForm").attr("action","<%=contextPath %>/admin/message/add");	    	
	    	$('#addForm').submit();
	    }
	    
	    function getContent() {
	        return UE.getEditor('myEditor').getContent();
	    }
		
		function goback(){
			window.location = "<%=contextPath %>/admin/message/list";	
		}
	</script>		
</body>
</html>