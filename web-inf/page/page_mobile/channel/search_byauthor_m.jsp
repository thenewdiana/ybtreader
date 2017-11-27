<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../common_m.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>搜书_雁北堂_雁北堂中文网_手机版</title>
<link rel="stylesheet" href="${sessionScope.baseUrl}mobile/css/common.css"/>
<link rel="stylesheet" href="${sessionScope.baseUrl}mobile/css/style.css"/>
<link rel="stylesheet" href="${sessionScope.baseUrl}mobile/css/use.css"/>
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
<!--search start-->
<div class="index_search">
<form action="${pageContext.request.contextPath }/m/book/search" method="get" id="bookSearchForm">
	<input type="hidden" id="page" name="page" value="${pagination.currPage }"/>
    <input type="hidden" id="rows" name="rows" value="${pagination.pageSize }"/>
   	<input type="hidden" id="searchType" name="searchType" value="${bookReqForm.searchType }"/>    	
  <ul class="search_tab clearfix">
    <li onclick="byBook()">按书名</li>
    <li class="s_current" onclick="byAuthor()">按作者</li>
  </ul>
  <dl class="clearfix">
    <dt >
      <input class="text-border vm" type="text" placeholder="输入关键字..." name="searchName" id="searchName" value="${bookReqForm.searchName}">
      <em class="search_close"></em></dt>
    <dd>
      <input class="btn btn-auto btn-blue vm" type="button" onclick="doSearch();" value="">
    </dd>
  </dl>
</form>
</div>
<!--search end-->

<section class="cons_cont s_cont" >
  <h2 class="search_title">共有<span class="cola21812">${fn:length(bookList)}</span>本书</h2>
  <c:forEach items="${bookList }" var="item" >
  	<dl class="s_dl clearfix">
	    <dt ><a href="<%=contextPath%>/m/book/${item.id}"><img src="${item.midCoverImage}" alt="${item.name}"></a></dt>
	    <dd><a href="<%=contextPath%>/m/book/${item.id}"><span <c:if test="${item.isVip == 1}">class="s_vip" title="vip"</c:if> ></span><span class="cola21812">${item.name }</span><span class="s_name">作者：${item.authorNick }</span></a> <span class="col898989">${item.shotInfo }</span> <span class="s_gxin">最后更新：${item.createMinuteFormat } <c:if test="${item.isFinish == 1}"><em class="fr"> 已完成</em></c:if><c:if test="${item.isFinish == 0}"><em class="fr"> 连载中...</em></c:if></span> </dd>
	</dl>
  </c:forEach>
</section>
<page:mpagination pageAttr="pagination"></page:mpagination>


<!--footer-->
<%@ include file="../footer_m.jsp"%>
<!--footer-->

<script type="text/javascript">
function byBook() {
	$("#searchType").attr("value", 0);    	    	
	doSearch();
}

function byAuthor() {
	$("#searchType").attr("value", 1);  
	doSearch();
}

function paper(pageNoValue, pageSizeValue){
	$('#page').val(pageNoValue);
	$('#rows').val(pageSizeValue);
	doSearch();
}

function doSearch() {
	var formData = $('#bookSearchForm').serialize();
	window.location.href = "${pageContext.request.contextPath }/m/book/search?" + formData;    	
}
</script>
</body>
</html>
