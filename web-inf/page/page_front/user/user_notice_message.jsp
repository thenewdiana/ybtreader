<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common.jsp" %>
<div class="ce-t1 ce-t2 house">
<c:forEach items="${list }" var="item">
<dl>
	<dt><a href="${pageContext.request.contextPath }/book/listbyauthor/${item.userId}" ><img src="${sessionScope.baseUrl}/custom/${item.userPic}" width="52" height="52" /><br /></a></dt>
    <dd>
    	<p><span class="red"><a href="${pageContext.request.contextPath }/book/listbyauthor/${item.userId}">${item.userNick}</a></span>在评论<span class="red"><a href="${pageContext.request.contextPath }/comment/${item.replyId}">${item.title}</a></span>中 回应了您的回复</p>
        <p class="bd-bdtb"><em>${item.content}</em></p>
        <p class="ml5"><a href="${pageContext.request.contextPath }/book/listbyauthor/${sessionScope.sessionFrontBean.userId}" >${sessionScope.sessionFrontBean.userNick}</a>：<em>${item.replyContent}</em></p>
        <p class="over">
        	<em class="examTime">${item.createTime}</em>
            <span><a href="javascript:void(0);" name="btn_comment_reply" class="fr">回复</a></span>
        </p>
        <div class="over" style="display:none;">
        	<form action="">                                        	
	           	<input type="hidden" name="bookId" value="${item.bookId }"/>
	           	<input type="hidden" name="replyId" value="${item.replyId }"/>
	           	<input type="hidden" name="title" value="${item.title }"/>
	           	<input type="hidden" name="replyContent" value="${item.content }"/>
	           	<input type="hidden" name="replyUserId" value="${item.userId }"/>
	           	<input type="text" class="ne-input" name="content" value="回复@${item.userNick }："/>
	           	<input type="button" class="ne-buttom" name="btn_sumbit_comment_reply" style="cursor:pointer;"/>
	           	<br/>
	           	<span class="red"></span>                                     
           	</form>
        
        
            
        </div>
    </dd>
    
</dl>
</c:forEach>
    
</div>
<page:pagination pageAttr="pagination"></page:pagination>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/time.js"></script>
<script type="text/javascript">
$(function(){
	initCommentReply();
});

function paper(pageNo, pageSize) {
	openMessageList(pageNo, pageSize);
}

function initCommentReply() {	
	$("a[name='btn_comment_reply']").each(function() {
		var replyDiv = $(this).parent().parent().next("div");
		$(replyDiv).hide();
	});
	
	//我要回复
	$("a[name='btn_comment_reply']").unbind("click");
	$("a[name='btn_comment_reply']").bind("click", function(){
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
					$(replyForm).hide();
				}
			}
		});
	});	
}
</script> 