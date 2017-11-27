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
        	<form id="searchForm" name="searchForm" action="<%=contextPath%>/admin/subject/subject_book_json" method="post">
				<input type="hidden" name="subjectId" id="subjectId" value="${subjectId}" />
			</form>
        	<div id="buttons" class="toolbar-button">
	        	<auth:authenticator action='/admin/subject/rec_url_add_init'>
	        	<a href="javascript:add();" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">添加</a> 
	        	</auth:authenticator>
	        	<a href="javascript:goback();" class="easyui-linkbutton" data-options="iconCls:'icon-back',plain:true">返回</a>
	        	<a href="javascript:move(true);" class="easyui-linkbutton" data-options="iconCls:'icon-up-ct',plain:true">上移</a>
	        	<a href="javascript:move(false);" class="easyui-linkbutton" data-options="iconCls:'icon-down-ct',plain:true">下移</a>
	        	<a href="javascript:saveBookList();" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true">提交</a> 
            </div>
           	<table id="bookList" width="90%">
           	</table>
        </div>
    </div>
    <script type="text/javascript">
		$(function(){
			$("#bookList").datagrid({
	        	title:'文字链接列表', 
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
			    url:'<%=contextPath%>/admin/subject/book_list_json?noReset=1',
                columns:[[  
	                {field:'id',title:'ID',width:60},  
	                {field:'sort',title:'显示顺序',width:120},
	                {field:'recommTitle',title:'推荐文字',width:120},
	                {field:'recommDesc',title:'推荐描述',width:120},
              		{field:'picUrl',title:'banner',width:400,
	                	formatter:function(value,rec){ 
	                		if (value){
	                 			var link = "<a href='${sessionScope.customUrl}"+value+"' target='_blank'><img src='${sessionScope.customUrl}"+value+"' onload='if(this.width>400){this.width=400;}'  onerror='this.src=\"${sessionScope.baseUrl}pc/images/error.jpg\"' /></a>";
	                 			return link; 
                 			}
                 			return value;
                        }  
	                },
              		{field:'oper', title:'操作', width:120, formatter:function(value,row,index){
	                       var id = row.id; 
	                       var link = '<auth:authenticator action='/admin/subject/text_link_mod/'><a class="editClass" href="javascript:mod(' + id + ');">编辑</a> </auth:authenticator>';
	                       link += '<auth:authenticator action='/admin/subject/book_del/'><a class="delClass" href="javascript:deleteBook(' + id + ');">删除</a> </auth:authenticator>'; 
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
		        	$(".delClass").linkbutton({iconCls:"icon-del-ct",plain:true});
		        }
			});
		});
         
        function add(){
        	location.href = "<%=contextPath%>/admin/subject/text_link_add_init?subjectId="+${subjectId};
        }
		
		function mod(id){
		   	location.href = "<%=contextPath%>/admin/subject/text_link_mod_init/" + id;
		}
		
		function deleteBook(id){
		    var ajaxUrl = "<%=contextPath%>/admin/subject/book_del";
			ajaxR(ajaxUrl,"csbId="+id,"是否确定要删除此推荐?");
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
									$("#bookList").datagrid("reload");
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
		
		function formatDate(value){ 
   			var formatValue = "";
   			if (value){
   				var t = new Date(parseInt(value));
		     	formatValue = t.getFullYear()+"-"+(t.getMonth()+1)+"-"+t.getDate();
		     	var hh = t.getHours();
	            var mm = t.getMinutes();
	            if(hh<10){ hh = '0'+hh;}
	            if(mm<10){ mm = '0'+mm;}
	            formatValue += " "+hh+":"+mm
   			}
   			return formatValue; 
         }  
         
        function goback(){
			window.location.href='<%=contextPath%>/admin/channel/subject_list?isReset=1';
		}	
		
		function search(){  
			$('#subjectList').datagrid('options').queryParams = getParams('searchForm'); 
			$('#subjectList').datagrid('options').pageNumber = 1; 
			$('#subjectList').datagrid('getPager').pagination({pageNumber:1});
			$('#subjectList').datagrid('reload'); //设置好查询参数 reload 一下就可以了  
		}
		
		function move(isUp) {
	        var selections = $("#bookList").datagrid("getSelections");
	        if(selections.length == 0){
	                return;
	        }
	        if(selections.length > 1){
	                $.messager.alert("提示","一次只能移动一条数据!","info");
	                return;
	        }
	    	var $view = $('div.datagrid-view');
	        var index = $("#bookList").datagrid('getRowIndex',selections[0]);
	        var $row = $view.find('tr[datagrid-row-index=' + index + ']');
	        if (isUp) {
                $row.each(function(){
                    var prev = $(this).prev();
                    prev.length && $(this).insertBefore(prev);
                });
		    } else {
                $row.each(function(){
                	var next = $(this).next();
                    next.length && $(this).insertAfter(next);
                });
		    }
		}
		
		function saveBookList() {
	        var selectAll = $("#bookList").datagrid('selectAll');
	        var rows = $("#bookList").datagrid('getSelections');
	        var ids = [];
	        for(var i = 0; i < rows.length; i++){
	        	ids.push(rows[i].id);
	        }
	        $.post('<%=contextPath%>/admin/subject/saveBookList',{'ids':ids.join(";")},function(data){  
	            $.messager.alert('提示',data.msg,'info',function(){
	            	$('#bookList').datagrid('reload');   
	            });  
	            $(".panel-tool-close").hide();
         	},'json'); 
		}
	</script>
</body>
</html>