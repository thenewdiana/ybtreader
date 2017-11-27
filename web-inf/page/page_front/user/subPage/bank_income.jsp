<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../../common.jsp" %>

<form action="" id="incomeForm" method="post">
   	<input type="hidden" id="page" name="page" value="${pagination.currPage }"/>
	<input type="hidden" id="rows" name="rows" value="${pagination.pageSize }"/>
	<c:if test="${sessionScope.sessionFrontBean.hasWriter == 1}">
		<div class="ce-t1 strong bg2">
			<ul class="over f14">
				<li>收入类型</li>
				<li>作品</li>
				<li class="wd4">来源</li>
				<li>数量</li>
				<li class="wd8">收入时间</li>
			</ul>
		</div>
		<div class="ce-t1 ce-t2">
			<c:forEach items="${incomeList}" var="item" varStatus="status">
				<ul>
					<li>
						<c:choose>
							<c:when test="${item.payType == 1}">订阅</c:when>
							<c:when test="${item.payType == 2}">打赏</c:when>
							<c:otherwise>
								未知
							</c:otherwise>
						</c:choose>
				   </li>
					</li>
					<li>${item.bookName}</li>
					<li class="wd4">${item.fromUserNick}</li>
					<li class=" red">${item.payValue}</li>
					<li class="wd8 examTime2">${item.createTime}</li>
				</ul>
			</c:forEach>
		</div>
		<div class="income">我的总收入：<strong class="red">${totalIncome}</strong><a href="${pageContext.request.contextPath }/statistics/byBook" class="frontButton">详情</a> </div>
		<!--分页-->
		<div class="page ac mt10 Arial">
		   <page:pagination pageAttr="pagination" JSFunction="incPaper"></page:pagination>
		</div> 
		<!--分页-->
	</c:if>
	<c:if test="${sessionScope.sessionFrontBean.hasWriter != 1}">
		你还不是作者！
	</c:if>
</form>	
<script type="text/javascript">
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
function incPaper(pageNoValue, pageSizeValue) {
	openUserIncome(pageNoValue, pageSizeValue);
}
</script>		
                       