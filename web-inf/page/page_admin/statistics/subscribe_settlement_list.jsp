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
	       <form id="searchForm" name="searchForm" action="<%=contextPath%>/admin/statistics/subscribe_settlement_list_json" method="post">
	       	  <table>
		         <tr>
		           	<th>书名：</th>
		            <td><input type="text" id="bookName" name="bookName" style="width:123px;"/></td>
		            <th>结算时间段：</th>
		            <td>
		            <select class="easyui-combobox"
						name="settlementId" id="settlementId" style="width:153px;"
						data-options="editable:false">
						<c:forEach items="${dictDataList}" var="dict">
							<option value=${dict.id}>${dict.dataKey}</option>
						</c:forEach>
					</select>
		            </td>
		            <td><a href="javascript:search();" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">查询</a></td>
		            <auth:authenticator action="admin/statistics/exportSubscribeSettlement">
		            <td><a href="javascript:exportExcel();" class="easyui-linkbutton" data-options="iconCls:'icon-export-ct',plain:true">导出excel</a></td>
		            </auth:authenticator>
		         </tr>
		      </table>
           </form>
           <form id="idsForm" method="post"></form>
        </div>			
        <div id="center" data-options="region:'center',border:false" width="90%">
        	<div id="buttons" class="toolbar-button">
	        	<font color="red"><b>注意：查询默认为未结算状态，执行人员可手动更改设置为已结算，但此操作不可逆</b></font>
            </div>
            <table id="list" width="90%">
            </table>
        </div>
    </div>
    <div style="display:none">
		<form name="listForm" method="post" id="listForm" target="_self">
			<input type="hidden" name="bookId" id="bookId"/>
			<input type="hidden" name="dataId" id="dataId"/>
		</form>
	</div>
    <script type="text/javascript">
		$(function(){
			$("#list").datagrid({
	        	title:'订阅结算', 
				fit:true,
				toolbar:'#buttons',
				pagination:true,
				pageNumber:1,
				pageSize:20,
				queryParams:getParams('searchForm'),
			    loadMsg:'数据加载中....',
			    striped: true, 
			    singleSelect:true,
			    url:'<%=contextPath%>/admin/statistics/subscribe_settlement_list_json',
                columns:[[  
	                {field:'id',title:'书号',width:$(this).width()*0.05},  
              		{field:'name',title:'书名',width:$(this).width()*0.15},
              		{field:'authorNick',title:'作者',width:$(this).width()*0.1},
              		{field:'statisticalDate', title:'统计时间段', width:$(this).width()*0.1},
              		{field:'saleBean',title:'订阅总糖豆',width:$(this).width()*0.1},
              		{field:'settlementValue',title:' 应结款（税前/元）',width:$(this).width()*0.1},
              		{field:'settlementStatus',title:'结算状态',width:$(this).width()*0.1,formatter:transStatus},
              		{field:'oper', title:'操作', width:$(this).width()*0.15, formatter:function(value,row,index){
              				var link = '';
	              			if(row.settlementStatus==0){
	              				link = '<a href=javascript:settlement('+row.id+','+row.settlementId+');>结算</a>';
	              			}else{
	              				link = '已经结算';
	              			}
	                        return link;
                    	}
                    }
            	]]
			});
		});
		
		function transStatus(value){
        	var statusName = "";
        	switch(value){
        	case 0:
        		statusName="未结算";
        		break;
        	case 1:
        		statusName="已结算";
        		break;
        	case 2:
        		statusName="不可结算";
        		break;
        	default:
        		statusName="未知";
        	}
        	return statusName;
        }
		
		function search(){  
	        $('#list').datagrid('options').queryParams = getParams('searchForm'); 
	        $('#list').datagrid('options').pageNumber = 1; 
	      	$('#list').datagrid('getPager').pagination({pageNumber:1});
	        $('#list').datagrid('reload'); //设置好查询参数 reload 一下就可以了  
    	}
    	
    	function settlement(bookId,dataId){
    		$("#bookId").attr("value", bookId);
			$("#dataId").attr("value", dataId);
			var data = getFormToJsonString('listForm');
			var ajaxUrl = "<%=contextPath%>/admin/statistics/subscribe_settlement";
			ajaxR(ajaxUrl,data,"此操作不可逆，确定要结算此书吗?");	
		}
		
		function exportExcel() {
			$("#searchForm").attr("action","<%=contextPath %>/admin/statistics/exportSubscribeSettlement");
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