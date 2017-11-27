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
           	<table id="feedbackList" width="90%">
           	</table>
        </div>
    </div>
    <script type="text/javascript">
		$(function(){
			$("#feedbackList").datagrid({
	        	title:'用户反馈查询',
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
			    url:'<%=contextPath%>/admin/user/feedback/list_json',
                columns:[[
                    {field:'id',title:'反馈ID',width:60,
                        formatter : function(value,row,index) {
                            return "<a href='<%=contextPath%>/admin/user/feedback/view/" + row.id + "'>" + value + "</a>";
			        }},
              		{field:'content',title:'反馈内容',width:500},
                    {field:'userId',title:'反馈人id',width:100},
              		{field:'userNick',title:'反馈人登录名',width:150},
              		{field:'createTime',title:'反馈时间',width:150,formatter:formatDate},
              		{field:'phoneOsType',title:'手机类型',width:150},
              		{field:'version',title:'用户版本',width:150}
            	]],
            	onBeforeLoad:function(){
            		if($("#buttons a").length == 0){
            			$(".datagrid-toolbar").hide();
            		}
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
	</script>
</body>
</html>