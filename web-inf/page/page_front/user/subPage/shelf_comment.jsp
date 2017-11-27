<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../../common.jsp" %>

<form action="" id="commentForm" method="post">
   	<input type="hidden" id="page" name="page" value="${pagination.currPage }"/>
	<input type="hidden" id="rows" name="rows" value="${pagination.pageSize }"/>
	<div class="ce-t1 strong bg1">
		<ul class="over f14">
			<li class="wd7">评论标题</li>
			<li class="wd10">评论内容</li>
		</ul>
	</div>
	<div class="ce-t1 ce-t2">
		<c:forEach items="${bcList}" var="item" varStatus="status">
			<ul>
				<li class="wd7"><a href="${pageContext.request.contextPath }/comment/${item.id}">${item.title}&nbsp;</a></li>
				<li class="wd10">${item.content}&nbsp;</li>
			</ul>
		</c:forEach>
	</div>
	
	<!--分页-->
	<div class="page ac mt10 Arial">
	   <page:pagination pageAttr="pagination" JSFunction="comPaper"></page:pagination>
	</div> 
	<!--分页-->
</form>	

<script type="text/javascript">
function comPaper(pageNoValue, pageSizeValue) {
	openUserComment(pageNoValue, pageSizeValue);
}
</script>		
                       