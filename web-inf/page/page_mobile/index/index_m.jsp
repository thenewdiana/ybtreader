<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common_m.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta name="baidu-site-verification" content="5GyDuFcAyQ" />
<meta property="wb:webmaster" content="d4230f7a301ff22c" />
<meta property="qc:admins" content="255257467665241676375" />
<title>雁北堂_雁北堂中文网_手机版</title>
<meta name="keywords" content="雁北堂，雁北堂中文网，雁北堂阅读，小说，悬疑小说，历史小说，都市小说，军事小说，玄幻小说，网络小说，原创网络文学 "></meta>
<meta name="description" content="雁北堂中文网提供悬疑、历史、都市、军事、玄幻、奇幻、仙侠、武侠、科幻、游戏、同人等网络小说在线阅读 - www.ebtang.com/m"></meta>
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
<script type="text/javascript" src="${sessionScope.baseUrl}mobile/js/TouchSlide.1.1.js"></script>
</head>
<body>
<c:if test="${source == 'app' }">
	<jsp:include page="../common/awaken_app_m.jsp"></jsp:include>
</c:if>
<header> 
<!--header begin-->
<jsp:include page="../header_m.jsp">
	 <jsp:param name="menu" value="index"/>   
</jsp:include>
<!--header end-->
</header>
<%@ include file="../header_user_m.jsp"%>
<%@ include file="../header_search_m.jsp"%>
<!--channel begin-->
<jsp:include page="../channel_m.jsp">
	 <jsp:param name="menu" value="index"/>   
</jsp:include>
<!--channel end-->

<section class="index_cont"> 
  <!--tab-->
  <div id="tabBox" class="tabBox">
    <div class="bd">
    <c:forEach items="${subjectMap['one_column']}" var="item" varStatus="status">
    	<ul>
	        <li>
	        <h6><a title="${item.bookShortRecommTitle}" href="${item.bannerUrl}"><img src="${item.bookBigImage}" onerror="this.src='${item.errorMidImage}'" alt="${item.bookShortRecommTitle}" /></a></h6>
	        <b><a href="${item.bannerUrl}">${item.bookShortRecommTitle}</a></b></li>
	        <li class="pl5 pr10">${item.bookShortRecommDec}</li>
	    </ul>
    </c:forEach>
    </div>
    <div id="tabBoxHd" class="hd"> <span class="type"><a href="#"></a><a href="#"></a><a href="#"></a></span>
      <h3><b></b>
        <ul>
        </ul>
      </h3>
    </div>
  </div>
<script type="text/javascript">
	TouchSlide({
		slideCell:"#tabBox",
		titCell:".hd ul", //开启自动分页 autoPage:true ，此时设置 titCell 为导航元素包裹层
		effect:"leftLoop", 
		autoPage:true, //自动分页
		autoPlay:true,//自动播放
		startFun:function(i,c){ // 切换当前标题
			var hd = document.getElementById("tabBoxHd");
			hd.getElementsByTagName("b")[0].innerText=hd.getElementsByTagName("a")[i].innerText;
		}
	})
</script>

<c:forEach items="${subjectMap['two_column']}" var="item" varStatus="status">
	<c:choose>
		<c:when test="${status.count == 1 || status.count == 2}">
			<dl class="clearfix">
			    <dt><a href="<%=contextPath%>/m/book/${item.bookId}"><img src="${item.bookBigImage}" onerror="this.src='${item.errorMidImage}'" alt="${item.bookShortRecommTitle}" /></a></dt>
			    <dd><a href="<%=contextPath%>/m/book/${item.bookId}">${item.bookShortRecommTitle}</a>${item.bookShortRecommDec}</p> </dd>
			</dl>
		</c:when>
		<c:when test="${status.count == 3 || status.count == 5 }">
			<p><a href="<%=contextPath%>/m/book/${item.bookId}"><span class="col991e23">[${item.cgName}]</span> ${item.bookShortRecommTitle}</a><c:if test="${item.isFinish==0}"><em class="lz_icon">连载</em></c:if></p>
		</c:when>
		<c:when test="${status.count == 4 }">
			<p><a href="<%=contextPath%>/m/book/${item.bookId}"><span class="col991e23">[${item.cgName}]</span> <span class="colf29600">${item.bookShortRecommTitle}</span></a><c:if test="${item.isFinish==0}"><em class="lz_icon">连载</em></c:if></p>
		</c:when>
	</c:choose>
