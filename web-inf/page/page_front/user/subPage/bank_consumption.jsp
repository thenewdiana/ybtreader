<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../../common.jsp" %>

<form action="" id="consumptionForm" method="post">
   	<input type="hidden" id="page" name="page" value="${pagination.currPage }"/>
	<input type="hidden" id="rows" name="rows" value="${pagination.pageSize }"/>
	<div class="ce-t1 strong bg2">
		<ul class="over f14">
			<li>消费类型</li>
			<li>作品名称</li>
			<li>消费糖豆</li>
			<li>消费时间</li>
		</ul>
	</div>
	<div class="ce-t1 ce-t2">
		<c:forEach items="${consumptionList}" var="item" varStatus="status">
			<ul>
			   <li>
				<c:choose>
					<c:when test="${item.payType == 1}">订阅</c:when>
					<c:when test="${item.payType == 2}">打赏</c:when>
					<c:when test="${item.payType == 3}">抽奖</c:when>
					<c:otherwise>
						未知
					</c:otherwise>
				</c:choose>
			   </li>
			   <li>${item.bookName}</li>
			   <li class="red">${item.payValue}</li>
			   <li class="examTime1">${item.createTime}</li>
			</ul>
		</c:forEach>
	</div>
	
	<!--分页-->
	<div class="page ac mt10 Arial">
	   <page:pagination pageAttr="pagination" JSFunction="conPaper"></page:pagination>
	</div> 
	<!--分页-->
</form>	

<script type="text/javascript">
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

function conPaper(pageNoValue, pageSizeValue) {
	openUserConsumption(pageNoValue, pageSizeValue);
}
</script>		
                       