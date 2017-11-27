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
			<div id="planPanel" title="添加推荐图书" class="easyui-panel"
				data-options="border:true" style="padding:5px;">
				
				<form id="addForm" name="addForm" method="post"
					action="<%=contextPath%>/admin/subject/rec_book_add"  enctype="multipart/form-data">
					<input type="hidden" id="subjectId" name="subjectId" value="${subjectId}" />
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
							<td><input id="myfile" type="file" name="myfile"/>
								<span class="notice"></span>
							</td>
						</tr>
						<tr>
							<td class="info">排序：</td>
							<td><input type="text" id="sort" name="sort" class="easyui-numberbox" value="${maxSort}" data-options="required:true,min:0" />
							</td>
						</tr>
					</table>
					<div align="center">
						<a id="submitBtn" onclick="add()" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" >保存</a> 
						<a id="goback" onclick="goback();" class="easyui-linkbutton" data-options="iconCls:'icon-back',plain:true">返回</a>
					</div>
				</form>
			</div>
			<div id="myWindow" class="easyui-window" title="请选择需要推荐的图书！" data-options="draggable:false,modal:true,closed:true,minimizable:false,maximizable:false,collapsible:false" style="width:800px;height:400px;padding:10px" ></div>
		</div>
	</div>
	<script type="text/javascript">
		function add(){
			if($('#bookId').val()==''){
				$.messager.alert('提示',"请选择推荐的图书！",'info');
				return;
			}
			if($('#myfile').val()==''){
				$.messager.alert('提示',"请选择需要上传的图片！",'info');
				return;
			}
			if ($('#addForm').form('validate')) {
	    		$("#addForm").submit();
	    	}
			
		}
		
		function selectBook(){
			$('#myWindow').window('open');
			$('#myWindow').window('refresh','<%=contextPath%>/admin/book/frame');
		}
		
		function refreshSearch(id,name,info){
			$("#bookId").val(id);
			$("#bookName").val(name);
			$("#recommDesc").val(info);
			$("#myWindow").window('close');
		}
		
		function goback(){
			window.location.href='<%=contextPath%>/admin/subject/book_list/'+$("#subjectId").val();
		}	
		
	</script>

</body>
</html>
