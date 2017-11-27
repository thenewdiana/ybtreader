<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${book.name}_雁北堂_阅读江湖新力量</title>
<meta name="keywords" content="${book.name }全文阅读"></meta>
<meta name="description" content="${book.name }全文目录"></meta>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/style.css"/>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/uaredirect.js" ></script>
<script type="text/javascript">uaredirect("http://m.ebtang.com/m/book/${book.id}/directory");</script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/main.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/statistics_bd.js"></script>

</head>

<body>
<!--header begin-->
<%@ include file="../header.jsp"%>
<!--header end-->
<%@ include file="../header_recomm.jsp"%>
<!--导航-->
<jsp:include page="../banner.jsp">
	 <jsp:param name="menu" value="bookroom"/>   
</jsp:include>
<!--中间-->
<div class="body-bg">
    <!--模块二-->
    <div class="w1000">
        <!--模块二-->
        <c:forEach items="${bookSectionList }" var="item" varStatus="status">
        <div class="read-list pos_r">
        	<c:if test="${status.count == 1 }">
        	<h1 class="ac">${book.name }</h1>
            <a href="${pageContext.request.contextPath }/book/${book.id}" class="lgo-back ac white f14 strong">返 回</a>
            </c:if> 
        	<div class="over read-ls">
                <h2 class="ac">${item.sectionName }</h2>
                <h3 class="lgo-size">本卷字数：${item.words }</h3>
            </div>
            <div class="over col66">
            	<ul>
            		<c:forEach items="${item.firstCollList }" var="firstColl">            		
                	<li><a href="${pageContext.request.contextPath }/book/${book.id }/${firstColl.id}" <c:if test="${firstColl.isVip == 1}">class="vip"</c:if>>${firstColl.title }</a> <span>${firstColl.publishTimeFormatMMDD }</span></li>
                    </c:forEach>
                </ul>
                <ul class="mg25">
                	<c:forEach items="${item.secondCollList }" var="secondColl">
                	<li><a href="${pageContext.request.contextPath }/book/${book.id }/${secondColl.id}" <c:if test="${secondColl.isVip == 1}">class="vip"</c:if>>${secondColl.title }</a> <span>${secondColl.publishTimeFormatMMDD }</span></li>
                    </c:forEach>
                </ul>
                <ul>
               	  	<c:forEach items="${item.thirdCollList }" var="thirdColl">
                	<li><a href="${pageContext.request.contextPath }/book/${book.id }/${thirdColl.id}" <c:if test="${thirdColl.isVip == 1}">class="vip"</c:if>>${thirdColl.title }</a> <span>${thirdColl.publishTimeFormatMMDD }</span></li>
                    </c:forEach>
              </ul>
            </div>
        </div>
        </c:forEach>        
        <!--模块二-->
    </div>
</div>

<!--footer-->
<%@ include file="../footer.jsp"%>
<!--footer-->
</body>
</html>