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
	       <form id="searchForm" name="searchForm" action="<%=contextPath%>/admin/user/adminList_json" method="post">
              <table >
		         <tr>
		            <th>用户名：</th>
		            <td><input type="text" id="name" name="name" style="width:123px;"/></td>
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
	        	<auth:authenticator action='/admin/user/admin_add_init'>
	        	<a href="javascript:add();" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">添加</a> 
	        	</auth:authenticator>
	        	<auth:authenticator action='/admin/user/del'>
	        	<a href="javascript:deleteUser();" class="easyui-linkbutton" data-options="iconCls:'icon-del-ct',plain:true">删除</a> 
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
			    singleSelect:true,
			    url:'<%=contextPath%>/admin/user/adminList_json',
                columns:[[  
              		{field:'name',title:'用户名',width:120},
              		{field:'realName',title:'姓名',width:80},
              		{field:'email',title:'邮箱',width:100},
              		{field:'lastLoginTime',title:'最后登录时间',width:120,formatter:formatDate},
              		{field:'regip',title:'注册IP',width:100},
              		{field:'oper', title:'操作', width:100, formatter:function(value,row,index){
	                       var id = row.id; 
	                       var link = '<auth:authenticator action='/admin/user/admin_mod_init/'><a class="editClass" href="javascript:mod(' + id + ');">编辑</a> </auth:authenticator>';
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
		        	$(".editClass").linkbutton({iconCls:"icon-edit",plain:true});
		        }
			});
		});
         
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
        	location.href = "<%=contextPath%>/admin/user/admin_add_init";
        }
		
		function mod(id){
		   location.href = "<%=contextPath%>/admin/user/admin_mod_init/" + id;
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
			   	$.messager.alert("提示信息","请选择要删除的用户！","warning");
				return;
			}
		    var data = getUserIdsJSON(rows);
		    var ajaxUrl = "<%=contextPath%>/admin/admin/del";
			ajaxR(ajaxUrl,data,"是否要删除该用户?");
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