<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common_m.jsp" %>

<!DOCTYPE html>
<html>
<head>
<title>${book.name}_${book.name}全文阅读，${book.authorNick }的小说_雁北堂_阅读江湖新力量_手机版</title>
<meta name="keywords" content="${book.name}_${book.name}全文阅读，${book.authorNick }的小说_手机版"></meta>
<meta name="description" content="${book.name}是${book.authorNick }在雁北堂的原创独家首发小说, 请密切关注雁北堂中文网_手机版"></meta>
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="${sessionScope.baseUrl}mobile/css/common.css"/>
<link rel="stylesheet" href="${sessionScope.baseUrl}mobile/css/style.css"/>
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
	 <jsp:param name="menu" value="index"/>   
</jsp:include>
<!--header end-->
</header>
<%@ include file="../header_user_m.jsp"%>
<hgroup class="daS_jl"><b class="f14">${book.name }</b></hgroup>
<section class="cons_cont">
	<ul class="read_tab clearfix">
    	<li <c:if test="${sortType.equals('asc') }">class="read_current"</c:if> id="asc"><span><em>正序</em></span></li>
    	<li <c:if test="${sortType.equals('desc') }">class="read_current"</c:if> id="desc"><span><em>倒序</em></span></li>
  	</ul>
  	<div class="read_cont" style="display:block;">
  	<c:forEach items="${bookSectionList }" var="section">
  		<h2>${section.sectionName }</h2>
  		<c:forEach items="${section.chapterList }" var="chapter">
  		<p>
  			<c:if test="${chapter.isVip == 1 }"><span class="title_icon01"></span></c:if>
  			<a href="${pageContext.request.contextPath }/m/book/${chapter.bookId}/${chapter.id}">${chapter.title }</a>
  		</p>
  		</c:forEach>	
  	</c:forEach>
    </div>
</section>
<div class="goback"><a class="homes" href="${pageContext.request.contextPath }/m"><img height="16" width="18" alt="返回首页" src="${sessionScope.baseUrl}mobile/images/home.png"></img></a>&gt;<a href="${pageContext.request.contextPath }/m/book/${book.id}" class="col992123"><em></em>${book.name }</a></div>
<page:mpagination pageAttr="pagination"></page:mpagination>
<section class="cons_cont">
  <h2 class="read_title">精选推荐</h2>
  <ul class="read_book clearfix">
  	<c:forEach items="${relatedBookList }" var="item">
  		<li> <a href="${pageContext.request.contextPath }/m/book/${item.id}"> <img src="${item.midCoverImage }"> </a> </li>
  	</c:forEach>    
  </ul>
</section>
<!--footer-->
<%@ include file="../footer_m.jsp"%>
<form action="${pageContext.request.contextPath }/m/book/${book.id}/directory" method="post" id="bookDirectoryForm">
	<input type="hidden" id="sortType" name="sortType" value="${sortType }"/>
	<input type="hidden" id="page" name="page" value="${pagination.currPage }"/>
    <input type="hidden" id="rows" name="rows" value="${pagination.pageSize }"/>
</form>    
<!--footer-->
<script type="text/javascript">
$(function(){
	$('.read_tab li').click(function(){
		var id = $(this).attr("id");
		$(this).addClass('read_current').siblings('li').removeClass('read_current');
		$("#sortType").attr("value", id);
		paper(1, 20);
	});
});

function paper(pageNoValue, pageSizeValue){
	$('#page').val(pageNoValue);
	$('#rows').val(pageSizeValue);
	$("#bookDirectoryForm").submit();
}

</script>
</body>
</html>