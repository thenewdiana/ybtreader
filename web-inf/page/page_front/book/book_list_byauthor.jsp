<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${user.nick}|${user.nick }小说|${user.nick }作品全集|${user.nick }最新作品-雁北堂中文网</title>
<meta name="keywords" content="${user.nick},${user.nick}小说,${user.nick}作品全集,${user.nick}全部小说,${user.nick}最新作品"></meta>
<meta name="description" content="雁北堂中文网${user.nick}个人主页，提供作者${user.nick}的个人简介、${user.nick}作品全集，包括${user.nick}以往作品以及最新小说，方便读者了解${user.nick}的最新写作动向。"></meta>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/js/slideBox.css"/>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/style.css"/>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/jquery.alert.js"></script>
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
    <div class="w1000 bords" id="mt20">
    	<!--right begin-->
        <div class="visit fl col71">
        	<div class="ce-t f14 ac">
                <ul>
                    <li id="collect" <c:if test="${tabNick == 'collect' }">class="on"</c:if>>他的收藏</li>
                    <li id="book" <c:if test="${tabNick == 'book' }">class="on"</c:if>>他的作品</li>                    
                    <li id="comment" <c:if test="${tabNick == 'comment' }">class="on"</c:if>>他的书评</li>
                </ul>
            </div>
            <div class="house <c:if test="${tabNick != 'collect' }">hide</c:if>">
                <div class="ce-t1 strong ac">
                    <ul class="over f14">
                        <li class="yk-wd2">作品</li>
                        <li class="yk-wd3">作者</li>
                    </ul>
                </div>
                <dl class="ac">
                	<c:forEach items="${userBookList }" var="item" >
                    <dd>                        
                        <span class="yk-wd2">
                        <strong class="f14"><a href="${pageContext.request.contextPath }/book/${item.bookId}" title="">${item.bookName }</a></strong>
                        </span>
                        <span class="yk-wd3"><a href="${pageContext.request.contextPath }/book/listbyauthor/${item.authorId }">${item.authorNick }</a></span>
                    </dd> 
                    </c:forEach>                   
                </dl>
            </div>
            
            <div class="house <c:if test="${tabNick != 'book' }">hide</c:if>">
            	<c:forEach items="${bookList }" var="item" >
            	<div class="column">            		
	            	<h1 class="gray1">${item.name }</h1>
	                <p class="gray1">${item.clickValue }点击 | ${item.categoryName } | ${item.words }字 | 签约级别：${item.permissionTypeCN}</p>
	                <div class="ce-c over">
	                	<div class="w202 fl">
	                    	<p class="bords"><img src="${item.bigCoverImage}" width="200" height="280" alt="" /></p>
	                    </div>
	                    <div class="w460 fr f14  pos_r">
	                        <div style="margin: 0px 0px 58px; height: 206px; overflow: hidden;">${item.shotInfo }</div>
							<a href="${pageContext.request.contextPath }/book/${item.id}" class="read-ft1" style="text-indent:47px;">开始阅读</a>
							<a href="javascript:void(0);" id="${item.id }" name="btn_collect" class="read-ft1 read-ft2">加入书架</a>							
	                    </div>
	                </div>
            	</div>
            	</c:forEach>				
            </div>
            
            <div class="house <c:if test="${tabNick != 'comment' }">hide</c:if>">            	
            	<dl class="sit-c">
            	<c:forEach items="${commentList }" var="item" >
            	<dd><strong><a href="${pageContext.request.contextPath }/comment/${item.id}">${item.title }</a></strong></dd>
                <dt class="cola2"><a href="javascript:void(0);"><i>[评论]</i>${item.content }</a></dt>
                </c:forEach>                
            </dl>
            </div>
            
        </div>
       <!-- right end-->
       <!--left begin-->
       <div class="zp-wdrg fr visiter">
      		<div class="sec ac">
            	<a href="javascript:void(0);"><img src="${user.userpic}" width="80" height="80" alt="" /></a>
                <p class="strong"><a href="javascript:void(0);" class="auto-img">${user.nick }</a></p>
            </div>
      		<div class="visitor">
                <div class="tp-img mt8"><h2 class="white">猜你喜欢</h2></div>
                <dl class="ac">
                	<c:forEach items="${relatedBookList }" var="item">
                	<dd>
                    	<a href="${pageContext.request.contextPath }/book/${item.id}" title=""><img src="${item.bigCoverImage}" width="120" height="150" alt="" /></a>
                        <p>[${item.categoryName }]<a href="${pageContext.request.contextPath }/book/${item.id}" class="strong">${item.name }</a></p>
                    </dd>
                    </c:forEach>                   
                </dl> 
            </div>            
      </div>
       <!--left end-->
        <!--模块二-->
    </div>
    <page:pagination pageAttr="pagination"></page:pagination>
    <form action="" id="pageForm" method="post">
    	<input type="hidden" id="page" name="page" value="${pagination.currPage }"/>
        <input type="hidden" id="rows" name="rows" value="${pagination.pageSize }"/>
        <input type="hidden" id="tabNick" name="tabNick" value="${tabNick }"/>
    </form>
</div>
<!--footer-->
<%@ include file="../footer.jsp"%>
<!--footer-->
<script type="text/javascript">
	$(function(){
		//滑动门
    	$('.visit .ce-t li').bind("click", function(){
			$(this).addClass('on').siblings('li').removeClass('on');
			$('.house').hide();
			var id = $(this).attr("id");
			if (id == "comment") {
				$("#tabNick").attr("value", "comment");
				paper(1, 10);
			} else if (id == "book") {
				$("#tabNick").attr("value", "book");
				paper(1, 2);
			} else if (id == "collect") {
				$("#tabNick").attr("value", "collect");
				paper(1, 10);
			}
		});	
		
    	$("a[name='btn_collect']").bind("click", function() {
			if (!isLogin()) {
				return;
			}
			var obj = $(this);
			var bookId = obj.attr("id");
			$.ajax({
				type : "POST",
				dataType : "json",
				data : "bookId=" + bookId,
				async:true,
				url : "${pageContext.request.contextPath }/book/collect",
				success : function(json) {
					if (json.resBean.code != 0) {
						$.MsgBox.Alert("提示", json.resBean.msg);
					} else {
						$.MsgBox.Alert("提示", "加入书架成功");
					}
				}
			});
		});
    });
    
    function paper(pageNoValue, pageSizeValue) {
    	$("#page").attr("value", pageNoValue);
    	$("#rows").attr("value", pageSizeValue);
    	doSearch();
    }
    
    function doSearch() {
    	$("#pageForm").attr("action", "${pageContext.request.contextPath }/book/listbyauthor/${authorId}");
    	$("#pageForm").submit();
    }
    
    function isLogin() {
    	var userId = "${sessionScope.sessionFrontBean.userId}";
    	if (userId == null || userId == "") {
    		var redirectUrl = "/book/listbyauthor/${authorId}";
    		window.location.href="${pageContext.request.contextPath }/user/login?redirectUrl=" + redirectUrl;	
    		return false;
    	}
    	
    	return true;
    }
</script> 
</body>
</html>