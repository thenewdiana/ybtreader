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
			<table class="promodify" cellspacing="1">
				<tr>
					<td class="info">频道：</td>
					<td>
						<select class="easyui-combobox" id="channelId"
							name="channelId" style="width:70px;"
							data-options="editable:false;multiple:false">
							<c:forEach items="${channelList }" var="item">
							<option value="${item.id }">${item.name }</option>
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
							<option value="${item.id }">${item.name }</option>
							</c:forEach>
						</select>
					</td>
				</tr>
								
				<tr>
					<td class="info">标签：</td>
					<td>
						<c:forEach items="${tagsList }" var="item">
						<input type="checkbox" name="tagsIds" value="${item.id }"/>${item.name }&nbsp;
						</c:forEach>
						<input type="hidden" name="tagsIds"></input>
					</td>
				</tr>

				<tr>
					<td class="info">作者昵称：</td>
					<td>
						<input type="text" id="authorNick" name="authorNick" class="input-text easyui-textbox" data-options="required:true"/>
					</td>
				</tr>				
				<tr>
					<td class="info">主角：</td>
					<td>
						<input type="text" id="hero" name="hero" class="input-text easyui-textbox" data-options="required:true"/>
					</td>
				</tr>
				<tr>
					<td class="info">授权类型：</td>
					<td>
						<select class="easyui-combobox" id="permissionType"
							name="permissionType" style="width:70px;"
							data-options="editable:false;multiple:false">							
							<option value="0">非授权</option>
							<option value="1">签约驻站</option>
							<option value="2">非独家首发</option>
							<option value="3">独家首发</option>
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
						<input type="radio" name="isFinish" value="0" />否
						<input type="radio" name="isFinish" value="1" checked="checked"/>是
					</td>
				</tr>
				<tr>
					<td class="info">是否收费：</td>
					<td>
						<input type="radio" name="isVip" value="0" checked="checked"/>否
						<input type="radio" name="isVip" value="1" />是
						<span id="vipValueSpan">
						<select name="vipType">
							<option value="1">按本收费</option>
							<option value="0">按章收费</option>
						</select>
						<input type="text" id="vipValue" name="vipValue" size="5" value="0" class="input-text"/><label id="vipValueDes">(糖豆或从第几章之后开始)</label>
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
					<td class="info">txt文件：</td>
					<td>
						<input type="file" name="txtFile"/>
					</td>
				</tr>
				<tr>
					<td class="info">描述：</td>
					<td>
						<textarea rows="5" cols="50" name="info" id="info"></textarea>
					</td>
				</tr>				 
			</table>
			</form>		
			<div style="text-align:center;padding:5px">
				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="submitForm();">上传</a>
				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-back',plain:true" onclick="goback();">返回</a>
			</div>
		</div>
	</div>	
    <script type="text/javascript">    
    	$("#vipValueSpan").hide();
	    
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
	    	$("#addForm").attr("action","<%=contextPath %>/admin/book/upload");	    	
	    	$('#addForm').submit();
	    }
		
		function goback(){
			window.location = "<%=contextPath %>/admin/book/list";	
		}
	</script>			
</body>
</html>