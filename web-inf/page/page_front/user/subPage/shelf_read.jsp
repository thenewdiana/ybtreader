<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../../common.jsp" %>

<form action="" id="readForm" method="post">
	<div class="ce-t1 strong bg1">
		<ul class="over f14">
			<li class="wd8">书名</li>
			<li class="wd8">最新章节</li>
			<li class="wd8">最近更新时间</li>
			<li class="wd4">作者</li>
<!-- 			<li class="wd3">自动订阅</li> -->
		</ul>
	</div>
	<div class="ce-t1 ce-t2">
		<c:forEach items="${readBookList}" var="item" varStatus="status">
			<ul>
				<li class="wd8 red"><a href="${contextPath }/book/${item.bookId}" target="_blank" >${item.bookName}&nbsp;</a></li>
				<li class="wd8"><a href="#" title="">${item.lastChapterTitle}&nbsp;</a></li>
				<li class="wd8 examTime2">${item.lastModifyTime}&nbsp;</li>
				<li class="wd4">${item.authorNick}&nbsp;</li>
<!-- 				<li class="wd3"><c:if test="${item.isRss == 1}"></c:if> -->
<!-- 					<div class="over pic white"><a  <c:if test="${item.isRss == 1}">href="javascript:closeReadRss(${item.id})"</c:if> class="fl <c:if test="${item.isRss == 0}">ons</c:if>">关</a><a <c:if test="${item.isRss == 0}">href="javascript:openReadRss(${item.bookId})"</c:if> class="fr <c:if test="${item.isRss == 1}">ons</c:if>">开</a></div> -->
<!-- 				</li> -->
			</ul>
		</c:forEach>
	</div>
</form>	

<script type="text/javascript">
$(function () {
	if($(".examTime2").get(0)){
	    $(".examTime2").each(function(i,e){
	        var t = new Date(parseInt($(e).text()));
	        var hh = t.getHours();
	        var mm = t.getMinutes();
	        var ss = t.getSeconds();
	        if(hh<10){ hh = '0'+hh;}
	        if(mm<10){ mm = '0'+mm;}
	        if(ss<10){ ss = '0'+ss;}
	        $(e).text(t.getFullYear()+"年"+(t.getMonth()+1)+"月"+t.getDate()+"日 "+hh+":"+mm+":"+ss);
	    });
	}
});



function openReadRss(bookId) {
	$.ajax({
		type : "POST",
		dataType : "json",
		data : "bookId=" + bookId,
		async:true,
		url : "${pageContext.request.contextPath }/book/rss",
		success : function(result) {
			if (result.resBean.code == 0) {
				openUserRead();
			} else {
				$.MsgBox.Alert("提示", result.resBean.msg);
			}
		}
	});
}

function closeReadRss(userBookId) {
	$.ajax({
		type : "POST",
		dataType : "json",
		data : "userBookId=" + userBookId,
		url : "${pageContext.request.contextPath }/user/rss_close_json",
		success : function(result) {
			if(result.code==0){
				openUserRead();
			}else{
				$.MsgBox.Alert("提示", result.msg);
			}
		}
	});
}	

</script>		
                       