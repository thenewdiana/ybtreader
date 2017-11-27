<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common.jsp" %>
<!DOCTYPE html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>flash动画-雁北堂中文网</title>
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
           	<c:forEach items="${subjectMap['ad_left']}" var="item" varStatus="status">
                <c:if test="${status.count==1}">
                <a href="${contextPath }/book/${item.bookId}" class="ad-l">
                	<img class="pic" src="${item.picUrl}"/>
                </a>
                </c:if>
           	</c:forEach>
            <c:forEach items="${subjectMap['ad_right']}" var="item" varStatus="status">
                <c:if test="${status.count==1}">
                <a href="${contextPath }/book/${item.bookId}" class="ad-r">
                	<img class="pic" src="${item.picUrl}"/>
                </a>
                </c:if>
           	</c:forEach>
            <!--ad左右侧广告 end-->

            <!--flash begin-->
            <div class="block flash">
                <div class="header">
                    <h3 class="title">Flash动画<em class="desc">推荐</em>
                    </h3>
                    <div class="desc">
                        <p>懒人专属</p>
                    </div>
                </div>
                <div class="content">
                    <c:forEach items="${flashList}" var="item" varStatus="status">
                        <c:if test="${status.count<4}">
                   	<a href="play_new/${item.id}" class="box">
                        <img class="pic" src="${item.fullFlashImage}" alt="${item.name}">
                        <h4 class="title">${item.name}</h4>
                    </a>
                        </c:if>
                        <c:if test="${status.count==4}">
                   	<a href="play_new/${item.id}" class="box last">
                        <img class="pic" src="${item.fullFlashImage}" alt="${item.name}">
                        <h4 class="title">${item.name}</h4>
                    </a>
                        </c:if>
                   	</c:forEach>
                </div>
                <div class="content last">
                	<c:forEach items="${flashList}" var="item" varStatus="status">
                        <c:if test="${status.count<8&&status.count>4}">
                   	<a href="play_new/${item.id}" class="box">
                        <img class="pic" src="${item.fullFlashImage}" alt="${item.name}">
                        <h4 class="title">${item.name}</h4>
                    </a>
                        </c:if>
                        <c:if test="${status.count==8}">
                   	<a href="play_new/${item.id}" class="box last">
                        <img class="pic" src="${item.fullFlashImage}" alt="${item.name}">
                        <h4 class="title">${item.name}</h4>
                    </a>
                        </c:if>
                   	</c:forEach>
                </div>
            </div>
            <!--flash end-->

            <!--简介推荐 begin-->
            <div class="block abstract">
            	<c:forEach items="${flashList}" var="item" varStatus="status">
                    <a href="play_new/${item.id}" class="link"><span class="hot">HOT</span><span class="desc">${item.name}</span></a>
              	</c:forEach>
            </div>
            <!--简介推荐 end-->

            <!--漫画库 begin-->
            <div class="block collect"  data-collect='2'  id="jsCollect">
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