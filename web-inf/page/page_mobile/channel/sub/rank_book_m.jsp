<%@ page contentType="text/html; charset=UTF-8" %>
<dd <c:if test="${status.last}">class="no"</c:if>>
	<span <c:if test="${status.count <4 }">class="num"</c:if>>${status.count }</span>
	<a href="${pageContext.request.contextPath }/m/book/${item.id}" title="">${item.name}</a>
</dd>