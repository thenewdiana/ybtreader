<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common.jsp" %>
<div class="ce-t1 strong bg1">
    <ul class="over f14">
        <li class="wd6">标题</li>
        <li class="wd7">消息来源</li>
        <li class="wd8">发送时间</li>        
        <li class="wd5"><input type="checkbox" id="checkbox_all"/></li>
    </ul>                        
</div>
<div class="ce-t1 ce-t2 house">
<c:forEach items="${list }" var="item">
<ul>	
	<li class="wd6"><a href="${pageContext.request.contextPath }/user/notice/${item.id}" target="_blank">${item.message.title }&nbsp;</a></li>
    <li class="wd7">雁北堂中文网官方客服&nbsp;</li>	
    <li class="wd8">${item.createTimeFormatHour }</li>
    <li class="wd5"><input type="checkbox" name="ids" value="${item.id }"/></li>
</ul>
</c:forEach>
</div>
<page:pagination pageAttr="pagination"></page:pagination>
<c:if test="${list.size() > 0 }">
<a href="javascript:void(0);" title="删除已选" class="del pos_a white" onclick="delNotice()">删除已选</a>
</c:if>

<script type="text/javascript">
$("#checkbox_all").unbind("click");
$("#checkbox_all").bind("click", function() {
	var isChecked = $(this).is(':checked'); 
	$("input[name='ids']").prop("checked", isChecked);		
});

function delNotice() {
	var formData = "tabNick=letterList";
	var ids = "";
	var isChecked = false;
	$("input[name='ids']").each(function() {
		if ($(this).is(':checked')) {				
			var id = $(this).attr("value");
			isChecked = true;				
			if (ids == "") {
				ids = id;
			} else {
				ids += "," + id;
			}				
		}
	});	
	
	if (!isChecked) {
		$.MsgBox.Alert("提示", "请选择要删除的消息");	
		return;
	}
	formData += "&ids=" + ids;
	window.location.href = "${pageContext.request.contextPath }/user/notice/delete?" + formData;
}

function paper(pageNo, pageSize) {
	openReadList(pageNo, pageSize);
}
</script> 