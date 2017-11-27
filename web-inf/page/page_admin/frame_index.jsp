<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="common.jsp" %>
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
    <style type="text/css">
		#welcome {
			float: right;
			margin: 2px 0px;
			padding: 0 30px;
			color: #888;
			line-height: 25px;
			border: 0px solid #fff;
		}
		
		
	</style>
	<script type="text/javascript">
		$(function() {
			var d = new Date();
			var year = d.getFullYear();
			var month = d.getMonth() + 1;
			var day = d.getDate();
			var mess = "今天是" + year + "年" + month + "月" + day + "日&nbsp;";			
			var userMess = $("#welcome").html();
			mess = mess + userMess;
			$("#welcome").html(mess);	
			
			initMenu();
		});
		
		function goToUrl(url){
           url = "<%=contextPath%>" + url;
           document.getElementById("mainFrame").setAttribute("src", url);
        }

		function updateTabName(tabTitle) {
			var currTab = $('#tabs').tabs('getSelected');
			$('#tabs').tabs('update', {
				tab : currTab,
				options : {
					title : tabTitle
				}
			});
		}
		
		function initMenu(){
			$('#main li a').click(function(){
				$('#main li div').removeClass("selected");
				$(this).parent().addClass("selected");
				var tabTitle = $(this).children('.nav').text();
				updateTabName(tabTitle);
			}).hover(function(){
				$(this).parent().addClass("hover");
			},function(){
				$(this).parent().removeClass("hover");
			});
		}
		
	</script>
</head>
<body class="easyui-layout">
	<div data-options="region:'north',border:true" style="height:32px;background:#E0ECFF;overflow:hidden;">
	 	<div id="welcome">
			欢迎您
			[
			<span>${sessionScope.sessionBean.userNick}</span>
			]
			<a target='_top' href='<%=contextPath%>/admin/logout'>退出系统</a>
		</div>
   	</div>
    <div data-options="region:'south',split:true,border:true" style="height:35px;background:#E0ECFF;padding-top:2px;">
    	<div style="text-align:center;padding:5px">
    		欢迎您提出宝贵建议，请发送邮件至反馈邮箱
		</div>	
    </div>
    <div data-options="region:'west',split:true,border:true" title="功能菜单" style="width:180px;padding:0px;">
    	<div id="main" class="easyui-accordion" data-options="fit:true,border:false">  
    		<c:forEach items="${menuTreeBean.children }" var="menu" varStatus="i">
	          <c:if test="${menu.url != null && menu.url != '' }">
	             <div title="${menu.text }" <c:if test="${i.index == 0 }">selected="true"</c:if> data-options="iconCls:'icon-sys-ct'" >
	                <ul>
	                   <li>
	                      <div>
	                         <a href="javascript:goToUrl('${menu.url }')" >
	                            <span class="icon icon-nav">&nbsp;</span><span class="nav">${menu.text }</span>
	                         </a>
	                      </div>
	                   </li>
	                </ul>
	             </div>
	          </c:if>
	          <c:if test="${menu.url == null || menu.url == '' }">
	             <div title="${menu.text }" <c:if test="${i.index == 0 }">selected="true"</c:if> data-options="iconCls:'icon-sys-ct'" >
	                <ul>
	                   <c:forEach items="${menu.children }" var="childMenu">
	                      <li>
	                         <div>
	                            <a href="javascript:goToUrl('${childMenu.url }')" >
	                               <span class="icon icon-nav">&nbsp;</span><span class="nav">${childMenu.text }</span>
	                            </a>
	                         </div>
	                      </li>
	                   </c:forEach>
	                </ul>
	             </div>
	          </c:if>
	       </c:forEach>
		</div>  
    </div>
    <div data-options="region:'center',border:false">
        <div id="tabs" class="easyui-tabs"
			data-options="fit:true,border:false"
			style="height: 100%; overflow: hidden;">
			<div style="overflow: hidden;" title="欢迎页" id="center-tabs"
				name="center-tabs">
				<iframe id="mainFrame" name="mainFrame" width="100%" height="100%"
					frameborder="0" scrolling="no"></iframe>
			</div>
		</div>
    </div> 
</body>
</html>