</c:forEach>
</section>
<h2 class="index_title01"><span>神作推荐</span></h2>
<section class="index_tj">
	<ul class="clearfix">
	<c:forEach items="${subjectMap['three_column']}" var="item" varStatus="status">
		<c:choose>
			<c:when test="${status.count == 1 || status.count == 2 || status.count == 3 }">
				<li><a href="<%=contextPath%>/m/book/${item.bookId}"><img src="${item.bookBigImage}" onerror="this.src='${item.errorMidImage}'"  alt="${item.bookShortRecommTitle}" /></a></li>
			</c:when>
		</c:choose>
 	</c:forEach>
 	</ul>
	<c:forEach items="${subjectMap['three_column']}" var="item" varStatus="status">
		<c:choose>
			<c:when test="${status.count == 4 || status.count == 6 }">
				<p><a href="<%=contextPath%>/m/book/${item.bookId}"><span class="col991e23">[${item.cgName}]</span> ${item.bookShortRecommTitle}</a><c:if test="${item.isFinish==0}"><em class="lz_icon">连载</em></c:if></p>
			</c:when>
			<c:when test="${status.count == 5 }">
				<p><a href="<%=contextPath%>/m/book/${item.bookId}"><span class="col991e23">[${item.cgName}]</span> <span class="colf29600">${item.bookShortRecommTitle}</span></a><c:if test="${item.isFinish==0}"><em class="lz_icon">连载</em></c:if></p>
			</c:when>
		</c:choose>
 	</c:forEach>
</section>
<h2 class="index_title01"><span class="col991e23"><em class="title_icon01"></em>精品</span></h2>
<section class="index_tj">
  <ul class="clearfix">
	<c:forEach items="${subjectMap['four_column']}" var="item" varStatus="status">
		<c:choose>
			<c:when test="${status.count == 1 || status.count == 2 || status.count == 3 }">
				<li><a href="<%=contextPath%>/m/book/${item.bookId}"><img src="${item.bookBigImage}" onerror="this.src='${item.errorMidImage}'"  alt="${item.bookShortRecommTitle}" /></a></li>
			</c:when>
		</c:choose>
 	</c:forEach>
 	</ul>
	<c:forEach items="${subjectMap['four_column']}" var="item" varStatus="status">
		<c:choose>
			<c:when test="${status.count == 4 || status.count == 6 }">
				<p><a href="<%=contextPath%>/m/book/${item.bookId}"><span class="col991e23">[${item.cgName}]</span> ${item.bookShortRecommTitle}</a><c:if test="${item.isFinish==0}"><em class="lz_icon">连载</em></c:if></p>
			</c:when>
			<c:when test="${status.count == 5 }">
				<p><a href="<%=contextPath%>/m/book/${item.bookId}"><span class="col991e23">[${item.cgName}]</span> <span class="colf29600">${item.bookShortRecommTitle}</span></a><c:if test="${item.isFinish==0}"><em class="lz_icon">连载</em></c:if></p>
			</c:when>
		</c:choose>
 	</c:forEach>
</section>
<c:forEach items="${subjectMap['one_banner']}" var="item" varStatus="status">
	
</c:forEach>
<c:forEach items="${subjectMap['one_banner']}" var="item" varStatus="status">
	<div class="slide-ad"><a href="${item.bannerUrl}" ><img src="${item.bannerImage}" /></a> </div>
</c:forEach>

<h2 class="index_title01"><span class="col991e23"><em class="title_icon02"></em>女生热推</span></h2>
<ul class="index_book clearfix">
	<c:forEach items="${subjectMap['five_column']}" var="item" varStatus="status">
		<li> <a href="<%=contextPath%>/m/book/${item.bookId}"><img src="${item.bookBigImage}" onerror="this.src='${item.errorMidImage}'"  alt="${item.bookShortRecommTitle}" /></a> </li>
	</c:forEach>
</ul>
<h2 class="index_title01"><span class="col991e23"><em class="title_icon03"></em>恐怖惊悚</span></h2>
<ul class="index_book clearfix">
  <c:forEach items="${subjectMap['six_column']}" var="item" varStatus="status">
		<li> <a href="<%=contextPath%>/m/book/${item.bookId}"><img src="${item.bookBigImage}" onerror="this.src='${item.errorMidImage}'"  alt="${item.bookShortRecommTitle}" /></a> </li>
	</c:forEach>
</ul>
<hgroup class="index_tab">
  <ul>
    <li class="active"><span>点击榜</span></li>
    <li><span>金票榜</span></li>
    <li><span>打赏榜</span></li>
  </ul>
</hgroup>
<section class="index_pm" style="display:block;">
	<c:forEach items="${bookRankMap['clickRankByAllList']}" var="item" varStatus="status">
	  		<li><span><em>${status.count}</em></span><a href="${pageContext.request.contextPath }/m/book/${item.id}">${item.name}</a></li>
	</c:forEach>
</section>
<section class="index_pm">
	<c:forEach items="${bookRankMap['goldenRankByAllList']}" var="item" varStatus="status">
		<li><span><em>${status.count}</em></span><a href="${pageContext.request.contextPath }/m/book/${item.id}">${item.name}</a></li>
	</c:forEach>
</section>
<section class="index_pm">
	<c:forEach items="${bookRankMap['rewardRankByAllList']}" var="item" varStatus="status">
		<li><span><em>${status.count}</em></span><a href="${pageContext.request.contextPath }/m/book/${item.id}">${item.name}</a></li>
	</c:forEach>
</section>
<!--footer-->
<%@ include file="../footer_m.jsp"%>
<!--footer-->


</body>
</html>