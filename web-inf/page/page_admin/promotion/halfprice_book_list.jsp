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
		<div id="north" title="半价时间"  style="background-color: #E0ECFF;height:60px;"
			 data-options="region:'north',border:false"  width="90%">
			<table >
				<tr>
					<th>半价时间：</th>
					<td id="startTimeStr">${dictData.dataKey}</td>
					<th></th>
					<td>--</td>
					<th></th>
					<td id="endTimeStr">${dictData.dataValue}</td>
					<th></th>
					<td>&nbsp;&nbsp;</td>
					<td><a href="javascript:showDlg();" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">修改</a></td>
				</tr>
			</table>
		</div>
        <div id="center" data-options="region:'center',border:false" width="90%">
			<div id="buttons" class="toolbar-button">
	        	<auth:authenticator action='/admin/halfprice/add_init'>
	        	<a href="javascript:add();" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">添加</a> 
	        	</auth:authenticator>
	        	<auth:authenticator action='/admin/halfprice/saveBookList'> 
	        	<a href="javascript:move(true);" class="easyui-linkbutton" data-options="iconCls:'icon-up-ct',plain:true">上移</a>
	        	</auth:authenticator>
	        	<auth:authenticator action='/admin/halfprice/saveBookList'>
	        	<a href="javascript:move(false);" class="easyui-linkbutton" data-options="iconCls:'icon-down-ct',plain:true">下移</a>
	        	</auth:authenticator>
	        	<auth:authenticator action='/admin/halfprice/saveBookList'>
	        	<a href="javascript:saveBookList();" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true">提交</a>
	        	</auth:authenticator>
            </div>
           	<table id="bookList" width="90%">
           	</table>
        </div>
    </div>
	<div id="time_dlg" class="easyui-dialog" title="修改半价有效期" style="width:380px;height:350px;"
		 data-options="
                iconCls: 'icon-edit',
                closed: true,
                buttons: '#time_dlg-buttons'">
		<br>
		<form id='timeInfo'>
			<table>
				<tr>
					<td>开始时间：</td>
					<td>
						<input type="text" id="startTime" class="easyui-datetimebox" data-options="required:true" editable="false"  style="width:250px;height:30px"/>
					</td>
				</tr>
				<tr>
					<td>结束时间：</td>
					<td>
						<input type="text" id="endTime" class="easyui-datetimebox" data-options="required:true" editable="false" style="width:250px;height:30px"/>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div id="time_dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="saveTime();">保存</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#time_dlg').dialog('close');">关闭</a>
	</div>
    <script type="text/javascript">
		$(function(){
			$("#bookList").datagrid({
	        	title:'半价图书列表', 
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
			    url:'<%=contextPath%>/admin/halfprice/list_json?noReset=1',
                columns:[[  
	                {field:'id',title:'ID',width:60},  
	                {field:'sort',title:'显示顺序',width:120},
              		{field:'recommTitle',title:'推荐标题',width:120},
              		{field:'recommDesc',title:'推荐描述',width:120},
              		{field:'startTime',title:'开始时间',width:120,formatter:formatDate},
              		{field:'endTime',title:'结束时间',width:120,formatter:formatDate},
              		{field:'createTime',title:'推荐时间',width:120,formatter:formatDate},
              		{field:'oper', title:'操作', width:120, formatter:function(value,row,index){
	                       var id = row.id; 
	                       var link = '<auth:authenticator action='/admin/halfprice/mod_init/'><a class="editClass" href="javascript:mod(' + id + ');">编辑</a> </auth:authenticator>';
	                       link += '<auth:authenticator action='/admin/halfprice/del/'><a class="delClass" href="javascript:deleteBook(' + id + ');">删除</a> </auth:authenticator>'; 
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
        	location.href = "<%=contextPath%>/admin/halfprice/add_init";
        }
		
		function mod(id){
		   	location.href = "<%=contextPath%>/admin/halfprice/mod_init/" + id;
		}
		
		function deleteBook(id){
		    var ajaxUrl = "<%=contextPath%>/admin/halfprice/del";
			ajaxR(ajaxUrl,"id="+id,"是否确定要删除此图书?");
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

		function showDlg(){
            $.ajax({
                type:"POST",
                url: "<%=contextPath%>/admin/promotion/mod_init/halfprice",
                dataType : "json",
                success : function(result) {
                    if(result.result){
                        var dictData = result.obj;
                        $('#startTime').datetimebox('setValue', dictData.dataKey);
                        $('#endTime').datetimebox('setValue', dictData.dataValue);
			 			$('#time_dlg').dialog('open');
                    }else{
                        $.messager.alert('提示',result.msg,'error');
                    }
                }
            });
		}

        function saveTime(){

            var isValid = $('#timeInfo').form('validate');
            if(!isValid){
                return;
            }
            var startTime = $("#startTime").datetimebox("getValue");
            var endTime = $("#endTime").datetimebox("getValue");

            $.ajax({
                type:"POST",
                url: "<%=contextPath%>/admin/promotion/mod/halfprice",
                data:{startTime:startTime,endTime:endTime},
                dataType : "json",
                success : function(result) {
                    if(result.result){
                        $("#startTimeStr").html(startTime);
                        $("#endTimeStr").html(endTime);
                        $.messager.show({title : 'Success',msg : result.msg});
                        $('#time_dlg').dialog('close');
                    }else{
                        $.messager.alert('提示',result.msg,'error');
                    }
                }
            });
        }
	</script>
</body>
</html>