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
        		<auth:authenticator action="/admin/inter_link/linkadd">
	        		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="add();">增加</a>
	        	</auth:authenticator>
			</div>
			
           	<table id="interLinkList" width="90%">
           	</table>
        </div>
    </div>
    <div style="display:none">
		<form name="listForm" method="post" id="listForm" target="_self">
		</form>
	</div>
    <script type="text/javascript">
		$(function(){
			$("#interLinkList").datagrid({
	        	title:'友情链接查询',
				fit:true,
				toolbar: '#tb',
				pagination:true,
				pageNumber:1,
				pageSize:20,
			    loadMsg:'数据加载中....',
			    striped: true, 
			    singleSelect:true,
			    url:'<%=contextPath%>/admin/inter_link/list_json',
                columns:[[
                    {field:'id',title:'ID',width:$(this).width()*0.05},  
              		{field:'linkName',title:'链接名',width:100},
                    {field:'linkUrl',title:'链接地址',width:500},
              		{field:'userId',title:'操作人id',width:150},
              		{field:'createTime',title:'创建时间',width:150,formatter:formatDate},
              		{field:'modifyTime',title:'修改时间',width:150,formatter:formatDate},
              		{field:'oper', title:'操作', width:$(this).width()*0.1, formatter:function(value,row,index){
	                       var id = row.id; 
	                       var link = '<auth:authenticator action='/admin/inter_link/edit'><a class="editClass" href="javascript:mod(' + id + ');">编辑</a> </auth:authenticator>';
	                       link += '<auth:authenticator action='/admin/inter_link/del'><a class="delClass" href="javascript:del(' + id + ');">删除</a> </auth:authenticator>'; 
	                       return link;
                 	}
                 }
            	]],
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
		
		function add() {
			$("#listForm").attr("action","<%=contextPath %>/admin/inter_link/linkadd_init");
			$("#listForm").submit();
		}
		
		function mod(id){
		   	location.href = "<%=contextPath%>/admin/inter_link/edit_init?id=" + id;
		}
		
		function del(id){
		    var ajaxUrl = "<%=contextPath%>/admin/inter_link/del";
			ajaxR(ajaxUrl,"id="+id,"是否确定要删除此条记录吗?");
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
									$("#interLinkList").datagrid("reload");
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
	</script>
</body>
</html>