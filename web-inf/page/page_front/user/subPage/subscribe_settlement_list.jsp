<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../../common.jsp" %>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/time.js"></script>

<form action="" id="subscribeForm" method="post">
   	<input type="hidden" id="page" name="page" value="${pagination.currPage }"/>
	<input type="hidden" id="rows" name="rows" value="${pagination.pageSize }"/>
	<div class="ce-t1 strong bg2" >
		<ul class="over f14">
			<li class="wd5">书号</li>
			<li class="wd8">书名</li>
			<li class="wd3">时间</li>
			<li class="wdl">订阅总糖豆</li>
			<li class="wdl">应结款(税前/元)</li>
			<li class="wdl">结算状态</li>
		</ul>
	</div>
	<div class="ce-t1 ce-t2">
		<c:forEach items="${resultList}" var="item" varStatus="status">
			<ul>
				<li class="wd5">${item.id}</li>
				<li class="wd8">${item.name}</li>
				<li class="wd3"><a >${item.statisticalDate}</a></li>
				<li class="wdl red">${item.saleBean}&nbsp;</li>
				<li class="wdl red">${item.settlementValue}&nbsp;</li>
				<c:choose>
					<c:when test="${item.settlementStatus == 0}"><li class="wdl red">未结算</li></c:when>
					<c:when test="${item.settlementStatus == 1}"><li class="wdl green">已结算</li></c:when>
					<c:otherwise>
						<li class="wd3">未知</li>
					</c:otherwise>
				</c:choose>
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
	openSubscribeSettlement(pageNoValue, pageSizeValue);
}
</script>		
                       