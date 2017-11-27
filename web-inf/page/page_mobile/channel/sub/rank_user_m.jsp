<%@ page contentType="text/html; charset=UTF-8" %>
<dd <c:if test="${status.last}">class="no"</c:if>>
	<span <c:if test="${status.count <4 }">class="num"</c:if>>${status.count }</span>
	<a href="${pageContext.request.contextPath }/m/userCenter/${item.userId}" title="">${item.nick}</a>
</dd>