<%@page import="com.ebtang.common.bean.VipValues"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户管理中心-书籍统计</title>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/user.css"/>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}plugin/jquery-labelauty/jquery-labelauty.css">
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}plugin/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}plugin/jquery-labelauty/jquery-labelauty.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/paginationUtil.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/main.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/statistics_bd.js"></script>

<style>
.labelauty ul { list-style-type: none;}
.labelauty li { display: inline-block;margin: 10px 0;}
input.labelauty + label { font: 12px "Microsoft Yahei";}
</style>
</head>
</head>


<body>
<!--header begin-->
<%@ include file="./user_header.jsp"%>
<!--header end-->
<div class="body-bg">
 	<div class="w1000">
    	<img src="${sessionScope.baseUrl}pc/images/user/nav-2.jpg" width="954" height="8" alt="" />
        <div class="over u-ct">
        	<!--left begin-->
        	<div class="u-per fl">
        		<%@ include file="./user_left_up.jsp"%>
	        	<jsp:include page="./user_left_down.jsp">
					 <jsp:param name="menu" value="bank"/>   
				</jsp:include>
			</div>
        	<!--left end-->
            <!--right begin-->
            <div class="u-perrg">
            	<div class="ce1 over ce01">
                	<h2 class="f16 fl col71 icp3">我的银号</h2>
                    <p class="fl red red f14 m25"><strong>VIP会员尊享</strong>&gt;&gt;保底金票 看书打折</p>
                    <a href="${pageContext.request.contextPath }/recharge/index" title="" class="fr red-bd white">我要充值</a>
                    <p class="fr f14">剩余糖豆：<strong class="red">${resBean.balanceValue}</strong></p>
                </div>
                <!--第二个-->
                <div class="ce5">
                	<h2 class="ac f14">请选择查询的图书</h2>
                    <dl class="bords ac f14 over labelauty">
                    	<ul class="dowebok">
                    		<c:forEach items="${bookList}" var="item" varStatus="status">
                    			<li><input type="radio" name="bid" value="${item.id}" <c:if test="${status.first}">checked</c:if> data-labelauty="${item.name}"></li>
                    		</c:forEach>
						</ul>
                    </dl>
                </div>
                <div class="ce5">
                	<h2 class="ac f14">查询种类</h2>
                    <dl class="bords ac f14 over">
                    </dl>
                </div>
                <!--第1个-->
                 <div class="ce6 f14"> 
                 	<ul class="ul1"> 
                     	<li><span>订阅查询：</span><input type="text" id="subscribeStartTime" name="subscribeStartTime" class="Wdate" readonly="readonly"  onFocus="WdatePicker({lang:'zh-cn'})" />~<input type="text" id="subscribeEndTime" name="subscribeEndTime" class="Wdate" readonly="readonly"  onFocus="WdatePicker({lang:'zh-cn'})" /><a href="javascript:openSubscribeSelect(1,10);" title="" class="frontButton">查询</a></li> 
                    </ul> 
                    <ul> 
                     	<li><span>订阅结算：</span><select name="subscribeSettlementId" id="subscribeSettlementId" style="width:153px;" >
							<c:forEach items="${dictDataList}" var="dict">
								<option value=${dict.id}>${dict.dataKey}</option>
							</c:forEach>
						</select><a href="javascript:openSubscribeSettlement(1,10);" title="" class="frontButton">统计结算</a></li> 
                    </ul> 
                    <ul class="ul3"> 
                     	<li><span>打赏查询：</span><input type="text" id="rewardStartTime" name="rewardStartTime"  class="Wdate" readonly="readonly"  onFocus="WdatePicker({lang:'zh-cn'})" />~<input type="text" id="rewardEndTime" name="rewardEndTime" class="Wdate" readonly="readonly"  onFocus="WdatePicker({lang:'zh-cn'})" /><a href="javascript:openRewardSelect(1,10)" title="" class="frontButton">查询</a></li> 
                    </ul> 
                    <ul class="ul4"> 
                     	<li><span>打赏结算：</span><select name="rewardSettlementId" id="rewardSettlementId" style="width:153px;" >
							<c:forEach items="${dictDataList}" var="dict">
								<option value=${dict.id}>${dict.dataKey}</option>
							</c:forEach>
						</select><a href="javascript:openRewardSettlement(1,10);" title="" class="frontButton">统计结算</a></li></li> 
                    </ul>
                 </div> 
                 <form name="listForm" method="post" id="listForm" target="_self">
                 	<input type="hidden" name="page" id="page" />
					<input type="hidden" name="rows" id="rows" />
					<input type="hidden" name="bookId" id="bookId"/>
					<input type="hidden" name="settlementId" id="settlementId"/>
					<input type="hidden" name="statisticalDate" id="statisticalDate"/>
					<input type="hidden" name="startTime" id="startTime"/>
					<input type="hidden" name="endTime" id="endTime"/>
				</form>
                <!--第三个-->
                <div class="visit ac  visits ">
                	<div class="ce-ts bords">
                        <ul class="over">
                            <li id="li0" <c:if test="${selectType==1}">class="on"</c:if>>订阅查询</li>
                            <li id="li1" <c:if test="${selectType==2}">class="on"</c:if>>订阅结算</li>
                            <li id="li2" <c:if test="${selectType==3}">class="on"</c:if>>打赏查询</li>
                            <li id="li3" <c:if test="${selectType==4}">class="on"</c:if>>打赏结算</li>
                        </ul>
                    </div>
                    <!--第2个-->
                    <div class="house" id="subscribeList">
                    </div>
                    
                    <div class="house hide" id="subscribeSettlementList">
                    </div>
                    
                    <div class="house hide" id="rewardList">
                    </div>
                    
                    <div class="house pos_r hide" id="rewardSettlementList">
                	</div>
                <!--第四个-->
            </div>
            <!--right end-->
        </div>
    </div>
