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
              <table>
		         <tr>
		            <th>审核状态：</th>
		            <td>
		            	<select class="easyui-combobox" id="status"
							name="status" style="width:70px;"
							data-options="editable:false">
							<option value="">--全部--</option>
							<option value="0">未审核</option>
							<option value="1" >通过</option>
							<option value="-1" >不通过</option>
						</select>
		            </td>
		            <th>书名：</th>
		            <td><input type="text" id="name" name="name" style="width:123px;"/></td>
		            <td><a href="javascript:search();" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">查询</a></td>
		         </tr>
		      </table>
           </form>
           <form id="idsForm" method="post"></form>
        </div>				
        <div id="center" data-options="region:'center',border:false" width="90%">
        	<div id="tb" class="datagrid-toolbar">
        		<auth:authenticator action="/admin/book/pass">
	        	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-ok',plain:true" onclick="pass();">通过</a>
	        	</auth:authenticator>
	        	<auth:authenticator action="/admin/book/fail">
				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-no',plain:true" onclick="fail();"/>不通过</a>
				</auth:authenticator>
				<auth:authenticator action="/admin/book/delete">
				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-no',plain:true" onclick="del();"/>删除</a>
				</auth:authenticator>
				<auth:authenticator action="/admin/book/upload_init">
				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="upload();"/>上传</a>
				</auth:authenticator>
				<auth:authenticator action="/admin/book/export">
				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="exportTxt();"/>导出txt</a>
				</auth:authenticator>
				<auth:authenticator action="/admin/book/mod_init">
				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="mod();"/>修改</a>
				</auth:authenticator>
				<auth:authenticator action="/admin/book/chapter_list">
				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-tip',plain:true" onclick="chapterList();"/>查看章节</a>
				</auth:authenticator>	
				<auth:authenticator action="/admin/book/push">
	        	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-ok',plain:true" onclick="push();">推送</a>
	        	</auth:authenticator>
	        	<auth:authenticator action="/admin/book/nopush">
	        	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-no',plain:true" onclick="nopush();">不推送</a>
	        	</auth:authenticator>
				<auth:authenticator action="/admin/book/booksExport">
					<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-export-ct',plain:true" onclick="booksExport();">导出图书列表 </a>
				</auth:authenticator>	
				<auth:authenticator action="/admin/book/keywords_init">		
				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="keywords();"/>关键词</a>
				</auth:authenticator>
						
			</div>
		        	
            <table id="list" width="90%">
            </table>
        </div>
    </div>
    <div style="display:none">
		<form name="listForm" method="post" id="listForm" target="_self">
			<input type="hidden" name="id" id="id"/>
			<input type="hidden" name="bookId" id="bookId"/>
		</form>
	</div>
    <script type="text/javascript">
		$(function(){
			$("#list").datagrid({
	        	title:'书籍列表', 
				fit:true,
				toolbar: '#tb',
				queryParams:getParams('searchForm'),
				pagination:true,
				pageNumber:1,
				pageSize:20,
			    loadMsg:'数据加载中....',
			    striped: true, 
			    singleSelect:true,
			    url:'<%=contextPath%>/admin/book/list_json',
                columns:[[  
	                {field:'id',title:'ID',width:$(this).width()*0.05},  
              		{field:'authorNick',title:'作者',width:$(this).width()*0.15},
              		{field:'name',title:'书名',width:$(this).width()*0.2},              		
              		{field:'createTimeFormat',title:'创建时间',width:$(this).width()*0.15},
              		{field:'isPermissionCN',title:'是否申请签约',width:$(this).width()*0.1},
              		{field:'statusCN',title:'状态',width:$(this).width()*0.1},
              		{field:'isPushCN',title:'第三方是否可读',width:$(this).width()*0.1}
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
			   	$.messager.alert("提示信息","请选择要审核的书籍！","warning");
				return;
			}
		    var data = getIdsJSON(rows);
		    var ajaxUrl = "<%=contextPath%>/admin/book/pass";
			ajaxR(ajaxUrl,data,"是否确定要审核通过?");
		}
		
		function fail() {
			var rows = $('#list').datagrid('getSelections');
			if(rows.length == 0){
			   	$.messager.alert("提示信息","请选择要审核的书籍！","warning");
				return;
			}
		    var data = getIdsJSON(rows);
		    var ajaxUrl = "<%=contextPath%>/admin/book/fail";
			ajaxR(ajaxUrl,data,"是否确定要审核不通过?");		
		}
		
		function push() {
			var rows = $('#list').datagrid('getSelections');
			if(rows.length == 0){
			   	$.messager.alert("提示信息","请选择要推送的书籍！","warning");
				return;
			}
		    var data = getIdsJSON(rows);
		    var ajaxUrl = "<%=contextPath%>/admin/book/push";
			ajaxR(ajaxUrl,data,"是否确定要推送?");
		}
		
		function nopush() {
			var rows = $('#list').datagrid('getSelections');
			if(rows.length == 0){
			   	$.messager.alert("提示信息","请选择要取消推送的书籍！","warning");
				return;
			}
		    var data = getIdsJSON(rows);
		    var ajaxUrl = "<%=contextPath%>/admin/book/nopush";
			ajaxR(ajaxUrl,data,"是否确定要取消推送?");
		}
		
		function del() {
			var rows = $('#list').datagrid('getSelections');
			if(rows.length == 0){
			   	$.messager.alert("提示信息","请选择要删除的书籍！","warning");
				return;
			}
		    var data = getIdsJSON(rows);
		    var ajaxUrl = "<%=contextPath%>/admin/book/delete";
			ajaxR(ajaxUrl,data,"是否确定删除?");	
		}
		
		function upload() {
			$("#listForm").attr("target","");
			$("#listForm").attr("action","<%=contextPath %>/admin/book/upload_init");
			$("#listForm").submit();	
		}
		
		function mod() {
			var rows = $('#list').datagrid('getSelections');
			if(rows.length == 0 || rows.length > 1){
			   	$.messager.alert("提示信息","请选择要修改的书籍！","warning");
				return;
			}
			
			$("#listForm").attr("target","");
			$("#listForm").attr("action","<%=contextPath %>/admin/book/mod_init?id=" + rows[0].id);
			$("#listForm").submit();
		}
		
		function keywords() {
			var rows = $('#list').datagrid('getSelections');
			if(rows.length == 0 || rows.length > 1){
			   	$.messager.alert("提示信息","请选择要修改的书籍！","warning");
				return;
			}
			
			$("#listForm").attr("target","");
			$("#listForm").attr("action","<%=contextPath %>/admin/book/keywords_init?bookId=" + rows[0].id);
			$("#listForm").submit();
		}
		
		function chapterList() {
			var row = $("#list").datagrid("getSelected");
			if (row == null) {
				$.messager.alert('警告','请选择一条记录');  
				return;
			}

			$("#bookId").attr("value", row.id);
			$("#listForm").attr("target","_blank");
			$("#listForm").attr("action","<%=contextPath %>/admin/book/chapter_list");
			$("#listForm").submit();
		}
		
		function exportTxt() {
			var rows = $('#list').datagrid('getSelections');
			if(rows.length == 0 || rows.length > 1){
			   	$.messager.alert("提示信息","请选择要导出的书籍！","warning");
				return;
			}
			
			$("#listForm").attr("target","_blank");
			$("#listForm").attr("action","<%=contextPath %>/admin/book/export?bookId=" + rows[0].id);
			$("#listForm").submit();	
		}

        function booksExport() {
            $("#searchForm").attr("target","_blank");
            $("#searchForm").attr("action","<%=contextPath %>/admin/book/booksExport");
            $("#searchForm").submit();
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