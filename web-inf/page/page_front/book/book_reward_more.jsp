<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${book.name}_${book.name}的打赏，${book.authorNick }的小说_雁北堂_阅读江湖新力量</title>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/style.css"/>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/jquery.alert.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/main.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/statistics_bd.js"></script>
<style type="text/css">
.css_img_reward_type_on {border:2px solid #FAC23B;margin:0 1px 4px; display:block;}
.css_img_reward_type {margin:0 1px 4px; display:block;}
</style>
</head>

<body>
<!--header begin-->
<%@ include file="../header.jsp"%>
<!--header end-->
<%@ include file="../header_recomm.jsp"%>
<!--导航-->
<jsp:include page="../banner.jsp">
	 <jsp:param name="menu" value="bookroom"/>   
</jsp:include>

<!--中间-->
<div class="body-bg">
    <!--模块二-->
    <div class="w1000 bords" id="mt20">
    	<!--right begin-->
        <div class="zp-wdlf fl">
        	<div class="column reward">
                <div class="go-back over">
                    <h2 class="f24 fl">${book.name}打赏用户记录</h2>
                    <a href="${pageContext.request.contextPath }/book/${book.id}" class="fr f14">&lt;返回《${book.name}》</a>
                </div>
                
               <!-- 头部-->
               <div class="ce-t over">
                    <ul>
                    	<li <c:if test="${sortType.equals('money') }">class="on"</c:if> id="money">按金额排序</li>
    					<li <c:if test="${sortType.equals('time') }">class="on"</c:if> id="time">按时间排序</li>
                    </ul>
               </div>
               
               	<!-- 头部-->
               	<div class="ce-c04">
               		<c:forEach items="${userRewardList }" var="item" varStatus="status">
               			<ul <c:if test="${status.last }">class="bdno"</c:if>>
	                        <li><strong><a style="margin:0;" href="${pageContext.request.contextPath }/m/userCenter/${item.fromUserId}">${item.fromUserNick }</a></strong><span class="v${item.vipValues.id }">&nbsp;</span></li>
	                        <li class="pa20"><em>豪气万丈</em>的打赏了</li>
	                        <%-- <li class="ml20"><img src="${sessionScope.customUrl}reward/${item.reward.image}" width="26" height="26"/></li> --%>
							<c:if test="${empty item.reward.image}">
		                          <li class="ml20"><img src="${item.rewardImage}" width="26" height="26" alt="" /></li>		                            
		                    </c:if>
		                    <c:if test="${not empty item.reward.image}">
		                          <li class="ml20"><img src="${sessionScope.customUrl}reward/${item.reward.image}" width="26" height="26" alt="" /></li>		                            
		                     </c:if>	                        
	                        <li class="red strong">×${item.rewardCount }</li>
	                        <li class="fr">${item.createTimeFormat }</li>
	                    </ul>
               		</c:forEach>
              	</div>
              	<!--分页-->
				<div class="page ac mt10 Arial" id="fenye">
				   <page:pagination pageAttr="pagination" JSFunction="bookReward"></page:pagination>
				</div> 
				<!--分页-->
				<form action="" id="pageForm" method="post">
					<input type="hidden" id="sortType" name="sortType" value="${sortType }"/>
					<input type="hidden" id="page" name="page" value="1"/>
				    <input type="hidden" id="rows" name="rows" value="10"/>
				</form>  
            </div>
            
        </div>
       <!-- right end-->
       <!--left begin-->
       <div class="zp-wdrg fr">
       		<div class="ac mt25">
                <a href="${pageContext.request.contextPath }/book/${book.id}"><img src="${book.bigCoverImage }" height="275" width="210" alt="${book.name}"/></a>
                <p class="mt7 strong"><a href="${pageContext.request.contextPath }/book/${book.id}" title="${book.name}" class="f20 red">${book.name}</a></p>
            </div>
       </div>
       <!--left end-->
        <!--模块二-->
    </div>
</div>


<!--footer-->
<%@ include file="../footer.jsp"%>
<!--footer-->

<script type="text/javascript">
$(function(){
	$('.ce-t li').click(function(){
		var id = $(this).attr("id");
		$(this).addClass('on').siblings('li').removeClass('on');
		$("#sortType").attr("value", id);
		$("#fenye").hide();
		$(".ce-c04").hide();
		bookReward(1,20);
	});
});

function bookReward(page, rows) {
	var obj = $("#pageForm"); 
	$("#page").val(page);
	$("#rows").val(rows);
	obj.attr("action","${pageContext.request.contextPath }/book/${book.id}/reward/more");
	obj.submit();
}
</script>
</body>
</html>