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
			<div id="planPanel" title="编辑半价图书" class="easyui-panel"
				data-options="border:true" style="padding:5px;">
				<form id="modForm" name="modForm" method="post"
					action="<%=contextPath%>/admin/halfprice/mod" enctype="multipart/form-data">
					<input type="hidden" id="id" name="id" value="${bookPromotion.id}" />
					<input type="hidden" id="srcBookId" name="srcBookId" value="${bookPromotion.bookId}" />
					<table class="promodify" cellspacing="1">
					    <tr>
							<td class="info">推荐图书：</td>
							<td>
								<input type="hidden" name="bookId" id="bookId" value="${bookPromotion.bookId}" />
								<input type="text" name="bookName" id="bookName" value="${bookPromotion.bookName}" disabled="disabled" />
								<a id="selectBook" onclick="selectBook()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" >选择图书</a> 
							</td>
						</tr>
						<tr>
							<td class="info">显示图片：</td>
							<td>
								<a href="${bookPromotion.bookCoverImage}" target='_blank'><img src="${bookPromotion.bookCoverImage}" onload='if(this.width>400){this.width=400;}'  onerror='this.src=\"${sessionScope.baseUrl}pc/images/error.jpg\"' /></a><br/>
								<input id="myfile" type="file" name="myfile"/><span class="notice"></span>（当上传图片时会替换书籍的封面，不传默认使用图书封面！）
							</td>
						</tr>
						<tr>
				            <td class="info">显示：</td>
							<td>
							<select class="easyui-combobox"
								name="showBookName" id="showBookName" style="width:155px;"
								data-options="editable:false">
								<option value=0 <c:if test="${bookPromotion.showBookName == 0}">selected="selected"</c:if>>推荐标题</option>
								<option value=1 <c:if test="${bookPromotion.showBookName == 1}">selected="selected"</c:if>>书名</option>
							</select>
							</td>
				        </tr>
						<tr>
							<td class="info">推荐标题：</td>
							<td><input type="text" id="recommTitle" name="recommTitle" value="${bookPromotion.recommTitle}" class="easyui-textbox"   />
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
								<textarea rows="5" cols="50"  name="recommDesc" id="recommDesc"><c:out value="${bookPromotion.recommDesc }" escapeXml="true"/></textarea>
							</td>
						</tr>
						<tr>
							<td class="info">排序：</td>
							<td><input type="text" id="sort" name="sort" class="easyui-numberbox" value="${bookPromotion.sort}" data-options="required:true"/>
							</td>
						</tr>
					</table>
					<div align="center">
						<a id="submitBtn" onclick="mod()" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" >保存</a> 
						<a id="goback" onclick="goback();" class="easyui-linkbutton" data-options="iconCls:'icon-back',plain:true">返回</a>
					</div>
				</form>
			</div>
			<div id="myWindow" class="easyui-window" title="请选择需要的图书！" data-options="draggable:false,modal:true,closed:true,minimizable:false,maximizable:false,collapsible:false" style="width:800px;height:400px;padding:10px" ></div>
		</div>
	</div>
	<script type="text/javascript">
		function mod(){
			if($('#bookId').val()==''){
				$.messager.alert('提示',"请选择推荐的图书！",'info');
				return;
			}
			if ($('#modForm').form('validate')) {
	    		$("#modForm").submit();
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
		
		$(function(){
			$('#startTimeStr').datetimebox('setValue', '${bookPromotion.startTimeStr}');
			$('#endTimeStr').datetimebox('setValue', '${bookPromotion.endTimeStr}');
		});
		
	</script>

</body>
</html>
