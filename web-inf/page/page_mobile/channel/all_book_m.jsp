<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common_m.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>图书_雁北堂_雁北堂中文网_手机版</title>
<link rel="stylesheet" href="${sessionScope.baseUrl}mobile/css/use.css"/>
<link rel="stylesheet" href="${sessionScope.baseUrl}mobile/css/common.css"/>
<link rel="stylesheet" href="${sessionScope.baseUrl}mobile/css/style.css"/>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/statistics_bd.js"></script>
<script type="text/javascript"  src="${sessionScope.baseUrl}mobile/js/jquery.min.js"></script>
<!--[if lt IE 9]>
<script type="text/javascript"  src="${sessionScope.baseUrl}mobile/js/html5.js"></script>
<![endif]-->
<script type="text/javascript" src="${sessionScope.baseUrl}mobile/js/main.js"></script>
</head>


<body>
<!--header begin-->
<header> 
<jsp:include page="../header_m.jsp">
	<jsp:param name="menu" value="${free}"/>
</jsp:include>
</header>
<%@ include file="../header_user_m.jsp"%>
<!--header end-->


<article class="ranking">
	<h1>书库</h1>
	<form action="" method="get" id="bookForm">
		<input type="hidden" id="free" name="free" value="${free}"/>
		<input type="hidden" id="page" name="page" value="${pagination.currPage }"/>
       	<input type="hidden" id="rows" name="rows" value="${pagination.pageSize }"/>
       	<input type="hidden" id="bookRoomCategoryType" name="bookRoomCategoryType" value="${bookReqForm.bookRoomCategoryType }"/>
       	<input type="hidden" id="bookRoomWordType" name="bookRoomWordType" value="${bookReqForm.bookRoomWordType }"/>
       	<input type="hidden" id="bookRoomUpdateType" name="bookRoomUpdateType" value="${bookReqForm.bookRoomUpdateType }"/>
       	<input type="hidden" id="bookRoomVipType" name="bookRoomVipType" value="${bookReqForm.bookRoomVipType }"/>
       	<input type="hidden" id="bookRoomFinishType" name="bookRoomFinishType" value="${bookReqForm.bookRoomFinishType }"/>
       	<input type="hidden" id="bookRoomOrderByType" name="bookRoomOrderByType" value="${bookReqForm.bookRoomOrderByType }"/>
       	
		<dl class="stack f12">
	    	<dd>
	        	<strong>分&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;类：</strong>
	        	<a href="javascript:void(0);" <c:if test="${bookReqForm.bookRoomCategoryType == -1 }">class="on"</c:if> onclick="doBookRoomCategoryType(-1)">全部</a>                       	
              	<c:forEach items="${categoryList }" var="item">
              	<c:choose>
              		<c:when test="${bookReqForm.bookRoomCategoryType == item.id }">
              			<a href="javascript:void(0);" class="on" onclick="doBookRoomCategoryType('${item.id}');">${item.name }</a>                        			
              		</c:when>
              		<c:otherwise>
              			<a href="javascript:void(0);" onclick="doBookRoomCategoryType('${item.id}');">${item.name }</a>
              		</c:otherwise>
              	</c:choose>                        	
              	</c:forEach> 
	        </dd>
	        <dd>
	        	<strong>作品字数：</strong>
	        	<a href="javascript:void(0);" <c:if test="${bookReqForm.bookRoomWordType == -1}">class="on"</c:if> onclick="doBookRoomWordType(-1)">全部</a>
               	<a href="javascript:void(0);" <c:if test="${bookReqForm.bookRoomWordType == 1}">class="on"</c:if> onclick="doBookRoomWordType(1)">30万以下</a>
               	<a href="javascript:void(0);" <c:if test="${bookReqForm.bookRoomWordType == 2}">class="on"</c:if> onclick="doBookRoomWordType(2)">30-50万</a>
               	<a href="javascript:void(0);" <c:if test="${bookReqForm.bookRoomWordType == 3}">class="on"</c:if> onclick="doBookRoomWordType(3)">50-100万</a>
               	<a href="javascript:void(0);" <c:if test="${bookReqForm.bookRoomWordType == 4}">class="on"</c:if> onclick="doBookRoomWordType(4)">100万以上</a>
	        </dd>
	        <dd>
	        	<strong>排序方式：</strong>
	        	<a href="javascript:void(0);" <c:if test="${bookReqForm.bookRoomOrderByType == -1}">class="on"</c:if> onclick="doBookRoomOrderByType(-1)">全部</a>
              	<a href="javascript:void(0);" <c:if test="${bookReqForm.bookRoomOrderByType == 1}">class="on"</c:if> onclick="doBookRoomOrderByType(1)">点击</a>
              	<a href="javascript:void(0);" <c:if test="${bookReqForm.bookRoomOrderByType == 2}">class="on"</c:if> onclick="doBookRoomOrderByType(2)">订阅</a>
              	<a href="javascript:void(0);" <c:if test="${bookReqForm.bookRoomOrderByType == 3}">class="on"</c:if> onclick="doBookRoomOrderByType(3)">收藏</a>
              	<a href="javascript:void(0);" <c:if test="${bookReqForm.bookRoomOrderByType == 4}">class="on"</c:if> onclick="doBookRoomOrderByType(4)">金票</a>
              	<a href="javascript:void(0);" <c:if test="${bookReqForm.bookRoomOrderByType == 5}">class="on"</c:if> onclick="doBookRoomOrderByType(5)">字数</a>
	        	
	        </dd>                    
	       <dd>
	        	<strong>更新时间：</strong>
	        	<a href="javascript:void(0);" <c:if test="${bookReqForm.bookRoomUpdateType == -1}">class="on"</c:if> onclick="doBookRoomUpdateType(-1)">全部</a>
               	<a href="javascript:void(0);" <c:if test="${bookReqForm.bookRoomUpdateType == 1}">class="on"</c:if> onclick="doBookRoomUpdateType(1)">3三日内</a>
               	<a href="javascript:void(0);" <c:if test="${bookReqForm.bookRoomUpdateType == 2}">class="on"</c:if> onclick="doBookRoomUpdateType(2)">七日内</a>
               	<a href="javascript:void(0);" <c:if test="${bookReqForm.bookRoomUpdateType == 3}">class="on"</c:if> onclick="doBookRoomUpdateType(3)">半月内</a>
               	<a href="javascript:void(0);" <c:if test="${bookReqForm.bookRoomUpdateType == 4}">class="on"</c:if> onclick="doBookRoomUpdateType(4)">一月内</a>
	        </dd>                
	        <dd>
	        	<strong>是否免费：</strong>
	        	<a href="javascript:void(0);" <c:if test="${bookReqForm.bookRoomVipType == -1}">class="on"</c:if> onclick="doBookRoomVipType(-1)">全部</a>
              	<a href="javascript:void(0);" <c:if test="${bookReqForm.bookRoomVipType == 0}">class="on"</c:if> onclick="doBookRoomVipType(0)">免费作品</a>
              	<a href="javascript:void(0);" <c:if test="${bookReqForm.bookRoomVipType == 1}">class="on"</c:if> onclick="doBookRoomVipType(1)">收费作品</a>
	        </dd>          
	        <dd>
	        	<strong>是否完结：</strong>
	        	<a href="javascript:void(0);" <c:if test="${bookReqForm.bookRoomFinishType == -1}">class="on"</c:if> onclick="doBookRoomFinishType(-1)">全部</a>
               	<a href="javascript:void(0);" <c:if test="${bookReqForm.bookRoomFinishType == 1}">class="on"</c:if> onclick="doBookRoomFinishType(1)">已完结</a>
               	<a href="javascript:void(0);" <c:if test="${bookReqForm.bookRoomFinishType == 0}">class="on"</c:if> onclick="doBookRoomFinishType(0)">未完结</a>
	        </dd>
	    </dl>          
    </form>  
	<div class="diary">
		<c:forEach items="${bookList }" var="item" varStatus="status">
			<dl <c:if test="${status.count%2==0}">class="gray"</c:if>>
	        	<dt <c:if test="${item.isVip==1}">class="vp"</c:if>><a href="<%=contextPath%>/m/book/${item.id}" title="">${item.name}</a></dt>
	            <dd><a href="<%=contextPath%>/m/userCenter/${item.authorId}" title="">作者：${item.authorNick}</a><span>字数：${item.words}</span></dd>
	            <dd><a href="<%=contextPath%>/m/book/${item.id}/${item.lastChapterId}" title="">最新：${item.lastChapterTitle}</a><time>（${item.createMinuteFormat }）</time></dd>
	        </dl>
        </c:forEach> 
        <page:mpagination pageAttr="pagination"></page:mpagination>
    </div>
    
