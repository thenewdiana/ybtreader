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
    	<div id="north" title="搜索条件"  style="background-color: #E0ECFF;height:80px;"
	       data-options="region:'north',border:false"  width="90%">
	       <form id="searchForm" name="searchForm" action="" method="post">
              <table>
		         <tr>
		            <th>交易状态：</th>
		            <td>
		            	<select class="easyui-combobox" id="status"
							name="status" style="width:70px;"
							data-options="editable:false">
							<option value="">--全部--</option>
							<option value="0">未支付</option>
							<option value="1" >成功</option>
							<option value="-1" >取消</option>
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
		         </tr>
		         <tr>
		         	<th>用户昵称：</th>
		            <td>
		            	<input type="text" id="userNick" name="userNick" style="width:123px;"/>
		            </td>
		         	<th>本站订单：</th>
		            <td>
		            	<input type="text" id="orderNo" name="orderNo" style="width:123px;"/>
		            </td>
		            <th>第三方订单：</th>
		            <td>
		            	<input type="text" id="tradeNo" name="tradeNo" style="width:123px;"/>
		            </td>
		            <th>第三方code：</th>
		            <td>
		            	<input type="text" id="bankCode" name="bankCode" style="width:123px;"/>
		            </td>
		            <td><a href="javascript:search();" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">查询</a></td>
		         </tr>
		      </table>
           </form>
        </div>				
        <div id="center" data-options="region:'center',border:false" width="90%">		        	
            <table id="list" width="90%">
            </table>
        </div>
    </div>
    <script type="text/javascript">
		$(function(){
			$("#list").datagrid({
	        	title:'交易列表', 
				fit:true,
				//toolbar: '#tb',
				queryParams:getParams('searchForm'),
				pagination:true,
				pageNumber:1,
				pageSize:20,
			    loadMsg:'数据加载中....',
			    striped: true, 
			    singleSelect:true,
			    url:'<%=contextPath%>/admin/userrecharge/list_json',
                columns:[[  
	                {field:'id',title:'ID',width:$(this).width()*0.05}, 
	                {field:'userNick',title:'充值用户',width:$(this).width()*0.1},
              		{field:'orderNo',title:'订单号',width:$(this).width()*0.1},
              		{field:'bankCode',title:'第三方',width:$(this).width()*0.1},
              		{field:'tradeNo',title:'第三方交易号',width:$(this).width()*0.2},
              		{field:'rechargeValue',title:'金额（单位：分）',width:$(this).width()*0.1},              		
              		{field:'createTimeFormat',title:'创建时间',width:$(this).width()*0.1},
              		{field:'modifyTimeFormat',title:'成功时间',width:$(this).width()*0.1},
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
	</script>
</body>
</html>