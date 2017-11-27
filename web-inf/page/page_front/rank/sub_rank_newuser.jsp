<%@ page contentType="text/html; charset=UTF-8" %>
<c:choose>
	<c:when test="${status.count == 1}">
		<li>
			<span class="sp1">${status.count }</span>
			<a href="${pageContext.request.contextPath }/book/listbyauthor/${item.id}" class="mja">${item.nick }</a>
		</li>
	</c:when>
	<c:when test="${status.count == 2 || status.count == 3}">
		<li>
			<span class="sp1 sp2">${status.count }</span>
			<a href="${pageContext.request.contextPath }/book/listbyauthor/${item.id}" class="mja">${item.nick }</a>
		</li>
	</c:when>
	<c:when test="${status.count == 10}">
		<li class="no">
			<span class="sp1 sp3">${status.count }</span>
			<a href="${pageContext.request.contextPath }/book/listbyauthor/${item.id}" class="mja">${item.nick }</a>
		</li>
	</c:when>
	<c:otherwise>
		<li>
			<span class="sp1 sp3">${status.count }</span>
			<a href="${pageContext.request.contextPath }/book/listbyauthor/${item.id}" class="mja">${item.nick }</a>
		</li>
	</c:otherwise>
</c:choose>