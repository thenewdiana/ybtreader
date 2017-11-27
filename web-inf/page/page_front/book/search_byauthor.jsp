<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><spring:message code="front.global.title"></spring:message>-搜索</title>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/js/slideBox.css"/>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/style.css"/>
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

<div class="body-bg">
    <!--模块二-->
    <div class="w1000">
    	<form action="" id="bookForm" method="post">
    	<input type="hidden" id="page" name="page" value="${pagination.currPage }"/>
        <input type="hidden" id="rows" name="rows" value="${pagination.pageSize }"/>
    	<input type="hidden" id="searchType" name="searchType" value="${bookReqForm.searchType }"/>    	
    	<div class="search-fm">
        	<ul class="f14 over">
            	<li><a href="javascript:void(0);" onclick="byBook()">按书名</a></li>
                <li class="on"><a href="javascript:void(0);" onclick="byAuthor()">按作者</a></li>
            </ul>
            <div class="over">
            	<input type="text" class="inputs fl" name="searchName" value="${bookReqForm.searchName }"/>
                <input value="搜 索" type="button" class="inpub f16 strong fl" onclick="doSearch()"/>
            </div>
            <!--  
            <p class="f14 mt5">热门搜索：<a href="#" title="">阴间那些事儿</a><a href="#" title="">国色天香</a><a href="#" title=""> 浪漫满屋</a><a href="#" title=""> 对面的女孩看过来</a></p>
            -->
        </div>
        </form>
        <div class="container mt20 col66">
        	<div class="dt1"></div>
        	<c:forEach items="${userList }" var="item" >
        	<dl>
            	<dt><a href="${pageContext.request.contextPath }/book/listbyauthor/${item.id }"><img src="${item.userpic}" width="80" height="80" alt="" /></a></dt>
                <dd>
                	<p><a href="${pageContext.request.contextPath }/book/listbyauthor/${item.id }" class="f14 strong">${item.nick }</a></p>                    
                </dd>
            </dl>        	
            </c:forEach>            
            <!--page-->
       
        <page:pagination pageAttr="pagination"></page:pagination>
        </div>
        
    </div>
    <!--模块二-->    
</div>

<!--footer-->
<%@ include file="../footer.jsp"%>
<!--footer-->
<script type="text/javascript">
    jQuery(function($) {
		//滑动门
        $(".tabs").selfTabs();
    });
    
    function paper(pageNoValue, pageSizeValue) {
    	$("#page").attr("value", pageNoValue);
    	$("#rows").attr("value", pageSizeValue);
    	doSearch();
    }
    
    function byBook() {
    	$("#searchType").attr("value", 0);    	    	
    	doSearch();
    }
    
    function byAuthor() {
    	$("#searchType").attr("value", 1);  
    	doSearch();
    }
    
    function doSearch() {
    	$("#bookForm").attr("action", "${pageContext.request.contextPath }/book/search");
    	$("#bookForm").submit();
    }
</script> 
</body>
</html>