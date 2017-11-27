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
        		<auth:authenticator action="/admin/vote/itemadd_init">
	        	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="add();">增加</a>
	        	</auth:authenticator>
	        	<auth:authenticator action="/admin/vote/itemmod_init">
				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" onclick="mod();"/>修改</a>
				</auth:authenticator>
				<auth:authenticator action="/admin/vote/itemdel">
				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-del-ct',plain:true" onclick="del();"/>删除</a>
				</auth:authenticator>
				<auth:authenticator action="/admin/vote/votelist">
				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-back',plain:true" onclick="backVoteList();"/>返回</a>
				</auth:authenticator>
			</div>
		        	
            <table id="list" width="90%">
            </table>
        </div>
    </div>
    <div style="display:none">
		<form name="listForm" method="post" id="listForm" target="_self">
			<input type="hidden" name="id" id="id"/>
			<input type="hidden" name="voteId" value="${voteId }"/>
		</form>
	</div>
    <script type="text/javascript">
		$(function(){
			$("#list").datagrid({
	        	title:'投票选项列表', 
				fit:true,
				toolbar: '#tb',
				queryParams:getParams('searchForm'),
				pagination:true,
				pageNumber:1,
				pageSize:20,
			    loadMsg:'数据加载中....',
			    striped: true, 
			    singleSelect:true,
			    url:'<%=contextPath%>/admin/vote/itemlist_json?voteId=${voteId}',
                columns:[[  
	                {field:'id',title:'ID',width:80},  
              		{field:'itemName',title:'选项名称',width:300,
              			formatter : function(value,row,index) {
              				return "<a href='itemmod_init?id=" + row.id + "'>" + value + "</a>";
              			}},
              		{field:'itemBookId',title:'书籍编号',width:100,
              			formatter : function(value,row,index) {
              				return "<a href='itemmod_init?id=" + row.id + "'>" + value + "</a>";
              			}},
              		{field:'voteNum',title:'已得票数',width:80},  
              		{field:'isClosed',title:'状态',width:40,
              			formatter:function(value,row,index) {return value==1 ? "关闭" : "开放";}},
              		{field:'goldTimes',title:'获得元宝数',width:80}, 
              		{field:'goldVoteNum',title:'元宝增加票数',width:100},
              		{field:'bombTimes',title:'获得炸弹数',width:80}, 
              		{field:'bombVoteNum',title:'炸弹减少票数',width:100},
              		{ field:'addTimes',title:'后台加票次数',width:100,
              			formatter : function(value,row,index) {
              				return value + "&nbsp;<a href='javascript:void()' onclick='javascript:addVoteNum(" + row.id + ");'>＋ </a>";
              			},
              		}, 
              		{field:'addVoteNum',title:'后台加票总数',width:100},
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
			$("#listForm").attr("action","<%=contextPath %>/admin/vote/itemadd_init");
			$("#listForm").submit();
		}
		
		function addVoteNum(id, itemName) {
			$.messager.prompt('提示:','请输入为该选项 增加的票数:', function(r) {
				var n = parseInt(r);
				if( isNaN(n) ) {
					$.messager.alert("您输入的数量格式不正确！");
					return;
				}
				if( n <= 0 ) {
					$.messager.alert("只能增加票数！");
					return;
				}
				
				$.ajax({
					type : "POST",
					dataType : "json",
					data : "voteId=${voteId}&itemId=" + id + "&toolId=0&num=" + n,
					async:true,
					url : "${pageContext.request.contextPath }/admin/vote/usetool",
					success : function(json) {
						if (json.code != 0) {
							$.messager.alert("提示", json.msg);
						} else {
							var selRow = $('#list').datagrid('getSelected');
							var idx = $('#list').datagrid('getRowIndex',selRow);
							$('#list').datagrid("updateRow", {
								index : idx,
								row : {
									addTimes : json.addTimes,
									addVoteNum : json.addVoteNum,
									voteNum : json.voteNum
								}
							});
							$.messager.alert("提示", "操作成功！");
						}
					}
				});
			});
		}
		
		function mod() {
			var row = $("#list").datagrid("getSelected");
			if (row == null) {
				$.messager.alert('警告','请选择一条记录');  
				return;
			}

			$("#id").attr("value", row.id);
			$("#listForm").attr("action","<%=contextPath %>/admin/vote/itemmod_init");
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
			    	$("#listForm").attr("action","<%=contextPath %>/admin/vote/itemdel");
					$("#listForm").submit();  
			    }    
			});	
		}
		function backVoteList(){
			window.location = "<%=contextPath %>/admin/vote/votelist";	
		}
	</script>
</body>
</html>