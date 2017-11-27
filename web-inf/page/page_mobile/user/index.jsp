<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common_m.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

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
<div class="comment">
	<dl>
    	<dt><c:if test="${isOwn==1}">我</c:if><c:if test="${isOwn!=1}">他</c:if>的书架</dt>
    </dl>
    <div class="book1">
    <c:if test="${not empty userBookList}">
    	<c:forEach items="${userBookList}" var="item" varStatus="status">
    		<c:if test="${status.count == 1}">
    			<div class="ce-top1 over">
		        	<div class="fl"><a href="${contextPath }/m/book/${item.bookId}" title="${item.bookName}"><img src="${sessionScope.customUrl}book/mimgs/${item.bookImage}" width="70" alt="${item.bookName}"></a></div>
		            <div class="fl ml5">
		            	<h2 class="pt5"><a href="${contextPath }/m/book/${item.bookId}" title="">${item.bookName}</a></h2>
		                <a href="${contextPath }/m/book/${item.bookId}/${item.lastChapterId}"><p>最新更新：${item.lastChapterTitle}&nbsp;</p></a>    
		            </div>            
		        </div>
		        <ul class="over ce-top2 white ac">
	            	<li><a href="${contextPath }/m/book/${item.bookId}" title="${item.bookName}">开始阅读</a></li>
	                <li><a href="${contextPath }/m/book/${item.bookId}/${item.lastChapterId}" title="${item.lastChapterTitle}" class="mrg">最新章节</a></li>
	            </ul>
    		</c:if>
    	</c:forEach>
    	<ul class="ce-top3">
    	<c:forEach items="${userBookList}" var="item" varStatus="status">
    		<c:if test="${status.count > 1}">
    			<li class="bd"><a href="${contextPath }/m/book/${item.bookId}" title="${item.bookName}">${item.bookName}</a></li>
    		</c:if>
    	</c:forEach>
    	</ul>
    </c:if>
    <c:if test="${empty userBookList}">
    	<ul class="ce-top3">还没有收藏过书</ul>
    </c:if>
    </div>
    <c:if test="${fn:length(userBookList)>4}">
    	<a href="${contextPath }/m/userCenter/shelf/${userId}" title="更多" class="ac morect">更多</a>
    </c:if>
</div>
<div class="comment">
	<dl>
    	<dt><c:if test="${isOwn==1}">我</c:if><c:if test="${isOwn!=1}">他</c:if>的作品</dt>
    </dl>
    <div class="book1">
    	<c:if test="${not empty bookList}">
    		<c:forEach items="${bookList}" var="item" varStatus="status">
	    		<c:if test="${status.count == 1}">
	    			<div class="ce-top1 over">
			        	<div class="fl"><a href="${contextPath }/m/book/${item.id}" title="${item.name}"><img src="${item.smallCoverImage}" width="70" alt="${item.name}"></a></div>
			            <div class="fl ml5">
			            	<h2 class="pt5"><a href="${contextPath }/m/book/${item.id}" title="${item.name}">${item.name}</a></h2>
			                <p>已更章：${item.words}字</p>
			            </div>            
			        </div>
	    		</c:if>
	    	</c:forEach>
	    	<ul class="ce-top3">
	    	<c:forEach items="${bookList}" var="item" varStatus="status">
	    		<c:if test="${status.count > 1}">
	    			<li class="bd"><a href="${contextPath }/m/book/${item.id}" title="${item.name}">${item.name}</a></li>
	    		</c:if>
	    	</c:forEach>
	    	</ul>
    	</c:if>
    	<c:if test="${empty bookList}">
	    	<ul class="ce-top3">还没有写过书</ul>
	    </c:if>
    </div>
    <c:if test="${fn:length(bookList)> 4}">
    	<a href="${contextPath }/m/userCenter/works/${userId}" title="更多" class="ac morect">更多</a>
    </c:if>
</div>
<div class="comment">
	<dl>
		<dt><c:if test="${isOwn==1}">我</c:if><c:if test="${isOwn!=1}">他</c:if>的评论</dt>
		<c:if test="${not empty bcList}">
    		<c:forEach items="${bcList}" var="item" varStatus="status">
	    		<dd>
		        	<h2><a href="${contextPath }/m/book/${item.bookId}/${item.id}/comment/more" >${item.title}</a></h2>
		            <p>${item.content}</p>
		            <div class="over">
		            	<time>${item.createTimeFormat}</time>
		                <span>评<a href="${contextPath }/m/book/${item.bookId}" title="">《${item.bookName}》</a></span>
		            </div>
		        </dd>
	    	</c:forEach>
    	</c:if>
    	<c:if test="${empty bcList}">
    		<dd>还没有评论过</dd>
	    </c:if>
    </dl>
    <c:if test="${fn:length(bcList)> 9}">
    	<a href="${contextPath }/m/userCenter/comments/${userId}" title="更多" class="ac morect">更多</a>
    </c:if>
</div>
<!--中间内容结束-->
<!--footer-->
<%@ include file="../footer_m.jsp"%>
<!--footer-->
</body>
</html>
