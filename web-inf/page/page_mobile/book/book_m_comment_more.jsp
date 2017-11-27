<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common_m.jsp" %>

<!DOCTYPE html>
<html>
<head>
<title>${book.name}_${book.name}全文阅读，${book.authorNick }的小说_雁北堂_阅读江湖新力量_手机版</title>
<meta name="keywords" content="${book.name}_${book.name}全文阅读，${book.authorNick }的小说_手机版"></meta>
<meta name="description" content="${book.name}是${book.authorNick }在雁北堂的原创独家首发小说, 请密切关注雁北堂中文网_手机版"></meta>
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
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
<header> 
<!--header begin-->
<jsp:include page="../header_m.jsp">
	 <jsp:param name="menu" value="index"/>   
</jsp:include>
<!--header end-->
</header>
<%@ include file="../header_user_m.jsp"%>
<section class="cons_cont pb5">
	<c:forEach items="${commentList }" var="item" varStatus="status">
		<div class="dis_pl_outer clearfix">
    		<dl class="dis_o clearfix">
	      		<dt>
	      			<a href="${pageContext.request.contextPath }/m/userCenter/${item.userId}"><span class="col898989">${item.userNick }</span><span class="b_num v_${item.vipValues.id }"></span></a><span class="dis_icon ${item.fansValues.mobileCss }" title="${item.fansValues.name }">${item.fansValues.name }</span>
	      		</dt>
	      		<dd>&nbsp;${item.createTimeFormat }&nbsp;<a href="${pageContext.request.contextPath }/m/book/comment/reply?callBackUrl=m/book/${book.id}/comment/more&commentId=${item.id}">回复</a> </dd>
    		</dl>
    		<p class="pt5"><span class="f14 cola21812"><a href="${pageContext.request.contextPath }/m/book/${book.id}/${item.id }/comment/more">${item.title }</a></span></p>
    		<p class="col898989">评《<a href="<%=contextPath%>/m/book/${book.id}">${book.name }</a>》</p>
    		<p class="f12 col898989 pt5 pb5">${item.content }</p>
  		</div>
  		<c:if test="${item.replyCommentList.size() > 0 }">
  			<c:forEach items="${item.replyCommentList }" var="replyItem" varStatus="status">
  			<dl class="pl_zt_dl clearfix <c:if test="${status.last}">on</c:if>">
    			<dt >
    				<a href="${pageContext.request.contextPath }/m/userCenter/${replyItem.userId}"><span class="col0099cc">${replyItem.userNick }</span></a><span class="b_num v_${replyItem.vipValues.id }"></span><span class="dis_icon ${replyItem.fansValues.mobileCss }">${replyItem.fansValues.name }</span>
    				：${replyItem.content }
    			</dt>
    			<dd >
    				<span class="fl col999999">${replyItem.createTimeFormat }</span>
    				<span class="fr">
    				<commauth:commauth operType="del" bookAuthorId="${book.authorId }" commentUserId="${replyItem.userId }">
        			<a href="javascript:void();" name="btn_comment_del" id="${replyItem.id }">删除</a>
        			</commauth:commauth>
    				</span>
    			</dd>
  			</dl>
  			</c:forEach>
  		</c:if>
	</c:forEach>    
</section>
<div class="goback"><a class="homes" href="${pageContext.request.contextPath }/m"><img height="16" width="18" alt="返回首页" src="${sessionScope.baseUrl}mobile/images/home.png"></img></a>&gt;<a href="${pageContext.request.contextPath }/m/book/${book.id}" class="col992123"><em></em>${book.name }</a></div>
<page:mpagination pageAttr="pagination"></page:mpagination>
<!--footer-->
<%@ include file="../footer_m.jsp"%>
<form action="${pageContext.request.contextPath }/m/book/${book.id}/comment/more" method="post" id="bookCommentForm">
	<input type="hidden" id="page" name="page" value="${pagination.currPage }"/>
    <input type="hidden" id="rows" name="rows" value="${pagination.pageSize }"/>
</form>    
<!--footer-->
<script type="text/javascript">
$(function(){
	initCommentDel();
});

function paper(pageNoValue, pageSizeValue){
	$('#page').val(pageNoValue);
	$('#rows').val(pageSizeValue);
	$("#bookCommentForm").submit();
}

function initCommentDel() {
	$("a[name='btn_comment_del']").bind("click", function() {
		if (!isLogin()) {
			return;
		}
		
		var commentId = $(this).attr("id");
		var formData = "bookId=${book.id}&commentId=" + commentId;
		var replyDiv = $(this).parent().parent().parent();
		$.ajax({
			type : "POST",
			dataType : "json",
			data : formData,
			async:true,
			url : "${pageContext.request.contextPath }/m/book/comment/del",
			success : function(json) {						
				if (json.resBean.code == 0) {												
					$(replyDiv).remove();
				} else {
					$.MsgTip.fail(json.resBean.msg);
				}
			}
		});
	});
}

function isLogin() {
	var userId = "${sessionScope.sessionFrontBean.userId}";
	if (userId == null || userId == "") {
		var redirectUrl = "/m/book/${book.id}/comment/more";
		window.location.href="${pageContext.request.contextPath }/m/user/login?redirectUrl=" + redirectUrl;	
		return false;
	}
	return true;
}
</script>
</body>
</html>