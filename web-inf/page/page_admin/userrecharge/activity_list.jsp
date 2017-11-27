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
        		<auth:authenticator action="/admin/activity/activityadd_init">
	        	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="add();">增加</a>
	        	</auth:authenticator>
	        	<auth:authenticator action="/admin/activity/activitymod_init">
				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" onclick="mod();"/>修改</a>
				</auth:authenticator>
				<auth:authenticator action="/admin/activity/activitydel">
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
	        	title:'充值活动列表', 
				fit:true,
				toolbar: '#tb',
				queryParams:getParams('searchForm'),
				pagination:true,
				pageNumber:1,
				pageSize:20,
			    loadMsg:'数据加载中....',
			    striped: true, 
			    singleSelect:true,
			    url:'<%=contextPath%>/admin/activity/activitylist_json',
                columns:[[  
	                {field:'id',title:'ID',width:40},  
              		{field:'name',title:'活动名称',width:200,
              			formatter : function(value,row,index) {
              				return "<a href='rulelist?activityId=" + row.id + "'>" + value + "</a>";
              			}},
              		{field:'activityType',title:'活动类型',width:80,
              			formatter:function(value,row,index) {
              				switch(value) {
              					case 0 : return "充值送";
              					case 1 : return "新用户";
              					case 2 : return "免费领";
              					default : return "其它";
              				}
              			}},
              		{field:'deliverType',title:'发放方式',width:80,
              			formatter:function(value,row,index) {
              				if(row.activityType==1 || row.activityType==2)
              					//return "点击领取";
              					return "";
              					
              				switch(value) {
              					case 0 : return "统一发放";
              					case 1 : return "即时到账";
              					default : return "其它";
              				}
              			}},
              		{field:'rechargeStartStr',title:'开始时间',width:120},
              		{field:'rechargeEndStr',title:'结束时间',width:120},
              		{field:'pointType',title:'计算金额',width:70,
              			formatter:function(value,row,index) {
              				if( row.activityType == 0 ) {
              					return value==0 ? "充值总额" : (value==1 ? "首次金额" : "最高金额");
              				}
              				return "";
              			}},
              		{field:'isClosed',title:'状态',width:40,
              			formatter:function(value,row,index) {return value==1 ? "关闭" : "开放";}},
              		{field:'giftMsg',title:'送糖豆站短内容',width:200},
              		{field:'deliverState',title:'发放状态',width:70,
              			formatter:function(value,row,index) {return value==0 ? "未发放" : (value==1 ? "部分发放" : "全部发放");}},
              		{field:'deliverTimeStr',title:'发放时间',width:120},
              		{field:'createTimeStr',title:'创建时间',width:120},
              		{field:'name1',title:'充值记录',width:80, formatter : function(value,row,index) {
              				return "<a href='activitylist_recharge?activityId=" + row.id + "'>查看</a>";
              			}}
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
			$("#listForm").attr("action","<%=contextPath %>/admin/activity/activityadd_init");
			$("#listForm").submit();
		}
		
		function toollist() {
			$("#listForm").attr("action","<%=contextPath %>/admin/activity/activitylist");
			$("#listForm").submit();
		}
		
		function mod() {
			var row = $("#list").datagrid("getSelected");
			if (row == null) {
				$.messager.alert('警告','请选择一条记录');  
				return;
			}

			$("#id").attr("value", row.id);
			$("#listForm").attr("action","<%=contextPath %>/admin/activity/activitymod_init");
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
			    	$("#listForm").attr("action","<%=contextPath %>/admin/activity/activitydel");
					$("#listForm").submit();  
			    }    
			});			
		}
	</script>
</body>
</html>