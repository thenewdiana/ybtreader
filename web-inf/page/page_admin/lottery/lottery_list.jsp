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
        		<auth:authenticator action="/admin/lottery/lotteryadd_init">
	        	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="add();">增加</a>
	        	</auth:authenticator>
	        	<auth:authenticator action="/admin/lottery/lotterymod_init">
				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" onclick="mod();"/>修改</a>
				</auth:authenticator>
				<auth:authenticator action="/admin/lottery/lotterydel">
				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-del-ct',plain:true" onclick="del();"/>删除</a>
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
	        	title:'抽奖活动列表', 
				fit:true,
				toolbar: '#tb',
				queryParams:getParams('searchForm'),
				pagination:true,
				pageNumber:1,
				pageSize:20,
			    loadMsg:'数据加载中....',
			    striped: true, 
			    singleSelect:true,
			    url:'<%=contextPath%>/admin/lottery/lotterylist_json',
                columns:[[  
	                {field:'id',title:'ID',width:40},  
              		{field:'name',title:'活动名称',width:200},
              		{field:'id1',title:'奖项',width:60,
              			formatter : function(value,row,index) {
              				return "<a href='itemlist?lotteryId=" + row.id + "'>管理</a>";
              			}},
              		{field:'id2',title:'中奖记录',width:60,
              			formatter : function(value,row,index) {
              				return "<a href='useritemlist?lotteryId=" + row.id + "'>查看</a>";
              			}},
              		{field:'isClosed',title:'状态',width:40,
              			formatter:function(value,row,index) {return value==1 ? "关闭" : "开放";}},
              		{field:'startTimeStr',title:'开始时间',width:120},
              		{field:'endTimeStr',title:'结束时间',width:120},
              		{field:'limitVipValue',title:'VIP免费<br>领券级别',width:60},
              		{field:'vipDailyTicketNum',title:'VIP每日<br>领券数量',width:60},
              		{field:'isVipExpiredDaily',title:'VIP券<br>次日作废',width:60,
              			formatter:function(value,row,index) {
              				switch(value) {
              					case 0 : return "否";
              					case 1 : return "是";
              					default : return ""+value;
              				}
              			}},
              		{field:'rewardTicketType',title:'打赏<br>兑奖券',width:50,
              			formatter:function(value,row,index) {
              				switch(value) {
              					case 0 : return "不兑换";
              					case 1 : return "仅兑一次";
              					case 2 : return "重复兑换";
              					default : return ""+value;
              				}
              			}},
              		{field:'rewardValue',title:'打赏<br>糖豆数',width:50},
              		{field:'rewardTicketNum',title:'兑换<br>奖券数',width:50},
              		{field:'isRewardExpiredDaily',title:'打赏兑券<br>次日作废',width:60,
              			formatter:function(value,row,index) {
              				switch(value) {
              					case 0 : return "否";
              					case 1 : return "是";
              					default : return ""+value;
              				}
              			}},
              		{field:'consumeTicketType',title:'消费<br>换奖券',width:50,
              			formatter:function(value,row,index) {
              				switch(value) {
              					case 0 : return "不兑换";
              					case 1 : return "仅兑一次";
              					case 2 : return "重复兑换";
              					default : return ""+value;
              				}
              			}},
              		{field:'consumeValue',title:'消费<br>糖豆数',width:50},
              		{field:'consumeTicketNum',title:'消费换<br>奖券数',width:50},
              		{field:'isConsumeExpiredDaily',title:'消费兑券<br>次日作废',width:60,
              			formatter:function(value,row,index) {
              				switch(value) {
              					case 0 : return "否";
              					case 1 : return "是";
              					default : return ""+value;
              				}
              			}},
              		{field:'modifyTimeStr',title:'修改时间',width:120},
              		{field:'modifier',title:'修改人',width:80},
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
			$("#listForm").attr("action","<%=contextPath %>/admin/lottery/lotteryadd_init");
			$("#listForm").submit();
		}
		
		function toollist() {
			$("#listForm").attr("action","<%=contextPath %>/admin/lottery/lotterylist");
			$("#listForm").submit();
		}
		
		function mod() {
			var row = $("#list").datagrid("getSelected");
			if (row == null) {
				$.messager.alert('警告','请选择一条记录');  
				return;
			}

			$("#id").attr("value", row.id);
			$("#listForm").attr("action","<%=contextPath %>/admin/lottery/lotterymod_init");
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
			    	$("#listForm").attr("action","<%=contextPath %>/admin/lottery/lotterydel");
					$("#listForm").submit();  
			    }    
			});			
		}
	</script>
</body>
</html>