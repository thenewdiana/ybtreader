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
			<div id="planPanel" title="添加专题" class="easyui-panel"
				data-options="border:true" style="padding:5px;">
				
				<form id="addForm" name="addForm" method="post"
					action="<%=contextPath%>/admin/channel/subject_add" enctype="multipart/form-data">
					<table class="promodify" cellspacing="1">
					    <tr>
							<td class="info">所属频道：</td>
							<td>
								<input class="easyui-combobox" name="channelId" id="channelId" data-options="editable:false" />
							</td>
						</tr>
						<tr>
							<td class="info">推荐类型：</td>
							<td>
								<select class="easyui-combobox" id="type"
									name="type" style="width:150px;"
									data-options="editable:false">
									<option value=1>普通推荐</option>
									<option value=2>专题推荐图书</option>
									<option value=3>专题推荐链接</option>
									<option value=4>热词</option>
									<option value=5>文字推荐列表</option>
								</select>
							</td>
						</tr>
						<tr>
							<td class="info">推荐位名称：</td>
							<td><input type="text" id="subjectTitle" name="subjectTitle" class="easyui-textbox" data-options="required:true"/>
								<span class="notice"></span>
							</td>
						</tr>
						<tr>
							<td class="info">显示标识：</td>
							<td><input type="text" id="subjectNick" name="subjectNick" class="easyui-textbox" data-options="required:true" />
								<span class="notice"></span>
							</td>
						</tr>
						<tr>
							<td class="info">显示数量：</td>
							<td><input type="text" id="maxnum" name="maxnum" class="easyui-numberbox" data-options="required:true,min:0,max:50"/>
							</td>
						</tr>
						<tr>
							<td class="info">排序：</td>
							<td><input type="text" id="sort" name="sort" class="easyui-numberbox" data-options="required:true,min:0" />
							</td>
						</tr>
						<tr>
							<td class="info">跳转url：</td>
							<td><input type="text" id="recommUrl" name="recommUrl" class="easyui-textbox" />
								<span class="notice"></span>
							</td>
						</tr>
						<tr>
							<td class="info">推荐位图片：</td>
							<td><input id="myfile" type="file" name="myfile"/>
								<span class="notice"></span>
							</td>
						</tr>
						<tr>
							<td class="info">推荐位描述：</td>
							<td>
								<textarea rows="5" cols="50"  name="subjectDescription" id="subjectDescription"></textarea>
							</td>
						</tr>
					</table>
					<div align="center">
						<a id="submitBtn" onclick="add()" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" >保存</a> 
						<a id="goback" onclick="goback();" class="easyui-linkbutton" data-options="iconCls:'icon-back',plain:true">返回</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function(){
			$("#channelId").combobox({ 
				url:'<%=contextPath%>/admin/channel/list_json?noReset=1', 
				valueField:'id',  
				textField:'name',
				onLoadSuccess: function () { //加载完成后,设置选中第一项
	                var val = $(this).combobox("getData");
	                for (var item in val[0]) {
	                    if (item == "id") {
	                        $(this).combobox("select", val[0][item]);
	                    }
	                }
	            }
			});  
		});
	
		
		
		function add(){
			if (!$('#addForm').form('validate')) {
	    		return;
	    	}
			if ($('#addForm').form('validate')) {
	    		$("#addForm").submit();
	    	}
			<%-- var params = $("#addForm").serializeArray();
			$.ajax({
				type: "POST",
				url:$("#addForm").attr("action"),
				dataType: "json",
				data:params,
				success:function(data){
					if(data.result){
						$.messager.alert('提示',data.msg,'info',function(){
							location.href = '<%=contextPath%>/admin/channel/subject_list?isReset=1';
						});
						$(".panel-tool-close").hide();
					}else{
						$.messager.alert('提示',data.msg,'error');
					}
				}
			}); --%>
		}
		
		function goback(){
			window.location.href='<%=contextPath%>/admin/channel/subject_list?isReset=1';
		}	
		
	</script>

</body>
</html>
