<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common.jsp" %>
<!DOCTYPE html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>动态表情-雁北堂中文网</title>
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

            <!--动态表情列表 begin-->
            <div class="face-info block ">
                <h4 class="title">原创<span class="name">${book.name }</span></h4>
                <ul class="list" id="summary">
                	<c:forEach items="${chapters}" var="chapter">
                    <li class="item">
	                    <a class="link" href="javascript:;">
	                    	<span class="name">${chapter.title }</span>
	                    	<c:set value="${chapter.emotes }" var="emotes"/>
		                    <div class="wrapper">
		                    <c:forEach items="${emotes}" var="emote">
		                        <span class="num">${emote.index}</span><c:if test="item.count%5==0"><br></c:if>
		                    </c:forEach>
		                    </div>
	                    </a>
                    </li>
                    </c:forEach>
                </ul>
            </div>
            <!--动态表情列表 end-->

            <!--动态表情展示 begin-->
            <div class="face-show block">
                <div class="info">
                    <div class="wrapper">
                        <img class="pic" id="picInfo" src="${sessionScope.baseUrl}${chapter.firstEmote}">
                    </div>
                    <h4 class="name">${book.name}</h4>
                    <h4 class="author">作者：${book.authorNick}</h4>
                </div>
                <div class="content">
                	<c:forEach items="${chapters}" var="chapter" varStatus="status">
                    <ul class="list face-${status.index+1}">
                    	<c:set value="${chapter.emotes }" var="emotes"/>
	                    <c:forEach items="${emotes}" var="emote">
	                        <li class="item"><img class="pic" src="${sessionScope.baseUrl}${emote.url}"></li>
	                    </c:forEach>
                    </ul>
                    </c:forEach>
                    <p class="note"> 注：作品版权归作者所有，本站仅用于浏览娱乐，不用于盈利等商业范畴。</p>
                </div>
            </div>
            <!--动态表情展示 end-->

            <!--漫画库 begin-->
            <div class="block collect"  data-collect='3' id="jsCollect">
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