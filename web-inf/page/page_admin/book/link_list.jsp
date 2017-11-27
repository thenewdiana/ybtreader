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
        		<auth:authenticator action="/admin/links/linkadd_init">
	        	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="add();">增加</a>
	        	</auth:authenticator>
	        	<auth:authenticator action="/admin/links/linkmod_init">
				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" onclick="mod();"/>修改</a>
				</auth:authenticator>
				<auth:authenticator action="/admin/links/linkdel">
				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-del-ct',plain:true" onclick="del();"/>删除</a>
				</auth:authenticator>
				<auth:authenticator action="/admin/links/grouplist">
				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-back',plain:true" onclick="backGroup();"/>返回</a>
				</auth:authenticator>
			</div>
		        	
            <table id="list" width="90%">
            </table>
        </div>
    </div>
    <div style="display:none">
		<form name="listForm" method="post" id="listForm" target="_self">
			<input type="hidden" name="id" id="id"/>
			<input type="hidden" name="groupId" id="groupId" value="${groupId}"/>
		</form>
	</div>
    <script type="text/javascript">
		$(function(){
			$("#list").datagrid({
	        	title:'网站内链列表', 
				fit:true,
				toolbar: '#tb',
				queryParams:getParams('searchForm'),
				pagination:true,
				pageNumber:1,
				pageSize:20,
			    loadMsg:'数据加载中....',
			    striped: true, 
			    singleSelect:true,
			    url:'<%=contextPath%>/admin/links/linklist_json?groupId=${groupId}',
                columns:[[  
	                {field:'id',title:'ID',width:50},
	                {field:'linkName',title:'说明',width:120},
	                {field:'posName',title:'所在位置',width:150}, 
              		{field:'linkText',title:'显示文本',width:150},
              		{field:'urlName',title:'指向地址',width:280},
              		{field:'startTimeStr',title:'开始显示时间',width:120},
              		{field:'endTimeStr',title:'停止显示时间',width:120},
              		{field:'webEnabled',title:'在web中显示',width:80,
              			formatter:function(value,row,index) {return value==1 ? "是" : "否";}},
              		{field:'mobEnabled',title:'在移动版显示',width:80,
              			formatter:function(value,row,index) {return value==1 ? "是" : "否";}},
              		{field:'appEnabled',title:'在app中显示',width:80,
              			formatter:function(value,row,index) {return value==1 ? "是" : "否";}}
            	]]
			});
		});
		
		function search(){  
	        $('#list').datagrid('options').queryParams = getParams('searchForm'); 
	        $('#list').datagrid('options').pageNumber = 1; 
	      	$('#list').datagrid('getPager').pagination({pageNumber:1});
	        $('#list').datagrid('reload'); //设置好查询参数 reload 一下就可以了  
    	}
		
		function add() {
			$("#listForm").attr("action","<%=contextPath %>/admin/links/linkadd_init");
			$("#listForm").submit();
		}
		
		function backGroup() {
			$("#listForm").attr("action","<%=contextPath %>/admin/links/grouplist");
			$("#listForm").submit();
		}
		
		function mod() {
			var row = $("#list").datagrid("getSelected");
			if (row == null) {
				$.messager.alert('警告','请选择一条记录');  
				return;
			}

			$("#id").attr("value", row.id);
			$("#listForm").attr("action","<%=contextPath %>/admin/links/linkmod_init");
			$("#listForm").submit();
		}
		
		function del() {
			var row = $("#list").datagrid("getSelected");
			if (row == null) {
				$.messager.alert('警告','请选择一条记录');  
				return;
			}
			
			$.messager.confirm('确认','您确认想要删除记录吗？',function(r){    
			    if (r){    
			    	$("#id").attr("value", row.id);
			    	$("#listForm").attr("action","<%=contextPath %>/admin/links/linkdel");
					$("#listForm").submit();  
			    }    
			});			
		}
	</script>
</body>
</html>