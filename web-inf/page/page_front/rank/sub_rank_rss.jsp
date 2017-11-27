<%@ page contentType="text/html; charset=UTF-8" %>
<c:choose>
	<c:when test="${status.count == 1}">
		<li>
			<span class="sp1">${status.count }</span>
			<a href="${pageContext.request.contextPath }/book/${item.id}" title="">
			<img src="${item.smallCoverImage }" width="50" height="70" alt=""  class="fl"/>
			</a>
			<div class="w80 fl">
			    <h2 class="f14"><a href="${pageContext.request.contextPath }/book/${item.id}" title="">${item.name }</a></h2>
			    <p>作者：<a href="${contextPath }/book/listbyauthor/${item.authorId}">${item.authorNick}</a></p>
			</div>
		</li>
	</c:when>
	<c:when test="${status.count == 2 || status.count == 3}">
		<li>
		    <span class="sp1 sp2">${status.count }</span>
		    <a href="${pageContext.request.contextPath }/book/${item.id}" title="" class="mja">${item.name }</a>
		</li>
	</c:when>
	<c:when test="${status.count == 10}">
		<li class="no">
		    <span class="sp1 sp3">${status.count }</span>
		    <a href="${pageContext.request.contextPath }/book/${item.id}" title="" class="mja">${item.name }</a>
		</li> 
	</c:when>													
	<c:otherwise>
		<li>
		    <span class="sp1 sp3">${status.count }</span>
		    <a href="${pageContext.request.contextPath }/book/${item.id}" title="" class="mja">${item.name }</a>
		</li> 
	</c:otherwise>
</c:choose>