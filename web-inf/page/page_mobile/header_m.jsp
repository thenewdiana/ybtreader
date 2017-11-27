<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="common_m.jsp" %>
<a href="${pageContext.request.contextPath }/m" class="logo"></a>
<ul>
	<li <c:if test="${param.menu == 'index' }">class="active"</c:if>><a href="${pageContext.request.contextPath }/m">雁北堂</a></li>
	<li <c:if test="${param.menu == 'bookroom' }">class="active"</c:if>><a href="${pageContext.request.contextPath }/m/allBook">书库</a></li>
	<li <c:if test="${param.menu == 'rank' }">class="active"</c:if>><a href="${pageContext.request.contextPath }/m/rank">排行</a></li>
	<li <c:if test="${param.menu == 'free' }">class="active"</c:if>><a href="${pageContext.request.contextPath }/m/allBook?free=free&bookRoomVipType=0">免费</a></li>
	<li class="<c:if test="${param.menu == 'recharge' }">active</c:if> price" ><a href="${pageContext.request.contextPath }/m/recharge">充值</a></li>
</ul>