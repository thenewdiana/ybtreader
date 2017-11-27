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
        		<auth:authenticator action="/admin/message/add_init">
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
	        	title:'站内信列表', 
				fit:true,
				toolbar: '#tb',
				pagination:true,
				pageNumber:1,
				pageSize:20,
			    loadMsg:'数据加载中....',
			    striped: true, 
			    singleSelect:true,
			    url:'<%=contextPath%>/admin/message/list_json',
                columns:[[  
	                {field:'id',title:'ID',width:100,width:$(this).width()*0.1},
              		{field:'title',title:'标题',width:$(this).width()*0.2},
              		{field:'contentText',title:'内容',width:$(this).width()*0.4},
                    {field:'createTime',title:'发送时间',width:$(this).width()*0.2,formatter:formatDate}
            	]]
			});
		});
		

		function add() {
			$("#listForm").attr("action","<%=contextPath %>/admin/message/add_init");
			$("#listForm").submit();
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
				
	</script>
</body>
</html>