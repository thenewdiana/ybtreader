<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common_m.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
<title>书架_雁北堂_雁北堂中文网_手机版</title>
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
<form action="<%=contextPath%>/m/userCenter/comments/${userId}" id="commentsForm" method="post">
	<div class="comment">
    	<dl>
    		<dt><c:if test="${isOwn==1}">我</c:if><c:if test="${isOwn!=1}">他</c:if>的评论</dt>
    		<input type="hidden" id="page" name="page" value="${pagination.currPage }"/>
			<input type="hidden" id="rows" name="rows" value="${pagination.pageSize }"/>
			<c:if test="${not empty bcList}">
				<c:forEach items="${bcList}" var="item" varStatus="status">
					<dd>
						<h2><a href="${contextPath }/m/book/${item.bookId}/${item.id}/comment/more" >${item.title}</a></h2>
						<p>${item.content}</p>
						<div class="over">
		                	<time>${item.createTimeFormat}</time>
		                    <span>评<a href="${contextPath }/m/book/${item.bookId}" title="${item.bookName}">《${item.bookName}》</a></span>
		                </div>
			        </dd>
				</c:forEach>
			</c:if>
			<c:if test="${empty bcList}">
	    		<dd>还没有评论过</dd>
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
		$('#commentsForm').submit();
	}
</script> 
</body>
</html>
