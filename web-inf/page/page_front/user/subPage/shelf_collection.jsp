<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../../common.jsp" %>

<form action="" id="collectionForm" method="post">
   	<input type="hidden" id="page" name="page" value="${pagination.currPage }"/>
	<input type="hidden" id="rows" name="rows" value="${pagination.pageSize }"/>
	<div class="ce-t1 strong bg1">
		<ul class="over f14">
			<li class="wd4"><input type="checkbox" id="btnCheckAll"></li>
			<li class="wd8">书名</li>
			<li class="wdl">最新章节</li>
			<li class="wd8">最近更新时间</li>
			<li class="wd4">作者</li>
<!-- 			<li class="wd3">自动订阅</li> -->
		</ul>
	</div>
	<div class="ce-t1 ce-t2">
		<c:forEach items="${userBookList}" var="item" varStatus="status">
			<ul>
				<li class="wd4"><input type="checkbox" name="userBookIds" value="${item.id}"></li>
				<li class="wd8 red"><a href="${contextPath }/book/${item.bookId}" target="_blank" >${item.bookName}&nbsp;</a></li>
				<li class="wdl"><a href="#" title="">${item.lastChapterTitle}&nbsp;</a></li>
				<li class="wd8 examTime1">${item.lastModifyTime}&nbsp;</li>
				<li class="wd4">${item.authorNick}&nbsp;</li>
<!-- 				<li class="wd3"><c:if test="${item.isRss == 1}"></c:if> -->
<!-- 					<div class="over pic white"><a  <c:if test="${item.isRss == 1}">href="javascript:closeRss(${item.id})"</c:if> class="fl <c:if test="${item.isRss == 0}">ons</c:if>">关</a><a <c:if test="${item.isRss == 0}">href="javascript:openRss(${item.bookId})"</c:if> class="fr <c:if test="${item.isRss == 1}">ons</c:if>">开</a></div> -->
<!-- 				</li> -->
			</ul>
		</c:forEach>
	</div>
	<a href="javascript:deleteUserBook();" title="删除已选" class="del white">删除已选</a>
	 <!--分页-->
	<div class="page ac mt10 Arial">
		<page:pagination pageAttr="pagination" JSFunction="colPaper"></page:pagination>
	</div>
	
	
	<!--分页-->
</form>	

<script type="text/javascript">
$(function () {
	if($(".examTime1").get(0)){
	    $(".examTime1").each(function(i,e){
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
	
	$("#btnCheckAll").click(function(){ 
		if(this.checked){ 
			$("input[name='userBookIds']").each(function(){this.checked=true;}); 
		}else{ 
			$("input[name='userBookIds']").each(function(){this.checked=false;}); 
		} 
	});
});

function deleteUserBook(){
	var chk_value =[];    
	$('input[name="userBookIds"]:checked').each(function(){    
		chk_value.push($(this).val());    
	});  
	if(chk_value.length==0) {
		$.MsgBox.Alert("提示", "你还没有选择任何内容！");
		return;
	}
	if(confirm("是否删除收藏的图书！")){
      $.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath }/user/del_collect_json",
		data:"userBookIds=" + chk_value,
		dataType : "json",
		success : function(data) {
			if(data.code==0){
				colPaper($('#page').val(), $('#rows').val());
			}else{
				$.MsgBox.Alert("提示", result.msg);
			}
		}
	});
   }
}  


function openRss(bookId) {
	$.ajax({
		type : "POST",
		dataType : "json",
		data : "bookId=" + bookId,
		async:true,
		url : "${pageContext.request.contextPath }/book/rss",
		success : function(result) {
			if (result.resBean.code == 0) {
				colPaper($('#page').val(), $('#rows').val());
			} else {
				$.MsgBox.Alert("提示", result.resBean.msg);
			}
		}
	});
}

function closeRss(userBookId) {
	$.ajax({
		type : "POST",
		dataType : "json",
		data : "userBookId=" + userBookId,
		url : "${pageContext.request.contextPath }/user/rss_close_json",
		success : function(result) {
			if(result.code==0){
				colPaper($('#page').val(), $('#rows').val());
			}else{
				$.MsgBox.Alert("提示", result.msg);
			}
		}
	});
}	

function colPaper(pageNoValue, pageSizeValue) {
	openUserCollection(pageNoValue, pageSizeValue);
}
</script>		
                       