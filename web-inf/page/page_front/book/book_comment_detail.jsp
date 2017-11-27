<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${book.name}_${book.name}全文阅读，${book.authorNick }的小说_雁北堂_阅读江湖新力量</title>
<meta name="keywords" content="${book.name}_${book.name}全文阅读，${book.authorNick }的小说"></meta>
<meta name="description" content="${book.name}是${book.authorNick }在雁北堂的原创独家首发小说, 请密切关注雁北堂中文网"></meta>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/style.css"/>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/uaredirect.js" ></script>
<script type="text/javascript">uaredirect("http://m.ebtang.com/m/book/${book.id}");</script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/jquery.alert.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/main.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/scrolling.js"></script>
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
        <div class="zp-wdlf fl pos_r zp-wdlf01">
        	<div class="stick over">
            	<div class="w77 fl ac">
            		<a href="${pageContext.request.contextPath }/book/listbyauthor/${bookCommentResBean.userId }"><img src="${bookCommentResBean.userPic }" width="53" height="55" alt="${bookCommentResBean.userNick }" /></a>
                    <c:if test="${bookCommentResBean.userId==book.authorId }"><img src="${sessionScope.baseUrl}pc/images/zp-img3.jpg" alt="" class="mt5"  /></c:if>
                    <c:if test="${bookCommentResBean.userId!=book.authorId}"><img src="${sessionScope.baseUrl}pc/images/${bookCommentResBean.fansValues.image}" width="41" height="19" alt="" class="mt5"  /></c:if>
                    <c:if test="${bookCommentResBean.vipValues.id > 0}"><p class="mat12 v${bookCommentResBean.vipValues.id }">&nbsp;</p></c:if>
            	</div>
                <div class="font-wd grays fr">
                	<h2>
                   	<c:if test="${bookCommentResBean.isTop == 1}">
                   		<a href="javascript:void(0);" class="top1">[置顶]</a>
                   	</c:if>
                   	<c:if test="${bookCommentResBean.isHot == 1}">
                   		<a href="javascript:void(0);" class="top2">[精华]</a>
                   	</c:if>
                   	<a>${bookCommentResBean.title }</a></h2>
                    <p class="mt10 mgb20" id="co90"><a href="${pageContext.request.contextPath }/book/listbyauthor/${bookCommentResBean.userId }">${bookCommentResBean.userNick }</a> 评
                    <a href="${pageContext.request.contextPath }/book/${book.id }" title="">《${book.name }》</a>   ${bookCommentResBean.createTimeFormat}</p>
                	<%-- <p>${bookCommentResBean.content }</p> --%>
                	<pre class="note"><p>${bookCommentResBean.content }</p></pre>    
                </div>
            </div>
            <div class="column">
            	<!--评论-->
                <div id="template_comment">
					<form action="" id="bookCommentForm">
					<input type="hidden" name="bookId" value="${book.id }"/>
					<input type="hidden" name="replyId" value="${bookCommentResBean.id }"/>
					<input type="hidden" name="title" value="${bookCommentResBean.title }"/>
					<input type="hidden" name="replyContent" value="${bookCommentResBean.content }"/>
					<input type="hidden" name="replyUserId" value="${bookCommentResBean.userId }"/>
	                <div class="pos_r replay02">
	                    <textarea class="replay01 replay04 mt10 grays" name="content"></textarea>
	                    <div class="pos_a">
							<%--<a href="javascript:void(0);"><img src="${sessionScope.baseUrl}pc/images/zp-img15.jpg" width="19" height="19"  /></a>--%>
	                        <a href="javascript:void(0);" name="btn_sumbit_comment_reply" class="input01">提交</a>
	                    </div>
					</div>
					<span class="red"></span>
					</form>
				</div>
                <!--评论-->
                <div class="discuss mt20">
                    <ul class="over mt10 border-bt">
                        <li id="fr"><a href="javascript:void(0);" class="plun ac" name="btn_comment">发表评论</a></li>
                        
                    </ul>
                </div>
                
                <div class="reviews mt20">

                    <div class="ce-c pos_r">
                    	<ul class="new-list">
                        	<c:forEach items="${bookCommentResBean.replyCommentList }" var="replyItem">
                        		<li class="pos_r">
	                            	<div class="lf-wd fl">
	                            		<a href="${pageContext.request.contextPath }/book/listbyauthor/${replyItem.userId }"><img src="${replyItem.userPic }" width="53" height="55" alt="${replyItem.userNick }" /></a>
	                            		<p class="col99"><a href="${pageContext.request.contextPath }/book/listbyauthor/${replyItem.userId }" >${replyItem.userNick }</a></p>
                                    	<c:if test="${replyItem.userId==book.authorId }"><img src="${sessionScope.baseUrl}pc/images/zp-img3.jpg" alt="" /></c:if>
                                       	<c:if test="${replyItem.userId!=book.authorId}"><img src="${sessionScope.baseUrl}pc/images/${replyItem.fansValues.image}" width="36" height="19" alt="" /></c:if>
	                                    <c:if test="${replyItem.vipValues.id > 0}"><p class="mat12 v${replyItem.vipValues.id }"></p></c:if>
                                    </div>
	                                <div class="rg-wd fr rg-wd10">
	                                	<b>${replyItem.content }</b>
	                                	<c:if test="${not empty replyItem.replyContent }">
	                                		<h2></h2>
	                                		<p>${replyItem.replyContent }</p>
	                                	</c:if>
	                                    <div class="controls over">
	                                    	<span class="col99 fl">${replyItem.createTimeFormat }</span>
	                                    	<commauth:commauth operType="del" bookAuthorId="${book.authorId }" commentUserId="${replyItem.userId }">
                                            <a href="javascript:void(0);" name="btn_comment_del" id="${replyItem.id }" class="col66 fr ml5">删除</a>
                                            </commauth:commauth>
                                            <commauth:commauth operType="reply" bookAuthorId="${replyItem.userId }">
                                            <span><a href="javascript:void(0);" class="col66 fr ml5" name="btn_comment_reply">回复</a></span> 
                                            </commauth:commauth>
	                                    </div>
	                                    <div class="over" style="display:none;">
                                        	<form action="">                                        	
                                        	<input type="hidden" name="bookId" value="${book.id }"/>
                                        	<input type="hidden" name="replyId" value="${bookCommentResBean.id }"/>
                                        	<input type="hidden" name="title" value="${replyItem.title }"/>
                                        	<input type="hidden" name="replyContent" value="${replyItem.content }"/>
                                        	<input type="hidden" name="replyUserId" value="${replyItem.userId }"/>
                                        	<input type="text" class="ne-input" name="content" value="回复@${replyItem.userNick }："/>
                                        	<input type="button" class="ne-buttom" name="btn_sumbit_comment_reply" style="cursor:pointer;"/>
                                        	<br/>
                                        	<span class="red"></span>                                     
                                        	</form>
                                        </div>               
	                                </div>
	                            </li>
                        	</c:forEach>
                    	</ul>
                    </div>
                </div>
            </div>
        </div>
       <!-- right end-->
       <!--left begin-->
       <div class="zp-wdrg fr">
       		<div class="ac mt25">
                <a href="${pageContext.request.contextPath }/book/${book.id}"><img src="${book.bigCoverImage }" height="275" width="210" alt="${book.name}"/></a>
                <p class="mt7 strong"><a href="${pageContext.request.contextPath }/book/${book.id}" title="${book.name}" class="f20 red">${book.name}</a></p>
            </div>
       </div>
       <!--left end-->
        <!--模块二-->
    </div>
</div>
<script type="text/javascript">
$(function(){
	initComment();
	initCommentReply();		
	initCommentDel();
});

function initComment() {
	var template_comment = $("#template_comment");
	$(template_comment).hide();
	
	var commentForm = $(template_comment).find("form");
	var btnSubmit = $(template_comment).find("a[name='btn_sumbit_comment_reply']");
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
			url : "${pageContext.request.contextPath }/comment/reply",
			success : function(json) {
				$(imgRandom).trigger("click");
				if (json.resBean.code != 0) {				
					$(error).text(json.resBean.msg);				
				} else {
					loadComment();
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
					loadComment();
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
						loadComment();
					}
				}
			});
		});
	});
}
 
function isLogin() {
	var userId = "${sessionScope.sessionFrontBean.userId}";
	if (userId == null || userId == "") {
		var redirectUrl = "/book/${book.id}";
		window.location.href="${pageContext.request.contextPath }/user/login?redirectUrl=" + redirectUrl;	
		return false;
	}
	
	return true;
}

function loadComment(){
	location.reload();
}

</script>
</body>
</html>




					