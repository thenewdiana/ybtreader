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
			<div id="planPanel" title="添加半价图书" class="easyui-panel"
				data-options="border:true" style="padding:5px;">
				
				<form id="addForm" name="addForm" method="post"
					action="<%=contextPath%>/admin/halfprice/add" enctype="multipart/form-data">
					<table class="promodify" cellspacing="1">
					    <tr>
							<td class="info">推荐图书：</td>
							<td>
								<input type="hidden" name="bookId" id="bookId" value="" />
								<input type="text" name="bookName" id="bookName" value="" disabled="disabled" />
								<a id="selectBook" onclick="selectBook()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" >选择图书</a> 
							</td>
						</tr>
						<tr>
							<td class="info">显示图片：</td>
							<td><input id="myfile" type="file" name="myfile"/>（当上传图片时会替换书籍的封面，不传默认使用图书封面！）
								<span class="notice"></span>
							</td>
						</tr>
						<tr>
				            <td class="info">显示：</td>
							<td>
							<select class="easyui-combobox"
								name="showBookName" id="showBookName" style="width:155px;"
								data-options="editable:false">
								<option value=0>推荐标题</option>
								<option value=1>书名</option>
							</select>
							</td>
				        </tr>
						<tr>
							<td class="info">推荐标题：</td>
							<td><input type="text" id="recommTitle" name="recommTitle" class="easyui-textbox" data-options="validType:['length[0,16]']"/>
								<span class="notice"></span>
							</td>
						</tr>
						<tr>
							<td class="info">开始时间：</td>
							<td><input type="text" id="startTimeStr" name="startTimeStr" class="easyui-datetimebox" editable="false" data-options="required:true"/>
								<span class="notice"></span>
							</td>
						</tr>
						<tr>
							<td class="info">结束时间：</td>
							<td><input type="text" id="endTimeStr" name="endTimeStr" class="easyui-datetimebox" editable="false" data-options="required:true"/>
								<span class="notice"></span>
							</td>
						</tr>
						<tr>
							<td class="info">推荐描述：</td>
							<td>
								<textarea rows="5" cols="50"  name="recommDesc" id="recommDesc"></textarea>
							</td>
						</tr>
						<tr>
							<td class="info">排序：</td>
							<td><input type="text" id="sort" name="sort" class="easyui-numberbox" data-options="required:true"/>
							</td>
						</tr>
					</table>
					<div align="center">
						<a id="submitBtn" onclick="add()" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" >保存</a> 
						<a id="goback" onclick="goback();" class="easyui-linkbutton" data-options="iconCls:'icon-back',plain:true">返回</a>
					</div>
				</form>
			</div>
			<div id="myWindow" class="easyui-window" title="请选择需要的图书！" data-options="draggable:false,modal:true,closed:true,minimizable:false,maximizable:false,collapsible:false" style="width:800px;height:400px;padding:10px" ></div>
		</div>
	</div>
	<script type="text/javascript">
		function add(){
			if($('#bookId').val()==''){
				$.messager.alert('提示',"请选择推荐的图书！",'info');
				return;
			}
			if ($('#addForm').form('validate')) {
	    		$("#addForm").submit();
	    	}
		}
		
		function selectBook(){
			$('#myWindow').window('open');
			$('#myWindow').window('refresh','<%=contextPath%>/admin/promotion/book/frame');
		}
		
		function refreshSearch(id,name,info,recommendTitle){
			$("#bookId").val(id);
			$("#bookName").val(name);
			$("#recommDesc").val(info);
			$("#recommTitle").textbox('setValue',recommendTitle);
			$("#myWindow").window('close');
		}
		
		function goback(){
			window.location.href='<%=contextPath%>/admin/halfprice/list/';
		}	
		
	</script>

</body>
</html>
