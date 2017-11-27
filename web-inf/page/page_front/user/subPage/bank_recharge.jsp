<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../../common.jsp" %>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/time.js"></script>

<form action="" id="rechargeForm" method="post">
   	<input type="hidden" id="page" name="page" value="${pagination.currPage }"/>
	<input type="hidden" id="rows" name="rows" value="${pagination.pageSize }"/>
	<div class="ce-t1 strong bg2" >
		<ul class="over f14">
			<li class="wd3">充值类型</li>
			<li class="wd8">单号</li>
			<li class="wd3">途径</li>
			<li class="wd3">金额（元）</li>
			<li class="wd3">获得糖豆</li>
			<li class="wd3">状态</li>
			<li class="wdl">充值时间</li>
		</ul>
	</div>
	<div class="ce-t1 ce-t2">
		<c:forEach items="${userRechargeResBeanList}" var="item" varStatus="status">
			<ul>
				<li class="wd3">普通充值</li>
				<li class="wd8">${item.orderNo}</li>
				<li class="wd3">
					<c:choose>
						<c:when test="${item.rechargeWay == -1}">系统退款</c:when>
						<c:when test="${item.rechargeWay == 0}">支付宝</c:when>
						<c:when test="${item.rechargeWay == 1}">银行卡</c:when>
						<c:when test="${item.rechargeWay == 2}">系统赠送</c:when>
						<c:when test="${item.rechargeWay == 3}">微信支付</c:when>
						<c:when test="${item.rechargeWay == 4}">卡类支付</c:when>
						<c:when test="${item.rechargeWay == 5}">任务赠送</c:when>
						<c:when test="${item.rechargeWay == 6}">app任务获取</c:when>
						<c:when test="${item.rechargeWay == 7}">苹果内购</c:when>
						<c:otherwise>
							未知
						</c:otherwise>
					</c:choose>
				</li>
				<li class="wd3 red">${item.rechargeValue/100}&nbsp;</li>
				<li class="wd3">${item.rechargeValue}&nbsp;</li>
				<c:choose>
					<c:when test="${item.rechargeStatus == 0}"><li class="wd3 red">等待付款</li></c:when>
					<c:when test="${item.rechargeStatus == 1}"><li class="wd3 green">充值成功</li></c:when>
					<c:when test="${item.rechargeStatus == 2}"><li class="wd3 red">充值失败</li></c:when>
					<c:when test="${item.rechargeStatus == -1}"><li class="wd3">取消</li></c:when>
					<c:otherwise>
						<li class="wd3">未知</li>
					</c:otherwise>
				</c:choose>
				<li class="wdl">${item.createTimeFormat}</li>
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
	openUserRecharge(pageNoValue, pageSizeValue);
}
</script>		
                       