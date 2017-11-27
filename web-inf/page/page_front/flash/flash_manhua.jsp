<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>漫画精选-雁北堂中文网</title>
    <meta name="keywords" content="长江之战,长江之战书评,长江之战预售,长江之战名家推荐,蛇从革访谈"></meta>
    <meta name="description" content="蛇从革宜昌鬼事系列最新力作《大宗师：长江之战》专题，为你提供《长江之战》的各种精彩书评、名家推荐、以及预售、购买渠道"></meta>
    <link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/flash/index.css"/>
    <script type="text/javascript" src="${sessionScope.baseUrl}pc/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="${sessionScope.baseUrl}pc/js/main.js"></script>
    <script type="text/javascript" src="${sessionScope.baseUrl}pc/js/time.js"></script>
    <script type="text/javascript" src="${sessionScope.baseUrl}pc/js/statistics_bd.js"></script>


</head>


<body>
<!--header begin-->
<%@ include file="../header.jsp" %>
<!--header end-->
<%@ include file="../header_recomm.jsp" %>
<!--导航-->
<jsp:include page="../banner.jsp">
    <jsp:param name="menu" value="channel_manhua"/>
</jsp:include>


<!--中间-->
<div class="body-bg">
    <div class="content">
        <div class="top">
            <div class="nav-top">
                <ul>
                    <a href="${pageContext.request.contextPath }/flash/manhua"><li class="li-1"><b>漫画精选</b></li></a>
                    <a href="${pageContext.request.contextPath }/flash"><li><b>Flash动画</b></li></a>
                    <a href="${pageContext.request.contextPath }/flash/face"><li><b>动态表情</b></li></a>
                </ul>
            </div>
            <div class="center">
                <ul class="cen">
                    <c:forEach items="${subjectMap['one_column']}" var="item" varStatus="status">
                        <li class="list" <c:if test="${status.count==1}">style="margin-left:0px;"</c:if>>
                            <a href="${contextPath }/book/${item.bookId}" target="_blank" >
                            <img src="${item.bannerImage}"/>
                            <div class="title1">
                                <h2 align="center">《${item.bookName }》</h2>
                            </div>
                            </a>
                        </li>
                    </c:forEach>
                    <li id="title-right">
                        <h1>近期热门</h1>
                        <ul style="float:left;">
                            <c:forEach items="${subjectMap['two_column']}" var="item" varStatus="status">
                                <c:if test="${status.count<6}">
                                    <li>
                                        <a href="${contextPath }/book/${item.bookId}" target="_blank" class="interceptString" datalength="5" style="color:#CCCCCC;">${status.count}.${item.bookName }</a>
                                    </li>
                                </c:if>
                            </c:forEach>
                        </ul>
                        <ul style="float:left;margin-left:40px;">
                            <c:forEach items="${subjectMap['two_column']}" var="item" varStatus="status">
                                <c:if test="${status.count>5}">
                                    <li>
                                        <a href="${contextPath }/book/${item.bookId}" target="_blank" class="interceptString" datalength="5" style="color:#CCCCCC;">${status.count}.${item.bookName }</a>
                                    </li>
                                </c:if>
                            </c:forEach>
                        </ul>
                        <div class="title-foot">
                            <span style="color:#F00; background:#000; padding:3px; position:relative; top:10px;">推</span>
                            <c:forEach items="${subjectMap['three_column']}" var="item" varStatus="status">
                                <span style="color:#FFCC33; position:relative; top:10px; left:5px;"><a href="${contextPath }/book/${item.bookId}" target="_blank" style="color: #FFCC33;">${item.bookName }</a></span>
                            </c:forEach>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <!--最新速递-->
        <div class="Courier">
            <img src="${sessionScope.baseUrl}pc/images/flash/flash_sudi.jpg" width="100px;"
                 style="margin-top:15px; margin-left:30px; float:left;"/>
            <ul class="biaoti">
                <c:forEach items="${subjectMap['four_column']}" var="item" varStatus="status">
                    <a href="${contextPath }/book/${item.bookId}" target="_blank" ><li class="interceptString" datalength="3">${item.bookName }</li></a>
                </c:forEach>
            </ul>
            <ul class="biaoti">
                <li>更新时间：一天前</li>
                <li>更新时间：一天前</li>
            </ul>
            <c:forEach items="${subjectMap['five_column']}" var="item" varStatus="status">
                <a href="${contextPath }/book/${item.bookId}" target="_blank" ><img src="${item.bannerImage}"  style="margin-left:55px;" width="540"/></a>
            </c:forEach>

        </div>

        <!--推荐-->
        <div class="recommended" style="overflow: hidden   ;">
            <h1>漫画<span>推荐</span></h1>
            <div class="list2">
                <ul>
                    <c:forEach items="${subjectMap['six_column']}" var="item" varStatus="status">
                        <li class="tab1" <c:if test="${status.count==1}">style="margin-left:-7px;"</c:if>>
                            <a href="${contextPath }/book/${item.bookId}" target="_blank" ><img src="${item.bannerImage}"  width="139"/><br/><b>${item.bookName }</b></a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <div style="width:50px; height:220px; background-color:#FFF; position:relative;
	top:-250px;
	left:950px;">
                <div class="but">
                    <img class="but-img" src="${sessionScope.baseUrl}pc/images/flash/flash_move.jpg" width="48"
                         height="188"/>
                </div>
            </div>
        </div>

        <!--客服-->
        <a href="${pageContext.request.contextPath }/callcenter"><img src="${sessionScope.baseUrl}pc/images/flash/flash_kefu.jpg"
                                                                      style="position:relative; left:200px; top:-280px;"/></a>
    </div>
    <div class="sub mt15"></div>
</div>
<style>
    .tab1 {float:left;
        margin-left:15px;
    }
    .tab1 b{position:relative;
        top:10px;}
    .but{width:48px;
        height:188px;
        border:1px solid #333;}
    .tab1 img{border:1px solid #333;}
</style>
<script>
    $(document).ready(function(){
        $(".but-img").click(function(){
            $(".list2").animate({left:'10px'});
        });
    });
</script>

<!--footer-->
<%@ include file="../footer.jsp" %>
<!--footer-->
</body>

</html>
