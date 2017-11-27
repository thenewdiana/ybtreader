<%@ page contentType="text/html; charset=UTF-8" %>
            <c:forEach items="${subjectMap['ad_left']}" var="item" varStatus="status">
                <c:if test="${status.count==1}">
                <a href="${contextPath }/book/${item.bookId}" class="ad-l">
                	<img class="pic" src="${item.bannerImage}"/>
                </a>
                </c:if>
           	</c:forEach>
            <c:forEach items="${subjectMap['ad_right']}" var="item" varStatus="status">
                <c:if test="${status.count==1}">
                <a href="${contextPath }/book/${item.bookId}" class="ad-r">
                	<img class="pic" src="${item.bannerImage}"/>
                </a>
                </c:if>
           	</c:forEach>