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
<!--     	<input type="hidden" id="searchType" name="searchType" value="${bookReqForm.searchType }"/>    	 -->
    	<div class="search-fm">
<!--         	<ul class="f14 over"> -->
<!--             	<li class="on"><a href="javascript:void(0);" onclick="byBook()">按书名</a></li> -->
<!--                 <li><a href="javascript:void(0);" onclick="byAuthor()">按作者</a></li> -->
<!--             </ul> -->
            <div class="over">
<!--             	<input type="text" class="inputs fl" name="searchName" value="${bookReqForm.searchName }"/> -->
				<input type="text" class="inputs fl" name="searchName" value="${searchName }"/>
				<input type="hidden" id="orderBy" name="orderBy" value="${orderBy }"/>
                <input value="搜 索" type="button" class="inpub f16 strong fl" onclick="doSearch()"/>
            </div>
            <!--  
            <p class="f14 mt5">热门搜索：<a href="#" title="">阴间那些事儿</a><a href="#" title="">国色天香</a><a href="#" title=""> 浪漫满屋</a><a href="#" title=""> 对面的女孩看过来</a></p>
            -->
        </div>
        </form>
        <div class="container mt20 col66">
        	<div class="dt1"></div>
        	<c:if test="${bookList.size() > 0 }">
        	<!-- 20171011-by-swanny-按照时间与热度切换-start -->
            <ul class="sort-tag">
                <li id="byTime"><a href="javascript:void(0);" class="link" onclick="byTime()">按时间</a></li>
                <li id="byHot"><a href="javascript:void(0);" class="link" onclick="byHot()">按热度</a></li>
            </ul>
            </c:if>
            <c:if test="${bookList.size() == 0 }">
            	<span>暂无搜索结果</span>
            </c:if>
            <!-- 20171011-by-swanny-按照时间与热度切换-end -->
        	<c:forEach items="${bookList }" var="item" >
        	<dl>
            	<dt><a href="${pageContext.request.contextPath }/book/${item.id}" title=""><img src="${item.midCoverImage}" width="81" height="112" alt="" /></a></dt>
                <dd>                	
                	<p <c:if test="${item.isVip == 1}">class="vip"</c:if> ><a href="${pageContext.request.contextPath }/book/${item.id}" class="f14 strong">${item.name }</a><span class="ml5 col99">作者：<a href="${pageContext.request.contextPath }/book/listbyauthor/${item.authorId }" title="">${item.authorNick }</a></span></p>
                    <p class="summary">${item.shotInfo }</p>
                    <p>最后更新：${item.lastModifyTimeFormat }</p>
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
	$(function(){  
		if($("#orderBy").val()==1){
			$("#byTime").addClass("item on");
	    	$("#byHot").addClass("item");
		}else{
			$("#byTime").addClass("item");
	    	$("#byHot").addClass("item on");
		}
	});
	
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
    
    function byTime(){
    	$("#byTime").removeClass("item");
    	$("#byTime").addClass("item on");
    	$("#byHot").removeClass("item on");
    	$("#byHot").addClass("item");
    	
    	
    	$("#orderBy").val(1)
    	$("#bookForm").attr("action", "${pageContext.request.contextPath }/book/search");
    	$("#bookForm").submit();
    }
    
    function byHot(){
    	$("#byTime").removeClass("item on");
    	$("#byTime").addClass("item");
    	$("#byHot").removeClass("item");
    	$("#byHot").addClass("item on");
    	
    	$("#orderBy").val(2)
    	$("#bookForm").attr("action", "${pageContext.request.contextPath }/book/search");
    	$("#bookForm").submit();
    }
</script> 
</body>
</html>