<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common.jsp" %>
<!DOCTYPE html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>四格漫画-雁北堂中文网</title>
        <meta name="keywords" content="长江之战,长江之战书评,长江之战预售,长江之战名家推荐,蛇从革访谈">
        <meta name="description" content="蛇从革宜昌鬼事系列最新力作《大宗师：长江之战》专题，为你提供《长江之战》的各种精彩书评、名家推荐、以及预售、购买渠道">
        <link rel="icon" href="${sessionScope.baseUrl}pc/images/comic/favicon.ico" mce_href="${sessionScope.baseUrl}pc/images/comic/favicon.ico" type="image/x-icon">
        <link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/comic/reset.css">
        <link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/comic/style.css">
        <script type="text/javascript" src="${sessionScope.baseUrl}pc/js/require.min.js" data-main="${sessionScope.baseUrl}pc/js/config.js"></script>
    </head>
    <body>
        <%@ include file="./header.jsp" %>

        <!--content begin-->
        <div class="main w1000">
            <!--ad左右侧广告 begin-->
           	<%@ include file="./ad.jsp" %>
            <!--ad左右侧广告 end-->
            
            <!--四格漫画 begin-->
            <div class="block strips-all">
                <div class="header">
                    <h3 class="title">四格漫画<em class="desc">推荐</em>
                    </h3>
                    <div class="desc">
                        <p>几张图讲述几个好故事</p>
                    </div>
                </div>
                <div class="content">
                	<c:forEach items="${subjectMap['strips_tuijian']}" var="item" varStatus="status">
                        <c:if test="${status.count<6}">
                   	<a href="strips_detail/${item.bookId}" class="box">
                        <img class="pic" src="${item.bannerImage}" alt="${item.bookName}">
                        <h4 class="title">${item.bookName}</h4>
                        <div class="desc">
                            <p>${item.bookInfo }</p>
                        </div>
                    </a>
                        </c:if>
                        <c:if test="${status.count==6}">
                   	<a href="strips_detail/${item.bookId}" class="box last">
                        <img class="pic" src="${item.bannerImage}" alt="${item.bookName}">
                        <h4 class="title">${item.bookName}</h4>
                        <div class="desc">
                            <p>${item.bookInfo }</p>
                        </div>
                    </a>
                        </c:if>
                   	</c:forEach>
                </div>
                <div class="content">
                    <c:forEach items="${subjectMap['strips_tuijian']}" var="item" varStatus="status">
                        <c:if test="${status.count>6&&status.count<12}">
                   	<a href="strips_detail/${item.bookId}" class="box">
                        <img class="pic" src="${item.bannerImage}" alt="${item.bookName}">
                        <h4 class="title">${item.bookName}</h4>
                        <div class="desc">
                            <p>${item.bookInfo }</p>
                        </div>
                    </a>
                        </c:if>
                        <c:if test="${status.count==12}">
                   	<a href="strips_detail/${item.bookId}" class="box last">
                        <img class="pic" src="${item.bannerImage}" alt="${item.bookName}">
                        <h4 class="title">${item.bookName}</h4>
                        <div class="desc">
                            <p>${item.bookInfo }</p>
                        </div>
                    </a>
                        </c:if>
                   	</c:forEach>
                </div>
            </div>
            <!--四格漫画 end-->

            <!--简介推荐 begin-->
            <div class="block abstract">
            	<c:forEach items="${subjectMap['trips_hot']}" var="item" varStatus="status">
                    <a href="strips_detail/${item.bookId}" class="link"><span class="hot">HOT</span><span class="desc">${item.bookName}</span></a>
              	</c:forEach>
            </div>
            <!--简介推荐 end-->
            
            <!--漫画库 begin-->
            <div class="block collect"  data-collect='1'  id="jsCollect">
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