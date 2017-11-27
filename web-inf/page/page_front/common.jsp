<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="auth" prefix="auth"  %>
<%@taglib uri="page" prefix="page" %>
<%@taglib uri="commauth" prefix="commauth" %>  
<%
	String contextPath = request.getContextPath();
    StringBuffer rootPath = new StringBuffer();
    rootPath.append(request.getScheme());
    rootPath.append("://");
    rootPath.append(request.getServerName()+":" + request.getServerPort());
    rootPath.append(contextPath);
    
    response.setContentType("text/html; charset=UTF-8");
%>