<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../common.jsp" %>
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
        <div id="center" data-options="region:'center',border:false" width="90%">		        	
            <table id="list" width="90%">
            </table>
        </div>
    </div>
    <script type="text/javascript">
		$(function(){
			$("#list").datagrid({
	        	title:'缓存管理',
				fit:true,
				queryParams:getParams('searchForm'),
			    loadMsg:'数据加载中....',
			    striped: true,
                singleSelect:true,
			    url:'<%=contextPath%>/admin/ehcache/list_json',
                columns:[[  
	                {field:'name',title:'缓存名称',width:$(this).width()*0.4},
                    {field:'key',title:'缓存类型',width:$(this).width()*0.4},
                    {field:'oper', title:'操作', width:$(this).width()*0.2, formatter:function(value,row,index){
                        var key = row.key;
                        var link = '<auth:authenticator action='/admin/ehcache/clean'><a class="delClass" href="javascript:cleanKey(\'' + key + '\');">清除</a> </auth:authenticator>';
                        return link;
                    }
                    }
            	]]
			});
		});

        function cleanKey(key){
            var ajaxUrl = "<%=contextPath%>/admin/ehcache/clean";
            ajaxR(ajaxUrl,"key="+key,"是否确定要清除此缓存?");
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
	</script>
</body>
</html>