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
</head>

<body class="easyui-layout" fit="true">
	<div region="center" id="center" style="padding:10px;" border="false">		
		<div class="easyui-panel" title="书籍上传" style="width:700px;height:auto">			
			<form id="addForm" name="addForm" method="post" action="" enctype="multipart/form-data">
			<input type="hidden" name="id" value="${book.id }"/>
			<table class="promodify" cellspacing="1">
				<tr>
					<td class="info">频道：</td>
					<td>
						<select class="easyui-combobox" id="channelId"
							name="channelId" style="width:70px;"
							data-options="editable:false;multiple:false">
							<c:forEach items="${channelList }" var="item">
							<c:choose>
								<c:when test="${book.channelId == item.id }">
									<option value="${item.id }" selected="selected">${item.name }</option>	
								</c:when>
								<c:otherwise>
									<option value="${item.id }">${item.name }</option>
								</c:otherwise>
							</c:choose>							
							</c:forEach>
						</select>
					</td>
				</tr>
				
				<tr>
					<td class="info">分类：</td>
					<td>
						<select class="easyui-combobox" id="categoryId"
							name="categoryId" style="width:70px;"
							data-options="editable:false;multiple:false">
							<c:forEach items="${categoryList }" var="item">
							<c:choose>
								<c:when test="${book.categoryId == item.id }">
									<option value="${item.id }" selected="selected">${item.name }</option>
								</c:when>
								<c:otherwise>
									<option value="${item.id }">${item.name }</option>
								</c:otherwise>
							</c:choose>							
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td class="info">作品名称：</td>
					<td>
						<input type="text" id="name" name="name" value="${book.name }" class="input-text easyui-textbox" data-options="required:true"/>
					</td>
				</tr>
				<tr>
					<td class="info">推荐语：</td>
					<td>
						<input type="text" id="recommendTitle" name="recommendTitle" value="${book.recommendTitle }" class="input-text easyui-textbox" data-options="required:false"/>
					</td>
				</tr>
				<tr>
					<td class="info">主角：</td>
					<td>
						<input type="text" id="hero" name="hero" value="${book.hero }" class="input-text easyui-textbox" data-options="required:true"/>
					</td>
				</tr>
				<tr>
					<td class="info">授权类型：</td>
					<td>
						<select class="easyui-combobox" id="permissionType"
							name="permissionType" style="width:70px;"
							data-options="editable:false;multiple:false">													
							<option value="0" <c:if test="${book.permissionType == 0 }">selected="selected"</c:if> >非授权</option>
							<option value="1" <c:if test="${book.permissionType == 1 }">selected="selected"</c:if> >签约驻站</option>
							<option value="2" <c:if test="${book.permissionType == 2 }">selected="selected"</c:if> >非独家首发</option>
							<option value="3" <c:if test="${book.permissionType == 3 }">selected="selected"</c:if> >独家首发</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="info">销售意向：</td>
					<td>
						<select class="easyui-combobox" id="saleType"
							name="saleType" style="width:70px;"
							data-options="editable:false;multiple:false">							
							<option value="0">单订</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="info">是否完结：</td>
					<td>						
						<input type="radio" name="isFinish" value="0" <c:if test="${book.isFinish == 0 }">checked="checked"</c:if> />否
						<input type="radio" name="isFinish" value="1" <c:if test="${book.isFinish == 1 }">checked="checked"</c:if> />是
					</td>
				</tr>
				<tr>
					<td class="info">是否收费：</td>
					<td>
						
						<input type="radio" name="isVip" value="0" <c:if test="${book.isVip == 0 }">checked="checked"</c:if> />否
						<input type="radio" name="isVip" value="1" <c:if test="${book.isVip == 1 }">checked="checked"</c:if> />是
						<span id="vipValueSpan">
						<select name="vipType">							
							<option value="1" <c:if test="${book.vipType == 1 }">selected="selected"</c:if> >按本收费</option>
							<option value="0" <c:if test="${book.vipType == 0 }">selected="selected"</c:if> >按章收费</option>
						</select>
						<input type="text" id="vipValue" name="vipValue" size="5" value="${book.vipValue }" class="input-text"/><label id="vipValueDes">(糖豆或从第几章之后开始)</label>
						</span>						
					</td>
				</tr>
				<tr>
					<td class="info">封面：</td>
					<td>
						<input type="file" name="coverImageFile"/>
					</td>
				</tr>
				<tr>
					<td class="info">描述：</td>
					<td>
						<textarea rows="5" cols="50" name="info" id="info">${book.info }</textarea>
					</td>
				</tr>				 
			</table>
			</form>		
			<div style="text-align:center;padding:5px">
				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="submitForm();">修改</a>
				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-back',plain:true" onclick="goback();">返回</a>
			</div>
		</div>
	</div>	
    <script type="text/javascript">
    	var isVip = '${book.isVip}';
    	if (isVip == "0") {
    		$("#vipValueSpan").hide();	
    	}
    		    
    	$("input[name='isVip']").bind("click", function() {
    		var id = $(this).attr("value");
    		if (id == 1) {
    			$("#vipValueSpan").show();
    		} else {
    			$("#vipValueSpan").hide();		
    		}
    	});
    	
    	$("select[name='vipType']").bind("change", function() {
    		var id = $(this).val();
    		if (id == 1) {
    			$("#vipValueDes").text("糖豆");
    		} else {
    			$("#vipValueDes").text("第几章之后开始");		
    		}
    	});
    	$("select[name='vipType']").trigger("change");
    	
		function submitForm(){			
	    	if (!$('#addForm').form('validate')) {
	    		return;
	    	}
	    	$("#addForm").attr("action","<%=contextPath %>/admin/book/mod");	    	
	    	$('#addForm').submit();
	    }
		
		function goback(){
			window.location = "<%=contextPath %>/admin/book/list";	
		}
	</script>			
</body>
</html>