</article>


<!--footer-->
<%@ include file="../footer_m.jsp"%>
<!--footer-->
<script type="text/javascript">
    jQuery(function($) {
		//滑动门
        //$(".tabs").selfTabs();
    });
    
    function paper(pageNoValue, pageSizeValue) {
    	$("#page").attr("value", pageNoValue);
    	$("#rows").attr("value", pageSizeValue);
    	doSubmit();
    }
    
    function doBookRoomCategoryType(categoryId) {
    	$("#bookRoomCategoryType").attr("value", categoryId);
    	$("#page").attr("value", 1);    	
    	doSubmit();
    }
    
    function doBookRoomWordType(bookRoomWordType) {
    	$("#bookRoomWordType").attr("value", bookRoomWordType);
    	$("#page").attr("value", 1);  
    	doSubmit();
    }
    
    function doBookRoomOrderByType(bookRoomOrderByType) {
    	$("#bookRoomOrderByType").attr("value", bookRoomOrderByType);
    	$("#page").attr("value", 1);  
    	doSubmit();
    }
    
    function doBookRoomUpdateType(bookRoomUpdateType) {
    	$("#bookRoomUpdateType").attr("value", bookRoomUpdateType);
    	$("#page").attr("value", 1);  
    	doSubmit();
    }
    
    function doBookRoomVipType(bookRoomVipType) {
    	$("#bookRoomVipType").attr("value", bookRoomVipType);
    	$("#page").attr("value", 1);  
    	doSubmit();
    }
    
    function doBookRoomFinishType(bookRoomFinishType) {
    	$("#bookRoomFinishType").attr("value", bookRoomFinishType);
    	$("#page").attr("value", 1);  
    	doSubmit();
    }
    function submitForm(url, data)
    {
     	var eleForm = document.body.appendChild(document.createElement('form'));
    	eleForm.action = url;
    	for (var property in data)
    	{
    		var hiddenInput = document.createElement('input');
    		hiddenInput.type = 'hidden';
    		hiddenInput.name = property;
    		hiddenInput.value = data[property];
    		eleForm.appendChild(hiddenInput);
    	}
    	this.eleForm = eleForm;
    	if (!submitForm._initialized)
    	{
  			submitForm.prototype.post = function ()
			{
	    		this.eleForm.method = 'post';
	   			this.eleForm.submit();
	   		};
   		submitForm._initialized = true;
    	}
    }
    function url2json(e) {
        var t, n, r, i = e, s = {};
        t = i.split("&"),
        r = null,
        n = null;
        for (var o in t) {
            var u = t[o].indexOf("=");
            u !== -1 && (r = t[o].substr(0, u),
            n = t[o].substr(u + 1),
            s[r] = n)
        }
        return s
    }
    
    function doSubmit() {
    	var formData = $('#bookForm').serialize();
    	//window.location.href = "${pageContext.request.contextPath }/m/allBook?" + formData;    	
    	new submitForm('${pageContext.request.contextPath }/m/allBook', url2json(formData)).post();
    }
    
    function paper(pageNoValue, pageSizeValue){
		$('#page').val(pageNoValue);
		$('#rows').val(pageSizeValue);
		doSubmit();
	}
</script> 
</body>
</html>


