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
	<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/time.js"></script>
</head>
  
<body>
	<div class="easyui-layout" data-options="fit:true" >
		<div id="center" data-options="region:'center',border:false"
			style="padding:5px;">
			<form id="viewForm" name="viewForm" method="post">
				<div id="planPanel-base" title="反馈详情" class="easyui-panel"
					 data-options="border:true" style="padding:5px;">
					<input type="hidden" name="id" id="id" value="${feedback.id}" />
					<table class="promodify" cellspacing="1">
						<tr>
							<td class="info">反馈人id：</td>
							<td>${feedback.userId}</td>
						</tr>
						<tr>
							<td class="info">反馈人登录名：</td>
							<td>${feedback.userNick}</td>
						</tr>
						<tr>
							<td class="info">反馈时间：</td>
							<td class="yyyyMMddHHmm">${feedback.createTime}</td>
						</tr>
						<tr>
							<td class="info">反馈内容：</td>
							<td>${feedback.content}</td>
						</tr>
					</table>
				</div>
				<div align="center">
					<a id="goback" onclick="goback();" class="easyui-linkbutton" data-options="iconCls:'icon-back',plain:true">返回</a>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript">
		function goback(){
			window.location.href='<%=contextPath%>/admin/user/feedback/list';
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