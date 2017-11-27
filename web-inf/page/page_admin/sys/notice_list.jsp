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
        		<auth:authenticator action="/admin/notice/add">
	        	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="add();">增加</a>
	        	</auth:authenticator>
			</div>
		        	
            <table id="list" width="90%">
            </table>
        </div>
    </div>
	<div style="display:none">
		<form name="listForm" method="post" id="listForm" target="_self">
		</form>
	</div>
    <script type="text/javascript">
		$(function(){
			$("#list").datagrid({
	        	title:'公告列表', 
				fit:true,
				toolbar: '#tb',
				pagination:true,
				pageNumber:1,
				pageSize:20,
			    loadMsg:'数据加载中....',
			    striped: true, 
			    singleSelect:true,
			    url:'<%=contextPath%>/admin/notice/list_json',
                columns:[[  
	                {field:'id',title:'ID',width:100,width:50},
	                {field:'noticeTypeName',title:'类型',width:80},
              		{field:'title',title:'标题',width:$(this).width()*0.2},
              		{field:'text',title:'内容',width:$(this).width()*0.3},
                    {field:'createTime',title:'发送时间',width:150,formatter:formatDate},
              		{field:'oper', title:'操作', width:$(this).width()*0.1, formatter:function(value,row,index){
	                       var id = row.id; 
	                       var link = '<auth:authenticator action='/admin/notice/edit'><a class="editClass" href="javascript:mod(' + id + ');">编辑</a> </auth:authenticator>';
	                       link += '<auth:authenticator action='/admin/notice/del'><a class="delClass" href="javascript:del(' + id + ');">删除</a> </auth:authenticator>'; 
	                       return link;
                    	}
                    }
            	]],
		        onLoadSuccess:function(){
		        	$(".editClass").linkbutton({iconCls:"icon-edit",plain:true});
		        	$(".delClass").linkbutton({iconCls:"icon-del-ct",plain:true});
		        }
			});
		});
		

		function add() {
			$("#listForm").attr("action","<%=contextPath %>/admin/notice/add_init");
			$("#listForm").submit();
		}
		
		function mod(id){
		   	location.href = "<%=contextPath%>/admin/notice/edit_init?id=" + id;
		}
		
		function del(id){
		    var ajaxUrl = "<%=contextPath%>/admin/notice/del";
			ajaxR(ajaxUrl,"id="+id,"是否确定要删除此条记录吗?");
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