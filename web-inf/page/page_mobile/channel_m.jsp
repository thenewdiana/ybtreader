<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="common_m.jsp" %>
<nav class="index_nav clearfix">
  <ul>
    <li <c:if test="${param.menu == 'index' }">class="active"</c:if>><a title="狮子山" href="${pageContext.request.contextPath }/m" class="navA01"><span></span></a></li>
    <li <c:if test="${param.menu == 'male' }">class="active"</c:if>><a title="男频" href="${pageContext.request.contextPath }/m/male" class="navA02"><span></span></a></li>
    <li <c:if test="${param.menu == 'female' }">class="active"</c:if>><a title="女频" href="${pageContext.request.contextPath }/m/female" class="navA03"><span></span></a></li>
  </ul>
</nav>