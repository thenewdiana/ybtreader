<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><spring:message code="front.global.title"></spring:message>-小编办公室</title>
<meta name="keywords"  content="小编、办公室，小编办公室"></meta>
<meta name="description"  content="这里是雁北堂小编办公室，有什么问题都可以来这里哦！"></meta>

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
<jsp:param name="menu" value=""/> 
</jsp:include>
<!--中间-->
<div class="body-bg">
    <div class="w1000">
    	<div class="office ac mgt15">
        	<ul class="over">
        		<c:forEach items="${hercafeList }" var="item" varStatus="status">
	        		<c:if test="${status.count<7 }">
		            	<li <c:if test="${status.count==6 }">class="mgn"</c:if>>
		                	<img src="${item.userPic }" width="140" height="140" alt="" />
		                    <div class="name white f14 strong">${item.nick }</div>
		                    <div class="aih al">擅长分类：${item.userMajor }<br />QQ:${item.qq }</div>
		                </li>
	                </c:if>
                </c:forEach>               
            </ul>
        </div>
    	<div class="office ac">
        	<ul class="over">
        		<c:forEach items="${hercafeList }" var="item" varStatus="status">
        			<c:if test="${status.count>6 }">
		            	<li <c:if test="${status.last}">class="mgn"</c:if>>
		                	<img src="${item.userPic }" width="140" height="140" alt="" />
		                    <div class="name white f14 strong">${item.nick }</div>
		                    <div class="aih al">擅长分类：${item.userMajor }<br />QQ:${item.qq }</div>
		                </li>
               		</c:if>
                </c:forEach>               
            </ul>
        </div>
    </div>
    <div class="sub mt5"></div>
    <div class="w945" id = "div_comment">
    	
    </div>
    <form action="" id="pageForm" method="post">
    	<input type="hidden" name="bookId" value="-1"/>
    	<input type="hidden" id="tabNick" name="tabNick"/>
		<input type="hidden" id="page" name="page" value="1"/>
	    <input type="hidden" id="rows" name="rows" value="10"/>
	</form> 
<!--模块二-->
</div>


<!--footer-->
<%@ include file="../footer.jsp"%>
<!--footer-->
<script type="text/javascript">
$(function(){
	loadComment("latest", 1, 10);
});

function loadComment(tabNick, pageNoValue, pageSizeValue) {
	if (tabNick != null) {
		$("#tabNick").attr("value", tabNick);	
	}	
	$("#page").attr("value", pageNoValue);
	$("#rows").attr("value", pageSizeValue);
	var formData = $('#pageForm').serialize();	
	var formAction = "${pageContext.request.contextPath }/comment/listbycallcenter";
	$.ajax({
		type : "POST",
		dataType : "html",
		data : formData,
		async:true,
		url : formAction,
		success : function(html) {
			$("#div_comment").html(html);
			initComment();
			initCommentReply();		
			initCommentDel();
			initCommentTop();
			initCommentHot();
		}
	});
}

function paper(pageNoValue, pageSizeValue) {	
	loadComment(null, pageNoValue, pageSizeValue);
}

function paperTabNick(tabNick) {
	$("#tabNick").attr("value", tabNick);	
}

function initComment() {
	var commentForm = $("#bookCommentForm");
	var error = $(commentForm).find(".red");
	
	$("a[name='btn_comment']").unbind("click");
	$("a[name='btn_comment']").bind("click", function() {
		if (!isLogin()) {
			return;
		}
		
		var formData = $(commentForm).serialize();
		
		$.ajax({
			type : "POST",
			dataType : "json",
			data : formData,
			async:true,
			url : "${pageContext.request.contextPath }/comment/addbycallcenter",
			success : function(json) {
				if (json.resBean.code != 0) {	
					$(error).text(json.resBean.msg);				
				} else {
					loadComment("latest", 1, 10);
				}
			}
		});
	});	
}

function initCommentReply() {	
	$("a[name='btn_comment_reply']").each(function() {
		var replyDiv = $(this).parent().parent().next("div");
		$(replyDiv).hide();
	});
	
	//我要回复
	$("a[name='btn_comment_reply']").unbind("click");
	$("a[name='btn_comment_reply']").bind("click", function(){	
		if (!isLogin()) {
			return;
		}			
		var replyDiv = $(this).parent().parent().next("div");
		var hidden = $(replyDiv).is(":hidden");
		if (hidden) {
			$(replyDiv).show();
		} else {
			$(replyDiv).hide();
		}
	});
	
	//提交回复
	$("input[name='btn_sumbit_comment_reply']").unbind("click");
	$("input[name='btn_sumbit_comment_reply']").bind("click", function() {	
		if (!isLogin()) {
			return;
		}
		var replyForm = $(this).parent();
		var formData = $(replyForm).serialize();
		$.ajax({
			type : "POST",
			dataType : "json",
			data : formData,
			async:true,
			url : "${pageContext.request.contextPath }/comment/reply",
			success : function(json) {
				if (json.resBean.code != 0) {			
					$(replyForm).find(".red").text(json.resBean.msg);					
				} else {
					loadComment(null, 1, 10);
				}
			}
		});
	});	
}

function initCommentDel() {
	$("a[name='btn_comment_del']").unbind("click");
	$("a[name='btn_comment_del']").bind("click", function() {
		if (!isLogin()) {
			return;
		}
		var commentId = $(this).attr("id");
		var formData = "bookId=-1&commentId=" + commentId;
		$.ajax({
			type : "POST",
			dataType : "json",
			data : formData,
			async:true,
			url : "${pageContext.request.contextPath }/comment/del",
			success : function(json) {
				if (json.resBean.code != 0) {			
					$.MsgBox.Alert("提示", json.resBean.msg);		
				} else {
					loadComment(null, 1, 10);
				}
			}
		});
	});
}

function initCommentTop() {
	$("a[name='btn_comment_top']").unbind("click");
	$("a[name='btn_comment_top']").bind("click", function() {
		if (!isLogin()) {
			return;
		}
		var commentId = $(this).attr("id");
		var formData = "bookId=-1&commentId=" + commentId;
		$.ajax({
			type : "POST",
			dataType : "json",
			data : formData,
			async:true,
			url : "${pageContext.request.contextPath }/comment/top",
			success : function(json) {
				if (json.resBean.code != 0) {			
					$.MsgBox.Alert("提示", json.resBean.msg);	
				} else {
					$.MsgBox.Alert("提示", "设置置顶成功");
				}
			}
		});
	});
}

function initCommentHot() {
	$("a[name='btn_comment_hot']").unbind("click");
	$("a[name='btn_comment_hot']").bind("click", function() {
		if (!isLogin()) {
			return;
		}
		var commentId = $(this).attr("id");
		var formData = "bookId=-1&commentId=" + commentId;
		$.ajax({
			type : "POST",
			dataType : "json",
			data : formData,
			async:true,
			url : "${pageContext.request.contextPath }/comment/hot",
			success : function(json) {
				if (json.resBean.code != 0) {			
					$.MsgBox.Alert("提示", json.resBean.msg);				
				} else {
					$.MsgBox.Alert("提示", "设置精华成功");
				}
			}
		});
	});
}


function isLogin() {
	var userId = "${sessionScope.sessionFrontBean.userId}";
	if (userId == null || userId == "") {
		var redirectUrl = "/callcenter";
		window.location.href="${pageContext.request.contextPath }/user/login?redirectUrl=" + redirectUrl;	
		return false;
	}
	
	return true;
}
</script>
</body>
</html>