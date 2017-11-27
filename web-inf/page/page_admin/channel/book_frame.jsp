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
	       <form id="searchForm" name="searchForm" action="<%=contextPath%>/admin/book/list_json" method="post">
	       		<input  type="hidden" name="status" id="status" value="1"/>
	       		<input  type="hidden" name="orderBy" id="orderBy" value=""/>
              <table >
              	<tr>
		            <th>书名：</th>
		            <td>
		            <input class="easyui-textbox" name="name" id="name" />
		            </td>
		            <td><a href="javascript:search();" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">查询</a></td>
		         </tr>
		      </table>
           </form>
           
        </div>
        <div id="center" data-options="region:'center',border:false" width="90%">
        	<div id="buttons" class="toolbar-button">
	        	<a href="javascript:addBook();" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">添加</a>
            </div>
           	<table id="bookList" width="90%">
           	</table>
        </div>
    </div>
    <script type="text/javascript">
		$(function(){
			$("#bookList").datagrid({
	        	title:'图书列表', 
				fit:true,
				fitColumns:false,
				toolbar:'#buttons',
				queryParams:getParams('searchForm'),
				pagination:true,
				pageNumber:1,
				pageSize:20,
			    loadMsg:'数据加载中....',
			    striped: true, 
			    singleSelect:true,
			    url:'<%=contextPath%>/admin/book/list_json?noReset=1',
                columns:[[  
	                {field:'id',title:'ID',width:$(this).width()*0.05},  
              		{field:'authorName',title:'作者',width:$(this).width()*0.1},
              		{field:'name',title:'书名',width:$(this).width()*0.2},              		
              		{field:'createTimeFormat',title:'创建时间',width:$(this).width()*0.15},
              		{field:'statusCN',title:'状态',width:$(this).width()*0.1}
            	]],
            	onBeforeLoad:function(){
            		if($("#buttons a").length == 0){
            			$(".datagrid-toolbar").hide();
            		}
		        }
			});
		});
         
        function addBook(){
        	var row = $('#bookList').datagrid('getSelections');
        	if(row.length == 0){
			   	$.messager.alert("提示信息","请选择要推荐的书籍！","warning");
				return;
			}
			var params = {'bookId':row[0].id,'subjectId':$('#subjectId').val(),'srcBookId':$('#srcBookId').val()};
			$.ajax({
				type: "POST",
				url:"<%=contextPath%>/admin/subject/book_validate",
				dataType: "json",
				data:params,
				success:function(data){
					if(data.result){
						refreshSearch(row[0].id,row[0].name,row[0].info,row[0].name);
					}else{
						$.messager.alert('提示',data.msg,'error');
					}
				}
			});
			
        	
        }
		function search(){  
			$('#bookList').datagrid('options').queryParams = getParams('searchForm'); 
			$('#bookList').datagrid('options').pageNumber = 1; 
			$('#bookList').datagrid('getPager').pagination({pageNumber:1});
			$('#bookList').datagrid('reload'); //设置好查询参数 reload 一下就可以了  
		}
	</script>
</body>
</html>