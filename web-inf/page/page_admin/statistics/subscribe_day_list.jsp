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
		<div id="north" title="搜索条件"  style="background-color: #E0ECFF;height:0px;"
	       data-options="region:'north',border:false"  width="90%">
	       <form id="searchForm" name="searchForm" action="<%=contextPath%>/admin/statistics/subscribe_day_list_json" method="post">
	        	<input type="hidden" name="startDate" id="startDate" value="${startDate}"/>
	        	<input type="hidden" name="endDate" id="endDate" value="${endDate}"/>
	        	<input type="hidden" name="bookId" id="bookId" value="${bookId}"/>
           </form>
        </div>			
        <div id="center" data-options="region:'center',border:false" width="90%">
            <table id="list" width="90%">
            </table>
        </div>
    </div>
    <div style="display:none">
		<form name="listForm" method="post" id="listForm" target="_self">
			<input type="hidden" name="bookId" id="bookId"/>
			<input type="hidden" name="startDate" id="startDate"/>
			<input type="hidden" name="endDate" id="endDate"/>
		</form>
	</div>
    <script type="text/javascript">
		$(function(){
			$("#list").datagrid({
	        	title:'订阅统计', 
				fit:true,
				pagination:true,
				pageNumber:1,
				pageSize:20,
				queryParams:getParams('searchForm'),
			    loadMsg:'数据加载中....',
			    striped: true, 
			    singleSelect:true,
			    url:'<%=contextPath%>/admin/statistics/subscribe_day_list_json',
                columns:[[  
	                {field:'id',title:'书号',width:$(this).width()*0.05},  
              		{field:'name',title:'书名',width:$(this).width()*0.1},
              		{field:'authorNick',title:'作者',width:$(this).width()*0.1},
                    {field:'statisticalDate',title:'统计日期',width:$(this).width()*0.1},
              		{field:'saleBean',title:'订阅销售额(豆)',width:$(this).width()*0.1},
              		{field:'sales',title:'订阅销售额(元)',width:$(this).width()*0.1},
              		{field:'saleCount',title:'计次订阅用户数',width:$(this).width()*0.1},
              		{field:'arup',title:'ARPU',width:$(this).width()*0.1}
            	]]
			});
		});
		
		function search(){  
	        $('#list').datagrid('options').queryParams = getParams('searchForm'); 
	        $('#list').datagrid('options').pageNumber = 1; 
	      	$('#list').datagrid('getPager').pagination({pageNumber:1});
	        $('#list').datagrid('reload'); //设置好查询参数 reload 一下就可以了  
    	}
	</script>
</body>
</html>