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
    	<div id="north" title="搜索条件"  style="background-color: #E0ECFF;height:60px;"
	       data-options="region:'north',border:false"  width="90%">
	       <form id="searchForm" name="searchForm" action="" method="post">
	          <input type="hidden" name="bookId" id="bookId" value="${obj.id}"/>
              <table>
		         <tr>
		            <th>发布状态：</th>
		            <td>
		            	<select class="easyui-combobox" id="publishStatus"
							name="publishStatus" style="width:70px;"
							data-options="editable:false">
							<option value="">--全部--</option>
							<option value="0">未发布</option>
							<option value="1" >已发布</option>
							<option value="2" >定时发布</option>
						</select>
		            </td>
		            <td><a href="javascript:search();" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">查询</a></td>
		         </tr>
		      </table>
           </form>
           <form id="idsForm" method="post"></form>
        </div>
        			
        <div id="center" data-options="region:'center',border:false" width="90%">
        	<div id="tb" class="datagrid-toolbar">
        		<!--  
        		<auth:authenticator action="admin/book/chapter_pass">
	        	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-ok',plain:true" onclick="pass();">发布</a>
	        	</auth:authenticator>
	        	<auth:authenticator action="admin/book/chapter_fail">
				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-no',plain:true" onclick="fail();"/>禁止发布</a>
				</auth:authenticator>
				-->
				<auth:authenticator action="/admin/book/chapter_modinit">
				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-del-ct',plain:true" onclick="mod();"/>编辑</a>
				</auth:authenticator>
				<auth:authenticator action="/admin/book/chapter_addinit">
				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="add();"/>新增</a>
				</auth:authenticator>
				<auth:authenticator action="/admin/book/chapter_del">
				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-del-ct',plain:true" onclick="del();"/>删除</a>
				</auth:authenticator>	
				<auth:authenticator action="/admin/book/chapter_isvip">
				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-del-ct',plain:true" onclick="vip();"/>收费</a>
				</auth:authenticator>
				<auth:authenticator action="/admin/book/chapter_isfree">
				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-del-ct',plain:true" onclick="free();"/>免费</a>
				</auth:authenticator>
				<auth:authenticator action="/admin/book/chapter_detail">
				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-tip',plain:true" onclick="view();"/>查看明细</a>
				</auth:authenticator>				
			</div>
		        	
		        	
            <table id="list" width="90%">
            </table>
        </div>
    </div>
    <div style="display:none">
		<form name="listForm" method="post" id="listForm" target="_self">
			<input type="hidden" name="id" id="id"/>
		</form>
	</div>
    <script type="text/javascript">
		$(function(){
			$("#list").datagrid({
	        	title:'${obj.name}--章节列表', 
				fit:true,
				toolbar: '#tb',
				queryParams:getParams('searchForm'),
				pagination:true,
				pageNumber:1,
				pageSize:20,
			    loadMsg:'数据加载中....',
			    striped: true, 
			    singleSelect:true,
			    url:'<%=contextPath%>/admin/book/chapter_list_json',
                columns:[[  
	                {field:'id',title:'ID',width:$(this).width()*0.05},  
	                {field:'vipCN',title:'VIP',width:$(this).width()*0.1}, 
              		{field:'title',title:'章节名',width:$(this).width()*0.3},            		
              		{field:'createTimeFormat',title:'创建时间',width:$(this).width()*0.15},
              		{field:'statusCN',title:'状态',width:$(this).width()*0.1},
              		{field:'publishStatus',title:'章节发布状态',width:80,
              			formatter:function(value,row,index) {return value==1 ? "已发布" : "保存草稿";}}
            	]]
			});
		});
		
		function search(){  
	        $('#list').datagrid('options').queryParams = getParams('searchForm'); 
	        $('#list').datagrid('options').pageNumber = 1; 
	      	$('#list').datagrid('getPager').pagination({pageNumber:1});
	        $('#list').datagrid('reload'); //设置好查询参数 reload 一下就可以了  
    	}
		
		function getIdsJSON(rows){
			for(var i = 0; i < rows.length; i ++){
		       	var content = "<input type='hidden' name='ids' value='" + rows[i].id + "'/>";
		       	$("#idsForm").append(content);
		    }
		    var data = getFormToJson('idsForm');
		    $("#idsForm").html("");
		    return data;
		}
		
		function pass() {
			var rows = $('#list').datagrid('getSelections');
			if(rows.length == 0){
			   	$.messager.alert("提示信息","请选择要审核的章节！","warning");
				return;
			}
		    var data = getIdsJSON(rows);
		    var ajaxUrl = "<%=contextPath%>/admin/book/chapter_pass";
			ajaxR(ajaxUrl,data,"是否确定要审核通过?");
		}
		
		function fail() {
			var rows = $('#list').datagrid('getSelections');
			if(rows.length == 0){
			   	$.messager.alert("提示信息","请选择要审核的章节！","warning");
				return;
			}
		    var data = getIdsJSON(rows);
		    var ajaxUrl = "<%=contextPath%>/admin/book/chapter_fail";
			ajaxR(ajaxUrl,data,"是否确定要审核不通过?");		
		}
		
		function del() {
			var rows = $('#list').datagrid('getSelections');
			if(rows.length == 0){
			   	$.messager.alert("提示信息","请选择要删除的章节！","warning");
				return;
			}
		    var data = getIdsJSON(rows);
		    var ajaxUrl = "<%=contextPath%>/admin/book/chapter_del";
			ajaxR(ajaxUrl,data,"是否确定要删除?");		
		}
		
		function vip() {
			var rows = $('#list').datagrid('getSelections');
			if(rows.length == 0){
			   	$.messager.alert("提示信息","请选择要收费的章节！","warning");
				return;
			}
		    var data = getIdsJSON(rows);
		    var ajaxUrl = "<%=contextPath%>/admin/book/chapter_isvip?bookId=${obj.id}";
			ajaxR(ajaxUrl,data,"是否确定要收费?");	
		}
		
		function free() {
			var rows = $('#list').datagrid('getSelections');
			if(rows.length == 0){
			   	$.messager.alert("提示信息","请选择要免费的章节！","warning");
				return;
			}
		    var data = getIdsJSON(rows);
		    var ajaxUrl = "<%=contextPath%>/admin/book/chapter_isfree?bookId=${obj.id}";
			ajaxR(ajaxUrl,data,"是否确定要免费?");	
		}
		
		function view() {
			var row = $("#list").datagrid("getSelected");
			if (row == null) {
				$.messager.alert('警告','请选择一条记录');  
				return;
			}

			$("#id").attr("value", row.id);
			$("#listForm").attr("target","_blank");
			$("#listForm").attr("action","<%=contextPath %>/admin/book/chapter_detail");
			$("#listForm").submit();
		}
		
		function mod() {
			var row = $("#list").datagrid("getSelected");
			if (row == null) {
				$.messager.alert('警告','请选择一条记录');  
				return;
			}

			$("#id").attr("value", row.id);
			$("#listForm").attr("target","_self");
			$("#listForm").attr("action","<%=contextPath %>/admin/book/chapter_modinit");
			$("#listForm").submit();
		}
		
		function add() {
			$("#listForm").attr("target","_self");
			$("#listForm").attr("action","<%=contextPath %>/admin/book/chapter_addinit?bookId=${obj.id}");
			$("#listForm").submit();
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