<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title><spring:message code="admin.global.title"></spring:message></title>
    <link type="text/css" rel="stylesheet" href="${sessionScope.baseUrl}pc/css/default.css" />
    <link type="text/css" rel="stylesheet" href="${sessionScope.baseUrl}pc/css/easyui_icons.css" />
    <link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}plugin/jquery-easyui-1.4/themes/default/easyui.css"/>
    <link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}plugin/jquery-easyui-1.4/themes/icon.css"/>    
    <link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}plugin/jquery-easyui-1.4/themes/color.css"/>
    <script type="text/javascript" src="${sessionScope.baseUrl}plugin/jquery-easyui-1.4/jquery.min.js"></script>
    <script type="text/javascript" src="${sessionScope.baseUrl}plugin/jquery-easyui-1.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${sessionScope.baseUrl}plugin/jquery-easyui-1.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="${sessionScope.baseUrl}pc/js/paginationUtil.js"></script>
</head>

<body>
	<div class="easyui-layout" data-options="fit:true">	
        <div id="center" data-options="region:'center',border:false" width="90%">
        	<div id="tb" class="datagrid-toolbar">
        		<auth:authenticator action="/admin/sys/dict_add_init">
	        	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="add();">增加</a>
	        	</auth:authenticator>
	        	<auth:authenticator action="/admin/sys/dict_mod_init">
				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" onclick="mod();"/>修改</a>
				</auth:authenticator>
				<auth:authenticator action="/admin/sys/dictdata_list">
				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-del-ct',plain:true" onclick="dictDataList();"/>管理字典值</a>
				</auth:authenticator>
			</div>
		        	
            <table id="list" width="90%">
            </table>
        </div>
    </div>
    <div style="display:none">
		<form name="listForm" method="post" id="listForm" target="_self">
			<input type="hidden" name="id" id="id"/>
			<input type="hidden" name="dictId" id="dictId"/>
		</form>
	</div>
    <script type="text/javascript">
		$(function(){
			$("#list").datagrid({
	        	title:'字典分类列表', 
				fit:true,
				toolbar: '#tb',
				//queryParams:getParams('searchForm'),
				pagination:true,
				pageNumber:1,
				pageSize:20,
			    loadMsg:'数据加载中....',
			    striped: true, 
			    singleSelect:true,
			    url:'<%=contextPath%>/admin/sys/dict_list_json',
                columns:[[  
	                {field:'id',title:'ID',width:100,width:$(this).width()*0.2},  
              		{field:'name',title:'分类名',width:$(this).width()*0.3},
              		{field:'nick',title:'分类昵称',width:$(this).width()*0.3}
            	]]
			});
		});
		

		function add() {
			$("#listForm").attr("action","<%=contextPath %>/admin/sys/dict_add_init");
			$("#listForm").submit();
		}
		
		function mod() {
			var row = $("#list").datagrid("getSelected");
			if (row == null) {
				$.messager.alert('警告','请选择一条记录');  
				return;
			}

			$("#id").attr("value", row.id);
			$("#listForm").attr("action","<%=contextPath %>/admin/sys/dict_mod_init");
			$("#listForm").submit();
		}
		
		function dictDataList() {
			var row = $("#list").datagrid("getSelected");
			if (row == null) {
				$.messager.alert('警告','请选择一条记录');  
				return;
			}
			
			$("#dictId").attr("value", row.id);
			$("#listForm").attr("action","<%=contextPath %>/admin/sys/dictdata_list");
			$("#listForm").submit();
		}
	</script>
</body>
</html>