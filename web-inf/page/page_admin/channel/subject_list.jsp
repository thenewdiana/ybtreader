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
	       <form id="searchForm" name="searchForm" action="<%=contextPath%>/admin/channel/subject_list_json" method="post">
              <table >
              	<tr>
		            <th>频道：</th>
		            <td>
		            <input class="easyui-combobox" name="channelId" id="channelId" data-options="editable:false" value="${channelId}" />
		            </td>
		            <td><a href="javascript:search();" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">查询</a></td>
		         </tr>
		      </table>
           </form>
        </div>
        <div id="center" data-options="region:'center',border:false" width="90%">
        	<div id="buttons" class="toolbar-button">
	        	<auth:authenticator action='/admin/channel/subject_add_init'>
	        	<a href="javascript:add();" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">添加</a> 
	        	</auth:authenticator>
            </div>
           	<table id="subjectList" width="90%"> 
           	</table>
        </div>
    </div>
    <script type="text/javascript">
		$(function(){
			$.ajax({
				url:'<%=contextPath%>/admin/channel/list_json?noReset=1',
				type:"post",
				dataType:"json",
				editable:false,
				success:function(data,status){
		   	  		data.unshift({"id":"","name":"--请选择频道--"});
					$("#channelId").combobox({  
					    valueField:'id',  
					    textField:'name',
					    data:data
					});  
				}
			 });
		
			$("#subjectList").datagrid({
				title:'频道专题列表', 
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
			    url:'<%=contextPath%>/admin/channel/subject_list_json',
                columns:[[  
	                {field:'id',title:'ID',width:60},  
	                {field:'channelName',title:'所属频道',width:120},
	                {field:'subjectNick',title:'真实位置',width:120},
	                {field:'type',title:'推荐类型',width:120,formatter:formatType},
              		{field:'subjectTitle',title:'专题名称',width:120},
              		{field:'maxnum',title:'最大显示数量',width:120},
              		{field:'oper', title:'操作', width:210, formatter:function(value,row,index){
	                       var id = row.id; 
	                       var link = '<auth:authenticator action='/admin/channel/subject_mod_init/'><a class="editClass" href="javascript:mod(' + id + ');">编辑</a> </auth:authenticator>';
	                       link += '<auth:authenticator action='/admin/subject/book_list/'><a class="manageClass" href="javascript:bookManage(' + id + ');">图书管理</a> </auth:authenticator>';
	                       link += '<auth:authenticator action='/admin/channel/subject_del/'><a class="delClass" href="javascript:deleteSubject(' + id + ');">删除</a> </auth:authenticator>'; 
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
		        	$(".manageClass").linkbutton({iconCls:"icon-setting-ct",plain:true});
		        	$(".delClass").linkbutton({iconCls:"icon-del-ct",plain:true});
		        }
			});
		});
		
		function formatType(value){ 
   			var formatValue = "";
   			switch(value){
   				case 1: formatValue="普通推荐";
   				break;
	   			case 2: formatValue="专题推荐图书";
	   			break;
	   			case 3: formatValue="专题推荐链接";
	   			break;
	   			case 4: formatValue="热词";
	   			break;
	   			case 5: formatValue="文字链接";
	   			break;
   				default: formatValue="未知类型";
   			}
   			return formatValue; 
         } 
         
        function add(){
        	location.href = "<%=contextPath%>/admin/channel/subject_add_init";
        }
		
		function mod(id){
		   	location.href = "<%=contextPath%>/admin/channel/subject_mod_init/" + id;
		}
		
		function bookManage(id){
			location.href = "<%=contextPath%>/admin/subject/book_list/"+id;
		}
		
		function deleteSubject(id){
		    var ajaxUrl = "<%=contextPath%>/admin/channel/subject_del/"+id;
			ajaxR(ajaxUrl,null,"是否确定要删除此专题?");
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
									$("#subjectList").datagrid("reload");
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
			$('#subjectList').datagrid('options').queryParams = getParams('searchForm'); 
			$('#subjectList').datagrid('options').pageNumber = 1; 
			$('#subjectList').datagrid('reload'); //设置好查询参数 reload 一下就可以了  
		}
	</script>
</body>
</html>