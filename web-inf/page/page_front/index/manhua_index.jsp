<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>漫画_雁北堂中文网</title>
<meta name="keywords" content="漫画_雁北堂中文网 "></meta>
<meta name="description" content="雁北堂中文网男生频道提供都市小说、玄幻小说、武侠小说、历史小说等好看的男性向小说推荐，方便读者在线阅读各类男生小说。"></meta>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/slideBox.css"/>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/style.css"/>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/jquery.alert.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/main.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/tabs.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/slideBox.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/time.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/statistics_bd.js"></script>
<script type="text/javascript">var theJSArr= new Array();</script>

</head>


<body>
<!--header begin-->
<%@ include file="../header.jsp"%>
<!--header end-->
<%@ include file="../header_recomm.jsp"%>
<!--导航-->
<jsp:include page="../banner.jsp">
	 <jsp:param name="menu" value="channel_manhua"/>
</jsp:include>
<!--中间-->
<div class="body-bg">
	<div class="w1000 over dm">
		<!--头部信息-->
		<div class="banner" id="slideBox">
			<ul class="slideBox-content">
				<c:forEach items="${subjectMap['one_column']}" var="item" varStatus="status">
					<script type="text/javascript">theJSArr[${status.index }] = '${item.bookName }';</script>
					<li><a href="${contextPath }/book/${item.bookId}" target="_blank" title="${item.bookName}"><img src="${item.bannerImage}" alt="" height="499" width="1000"></a></li>
				</c:forEach>
			</ul>
		</div>
		<!--最新-->
		<div class="newwrap">
			<img src="${sessionScope.baseUrl}pc/images/dongman/new_tit.png" alt="">
			<div class="cont clearFix">
				<c:forEach items="${subjectMap['two_column']}" var="item" varStatus="status">
					<a href="${contextPath }/book/${item.bookId}" target="_blank" title="${item.bookName}" ><img src="${item.bannerImage}" alt="" height="141" width="316"></a>
				</c:forEach>
			</div>
			<div class="cont clearFix">
				<div class="fl">
					<c:forEach items="${subjectMap['three_column']}" var="item" varStatus="status">
						<c:if test="${status.count==1}">
							<a href="${contextPath }/book/${item.bookId}" target="_blank" title="${item.bookName}" ><img src="${item.bannerImage}" alt="" height="483" width="362"></a>
						</c:if>
					</c:forEach>
				</div>
				<div class="fr book_right">
					<c:forEach items="${subjectMap['three_column']}" var="item" varStatus="status">
						<c:if test="${status.count==2 or status.count ==3}">
							<div class="fl">
								<a href="${contextPath }/book/${item.bookId}" target="_blank" title="${item.bookName}" ><img src="${item.bannerImage}" alt="" height="288" width="292"></a>
							</div>
						</c:if>
						<c:if test="${status.count==4}">
							<div class="fl">
								<a href="${contextPath }/book/${item.bookId}" target="_blank" title="${item.bookName}" ><img src="${item.bannerImage}" alt="" class="mat11" height="182" width="598"></a>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
		</div>
		<!--最热-->
		<div class="topwrap">
			<img src="${sessionScope.baseUrl}pc/images/dongman/hot_tit.png" alt="">
			<div class="topcont clearFix">
				<c:forEach items="${subjectMap['four_column']}" var="item" varStatus="status">
					<div class="fl book_pic">
						<a href="${contextPath }/book/${item.bookId}" target="_blank" title="${item.bookName}" ><img src="${item.bannerImage}" alt="" height="386" width="408"></a>
					</div>
					<div class="book_info fr">
						<h3>${item.bookName} <img src="${sessionScope.baseUrl}pc/images/dongman/icon_qy.png" alt=""></h3>
						<p class="info_p2">作者:<span>${item.bookAuthorNick}</span></p>
						<p class="info_p2">类型:<span>${item.cgName}</span></p>
						<a href="${contextPath }/book/${item.bookId}" target="_blank" title="${item.bookName}" class="btn_read"><img src="${sessionScope.baseUrl}pc/images/dongman/btn_read.png"></a>
						<div class="book_text">
							<span class="info_detail">作品简介:</span>${item.bookInfo}
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="rank_list">
				<h3><img src="${sessionScope.baseUrl}pc/images/dongman/rank_tit.png" alt=""></h3>
				<ul class="clearFix">
					<c:forEach items="${subjectMap['five_column']}" var="item" varStatus="status">
						<li>
							<a href="${contextPath }/book/${item.bookId}" target="_blank" title="${item.bookName}" ><img src="${item.bannerImage}" alt="" height="142" width="153"></a>
							<span>${status.count}</span>
						</li>
					</c:forEach>
				</ul>
				<img style="padding:40px 0 0 50px;font-weight:blod;">
					<b>表情包下载：</b><a href="${sessionScope.baseUrl}custom/biaoqingbao/biaoqingbao.rar"><img src="${sessionScope.baseUrl}pc/images/biaoqingbao.png"></img></a>
				</p>
			</div>
		</div>
	</div>
	<div class="sub mt15"></div>
</div>
<style>
	.pv-slideBox .pv-slideBox-page{
		position: absolute;
		right: 5px;
		bottom:5px;
		left: auto;
	}
	.pv-slideBox .pv-slideBox-page li{
		width:180px;
		padding:0 20px;
		float: none;
		height: 45px;
		text-align: center;
		line-height: 45px;
		color: #ae2a23;
		margin:0;
	}
	.pv-slideBox .pv-slideBox-page .pv-slideBox-current-page{
		background:#ae2a23;
		color: #fff;
		border:1px solid #fff;
		width:180px;
		padding:0 20px;
	}
</style>

<!--footer-->
<%@ include file="../footer.jsp"%>
<!--footer-->


<script type="text/javascript">
	jQuery(function($) {
		//图片轮播
		$("#slideBox").slideBox({
			width:1000,
			height:499,
			page:true,
			pageContent:theJSArr,
			speed:5,
			circle:true,
			autoPage:true,
			easing : 'swing'
		});

	});
</script>
</body>

</html>
