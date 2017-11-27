<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common.jsp" %>
<div class="sub ac f12 p-list sub9">
	<ul class="bgf3 strong over ">
		<li class="wd2">评论标题</li>
	    <li class="wd5">评论信息</li>
	    <li class="wd05">操作</li>
	</ul>
	<c:forEach items="${commentList }" var="item">
    <ul class="over">    	
    	<li class="wd2 al">${item.title }&nbsp;</li>
        <li class="wd5 al">${item.content }</li>
        <li class="wd05">
        	<c:if test="${item.replyId == -1 }">
         	<a href="javascript:void(0);" id="${item.id }" name="btn_hot"><img src="${sessionScope.baseUrl}pc/images/user/u-img20.jpg" width="15" height="18"/></a>
            <a href="javascript:void(0);" id="${item.id }" name="btn_top"><img src="${sessionScope.baseUrl}pc/images/user/u-img21.jpg" width="15" height="18"/></a>|
            </c:if>
            <a href="javascript:void(0);" id="${item.id }" name="btn_del"><img src="${sessionScope.baseUrl}pc/images/user/u-img18.jpg"  width="16" height="15"/></a>
        </li>
    </ul>
    </c:forEach>
    <page:pagination pageAttr="pagination"></page:pagination>                            
</div>
<script type="text/javascript">
$("a[name='btn_hot']").unbind("click");
$("a[name='btn_hot']").bind("click", function() {
	var id = $(this).attr("id");
	var formData = "bookId=${bookId}&commentId=" + id;
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
				openBookComment(1, 10);
			}
		}
	});
});

$("a[name='btn_top']").unbind("click");
$("a[name='btn_top']").bind("click", function() {
	var id = $(this).attr("id");
	var formData = "bookId=${bookId}&commentId=" + id;
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
				openBookComment(1, 10);
			}
		}
	});
});

$("a[name='btn_del']").unbind("click");
$("a[name='btn_del']").bind("click", function() {
	var id = $(this).attr("id");
	var formData = "bookId=${bookId}&commentId=" + id;
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
				$.MsgBox.Alert("提示", "删除成功");
				openBookComment(1, 10);
			}
		}
	});
});

function paper(pageNoValue, pageSizeValue) {
	openBookComment(pageNoValue, pageSizeValue);
}
</script>