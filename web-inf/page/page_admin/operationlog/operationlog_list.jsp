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
	       <form id="searchForm" name="searchForm" action="<%=contextPath%>/admin/operlog/list_json" method="post">
              <table >
		         <tr>
		            <th>用户名：</th>
		            <td><input type="text" id="userName" name="userName" style="width:123px;"/></td>
		            <th>URL：</th>
		            <td><input type="text" id="operUrl" name="operUrl" style="width:123px;"/></td>
		            <td><a href="javascript:search();" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">查询</a></td>
		         </tr>
		      </table>
           </form>
        </div>
        <div id="center" data-options="region:'center',border:false" width="90%">
           	<table id="operlogList" width="90%">
           	</table>
        </div>
    </div>
    <script type="text/javascript">
		$(function(){
			$("#operlogList").datagrid({
	        	title:'操作记录查询', 
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
			    url:'<%=contextPath%>/admin/operlog/list_json',
                columns:[[  
	                {field:'id',title:'操作ID',width:60},  
              		{field:'userName',title:'操作人',width:120},
              		{field:'operModule',title:'操作模块',width:80},
              		{field:'operDes',title:'操作详情',width:300},
              		{field:'createTime',title:'操作时间',width:120,formatter:formatDate},
              		{field:'operUrl',title:'操作url',width:120,
              			formatter:function(value,rec){
              				var link = '<p title="'+rec.operUrl+'">'+rec.operUrl+'</p>';
                        	return link;
              			}
              		},
              		{field:'operParam',title:'操作参数',width:120,
              			formatter:function(value,rec){
              				var link = '<p title="'+rec.operParam+'">'+rec.operParam+'</p>';
                        	return link;
              			}
              		}
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
         
		function search(){  
			$('#operlogList').datagrid('options').queryParams = getParams('searchForm');
			$('#operlogList').datagrid('options').pageNumber = 1;
			$('#operlogList').datagrid('getPager').pagination({pageNumber:1});
			$('#operlogList').datagrid('reload'); //设置好查询参数 reload 一下就可以了
		}
	</script>
</body>
</html>