<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="auth" uri="auth" %>
<%@taglib prefix="page" uri="page" %>
<%@taglib prefix="commauth" uri="commauth" %>  
<%
	String contextPath = request.getContextPath();
    StringBuffer rootPath = new StringBuffer();
    rootPath.append(request.getScheme());
    rootPath.append("://");
    rootPath.append(request.getServerName()+":" + request.getServerPort());
    rootPath.append(contextPath);
    
    response.setContentType("text/html; charset=UTF-8");
%>