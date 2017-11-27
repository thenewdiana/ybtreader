<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>flash列表-雁北堂中文网</title>
    <meta name="keywords" content="长江之战,长江之战书评,长江之战预售,长江之战名家推荐,蛇从革访谈"></meta>
    <meta name="description" content="蛇从革宜昌鬼事系列最新力作《大宗师：长江之战》专题，为你提供《长江之战》的各种精彩书评、名家推荐、以及预售、购买渠道"></meta>
    <link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/flash/flash.css" />
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
                    <a href="${pageContext.request.contextPath }/flash/manhua"><li><b>漫画精选</b></li></a>
                    <a href="${pageContext.request.contextPath }/flash"><li class="li-1"><b>Flash动画</b></li></a>
                    <a href="${pageContext.request.contextPath }/flash/face"><li><b>动态表情</b></li></a>
                </ul>
            </div>
            <%@ include file="./flash_common.jsp" %>
        </div>
        <!--最新速递-->
        <div class="Courier">
            <ul>
                <c:forEach items="${flashList}" var="item" varStatus="status">
                    <a class="cursor:pointer;" href="${pageContext.request.contextPath }/flash/play/${item.id}">
                    <li <c:if test="${status.count<5}">style="margin-top:10px;"</c:if>><img src="${item.fullFlashImage}"  width="227" height="150px"/>
                        <h2>${item.name}</h2>
                    </li>
                    </a>
                </c:forEach>
            </ul>
        </div>
        <!--客服-->
        <a href="${pageContext.request.contextPath }/callcenter"><img src="${sessionScope.baseUrl}pc/images/flash/flash_kefu.jpg"
                                                                      style=" position:relative; left:200px; top:0px;"/></a>
    </div>
    <div class="sub mt15"></div>
</div>

<!--footer-->
<%@ include file="../footer.jsp" %>
<!--footer-->
</body>
</html>
