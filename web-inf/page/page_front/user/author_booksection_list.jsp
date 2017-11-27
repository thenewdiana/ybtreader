<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common.jsp" %>
<div class="sub ac f12 p-list">
	<form action="" id="booksectionForm">
	<input type="hidden" class="wd1" name="bookId" value="${bookId }">
	<input type="hidden" class="wd1" name="id">
	<ul class="bgf3 strong over ">
        <li class="wd2">卷名</li>
        <li class="wd5">分卷介绍</li>
        <li class="wd05">操作</li>
    </ul>
    <c:forEach items="${bookSectionList }" var="item">
    <ul class="over">
    	<li class="wd2 al"><a href="javascript:void(0);">${item.sectionName }</a></li>
        <li class="wd5 al">${item.sectionInfo }</li>
        <li class="wd05">   
        	<a name="btn_mod" id="${item.id }">编辑</a>                              	
            <img src="${sessionScope.baseUrl}pc/images/user/u-img18.jpg" width="16" height="15" class="ml10" id="${item.id }" name="btn_del"/>
        </li>
    </ul>
    </c:forEach>    
    </form>                        
</div>
<script type="text/javascript">
var formObj = $("#booksectionForm");
$(formObj).find("img[name='btn_del']").bind("click", function() {
	var id = $(this).attr("id");
	$(formObj).find("input[name='id']").attr("value", id);
	var formData = $(formObj).serialize();
	var formAction = "${pageContext.request.contextPath }/author/booksection/del";
	$.ajax({
		type : "POST",
		dataType : "json",
		data : formData,
		async:true,
		url : formAction,
		success : function(json) {
			if (json.resBean.code == 0) {
				openBookSection();
			} else {
				$.MsgBox.Alert("提示", json.resBean.msg);	
			}
		}
	});
});

$(formObj).find("a[name='btn_mod']").bind("click", function() {
	var sectionId = $(this).attr("id");
	var bookId = "${bookId}";
	modBookSection(bookId, sectionId);
});
</script>