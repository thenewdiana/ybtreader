<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title><spring:message code="admin.global.title"></spring:message></title>
	<link type="text/css" rel="stylesheet" href="${sessionScope.baseUrl}pc/css/default.css" />
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
	       <form id="searchForm" name="searchForm" action="" method="post">
              <table>
		         <tr>
		            <th>书名：</th>
		            <td><input type="text" id="name" name="name" style="width:123px;"/></td>
		            <td><a href="javascript:search();" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">查询</a></td>
					 <auth:authenticator action="/admin/zj/book/statement">
						 <td><a href="javascript:statement();" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">结算</a></td>
					 </auth:authenticator>
		         </tr>
		      </table>
           </form>
        </div>
        <div id="center" data-options="region:'center',border:false" width="90%">
        	<div id="tb" class="datagrid-toolbar">
        		<auth:authenticator action="/admin/zj/book/info/">
	        		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" onclick="bookEdit();">编辑</a>
	        	</auth:authenticator>
				<a href="javascript:void(0);"style="float:right;margin-right:100px;">&nbsp;</a>
				<auth:authenticator action="/admin/zj/rater/score/edit">
				<a href="#" style="float:right;" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" onclick="raterScoreEditInit();">本周评委<span id="raterScoreShow">${raterScore.dataValue}</span>分/票</a>
				</auth:authenticator>
				<auth:authenticator action="/admin/zj/compiler/score/edit">
				<a href="#" style="float:right;" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" onclick="compilerScoreEditInit();">本周编辑<span id="compilerScoreShow">${compilerScore.dataValue}</span>分/票</a>
				</auth:authenticator>
			</div>

            <table id="list" width="90%">
            </table>
			<div id="bookEditWindow" class="easyui-window" title="编辑" data-options="draggable:false,modal:true,closed:true,minimizable:false,maximizable:false,collapsible:false" style="width:400px;height:300px;padding:10px" ></div>
			<div id="compilerScoreWindow" class="easyui-window" title="编辑分设置" data-options="draggable:false,modal:true,closed:true,minimizable:false,maximizable:false,collapsible:false" style="width:150px;height:120px;padding:10px" >
				<form id="compilerScoreForm" method="post">
					<input type="text" id="compilerScore" name="compilerScore" style="width:123px;" value="${compilerScore.dataValue}"/>
					<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" onclick="compilerScoreEdit();">修改编辑分</a>
				</form>
			</div>
			<div id="raterScoreWindow" class="easyui-window" title="评委分设置" data-options="draggable:false,modal:true,closed:true,minimizable:false,maximizable:false,collapsible:false" style="width:150px;height:120px;padding:10px" >
				<form id="raterScoreForm" method="post">
					<input type="text" id="raterScore" name="raterScore" style="width:123px;" value="${raterScore.dataValue}"/>
					<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" onclick="raterScoreEdit();">修改评委分</a>
				</form>
			</div>
			<div id="compilerVoteWindow" class="easyui-window" title="编辑投票" data-options="draggable:false,modal:true,closed:true,minimizable:false,maximizable:false,collapsible:false" style="width:220px;height:150px;padding:10px" >
				<form id="compilerVoteForm" method="post">
					<input type="hidden" id="compilerBookId" name="bookId" style="width:123px;" />
					作品名称：<span id="compilerBookName"></span><br/>
					编辑名称：<input type="text" id="compilerName" name="compilerName" style="width:123px;" />
					<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" onclick="compilerVote();">投票</a>
				</form>
			</div>
			<div id="raterVoteWindow" class="easyui-window" title="评委投票" data-options="draggable:false,modal:true,closed:true,minimizable:false,maximizable:false,collapsible:false" style="width:220px;height:150px;padding:10px" >
				<form id="raterVoteForm" method="post">
					<input type="hidden" id="raterBookId" name="bookId" style="width:123px;" />
					作品名称：<span id="raterBookName"></span><br/>
					评委名称：<input type="text" id="raterName" name="raterName" style="width:123px;" />
					<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" onclick="raterVote();">投票</a>
				</form>
			</div>
        </div>
    </div>

    <script type="text/javascript">
		$(function(){
			$("#list").datagrid({
	        	title:'书籍列表',
				fit:true,
				toolbar: '#tb',
                showFooter:true,
				queryParams:getParams('searchForm'),
				pagination:true,
				pageNumber:1,
				pageSize:20,
			    loadMsg:'数据加载中....',
			    striped: true,
			    singleSelect:true,
			    url:'<%=contextPath%>/admin/zj/book/rankList_json',
                columns:[[
	                {field:'bookId',title:'书籍ID',width:$(this).width()*0.05},
              		{field:'bookName',title:'书名',width:$(this).width()*0.1},
                    {field:'click',title:'点击',width:$(this).width()*0.1},
                    {field:'rss',title:'订阅',width:$(this).width()*0.1},
                    {field:'golden',title:'金票',width:$(this).width()*0.1},
                    {field:'reward',title:'打赏',width:$(this).width()*0.1},
              		{field:'realHot',title:'真实hot',width:$(this).width()*0.1,sortable:true},
              		{field:'frontHot',title:'线上hot',width:$(this).width()*0.1,sortable:true},
                    {field:'oper', title:'编辑分', width:$(this).width()*0.1, formatter:function(value,row,index){
                        var bookId = row.bookId;
                        var bookName = row.bookName;
                        var link = row.compilerScore+'&nbsp;&nbsp;<auth:authenticator action='/admin/zj/compiler/score/vote'><a class="editClass" href="javascript:compilerVoteInit(' + bookId + ',\''+bookName+'\');">投票</a> </auth:authenticator>';
                        return link;
                    }},
                    {field:'oper1', title:'评委分', width:$(this).width()*0.1, formatter:function(value,row,index){
                        var bookId = row.bookId;
                        var bookName = row.bookName;
                        var link = row.raterScore+'&nbsp;&nbsp;<auth:authenticator action='/admin/zj/rater/score/vote'><a class="editClass" href="javascript:raterVoteInit(' + bookId + ',\''+bookName+'\');">投票</a> </auth:authenticator>';
                        return link;
                    }}
            	]],
                onLoadSuccess:function(){
                    $(".editClass").linkbutton({iconCls:"icon-edit"});
                },
                sortName:'front_hot',
                sortOrder:'desc'
			});
		});
		
		function search(){  
	        $('#list').datagrid('options').queryParams = getParams('searchForm'); 
	        $('#list').datagrid('options').pageNumber = 1; 
	      	$('#list').datagrid('getPager').pagination({pageNumber:1});
	        $('#list').datagrid('reload'); //设置好查询参数 reload 一下就可以了  
    	}

        function bookEdit(){
            var rows = $('#list').datagrid('getSelections');
            if(rows.length == 0 || rows.length > 1){
                $.messager.alert("提示信息","请选择要修改的图书！","warning");
                return;
            }
            $('#bookEditWindow').window('refresh','<%=contextPath%>/admin/zj/book/info/'+rows[0].bookId);
            $('#bookEditWindow').window('open');
        }

        function compilerScoreEditInit(){
            $('#compilerScoreWindow').window('open');
        }

        function compilerScoreEdit(){
            var data = getFormToJsonString('compilerScoreForm');
            var ajaxUrl = "<%=contextPath%>/admin/zj/compiler/score/edit";
            $.ajax({
                type:"POST",
                url:ajaxUrl,
                data:data,
                dataType : "json",
                success : function(data) {
                    if(data.result){
                        $("#compilerScoreShow").text(data.obj.dataValue);
                        $("#compilerScore").val(data.obj.dataValue);
                        $.messager.alert('提示',data.msg,'info');
                    }else{
                        $.messager.alert('提示',data.msg,'error');
                    }
                },
                error : function(msg) {
                    $.messager.alert("提示", msg, "error");
                }
            });
            $('#compilerScoreWindow').window('close');
        }

        function compilerVoteInit(bookId,bookName){
            $("#compilerBookId").val(bookId);
            $("#compilerBookName").text(bookName);
            $('#compilerVoteWindow').window('open');
		}

        function compilerVote(){
            var data = getFormToJsonString('compilerVoteForm');
            var ajaxUrl = "<%=contextPath%>/admin/zj/compiler/score/vote";
            $.ajax({
                type:"POST",
                url:ajaxUrl,
                data:data,
                dataType : "json",
                success : function(data) {
                    if(data.result){
                        $.messager.alert('提示',data.msg,'info',function(){
                            $('#compilerVoteWindow').window('close');
                            $("#compilerBookId").val('');
                            $("#compilerBookName").text('');
                            $("#compilerName").val('');
                            $("#list").datagrid("reload");
                        });
                    }else{
                        $.messager.alert('提示',data.msg,'error');
                    }
                },
                error : function(msg) {
                    $.messager.alert("提示", msg, "error");
                }
            });
        }

        function raterScoreEditInit(){
            $('#raterScoreWindow').window('open');
        }

        function raterScoreEdit(){
            var data = getFormToJsonString('raterScoreForm');
            var ajaxUrl = "<%=contextPath%>/admin/zj/rater/score/edit";
            $.ajax({
                type:"POST",
                url:ajaxUrl,
                data:data,
                dataType : "json",
                success : function(data) {
                    if(data.result){
                        $("#raterScoreShow").text(data.obj.dataValue);
                        $("#raterScore").val(data.obj.dataValue);
                        $.messager.alert('提示',data.msg,'info');
                    }else{
                        $.messager.alert('提示',data.msg,'error');
                    }
                },
                error : function(msg) {
                    $.messager.alert("提示", msg, "error");
                }
            });
            $('#raterScoreWindow').window('close');
        }

        function raterVoteInit(bookId,bookName){
            $("#raterBookId").val(bookId);
            $("#raterBookName").text(bookName);
            $('#raterVoteWindow').window('open');
        }

        function raterVote(){
            var data = getFormToJsonString('raterVoteForm');
            var ajaxUrl = "<%=contextPath%>/admin/zj/rater/score/vote";
            $.ajax({
                type:"POST",
                url:ajaxUrl,
                data:data,
                dataType : "json",
                success : function(data) {
                    if(data.result){
                        $.messager.alert('提示',data.msg,'info',function(){
                            $('#raterVoteWindow').window('close');
                            $("#raterBookId").val('');
                            $("#raterBookName").text('');
                            $("#raterName").val('');
                            $("#list").datagrid("reload");
                        });
                    }else{
                        $.messager.alert('提示',data.msg,'error');
                    }
                },
                error : function(msg) {
                    $.messager.alert("提示", msg, "error");
                }
            });
        }

        function statement(){
            var ajaxUrl = "<%=contextPath%>/admin/zj/book/statement";
            $.ajax({
                type:"POST",
                url:ajaxUrl,
                dataType : "json",
                success : function(data) {
                    if(data.result){
                        $.messager.alert('提示',data.msg,'info',function(){
                            $("#list").datagrid("reload");
                        });
                    }else{
                        $.messager.alert('提示',data.msg,'error');
                    }
                },
                error : function(msg) {
                    $.messager.alert("提示", msg, "error");
                }
            });
		}

        function closeWindow() {
            $('#bookEditWindow').window('close');
        }
	</script>
</body>
</html>