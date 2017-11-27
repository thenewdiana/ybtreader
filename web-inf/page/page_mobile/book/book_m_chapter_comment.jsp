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
<link rel="stylesheet" href="${sessionScope.baseUrl}mobile/css/use.css"/>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/statistics_bd.js"></script>
<script type="text/javascript"  src="${sessionScope.baseUrl}mobile/js/jquery.min.js"></script>
<!--[if lt IE 9]>
<script type="text/javascript"  src="${sessionScope.baseUrl}mobile/js/html5.js"></script>
<![endif]-->
<script type="text/javascript" src="${sessionScope.baseUrl}mobile/js/main.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}mobile/js/tip.js"></script>

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
<%@ include file="../header_tips.jsp"%>
<div class="ranking"><h1>写《${book.name }》的评论</h1></div>
    <section class="alipay enroll discuss">
    	<form action="" id="bookCommentForm">
    	<input type="hidden" name="bookId" value="${book.id }"/>
    	<input type="hidden" name="bookChapterId" value="${bookChapter.id }"/>
        <div class="ce-c">
                <dl>
                    <dt>回复章节：</dt>
                    <dd>${bookChapter.title }</dd>
                </dl>
                <dl>
                    <dt>内容</dt>
                    <dd><textarea class="textarea1 disinput" name="content"></textarea></dd>
                </dl>
            <a href="javascript:void(0);" id="btn_comment" class="apply-input white ac mt6">发 表</a>
        </div>
        </form>
    </section>
	<dl class="cons_page clearfix">
		<div class="goback"><a class="homes" href="${pageContext.request.contextPath }/m"><img height="16" width="18" alt="返回首页" src="${sessionScope.baseUrl}mobile/images/home.png"></img></a>&gt;<a href="${pageContext.request.contextPath }/m/book/${book.id}" class="col992123"><em></em>${book.name }</a></div>
	</dl>
<!--footer-->
<%@ include file="../footer_m.jsp"%> 
<!--footer-->
<script type="text/javascript">
$(function(){
	var returnUrl = "${callBackUrl}";
	$("#btn_comment").bind("click", function() {
		var formData = $("#bookCommentForm").serialize();
		$.ajax({
			type : "POST",
			dataType : "json",
			data : formData,
			async:true,
			url : "${pageContext.request.contextPath }/m/book/chapter/comment",
			success : function(json) {	
				if (json.resBean.code == 0) {
					window.location.href="${pageContext.request.contextPath }/" + returnUrl;
				} else {
					$.MsgTip.fail(json.resBean.msg);
				}
			}
		});
	});
});
</script>
</body>
</html>