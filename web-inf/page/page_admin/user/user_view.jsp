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
	<div class="easyui-layout" data-options="fit:true" >
		<div id="center" data-options="region:'center',border:false"
			style="padding:5px;">
			<div id="planPanel" title="修改会员" class="easyui-panel"
				data-options="border:true" style="padding:5px;">
				
				<form id="viewForm" name="viewForm" method="post">
					<div id="planPanel-base" title="基本信息" class="easyui-panel"
						data-options="border:true" style="padding:5px;">
						<input type="hidden" name="id" id="id" value="${user.id}" />
						<table class="promodify" cellspacing="1">
						    <tr>
								<td class="info">用户名：</td>
								<td>${user.name}</td>
							</tr>
							<tr>
								<td class="info">昵称：</td>
								<td>${user.nick}</td>
							</tr>
							<tr>
								<td class="info">是否审核：</td>
								<td>
									<input type="radio" name="hasChecked" value=1 <c:if test="${user.hasChecked==1}">checked="checked"</c:if> disabled="disabled" />审核通过
									<input type="radio" name="hasChecked" value=0 <c:if test="${user.hasChecked==0}">checked="checked"</c:if> disabled="disabled" />待审核
								</td>
							</tr>
							<tr>
								<td class="info">邮箱：</td>
								<td>${user.email}</td>
							</tr>
							<tr>
								<td class="info">是否作家：</td>
								<td>
									<input type="radio" name="hasWriter" value=1 <c:if test="${user.hasWriter==1}">checked="checked"</c:if> disabled="disabled" />是
									<input type="radio" name="hasWriter" value=0 <c:if test="${user.hasWriter==0}">checked="checked"</c:if> disabled="disabled" />否
								</td>
							</tr>
						</table>
					</div>
					
					<div id="planPanel-senior" title="作家信息" class="easyui-panel"
						data-options="border:true" style="padding:5px;">
					
					
					<table class="promodify" cellspacing="1">
					    <tr>
							<td class="info">真实姓名：</td>
							<td>${user.realName}</td>
						</tr>
						<tr>
							<td class="info">身份证号：</td>
							<td>${user.idcard}</td>
						</tr>
<!-- 						<tr> 笔名无作用，去掉-->
<!-- 							<td class="info">笔名：</td> -->
<!-- 							<td>${user.penName}</td> -->
<!-- 						</tr> -->
						<tr>
							<td class="info">手机号：</td>
							<td>${user.mobile}</td>
						</tr>
						<tr>
							<td class="info">通讯地址：</td>
							<td>${user.address}</td>
						</tr>
						<tr>
							<td class="info">QQ号码：</td>
							<td>${user.qq}</td>
						</tr>
						<tr>
							<td class="info">个人简介：</td>
							<td>
								<textarea rows="4" disabled="disabled" cols="66" name="intro" id="intro"><c:out value="${user.intro }" escapeXml="true"/>
								</textarea><span class=notice></span>
							</td>
						</tr>
					</table>
					</div>
					
					<div align="center">
						<a id="goback" onclick="goback();" class="easyui-linkbutton" data-options="iconCls:'icon-back',plain:true">返回</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function goback(){
			window.location.href='<%=contextPath%>/admin/user/frontList';
		}	
		
	</script>

</body>
</html>