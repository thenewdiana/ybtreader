<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>漫画精选-雁北堂中文网</title>
        <meta name="keywords" content="长江之战,长江之战书评,长江之战预售,长江之战名家推荐,蛇从革访谈">
        <meta name="description" content="蛇从革宜昌鬼事系列最新力作《大宗师：长江之战》专题，为你提供《长江之战》的各种精彩书评、名家推荐、以及预售、购买渠道">
        <link rel="icon" href="${sessionScope.baseUrl}pc/images/comic/favicon.ico" mce_href="${sessionScope.baseUrl}pc/images/comic/favicon.ico" type="image/x-icon">
        <link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/comic/reset.css">
        <link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/comic//style.css">
        <script type="text/javascript" src="${sessionScope.baseUrl}pc/js/require.min.js" data-main="${sessionScope.baseUrl}pc/js/config.js"></script>
    </head>
    <body>
        <%@ include file="./header.jsp" %>

        <!--content begin-->
        <div class="main w1000">
            <!--ad左右侧广告 begin-->
            <%@ include file="./ad.jsp" %>
            <!--ad左右侧广告 end-->
            
            <!--热门漫画 begin-->
            <div class="hotest">
                <div class="left">
                    <div class="content">
                    	<c:forEach items="${subjectMap['jingpin_one']}" var="item" varStatus="status">
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
                            	<c:forEach items="${subjectMap['jingpin_two']}" var="item" varStatus="status">
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
                            	<c:forEach items="${subjectMap['jingpin_two']}" var="item" varStatus="status">
	                                <c:if test="${status.count>5}">
	                                    <li class="item">
	                                    	<a href="${contextPath }/book/${item.bookId}" class="link" target="_blank"><span class="rank">${status.count}</span>${item.bookName }</a>
	                                    </li>
	                                </c:if>
                            	</c:forEach>
                            </ul>
                            <div class="recommand">
                                <div class="icon">荐</div>
                                <c:forEach items="${subjectMap['jingpin_three']}" var="item" varStatus="status">
                                <a class="link" href="${contextPath }/book/${item.bookId}"><span class="name">${item.bookName }</span> — <span class="author">${item.bookAuthorNick}</span></a>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--热门漫画 end-->

            <!--漫画速递 begin-->
            <div class="newest">
                <div class="left">
                    <div class="title">
                        最新<br>速递
                    </div>
                    <div class="content">
                            <ul class="list">
                                <c:forEach items="${subjectMap['jinpin_four']}" var="item" varStatus="status">
				                <li class="item">
				                	<a href="${contextPath }/book/${item.bookId}" target="_blank" class="link" >
				                		<span class="name">${item.bookName }</span></a>更新时间：<span class="update">两天前</span>
				                </li>
				                </c:forEach>
                            </ul>
                        </div>
                </div>
                <div class="right">
                	<c:forEach items="${subjectMap['jingpin_five']}" var="item" varStatus="status">
                		<a href="${contextPath }/book/${item.bookId}" target="_blank" ><img src="${item.bannerImage}" class="pic" alt="${item.bookName }"/></a>
            		</c:forEach>
                </div>
            </div>
            <!--漫画速递 end-->

            <!--漫画精选 begin-->
            <div class="block top-comic">
                <div class="header">
                    <h3 class="title">精品漫画<em class="desc">推荐</em>
                    </h3>
                    <div class="desc">
                        <p>有些漫画总会遇到的</p>
                    </div>
                </div>
                <div class="content">
                    <c:forEach items="${subjectMap['jingpin_tuijian']}" var="item" varStatus="status">
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
                    <a href="" class="more box">更<br>多<br>>></a>
                </div>
            </div>
            <!--精选 end-->

            <!--简介推荐 begin-->
            <div class="block abstract">
            	<c:forEach items="${subjectMap['jingpin_hot']}" var="item" varStatus="status">
               		<a href="${contextPath }/book/${item.bookId}" class="link" ><span class="hot">HOT</span><span class="desc">${item.bookName}</span></a>
           		</c:forEach>
            </div>
            <!--简介推荐 end-->

            <!--漫画库 begin-->
            <div class="block collect"  data-collect='0'  id="jsCollect">
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