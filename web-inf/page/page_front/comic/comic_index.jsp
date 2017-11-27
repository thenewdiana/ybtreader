<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>漫画精选-雁北堂中文网</title>
        <meta name="keywords" content="长江之战,长江之战书评,长江之战预售,长江之战名家推荐,蛇从革访谈">
        <meta name="description" content="蛇从革宜昌鬼事系列最新力作《大宗师：长江之战》专题，为你提供《长江之战》的各种精彩书评、名家推荐、以及预售、购买渠道">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">  
        <link rel="icon" href="${sessionScope.baseUrl}pc/images/comic/favicon.ico" mce_href="${sessionScope.baseUrl}pc/images/comic/favicon.ico" type="image/x-icon">
        <link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/comic/reset.css">
        <link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/comic/style.css">
        <script type="text/javascript" src="${sessionScope.baseUrl}pc/js/require.min.js" data-main="${sessionScope.baseUrl}pc/js/config.js"></script>
    </head>
    <body>
        <%@ include file="./header.jsp" %>

        <!--content begin-->
        <div class="main w1000">
            <!--ad左右侧广告 begin-->
            <%@ include file="./ad.jsp" %>
            <!--ad左右侧广告 end-->
            
            <!--热门漫画 begin-->
            <div class="hotest">
                <div class="left">
                    <div class="content">
                        <c:forEach items="${subjectMap['one_column']}" var="item" varStatus="status">
                        <a class="box <c:if test="${status.index==1}">second</c:if><c:if test="${status.index==2}">third</c:if>" href="${contextPath }/book/${item.bookId}" target="_blank">
                            <img class="pic" src="${item.bannerImage}" alt="${item.bookName }">
                            <div class="desc">
                                <h4><em>《${item.bookName }</em>》</h4>
                            </div>
                        </a>
                        </c:forEach>
                    </div>
                </div>
                <div class="right">
                    <div class="header">
                        <h4 class="title">近期热门</h4>
                        <div class="content">
                            <ul class="list">
                            	<c:forEach items="${subjectMap['two_column']}" var="item" varStatus="status">
	                                <c:if test="${status.count<4}">
	                                    <li class="item">
	                                    	<a href="${contextPath }/book/${item.bookId}" class="link" target="_blank"><span class="rank win">${status.count}</span>${item.bookName }</a>
	                                    </li>
	                                </c:if>
	                                <c:if test="${status.count>3&&status.count<6}">
	                                    <li class="item">
	                                    	<a href="${contextPath }/book/${item.bookId}" class="link" target="_blank"><span class="rank">${status.count}</span>${item.bookName }</a>
	                                    </li>
	                                </c:if>
                            	</c:forEach>
                            </ul>
                            <ul class="list">
                            	<c:forEach items="${subjectMap['two_column']}" var="item" varStatus="status">
	                                <c:if test="${status.count>5}">
	                                    <li class="item">
	                                    	<a href="${contextPath }/book/${item.bookId}" class="link" target="_blank"><span class="rank">${status.count}</span>${item.bookName }</a>
	                                    </li>
	                                </c:if>
                            	</c:forEach>
                            </ul>
                            <div class="recommand">
                                <div class="icon">荐</div>
                                <c:forEach items="${subjectMap['three_column']}" var="item" varStatus="status">
                                <a class="link" href="${contextPath }/book/${item.bookId}"><span class="name">${item.bookName }</span> — <span class="author">${item.bookAuthorNick}</span></a>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--热门漫画 end-->

            <!--漫画速递 begin-->
            <div class="newest">
                <div class="left">
                    <div class="title">
						最新<br>速递
                    </div>
                    <div class="content">
                            <ul class="list">
				                <c:forEach items="${subjectMap['four_column']}" var="item" varStatus="status">
				                <li class="item">
				                	<a href="${contextPath }/book/${item.bookId}" target="_blank" class="link" >
				                		<span class="name">${item.bookName }</span></a>更新时间：<span class="update">两天前</span>
				                </li>
				                </c:forEach>
                            </ul>
                        </div>
                </div>
                <div class="right">
                	<c:forEach items="${subjectMap['five_column']}" var="item" varStatus="status">
                		<a href="${contextPath }/book/${item.bookId}" target="_blank" ><img src="${item.bannerImage}" class="pic" alt="${item.bookName }"/></a>
            		</c:forEach>
                </div>
            </div>
            <!--漫画速递 end-->

            <!--漫画精选 begin-->
            <div class="block">
                <div class="header">
                    <h3 class="title">精品漫画<em class="desc">推荐</em>
                    </h3>
                    <div class="desc">
                        <p>有些漫画总会遇到的</p>
                    </div>
                </div>
                <div class="content">
                    <c:forEach items="${subjectMap['six_column']}" var="item" varStatus="status">
                    <c:if test="${status.count<6}">
                    <a href="${contextPath }/book/${item.bookId}" class="box">
                        <div class="pic">
                            <img src="${item.bannerImage}" alt="${item.bookName }">
                        </div>
                        <h4 class="title">${item.bookName }</h4>
                        <div class="desc">
                            <p>${item.bookInfo }</p>
                        </div>
                    </a>
                    </c:if>
                    </c:forEach>
                    <a href="top" class="more box">更<br>多<br>>></a>
                </div>
            </div>
            <!--精选 end-->
            
            <!--四格漫画 begin-->
            <div class="block">
                <div class="header">
                    <h3 class="title">四格漫画<em class="desc">推荐</em>
                    </h3>
                    <div class="desc">
                        <p>几张图讲述几个好故事</p>
                    </div>
                </div>
                <div class="content">
                    <c:forEach items="${subjectMap['seven_colunn']}" var="item" varStatus="status">
                    <c:if test="${status.count<6}">
                    <a href="${contextPath }/flash/strips_detail/${item.bookId}" class="box">
                        <div class="pic">
                            <img src="${item.bannerImage}" alt="${item.bookName }">
                        </div>
                        <h4 class="title">${item.bookName }</h4>
                        <div class="desc">
                            <p>${item.bookInfo }</p>
                        </div>
                    </a>
                    </c:if>
                    </c:forEach>
                    <a href="strips" class="more box">更<br>多<br>>></a>
                </div>
            </div>
            <!--四格漫画 end-->
            
            <!--全幅广告 begin-->
            <div class="ad">
            	<c:forEach items="${subjectMap['ad_middle']}" var="item" varStatus="status">
               	<a href="${contextPath }/book/${item.bookId}" class="ad-full" title="${item.bookName }">
               		<img src="${item.bannerImage}" class="pic" alt="${item.bookName }"/>
               	</a>
           		</c:forEach>
            </div>
            <!--全幅广告 end-->
            
            <!--flash begin-->
            <div class="block">
                <div class="header">
                    <h3 class="title">Flash动画<em class="desc">推荐</em>
                    </h3>
                    <div class="desc">
                        <p>懒人专属</p>
                    </div>
                </div>
                <div class="content flash">
                	<!--
                    <c:forEach items="${subjectMap['eight_column']}" var="item" varStatus="status">
                    <c:if test="${status.count<6}">
                    <a href="${contextPath }/flash/play_new/${item.bookId}" class="box">
                        <div class="pic">
                            <img src="${item.bannerImage}" alt="${item.bookName }">
                        </div>
                        <h4 class="title">${item.bookName }</h4>
                        <div class="desc">
                            <p>${item.bookInfo }</p>
                        </div>
                    </a>
                    </c:if>
                    </c:forEach>
                     -->
                     <c:forEach items="${flashList}" var="item" varStatus="status">
                    <c:if test="${status.count<5}">
                    <a href="${contextPath }/flash/play_new/${item.id}" class="box">
                        <div class="pic">
                            <img src="${item.fullFlashImage}" alt="${item.name }">
                        </div>
                        <h4 class="title">${item.name }</h4>
                        <div class="desc1">
                            <p></p>
                        </div>
                    </a>
                    </c:if>
                    </c:forEach>
                    <a href="flash" class="more box">更<br>多<br>>></a>
                </div>
            </div>
            <!--flash end-->
            
            <!--动态表情 begin-->
            <div class="block">
                <div class="header">
                    <h3 class="title">动态表情<em class="desc">推荐</em>
                    </h3>
                    <div class="desc">
                        <p>斗图无压力</p>
                    </div>
                </div>
                <div class="content expression">
                    <c:forEach items="${subjectMap['nine_column']}" var="item" varStatus="status">
                    <c:if test="${status.count<5}">
                    <a href="${contextPath }/flash/expression/${item.bookId}" class="box">
                        <div class="pic">
                            <img src="${item.bannerImage}" alt="${item.bookName }">
                        </div>
                        <h4 class="title">${item.bookName }</h4>
                        <div class="desc">
                            <p>${item.bookInfo }</p>
                        </div>
                    </a>
                    </c:if>
                    </c:forEach>
                    <a href="expression" class="more box">更<br>多<br>>></a>
                </div>
            </div>
            <!--动态表情 end-->
            
            <!--排行榜 begin-->
            <div class="block ranking">
                <div class="header">
                    <h3 class="title">排行榜<em class="desc">榜单</em>
                    </h3>
                </div>
                <div class="content">
                    <div class="recent box">
                        <h4 class="list-title" ><strong>最新</strong>更新</h4>
                        <div class="content">
                            <ul class="list">
                            <c:forEach items="${subjectMap['top_new']}" var="item" varStatus="status">
                            	<li class="item"><a href="${contextPath }/book/${item.bookId}" class="link" title="${item.bookName }">${item.bookName }</a><span class="new">NEW</span></li>
				           	</c:forEach>
                            </ul>
                        </div>
                    </div>
                    <div class="week box">
                        <h4 class="list-title"><strong>本周</strong>热门</h4>
                        <div class="content">
                            <ul class="list">
                            	<c:forEach items="${subjectMap['top_week']}" var="item" varStatus="status">
                            		<c:if test="${status.count>3}">
                            			<li class="item"><a href="${contextPath }/book/${item.bookId}" class="link" title="${item.bookName }">${item.bookName }</a><span class="hot">HOT</span></li>
                            		</c:if>
                            		<c:if test="${status.count<=3}">
	                            		<li class="item top">
	                                    <a class="link" href="${contextPath }/book/${item.bookId}">
	                                        <div class="win">NO.${status.count}</div>
	                                        <img class="pic" src="${item.bannerImage }">
	                                        <div class="wrapper">
	                                            <h5 class="title">${item.bookName }</h5>
	                                            <p class="desc">${item.bookShortInfo}</p>
	                                        </div>
	                                    </a>
                                		</li>
                            		</c:if>
				           		</c:forEach>
                            </ul>
                        </div>
                    </div>
                    <div class="month box">
                        <h4 class="list-title" ><strong>本月</strong>热门</h4>
                        <div class="content">
                            <ul class="list">
                            	<c:forEach items="${subjectMap['top_month']}" var="item" varStatus="status">
                            		<c:if test="${status.count>3}">
                            			<li class="item"><a href="${contextPath }/book/${item.bookId}" class="link" title="${item.bookName }">${item.bookName }</a><span class="hot">HOT</span></li>
                            		</c:if>
                            		<c:if test="${status.count<=3}">
	                            		<li class="item top">
	                                    <a class="link" href="${contextPath }/book/${item.bookId}">
	                                        <div class="win">NO.${status.count}</div>
	                                        <img class="pic" src="${item.bannerImage }">
	                                        <div class="wrapper">
	                                            <h5 class="title">${item.bookName }</h5>
	                                            <p class="desc">${item.bookShortInfo}</p>
	                                        </div>
	                                    </a>
                                		/li>
                            		</c:if>
				           		</c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!--排行榜 end-->
            
            <!--漫画库 begin-->
            <div class="block collect"  data-collect='0' id="jsCollect">
                <%@ include file="./comic_base.jsp" %>
            </div>
            <!--漫画库 end-->
            
        </div>
        <!--content end-->

        <!--footer begin-->
        <%@ include file="./footer.jsp" %>
        <!--footer end-->
    </body>
</html>