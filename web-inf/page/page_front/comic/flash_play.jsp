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

            <!--漫画信息 begin-->
            <div class="strip-info">
                <div class="left">
                    <img src="${flash.fullFlashImage }" alt="" class="pic">
                </div>
                <div class="right">
                    <h3 class="title">${flash.name}</h3>
                    <h4 class="author">作者:网络</h4>
                    <div class="wrapper">
                        <h4 class="desc-title">作品简介：</h4>
                        <p class="desc"></p>
                    </div>
                </div>
            </div>
            <!--漫画信息 end-->

            <!--漫画阅读 begin-->
            <div class="reading block">
                 <div class="content" style="text-align:center;margin:0 auto">
                     <embed width="700" height="450" src="${flash.fullFlashPath}"
			             style="margin-top:20px;"/>
		            </embed>
                 </div>
                 <div class="back">
                     <!--<a href="javascript:history.go(-1);" class="link">返回</a>-->
                     <a href="${contextPath }/flash/flash" class="link">返回</a>
                 </div>
            </div>
            <!--漫画阅读 end-->

            <!--漫画库 begin-->
            <div class="block collect"  id="jsCollect" data-collect="2">
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