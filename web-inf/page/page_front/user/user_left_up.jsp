<%@ page contentType="text/html; charset=UTF-8" %>
<div class="pictu ac">
	<a href="javascript:void(0)" title=""><c:if test="${sessionScope.sessionFrontBean.sex!=1}"><img src="${sessionScope.sessionFrontBean.userpic}" onerror="this.src='${sessionScope.customUrl}defaultAvatar/man.jpg'" width="80" height="80"/></c:if><c:if test="${sessionScope.sessionFrontBean.sex==1}"><img src="${sessionScope.sessionFrontBean.userpic}" onerror="this.src='${sessionScope.customUrl}defaultAvatar/male.jpg'" width="80" height="80"/></c:if> </a>
	<p class="strong"><a class="auto-img">${sessionScope.sessionFrontBean.userNick}</a><c:if test="${sessionScope.sessionFrontBean.vipValue!=0}"><img src="${sessionScope.baseUrl}pc/images/v${sessionScope.sessionFrontBean.vipValue}.png" width="21" height="16" /></c:if></p>
    <p class="white"><a href="${pageContext.request.contextPath }/user/notice/list" title="">消息</a> <a href="${pageContext.request.contextPath }/user/accounts" title="">设置</a> <a href="${pageContext.request.contextPath }/user/logout" title="">退出</a></p>
    
</div>

