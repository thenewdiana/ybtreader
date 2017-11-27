<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common_m.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>排行榜_雁北堂_雁北堂中文网_手机版</title>
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
<!--header begin-->
<header> 
<jsp:include page="../header_m.jsp">
	 <jsp:param name="menu" value="rank"/>   
</jsp:include>
</header>
<%@ include file="../header_user_m.jsp"%>
<!--header end-->


<article class="ranking f14">
	<h1>排行榜</h1>
	<dl class="rank1">
    	<dt>打赏榜</dt>
    	<c:forEach items="${rewardRankByMonthList }" var="item" varStatus="status">
     		<%@ include file="./sub/rank_book_m.jsp"%>
     	</c:forEach>
    </dl>
    <dl class="rank1">
    	<dt>点击榜</dt>
        <c:forEach items="${clickRankByMonthList }" var="item" varStatus="status">
     		<%@ include file="./sub/rank_book_m.jsp"%>
     	</c:forEach>
    </dl>
    <dl class="rank1">
    	<dt>订阅榜</dt>
        <c:forEach items="${rssRankByMonthList }" var="item" varStatus="status">
     		<%@ include file="./sub/rank_book_m.jsp"%>
     	</c:forEach>
    </dl>
    <dl class="rank1">
    	<dt>金票榜</dt>
        <c:forEach items="${goldenRankByMonthList }" var="item" varStatus="status">
     		<%@ include file="./sub/rank_book_m.jsp"%>
     	</c:forEach>
    </dl>
    <dl class="rank1">
    	<dt>免费榜</dt>
        <c:forEach items="${freeBookRankByMonthList }" var="item" varStatus="status">
     		<%@ include file="./sub/rank_book_m.jsp"%>
     	</c:forEach>
    </dl>
    <dl class="rank1">
    	<dt>土豪粉丝榜</dt>
        <c:forEach items="${hiapkRankByMonthList }" var="item" varStatus="status">
     		<%@ include file="./sub/rank_user_m.jsp"%>
     	</c:forEach>
    </dl>
    <dl class="rank1">
    	<dt>女频榜</dt>
        <c:forEach items="${womenChannelRankByMonthList }" var="item" varStatus="status">
     		<%@ include file="./sub/rank_book_m.jsp"%>
     	</c:forEach>
    </dl>
</article>


<!--footer-->
<%@ include file="../footer_m.jsp"%>
<!--footer-->
</body>
</html>