</div>

<!--foot begin-->
<%@ include file="./user_foot.jsp"%>
<!--foot end-->
<script type="text/javascript">
	
	$(function() {
		$(':radio').labelauty();
	});

	function openSubscribeSelect(page,rows) {
		$("#bookId").val($('input:radio:checked').val());
		$("#startTime").val($("#subscribeStartTime").val());
		$("#endTime").val($("#subscribeEndTime").val());
		$("#page").val(page);
		$("#rows").val(rows);
		var obj = $("#subscribeList"); 
		var formData = getFormToJsonString('listForm');
		var formAction = "${pageContext.request.contextPath }/statistics/subscribe_list";
		cssmod("li0");
		submitForHtml(formData, formAction, obj);
		
	}
	
	function openSubscribeDaySelect(page,rows,statisticalDate) {
		$("#bookId").val($('input:radio:checked').val());
		$("#statisticalDate").val(statisticalDate);
		$("#page").val(page);
		$("#rows").val(rows);
		var obj = $("#subscribeList"); 
		var formData = getFormToJsonString('listForm');
		var formAction = "${pageContext.request.contextPath }/statistics/subscribe_day_list";
		cssmod("li0");
		submitForHtml(formData, formAction, obj);
		
	}

	function openSubscribeSettlement(page,rows) {
		$("#bookId").val($('input:radio:checked').val());
		$("#settlementId").val($("#subscribeSettlementId").val());
		$("#page").val(page);
		$("#rows").val(rows);
		var obj = $("#subscribeSettlementList"); 
		var formData = getFormToJsonString('listForm');
		var formAction = "${pageContext.request.contextPath }/statistics/subscribe_settlement_list";
		cssmod("li1");
		submitForHtml(formData, formAction, obj);
	}
	
	function openRewardSelect(page,rows) {
		$("#bookId").val($('input:radio:checked').val());
		$("#startTime").val($("#rewardStartTime").val());
		$("#endTime").val($("#rewardEndTime").val());
		$("#page").val(page);
		$("#rows").val(rows);
		var obj = $("#rewardList"); 
		var formData = getFormToJsonString('listForm');
		var formAction = "${pageContext.request.contextPath }/statistics/reward_list";
		cssmod("li2");
		submitForHtml(formData, formAction, obj);
	}
	
	function openRewardDaySelect(page,rows,statisticalDate) {
		$("#bookId").val($('input:radio:checked').val());
		$("#statisticalDate").val(statisticalDate);
		$("#page").val(page);
		$("#rows").val(rows);
		var obj = $("#rewardList"); 
		var formData = getFormToJsonString('listForm');
		var formAction = "${pageContext.request.contextPath }/statistics/reward_day_list";
		cssmod("li2");
		submitForHtml(formData, formAction, obj);
	}
	
	function openRewardSettlement(page,rows) {
		$("#bookId").val($('input:radio:checked').val());
		$("#settlementId").val($("#rewardSettlementId").val());
		$("#page").val(page);
		$("#rows").val(rows);
		var obj = $("#rewardSettlementList"); 
		var formData = getFormToJsonString('listForm');
		var formAction = "${pageContext.request.contextPath }/statistics/reward_settlement_list";
		cssmod("li3");
		submitForHtml(formData, formAction, obj);
	}
	
	function cssmod(id){
		$("#"+id).addClass('on').siblings('li').removeClass('on');
		o_index = $("#"+id).index();
		$('.house').hide().eq(o_index).show();
	}

	function submitForHtml(formData, formAction, obj) {
		$.ajax({
			type : "POST",
			dataType : "html",
			data : formData,
			async:true,
			url : formAction,
			success : function(html) {
				$(obj).empty();
				$(obj).append(html);
			}
		});
	}	
</script>
</body>
</html>
