<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><spring:message code="front.global.title"></spring:message>-日更5000</title>
<meta name="keywords" content="日更5000 "></meta>
<meta name="description" content="更新最多的地方，就在这里。"></meta>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/slideBox.css"/>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/style.css"/>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/jquery.alert.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/main.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/tabs.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/slideBox.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/sliding.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/time.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/statistics_bd.js"></script>
</head>


<body>
<!--header begin-->
<%@ include file="../header.jsp"%>
<!--header end-->
<%@ include file="../header_recomm.jsp"%>
<!--导航-->
<jsp:include page="../banner.jsp">
	<jsp:param name="menu" value="mostUpdate"/>   
</jsp:include>
<!--中间-->
<div class="body-bg">
  <div class="w1000 over">
        <div class="fl mt15 bords daily pos_r">
        	<div id="moveDiv1" class="over">
                <ul>
                    <c:forEach items="${subjectMap['one_left']}" var="item" varStatus="status">
	            		<li>
	                        <a href="${contextPath }/book/${item.bookId}"><img src="${item.bookBigImage}" onerror="this.src='${item.errorBigImage}'" width="200" height="260" /></a>
	                        <div class="divs">${item.bookShortRecommDec}</div><a href="${contextPath }/book/${item.bookId}" title="[阅读]" class="red">[阅读]</a>
	                    </li>
	               	</c:forEach>
              </ul>
            <div class="btn">
                <a id="pre3" class="btn-l" href="javascript:void(0)"></a>
                <a id="next3" class="btn-r" href="javascript:void(0)"></a>
            </div>
			</div>
       </div>
        <!--right begin-->
        <div class="wd-244 fr bords mt15">
            <div class="ce-t over new-tab6">
                <span class="fl">免费榜</span>
                <ul>
                    <li>周</li>
                    <li>月</li>
                    <li class="on">总</li>
                </ul>
                <jsp:include page="../rank/rank_more.jsp">
					 <jsp:param name="action" value="freeBook"/>   
				</jsp:include>
            </div>
            <div class="ce-c">
                <ul class="new-list5 hide">
					<c:forEach items="${bookRankMap['freeBookRankByWeekList'] }" var="item"
						varStatus="status">
						<%@ include file="../rank/sub_rank_click.jsp"%>
					</c:forEach>
				</ul>
                      <ul class="new-list5 hide">
					<c:forEach items="${bookRankMap['freeBookRankByMonthList'] }" var="item"
						varStatus="status">
						<%@ include file="../rank/sub_rank_click.jsp"%>
					</c:forEach>
				</ul>
				<ul class="new-list5 show">
					<c:forEach items="${bookRankMap['freeBookRankByAllList'] }" var="item"
						varStatus="status">
						<%@ include file="../rank/sub_rank_click.jsp"%>
					</c:forEach>
				</ul>
            </div>
        </div>
       <!--right begin-->           
    
    </div>
    <div class="sub mt15"></div>
    <!--模块二-->
    <div class="w1000 dail over">
    	<c:forEach items="${bookRankMap['update5000ByDayList'] }" var="item"
								varStatus="status">
			<dl>
	        	<dt><a href="${contextPath}/book/${item.id}"><img src="${item.bigCoverImage}" width="118" height="148" /></a></dt>
	            <dd>
	            	<h2><strong><a href="${contextPath}/book/${item.id}" >${item.name}</a></strong>[${item.categoryName}]</h2>
	                <h3><span>作者：</span><a href="${contextPath }/book/listbyauthor/${item.authorId}">${item.authorNick}</a></h3>
	                <p>${item.info}</p><a href="${contextPath}/book/${item.id}" class="red">[阅读]</a>
	            </dd>
	        </dl>
		</c:forEach>
    </div>
    <!--模块二-->
</div>


<!--footer-->
<%@ include file="../footer.jsp"%>
<!--footer-->
<script type="text/javascript">
   jQuery("#moveDiv1").sliding({
        width:240,//加上边框、补白的总宽度
        num:3,
        speed:3,
        circle:true,
        pre:$("#pre3"),
        next:$("#next3")
    });
</script>
</script>
</body>

</html>
