<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common.jsp" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"  class="reader-for-other">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${bookChapter.title}_${book.name}_雁北堂_阅读江湖新力量</title>
<meta name="keywords" content="${book.name },${bookChapter.title},${book.authorNick }" />
<meta name="description" content="${bookChapter.shortContent}" />
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/common/base.css"/>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/style.css"/>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/common/popup.css"/>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/reader/style.css"/>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/uaredirect.js" ></script>
<script type="text/javascript">uaredirect("http://m.ebtang.com/m/book/${book.id}/${bookChapter.id}");</script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/main.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/statistics_bd.js"></script>
</head>
<body ondragstart="return false" oncopy="return false;" oncut="return false;" oncontextmenu="return false">
<!--header begin-->
<%@ include file="../header.jsp"%>
<!--header end-->
<%@ include file="../header_recomm.jsp"%>
<!--导航-->
<jsp:include page="../banner.jsp">
	 <jsp:param name="menu" value="bookroom"/>   
</jsp:include>
<!--导航-->

<!--阅读导航-->
	<div id="maincontent" class="readd-bg">
		<div class="readd-nav">
	    	<div class="w1000">
	        	<p class="white icon f14 fl">正在阅读&gt;
	        	<a href="${pageContext.request.contextPath }/book/${book.id}"> ${book.name }</a>&gt;
	        	<a href="${pageContext.request.contextPath }/book/${book.id}/directory">章节目录</a>&gt;
	        	<a href="javascript:void(0);" >${bookChapter.title }</a></p>
	        </div>
	    </div>
	</div>
<!--阅读导航-->

<!--章节内容-->
	<div id="ybtReader" class="reader-container read-dark">
		<div class="com-loading" id="j_comLoading">
			<img src="${sessionScope.baseUrl}pc/images/reader/loading.gif" class="img" />
		</div>
		<div class="reader-page-wrap">
			<div class="reader-c-wrap" id="j_readerWrap">
			</div>
		</div>
		<div id="j_chapterLoading" class="chapter-loading">加载中</div>
		<div id="j_clickNextChapter" class="click-wrapper">点击获取下一章</div>
		<div class="fix-right" id="j_toolbar">
			<div class="bottom-tools">
				<ul>
	 	   	 	<li class="item pf1" id="js_light_control" title="开关灯"></li>
	     		<li class="item pf2" id="js_vote_golden" title="投金票"></li>
	     		<li class="item pf3" id="js_add_mark" title="加书签"></li>
	     		<li class="item pf4" id="js_toggle_marklist" title="书签列表"></li>
	     		<li class="item pf5" id="js_toggle_catalog" title="书籍目录"></li>
	     		<li class="item pf6" id="js_click_totop" title="返回顶部"></li>
		 	 </ul>
		 	</div>
			<div class="bookmark-list" id="js_marklist">
				<div class="wrapper">
					<div class="title">
						<h2 class="text">书签</h2>
						<button class="close" id="js_close_markList"></button>
					</div>
					<div class="content">
						
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--loginPopup-->
	<%@ include file="../loginPopup.jsp"%>
	<!--loginPopup-->
	<!--vip_pay-->
	<%@ include file="../vip_pay.jsp"%>
	<!--vip_pay-->
	<!--vip_login-->
	<%@ include file="../vip_login.jsp"%>
	<!--vip_login-->
	<!--footer-->
	<%@ include file="../footer.jsp"%>
	<!--footer-->
	<!--隐藏域-->
  <div style="display:none">
		<input type="hidden" name="bookId" id="bookId" value="${book.id}"/>
		<input type="hidden" name="userId" id="userId" value="${sessionScope.sessionFrontBean.userId}"/>
		<input type="hidden" name="resourcesUrl" id="resourcesUrl" value="${sessionScope.baseUrl}"/>
		<input type="hidden" name="pageUrl" id="pageUrl" value="${pageContext.request.contextPath }"/>
  	<form action="" id="bookChapterForm" method="post">
  		<input type="hidden" name="nextId" id="nextId" value="${bookChapter.id}"/>
  		<input type="hidden" name="randomString" id="randomString" value="${randomString}"/>
  		<input type="hidden" name="curId" id="curId"/>
  	</form>
	</div>
	<!--隐藏域-->
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/lib/require.min.js" defer async="true" data-main="${sessionScope.baseUrl}pc/js/reader/config.js"></script>
</body>
</html>