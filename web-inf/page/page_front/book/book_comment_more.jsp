<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${book.name}_${book.name}全文阅读，${book.authorNick }的小说_雁北堂_阅读江湖新力量</title>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/style.css"/>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/jquery.alert.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/main.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/statistics_bd.js"></script>
<style type="text/css">
.css_img_reward_type_on {border:2px solid #FAC23B;margin:0 1px 4px; display:block;}
.css_img_reward_type {margin:0 1px 4px; display:block;}
</style>
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
        <div class="zp-wdlf fl pos_r zp-wdlf01">
        	<div class="column" id="div_comment"></div>
        </div>
       <!-- right end-->
       <!--left begin-->
       <div class="zp-wdrg fr">
      		<div class="sec ac">
            	<a href="${pageContext.request.contextPath }/book/listbyauthor/${user.id }" title=""><img src="${user.userpic}" width="80" height="80" alt="" /></a>
                <p class="strong"><a href="${pageContext.request.contextPath }/book/listbyauthor/${user.id }" title="${user.nick }">${user.nick }</a></p>
            </div>
            <!--  
            <div class="bords sec1 col99">
            	<span class="gray1">作者简介：</span>女神倒贴上来，跟我说一些不可思议的事情。房子被挖掘机挖掉之后，我们展开了同居...`
            </div>
            -->
            <div class="sec2">
            	<div class="ft1 strong"><a href="${pageContext.request.contextPath }/book/listbyauthor/${user.id }" title="">${user.nick }的其它作品</a></div>
            	<c:forEach items="${relatedBookList }" var="item">
                <dl>
                	<dt class="fl"><a href="${pageContext.request.contextPath }/book/${item.id}" title=""><img src="${item.smallCoverImage}" width="45" height="63" alt="" /></a></dt>
                    <dd>
                    	<p>作品名称</p>
                        <p class="gray1">${item.name }</p>
                    </dd>
                </dl>
                </c:forEach>
            </div>
            
            <div class="sec3">
            	<div class="tp-img"><h2 class="fl white">土豪粉丝榜</h2>
            	<a href="${pageContext.request.contextPath }/rank/fans" title="" class="fr"><img src="${sessionScope.baseUrl}pc/images/zp-img6.jpg" width="14" height="12" alt=""  class="fr" /></a>
            	</div>
                <div class="wd-244">
                    <div class="ce-c over">
                        <ul>
                        	<c:forEach items="${fansRankList }" var="item" varStatus="status">
                            	<%@ include file="../rank/sub_rank_fans.jsp"%>
                            </c:forEach>                            
                        </ul>
                    </div>
            	</div>
            </div>
            
            <div class="wd-244 ml5">
                <div class="ce-t over new-tab5 bords">
                    <span class="fl">新书榜</span>
                    <ul>
                        
                        <li>周</li>
                        <li>月</li>
                        <li class="on">总</li>
                    </ul>
                    <jsp:include page="../rank/rank_more.jsp">
					 <jsp:param name="action" value="newBook"/>   
				</jsp:include>
                </div>
                <div class="ce-c">
                    <ul class="new-list4 hide">
                        <c:forEach items="${newBookRankByWeekList }" var="item" varStatus="status">
                    		<%@ include file="../rank/sub_rank_click.jsp"%>
                    	</c:forEach>
                    </ul>
                    <ul class="new-list4 hide">
                        <c:forEach items="${newBookRankByMonthList }" var="item" varStatus="status">
                    		<%@ include file="../rank/sub_rank_click.jsp"%>
                    	</c:forEach>
                    </ul>
                    <ul class="new-list4 show">
                        <c:forEach items="${newBookRankByAllList }" var="item" varStatus="status">
                    		<%@ include file="../rank/sub_rank_click.jsp"%>
                    	</c:forEach>
                    </ul>
                </div>
            </div>
            <div class="sec3">
            	<div class="tp-img mt8"><h2 class="white">作者关注</h2></div>
            	<c:forEach items="${collBookList }" var="item">
                <dl>
                	<dt><img src="${item.smallCoverImage}" width="45" height="63" alt="" /></dt>
                    <dd>
                    	<h2><a href="${pageContext.request.contextPath }/book/${item.id}" title="">${item.name }</a></h2>
                        <p>类别：${item.categoryName }</p>
                    </dd>
                </dl>
                </c:forEach>
            </div>            
       </div>
       <!--left end-->
        <!--模块二-->
    </div>
    <form action="" id="pageForm" method="post">
    	<input type="hidden" name="bookId" value="${book.id }"/>
    	<input type="hidden" name="isShowPage" value="true"/>
    	<input type="hidden" id="tabNick" name="tabNick" value="bookComment"/>
		<input type="hidden" id="page" name="page" value="1"/>
	    <input type="hidden" id="rows" name="rows" value="10"/>
	</form>    
</div>
<!--footer-->
<%@ include file="../footer.jsp"%>
<!--footer-->

<script type="text/javascript">
$(function(){
	loadComment("latest", 1, 30);
});

function loadComment(tabNick, pageNoValue, pageSizeValue) {
	if (tabNick != null) {
		$("#tabNick").attr("value", tabNick);	
	}	
	$("#page").attr("value", pageNoValue);
	$("#rows").attr("value", pageSizeValue);
	var formData = $('#pageForm').serialize();	
	var formAction = "${pageContext.request.contextPath }/comment/listbybook";
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
			initCommentCancelHot();
			initCommentCancelTop();
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
	var template_comment = $("#template_comment");
	//$(template_comment).hide();
	
	var commentForm = $(template_comment).find("form");
	var btnSubmit = $(template_comment).find("a[name='btn_submit']");
	var imgRandom = $(template_comment).find("img[name='randomImg']");
	var error = $(template_comment).find(".red");
	
	$("a[name='btn_comment']").unbind("click");
	$("a[name='btn_comment']").bind("click", function() {
		if (!isLogin()) {
			return;
		}
		
		var hidden = $(template_comment).is(":hidden");
		if (hidden) {
			$(template_comment).show();
			$(imgRandom).trigger("click");
		} else {
			$(template_comment).hide();
		}
	});	
	
	//提交
	$(btnSubmit).unbind("click");
	$(btnSubmit).bind("click", function(){
		if (!isLogin()) {
			return;
		}
		var formData = $(commentForm).serialize();
		$.ajax({
			type : "POST",
			dataType : "json",
			data : formData,
			async:true,
			url : "${pageContext.request.contextPath }/comment/addbybook",
			success : function(json) {
				$(imgRandom).trigger("click");
				if (json.resBean.code != 0) {				
					$(error).text(json.resBean.msg);				
				} else {
					loadComment("latest", 1, 10);
				}
			}
		});
	});
	
	//验证码				
	$(imgRandom).unbind("click");
	$(imgRandom).bind("click", function() {
		$(this).attr("src", "${pageContext.request.contextPath }/kaptcha.jpg?" + Math.floor(Math.random()*100));
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
		var formData = "bookId=${book.id}&commentId=" + commentId;
		
		$.MsgBox.Confirm("提示", "是否确定删除", function(){
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
	});
}

function initCommentTop() {
	$("a[name='btn_comment_top']").unbind("click");
	$("a[name='btn_comment_top']").bind("click", function() {
		if (!isLogin()) {
			return;
		}
		var commentId = $(this).attr("id");
		var formData = "bookId=${book.id}&commentId=" + commentId;
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

function initCommentCancelTop() {
	$("a[name='btn_comment_canceltop']").unbind("click");
	$("a[name='btn_comment_canceltop']").bind("click", function() {
		if (!isLogin()) {
			return;
		}
		var commentId = $(this).attr("id");
		var formData = "bookId=${book.id}&commentId=" + commentId;
		$.ajax({
			type : "POST",
			dataType : "json",
			data : formData,
			async:true,
			url : "${pageContext.request.contextPath }/comment/canceltop",
			success : function(json) {
				if (json.resBean.code != 0) {			
					$.MsgBox.Alert("提示", json.resBean.msg);	
				} else {
					$.MsgBox.Alert("提示", "取消置顶成功");
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
		var formData = "bookId=${book.id}&commentId=" + commentId;
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


function initCommentCancelHot() {
	$("a[name='btn_comment_cancelhot']").unbind("click");
	$("a[name='btn_comment_cancelhot']").bind("click", function() {
		if (!isLogin()) {
			return;
		}
		var commentId = $(this).attr("id");
		var formData = "bookId=${book.id}&commentId=" + commentId;
		$.ajax({
			type : "POST",
			dataType : "json",
			data : formData,
			async:true,
			url : "${pageContext.request.contextPath }/comment/cancelhot",
			success : function(json) {
				if (json.resBean.code != 0) {			
					$.MsgBox.Alert("提示", json.resBean.msg);				
				} else {
					$.MsgBox.Alert("提示", "取消精华成功");
				}
			}
		});
	});
}

function isLogin() {
	var userId = "${sessionScope.sessionFrontBean.userId}";
	if (userId == null || userId == "") {
		var redirectUrl = "/book/${book.id}/comment/more";
		window.location.href="${pageContext.request.contextPath }/user/login?redirectUrl=" + redirectUrl;	
		return false;
	}
	
	return true;
}
</script>
</body>
</html>