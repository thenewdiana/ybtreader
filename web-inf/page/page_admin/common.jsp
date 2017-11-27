<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="auth" uri="auth" %>  
<%
	String contextPath = request.getContextPath();
    StringBuffer rootPath = new StringBuffer();
    rootPath.append(request.getScheme());
    rootPath.append("://");
    rootPath.append(request.getServerName()+":" + request.getServerPort());
    rootPath.append(contextPath);
    
    response.setContentType("text/html; charset=UTF-8");
%>
<c:set var="baseUrl" value="${sessionScope.baseUrl}" scope="session"/>
<c:set var="customUrl" value="${sessionScope.customUrl}" scope="session"/>
<script type="text/javascript">
	var baseUrl = '${baseUrl}';
	var customUrl = '${customUrl}';
</script>