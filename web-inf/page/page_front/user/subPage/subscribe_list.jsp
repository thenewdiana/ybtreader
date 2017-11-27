<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../../common.jsp" %>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/time.js"></script>

<form action="" id="subscribeForm" method="post">
   	<input type="hidden" id="page" name="page" value="${pagination.currPage }"/>
	<input type="hidden" id="rows" name="rows" value="${pagination.pageSize }"/>
	<input type="hidden" id="statisticalDate" name="statisticalDate" />
	<div class="ce-t1 strong bg2" >
		<ul class="over f14">
			<li class="wd5">书号</li>
			<li class="wd8">书名</li>
			<li class="wd3">统计日期</li>
			<li class="wdl">订阅销售额(豆)</li>
			<li class="wdl">订阅销售额(元)</li>
			<li class="wdl">计次订阅用户数</li>
		</ul>
	</div>
	<div class="ce-t1 ce-t2">
		<c:forEach items="${resultList}" var="item" varStatus="status">
			<ul>
				<li class="wd5">${item.id}</li>
				<li class="wd8">${item.name}</li>
				<li class="wd3"><a href=javascript:subscribeDay('${item.statisticalDate}');>${item.statisticalDate}</a></li>
				<li class="wdl red">${item.saleBean}&nbsp;</li>
				<li class="wdl red">${item.sales}&nbsp;</li>
				<li class="wdl red">${item.saleCount}&nbsp;</li>
			</ul>
		</c:forEach>
	</div>
	 <!--分页-->
	<div class="page ac mt10 Arial">
		<page:pagination pageAttr="pagination" JSFunction="recPaper"></page:pagination>
	</div> 
	<!--分页-->
</form>	
<script type="text/javascript">
function recPaper(pageNoValue, pageSizeValue) {
	openSubscribeSelect(pageNoValue, pageSizeValue);
}

function subscribeDay(statisticalDate) {
	openSubscribeDaySelect($("#page").val(), $("#rows").val(),statisticalDate);
}
</script>		
                       