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
	<script type="text/javascript">
		$(function($){
			loadTable();
		});
		
		function loadTable() {
			$("#listTable").datagrid({
				fit:true,
				singleSelect:true,
				fitColumns:true,  
			    url:null,
			    pagination:false,
			    toolbar: '#rowBar',
			    loadMsg:''    
			});
		}
		
		function add(){
			$("#listForm").attr("action","<%=contextPath %>/admin/sys/module_add_init");
			$("#listForm").submit();
		}
		
		function mod(id){
			$("#id").attr("value",id);
			$("#listForm").attr("action","<%=contextPath %>/admin/sys/module_mod_init");
			$("#listForm").submit();
		}
		
		function del(id){
			$.messager.confirm('提示信息','此操作不可恢复，确认要删除吗？',function(r){  
			    if (r){  
			    	$("#moduleId").attr("value",id);
					$("#listForm").attr("action","<%=contextPath %>/pbmain/page/module/module_del.action");
					$("#listForm").submit();
			    }  
			}); 	
		}
	</script>
</head>


<body class="easyui-layout" fit="true">
	<script type="text/javascript" src="<%=contextPath %>/js/loading.js"></script>
	<div region="center" id="center" border="false">
		<div id="rowBar" style="display:none;text-align:right;">	
			<auth:authenticator action="/admin/sys/module_add_init">
			<a href="javascript:add();" class="easyui-linkbutton">添加</a>
			</auth:authenticator>
		</div>
		<table id="listTable">
			<thead style="display:none">  
		        <tr>  
		        	<th data-options="field:'id',align:'center',width:$(this).width()*0.2,resizable:false">ID</th>	        	
		            <th data-options="field:'name',width:$(this).width()*0.2,resizable:false">模块名</th>
		            <th data-options="field:'url',width:$(this).width()*0.3,resizable:false">URL</th>  
		            <th data-options="field:'opt',align:'center',width:$(this).width()*0.2,resizable:false">操作</th>                
		        </tr>  
		   	</thead> 
		   	<tbody style="display:none">
		   		<c:forEach items="${list }" var="item">
		   			<tr>
						<td>${item.id }</td>
						<td>${item.name }</td>
						<td>${item.url }</td>
						<td>
							<auth:authenticator action="/admin/sys/module_mod_init">
							<a href="javascript:mod(${item.id });">修改</a>
							</auth:authenticator>
							<!--  
							<a href="javascript:del(${item.id });">删除</a>
							-->
						</td>
					</tr>
				</c:forEach>	
		   	</tbody> 	
		</table>
	</div>
	<div style="display:none">
		<form name="listForm" method="post" id="listForm" target="_self">
		<input type="hidden" name="parentId" id="parentId" value="${parentId }"/>
		<input type="hidden" name="id" id="id"/>
		</form>
	</div>
</body>
</html>