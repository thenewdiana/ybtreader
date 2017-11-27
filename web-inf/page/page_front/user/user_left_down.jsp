<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common.jsp" %>
<div class="pict f14 strong">
    <ul>
        <li class="img1 <c:if test="${param.menu == 'index' }">on</c:if>"><a href="${pageContext.request.contextPath }/user" title="用户首页">用户首页</a></li>
        <li class="img2 <c:if test="${param.menu == 'accounts' }">on</c:if>"><a href="${pageContext.request.contextPath }/user/accounts" title="个人设置">个人设置</a></li>
        <li class="img3 <c:if test="${param.menu == 'bank' }">on</c:if>"><a href="${pageContext.request.contextPath }/user/bank" title="我的银号">我的银号</a></li>
        <li class="img4 <c:if test="${param.menu == 'shelf' }">on</c:if>"><a href="${pageContext.request.contextPath }/user/shelf" title="我的书架">我的书架</a></li>
        <li class="img5 <c:if test="${param.menu == 'notice' }">on</c:if>"><a href="${pageContext.request.contextPath }/user/notice/list" title="我的消息">我的消息</a></li>
    </ul>
    <c:if test="${sessionScope.sessionFrontBean.hasWriter == 1}">
    <div class="works">
		<ul>
            <li class="img7 <c:if test="${param.menu == 'authorbooklistbypic' }">on</c:if>"><a href="${pageContext.request.contextPath }/author/book/listbypic">作者专区</a></li>
            <li class="img7 <c:if test="${param.menu == 'authorbookaddinit' }">on</c:if>"><a href="${pageContext.request.contextPath }/author/book/addinit">新建作品</a></li>
            <li class="img7 <c:if test="${param.menu == 'authorbooklistbytable' }">on</c:if>"><a href="${pageContext.request.contextPath }/author/book/listbytable">作品列表</a></li>
        </ul>
    </div> 
    </c:if>   
</div>