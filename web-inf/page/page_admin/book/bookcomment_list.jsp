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
	<div class="easyui-layout" data-options="fit:true">
    	<div id="north" title="搜索条件"  style="background-color: #E0ECFF;height:60px;"
	       data-options="region:'north',border:false"  width="90%">
	       <form id="searchForm" name="searchForm" action="<%=contextPath%>/admin/category/list_json" method="post">
              <table>
		         <tr>
		            <th>状态：</th>
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
		            <th>开始日期：</th>
		            <td>
		            	<input type="text" id="startTime" name="startTime" class="easyui-datebox" style="width:123px;"/>
		            </td>
		            <th>结束日期：</th>
		            <td>
		            	<input type="text" id="endTime" name="endTime" class="easyui-datebox" style="width:123px;"/>
		            </td>
		            <td><a href="javascript:search();" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">查询</a></td>
		         </tr>
		      </table>
           </form>
           <form id="idsForm" method="post"></form>
        </div>				
        <div id="center" data-options="region:'center',border:false" width="90%">
        	<div id="tb" class="datagrid-toolbar">
        		<auth:authenticator action="/admin/bookcomment/pass">
	        	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-ok',plain:true" onclick="pass();">通过</a>
	        	</auth:authenticator>
	        	<auth:authenticator action="/admin/bookcomment/fail">
				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-no',plain:true" onclick="fail();"/>不通过</a>
				</auth:authenticator>				
			</div>
		        	
            <table id="list" width="90%">
            </table>
        </div>
    </div>
    <script type="text/javascript">
		$(function(){
			$("#list").datagrid({
	        	title:'书籍评论列表', 
				fit:true,
				toolbar: '#tb',
				queryParams:getParams('searchForm'),
				pagination:true,
				pageNumber:1,
				pageSize:20,
			    loadMsg:'数据加载中....',
			    striped: true, 
			    //singleSelect:true,
			    url:'<%=contextPath%>/admin/bookcomment/list_json',
                columns:[[  
	                {field:'id',title:'ID',width:$(this).width()*0.1},  
              		{field:'userNick',title:'评论人',width:$(this).width()*0.2},
              		{field:'bookName',title:'评论作品',width:$(this).width()*0.2},
              		{field:'content',title:'评论内容',width:$(this).width()*0.2},
              		{field:'createTimeFormat',title:'评论时间',width:$(this).width()*0.2},
              		{field:'statusCN',title:'状态',width:$(this).width()*0.1}
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
			   	$.messager.alert("提示信息","请选择要审核的评论！","warning");
				return;
			}
		    var data = getIdsJSON(rows);
		    var ajaxUrl = "<%=contextPath%>/admin/bookcomment/pass";
			ajaxR(ajaxUrl,data,"是否确定要审核通过?");
		}
		
		function fail() {
			var rows = $('#list').datagrid('getSelections');
			if(rows.length == 0){
			   	$.messager.alert("提示信息","请选择要审核的评论！","warning");
				return;
			}
		    var data = getIdsJSON(rows);
		    var ajaxUrl = "<%=contextPath%>/admin/bookcomment/fail";
			ajaxR(ajaxUrl,data,"是否确定要审核不通过?");		
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