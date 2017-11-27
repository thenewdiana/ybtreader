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
    	<div id="north" title="搜索条件"  style="background-color: #E0ECFF;height:80px;"
	       data-options="region:'north',border:false"  width="90%">
	       <form id="searchForm" name="searchForm" action="<%=contextPath%>/admin/user/frontList_json" method="post">
              <table >
              	<tr>
		            <th>是否锁定：</th>
		            <td>
		            	<select class="easyui-combobox" id="hasLock"
							name="hasLock" style="width:70px;"
							data-options="editable:false">
							<option value="">--全部--</option>
							<option value=0 >否</option>
							<option value=1 >是</option>
						</select>
		            </td>
		            <th>是否激活：</th><td>
		            	<select class="easyui-combobox" id="hasActivation"
							name="hasActivation" style="width:70px;"
							data-options="editable:false">
							<option value="">--全部--</option>
							<option value=0 >否</option>
							<option value=1 >是</option>
						</select></td>
		            <th>是否VIP：</th>
		            <td>
		            	<select class="easyui-combobox" id="hasVip"
							name="hasVip" style="width:70px;"
							data-options="editable:false">
							<option value="">--全部--</option>
							<option value=0 >否</option>
							<option value=1 >是</option>
						</select></td>
		         </tr>
		         <tr>
		            <th>用户名：</th>
		            <td><input type="text" id="name" name="name" style="width:123px;"/></td>
		            <th>昵称：</th><td><input type="text" id="nick" name="nick" style="width:123px;"/></td>
		            <th>邮箱：</th>
		            <td><input type="text" id="email" name="email" style="width:123px;"/></td>
		            <td><a href="javascript:search();" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">查询</a></td>
		         </tr>
		      </table>
           </form>
           <form id="userIdForm" method="post"></form>
        </div>
        <div id="center" data-options="region:'center',border:false" width="90%">
        	<div id="buttons" class="toolbar-button">
	        	<auth:authenticator action='/admin/user/user_add_init'>
	        	<a href="javascript:add();" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">添加</a> 
	        	</auth:authenticator>
	        	<auth:authenticator action='/admin/user/del'>
	        	<a href="javascript:deleteUser();" class="easyui-linkbutton" data-options="iconCls:'icon-del-ct',plain:true">删除</a> 
	        	</auth:authenticator>
	        	<auth:authenticator action='/admin/user/lock'>
	        	<a href="javascript:lockUser();" class="easyui-linkbutton" data-options="iconCls:'icon-lock-ct',plain:true">锁定</a> 
	        	</auth:authenticator>
	        	<auth:authenticator action='/admin/user/unLock'>
	        	<a href="javascript:unLockUser();" class="easyui-linkbutton" data-options="iconCls:'icon-unlock-ct',plain:true">解锁</a> 
	        	</auth:authenticator>
            </div>
           	<table id="userList" width="90%">
           	</table>
        </div>
    </div>
    <script type="text/javascript">
		$(function(){
			$("#userList").datagrid({
	        	title:'会员查询', 
				fit:true,
				fitColumns:false,
				toolbar:'#buttons',
				queryParams:getParams('searchForm'),
				pagination:true,
				pageNumber:1,
				pageSize:20,
			    loadMsg:'数据加载中....',
			    striped: true, 
			    url:'<%=contextPath%>/admin/user/frontList_json',
                columns:[[  
                	{field:'ck',checkbox:true,width:30}, //显示复选框
              		{field:'name',title:'用户名',width:120},
              		{field:'nick',title:'昵称',width:120},
              		{field:'emailLoginName',title:'登录邮箱',width:120},
              		{field:'mobileLoginName',title:'登录手机',width:120},
              		{field:'email',title:'邮箱',width:100},
              		{field:'lastLoginTime',title:'最后登录时间',width:120,formatter:formatDate},
              		{field:'regip',title:'注册IP',width:100},
              		{field:'createTime',title:'注册时间',width:120,formatter:formatDate},
              		{field:'hasActivation',title:'激活',width:35,formatter:formatSelect},
              		{field:'hasVip',title:'VIP',width:35,formatter:formatSelect},
              		{field:'hasLock',title:'锁定',width:35,formatter:formatSelect},
              		{field:'hasWriter',title:'作家',width:35,formatter:formatSelect},
              		{field:'accountType',title:'注册方式',width:80,
              			formatter:function(value,row,index) {
              				switch(value) {
              					case 0 : return "本地";
              					case 1 : return "腾讯";
              					case 2 : return "新浪";
              					case 3 : return "豆瓣";
              					case 4 : return "百度";
              					case 5 : return "微信";
              					case 6 : return "游客";
              					default : return "";
              				}
              		}},
              		{field:'regSource',title:'注册来源',width:100,
              			formatter:function(value,row,index) {
              				switch(value) {
              					case 0 : return "pc浏览器";
              					case 1 : return "手机浏览器";
              					case 2 : return "安卓";
              					case 3 : return "苹果";
              					default : return "";
              				}
              		}},
              		{field:'oper', title:'操作', width:180, formatter:function(value,row,index){
	                       var id = row.id; 
	                       var link = '<auth:authenticator action='/admin/user/view/'><a class="viewClass" href="javascript:view(' + id + ');">查看</a> </auth:authenticator>';
	                       link += '<auth:authenticator action='/admin/user/user_mod_init/'><a class="editClass" href="javascript:mod(' + id + ');">编辑</a> </auth:authenticator>'; 
	                       link += '<auth:authenticator action='/admin/user/user_bean/'><a class="giveClass" href="javascript:give(' + id + ');">赠豆</a> </auth:authenticator>';
	                       return link;
                    	}
                    }
            	]],
            	onBeforeLoad:function(){
            		if($("#buttons a").length == 0){
            			$(".datagrid-toolbar").hide();
            		}
		        },
		        onLoadSuccess:function(){
		        	$(".viewClass").linkbutton({iconCls:"icon-search",plain:true});
		        	$(".editClass").linkbutton({iconCls:"icon-edit",plain:true});
		        	$(".giveClass").linkbutton({iconCls:"icon-tip",plain:true});
		        }
			});
		});
		
		function formatSelect(value){ 
   			var statusName = "";
        	switch(value){
        	case 0:
        		statusName="否";
        		break;
        	case 1:
        		statusName="是";
        		break;
        	default:
        		statusName="未知";
        	}
        	return statusName;
		} 
		
		function formatDate(value){ 
   			var formatValue = "";
   			if (value){
   				var t = new Date(parseInt(value));
		     	formatValue = t.getFullYear()+"-"+(t.getMonth()+1)+"-"+t.getDate();
		     	var hh = t.getHours();
	            var mm = t.getMinutes();
	            var ss = t.getSeconds();
	            if(hh<10){ hh = '0'+hh;}
	            if(mm<10){ mm = '0'+mm;}
	            if(ss<10){ ss = '0'+ss;}
	            formatValue += " "+hh+":"+mm+":"+ss;
   			}
   			return formatValue; 
         }
         
        function add(){
        	location.href = "<%=contextPath%>/admin/user/user_add_init";
        }
        
		function view(id){
			location.href = "<%=contextPath%>/admin/user/view/" + id;
		}
		
		function mod(id){
		   location.href = "<%=contextPath%>/admin/user/user_mod_init/" + id;
		}
		
		function give(id){
		   location.href = "<%=contextPath%>/admin/user/user_bean/" + id;
		}
		
		function getUserIdsJSON(rows){
			for(var i = 0; i < rows.length; i ++){
		       	var content = "<input type='hidden' name='userIds' value='" + rows[i].id + "'/>";
		       	$("#userIdForm").append(content);
		    }
		    var data = getFormToJson('userIdForm');
		    $("#userIdForm").html("");
		    return data;
		}
		
		function deleteUser(){
			var rows = $('#userList').datagrid('getSelections');
			if(rows.length == 0){
			   	$.messager.alert("提示信息","请选择要删除的会员！","warning");
				return;
			}
		    var data = getUserIdsJSON(rows);
		    var ajaxUrl = "<%=contextPath%>/admin/user/del";
			ajaxR(ajaxUrl,data,"是否确定要删除会员?");
		}  
		
		function lockUser(){
			var rows = $('#userList').datagrid('getSelections');
			if(rows.length == 0){
			   	$.messager.alert("提示信息","请选择要锁定的会员！","warning");
				return;
			}
		    var data = getUserIdsJSON(rows);
		    var ajaxUrl = "<%=contextPath%>/admin/user/lock";
			ajaxR(ajaxUrl,data,"是否确定要锁定会员?");
		}  
		
		function unLockUser(){
			var rows = $('#userList').datagrid('getSelections');
			if(rows.length == 0){
			   	$.messager.alert("提示信息","请选择要解锁的会员！","warning");
				return;
			}
		    var data = getUserIdsJSON(rows);
		    var ajaxUrl = "<%=contextPath%>/admin/user/unLock";
			ajaxR(ajaxUrl,data,"是否确定要解锁会员?");
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
									$("#userList").datagrid("reload");
								});
								$(".panel-tool-close").hide();
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
		
		
		
		function search(){  
			$('#userList').datagrid('options').queryParams = getParams('searchForm'); 
			$('#userList').datagrid('options').pageNumber = 1; 
			$('#userList').datagrid('getPager').pagination({pageNumber:1});
			$('#userList').datagrid('reload'); //设置好查询参数 reload 一下就可以了  
		}
	</script>
</body>
</html>