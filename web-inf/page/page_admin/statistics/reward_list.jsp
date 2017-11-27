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
	       <form id="searchForm" name="searchForm" action="<%=contextPath%>/admin/statistics/reward_list_json" method="post">
	       	  <table>
		         <tr>
		           	<th>书名：</th>
		            <td><input type="text" id="bookName" name="bookName" style="width:123px;"/></td>
		            <th>开始日期：</th>
		            <td>
		            	<input type="text" id="startTime" name="startTime" class="easyui-datebox" style="width:123px;"/>
		            </td>
		            <th>结束日期：</th>
		            <td>
		            	<input type="text" id="endTime" name="endTime" class="easyui-datebox" style="width:123px;"/>
		            </td>
		            <td><a href="javascript:search();" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">查询</a></td>
		            <auth:authenticator action="/admin/statistics/exportRewardList">
		            <td><a href="javascript:exportExcel();" class="easyui-linkbutton" data-options="iconCls:'icon-export-ct',plain:true">导出excel</a></td>
		            </auth:authenticator>
		         </tr>
		      </table>
           </form>
           <form id="idsForm" method="post"></form>
        </div>			
        <div id="center" data-options="region:'center',border:false" width="90%">
            <table id="list" width="90%">
            </table>
        </div>
    </div>
    <div style="display:none">
		<form name="listForm" method="post" id="listForm" target="_self">
			<input type="hidden" name="bookId" id="bookId"/>
			<input type="hidden" name="statisticalDate" id="statisticalDate"/>
		</form>
	</div>
    <script type="text/javascript">
		$(function(){
			$("#list").datagrid({
	        	title:'打赏统计', 
				fit:true,
				pagination:true,
				pageNumber:1,
				pageSize:20,
			    loadMsg:'数据加载中....',
			    striped: true, 
			    singleSelect:true,
			    url:'<%=contextPath%>/admin/statistics/reward_list_json',
                columns:[[  
	                {field:'id',title:'书号',width:$(this).width()*0.05},  
              		{field:'name',title:'书名',width:$(this).width()*0.2},
              		{field:'authorNick',title:'作者',width:$(this).width()*0.1},
              		{field:'statisticalDate', title:'统计日期', width:$(this).width()*0.2, formatter:function(value,row,index){
	                       var link = '<a href=javascript:byDay('+row.id+',"'+row.statisticalDate+'");>'+value+'</a>';
	                       return link;
                    	}
                    },
              		{field:'saleBean',title:'打赏销售额(豆)',width:$(this).width()*0.1},
              		{field:'sales',title:'打赏销售额(元)',width:$(this).width()*0.1},
              		{field:'saleCount',title:'计次打赏用户数',width:$(this).width()*0.1},
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
    	
    	function byDay(id,statisticalDate) {
    		$("#bookId").attr("value", id);
			$("#statisticalDate").attr("value", statisticalDate);
			$("#listForm").attr("target","_blank");
			$("#listForm").attr("action","<%=contextPath %>/admin/statistics/reward_day_list");
			$("#listForm").submit();
		}
		
		function exportExcel() {
			$("#searchForm").attr("action","<%=contextPath %>/admin/statistics/exportRewardList");
			$("#searchForm").submit();
		}
	</script>
</body>
</html>