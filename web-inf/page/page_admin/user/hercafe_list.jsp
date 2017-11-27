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
        	<div id="buttons" class="toolbar-button">
	        	<auth:authenticator action='/admin/hercafe/add_init'>
	        	<a href="javascript:add();" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">添加</a> 
	        	</auth:authenticator>
	        	<auth:authenticator action='/admin/hercafe/mod_init'>
	        	<a href="javascript:mod();" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">修改</a> 
	        	</auth:authenticator>
	        	<auth:authenticator action='/admin/hercafe/del'>
	        	<a href="javascript:del();" class="easyui-linkbutton" data-options="iconCls:'icon-del-ct',plain:true">删除</a> 
	        	</auth:authenticator>
	        	
            </div>
           	<table id="list" width="90%">
           	</table>
        </div>
    </div>
    <div style="display:none">
		<form name="listForm" method="post" id="listForm" target="_self">
		</form>
	</div>
    <script type="text/javascript">
		$(function(){
			$("#list").datagrid({
	        	title:'小编查询', 
				fit:true,
				fitColumns:false,
				toolbar:'#buttons',
				pagination:false,
				pageNumber:1,
				pageSize:20,
			    loadMsg:'数据加载中....',
			    striped: true, 
			    singleSelect:true,
			    url:'<%=contextPath%>/admin/hercafe/list_json',
                columns:[[  
					{field:'id',title:'ID',width:$(this).width()*0.05},      
              		{field:'nick',title:'昵称',width:120},
              		{field:'userMajor',title:'擅长',width:120},
              		{field:'qq',title:'qq',width:200},
            	]]
			});
		});
         
        function add(){
        	location.href = "<%=contextPath%>/admin/hercafe/add_init";
        }
		
		function mod(){
			var rows = $('#list').datagrid('getSelections');
			if(rows.length == 0 || rows.length > 1){
			   	$.messager.alert("提示信息","请选择要修改的小编！","warning");
				return;
			}
			
			$("#listForm").attr("target","");
			$("#listForm").attr("action","<%=contextPath %>/admin/hercafe/mod_init?id=" + rows[0].id);
			$("#listForm").submit();
		}
		
		
		function del(){
			var rows = $('#list').datagrid('getSelections');
			if(rows.length == 0 || rows.length > 1){
			   	$.messager.alert("提示信息","请选择要删除的小编！","warning");
				return;
			}
			
		    var ajaxUrl = "<%=contextPath%>/admin/hercafe/del?id=" + rows[0].id;
			ajaxR(ajaxUrl,null,"是否要删除该小编?");
		}  
		
		function ajaxR(ajaxUrl,data,info){
			$.messager.confirm('确认',info,function(r){  
			   	if (r){  
					$.ajax({
						type:"POST",
						url:ajaxUrl,
						data:data,
						dataType : "json",
						success : function(data) {
							if(data.result){
								$.messager.alert('提示',data.msg,'info',function(){
									$("#list").datagrid("reload");
								});
								$(".panel-tool-close").hide();
							}else{
								$.messager.alert('提示',data.msg,'error');
							}
						},
						error : function(msg) {
							$.messager.alert("提示", msg, "error");
						}
					});
			   	}
			});
		}   
	</script>
</body>
</html>