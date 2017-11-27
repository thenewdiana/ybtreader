<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common_m.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
<title>作品_雁北堂_雁北堂中文网_手机版</title>
<link rel="stylesheet" href="${sessionScope.baseUrl}mobile/css/common.css"/>
<link rel="stylesheet" href="${sessionScope.baseUrl}mobile/css/style.css"/>
<link rel="stylesheet" href="${sessionScope.baseUrl}mobile/css/use.css"/>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/statistics_bd.js"></script>
<script type="text/javascript"  src="${sessionScope.baseUrl}mobile/js/jquery.min.js"></script>
<!--[if lt IE 9]>
<script type="text/javascript"  src="${sessionScope.baseUrl}mobile/js/html5.js"></script>
<![endif]-->
<script type="text/javascript" src="${sessionScope.baseUrl}mobile/js/main.js"></script>
</head>
<body>
<header> 
<!--header begin-->
<jsp:include page="../header_m.jsp">  
	<jsp:param name="menu" value="wu"/>   
</jsp:include>
<!--header end-->
</header>
<%@ include file="../header_user_m.jsp"%>
<!--中间内容-->
<form action="<%=contextPath%>/m/userCenter/works/${userId}" id="worksForm" method="post">
	<div class="comment book2">
    	<dl>
    		<dt><c:if test="${isOwn==1}">我</c:if><c:if test="${isOwn!=1}">他</c:if>的作品</dt>
    		<input type="hidden" id="page" name="page" value="${pagination.currPage }"/>
			<input type="hidden" id="rows" name="rows" value="${pagination.pageSize }"/>
			<c:if test="${not empty bookList}">
				<c:forEach items="${bookList}" var="item" varStatus="status">
					<dd>
						<h2><a href="${contextPath }/m/book/${item.id}" title="${item.name}">${item.name}</a></h2>
		                <p class=""><a href="${contextPath }/m/book/${item.id}/${item.lastChapterId}">${item.lastChapterTitle}&nbsp;</a> <time class="mdhm">${item.modifyTime}</time></p>
		                <a href="${contextPath }/m/book/${item.id}" title="开始阅读" class="read1">开始阅读</a>
			        </dd>
				</c:forEach>
			</c:if>
			<c:if test="${empty bookList}">
		    	<dd>还没有写过书</dd>
		    </c:if>
        </dl>
    </div>
    <div class="goback"><a class="homes" href="${pageContext.request.contextPath }/m"><img height="16" width="18" alt="返回首页" src="${sessionScope.baseUrl}mobile/images/home.png"></img></a>&gt;<a href="javascript:history.go(-1);">返回</a></div>
	<page:mpagination pageAttr="pagination"></page:mpagination>
</form>
<!--中间内容结束-->
<!--footer-->
<%@ include file="../footer_m.jsp"%>
<!--footer--><script type="text/javascript">
	function paper(pageNoValue, pageSizeValue){
		$('#page').val(pageNoValue);
		$('#rows').val(pageSizeValue);
		$('#worksForm').submit();
	}
</script> 
</body>
</html>
