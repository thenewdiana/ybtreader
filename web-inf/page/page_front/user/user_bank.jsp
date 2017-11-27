<%@page import="com.ebtang.common.bean.VipValues"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户管理中心-我的书架</title>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/user.css"/>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/main.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/statistics_bd.js"></script>
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
                    <a href="${pageContext.request.contextPath }/recharge/index" title="" class="fr red-bd  white">我要充值</a>
                    <p class="fr f14">剩余糖豆：<strong class="red">${resBean.balanceValue}</strong></p>
                </div>
                <!--第二个-->
                <div class="ce5">
                	<h2 class="ac f14">VIP成长体系</h2>
                    <dl class="bords ac f14 over">
                    	<dt class="ce6"></dt>
                        <dd class="wd1">积分要求</dd>
                        <dd><%=VipValues.VIP0.getMaxPoint() %></dd>
                        <dd><%=VipValues.VIP1.getMaxPoint() %></dd>
                        <dd><%=VipValues.VIP2.getMaxPoint() %></dd>
                        <dd><%=VipValues.VIP3.getMaxPoint() %></dd>
                        <dd><%=VipValues.VIP4.getMaxPoint() %></dd>
                        <dd><%=VipValues.VIP5.getMaxPoint() %></dd>
                        <dd><%=VipValues.VIP6.getMaxPoint() %></dd>
                        <dd><%=VipValues.VIP7.getMaxPoint() %></dd>
                        <dd class="no-bd"><%=VipValues.VIP8.getMaxPoint() %></dd>
                    </dl>
                </div>
                <!--第1个-->
                <div class="ce6 f14">
                	<ul class="ul1">
                    	<li><span>昵称：</span><i>${sessionBean.userNick}<em class="f12 red m25"></em></i></li>
                        <li><span>VIP等级：</span><i><div class="bar"><div style="width:${resBean.pointValue/resBean.vipValues.maxPoint}%;"><span>${resBean.pointValue}/${resBean.vipValues.maxPoint}</span></div></div><c:if test="${resBean.vipValues.id!=0}"><img src="${sessionScope.baseUrl}pc/images/v${resBean.vipValues.id}.png" width="21" height="16" style="float:left;margin:16px 0 0 " /></c:if><a href="<%=contextPath %>/recharge/index"><em class="f12 red m25">升级VIP</em></a></i></li>
                    </ul>
                    <ul>
                    	<li><span>当前积分：</span><i>${resBean.pointValue}</i></li>
                        <li><span>所持金票：</span><i>${resBean.goldenValue}张</i></li>
                    </ul>
                    <ul class="ul2">
                    	<li><span>我的优惠：</span>${resBean.vipValues.discount}</li>
                    </ul>
                </div>
                <!--第三个-->
                <div class="visit ac  visits f14">
                	<div class="ce-t bords">
                        <ul class="over">
                            <li class="on">充值记录</li>
                            <li>消费记录</li>
                            <li>我的收入</li>
                        </ul>
                    </div>
                    <!--第2个-->
                    <div class="house" id="userRecharge">
                    </div>
                    
                    <div class="house houses hide" id="userConsumption">
                    </div>
                    
                    <div class="house house2 pos_r hide" id="userIncome">
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
		openUserRecharge(1, 10);
		openUserConsumption(1,10);
		openUserIncome(1,10);
	});

	function openUserRecharge(page, rows) {
		var obj = $("#userRecharge"); 
		var formData = "page=" + page + "&rows=" + rows;
		var formAction = "${pageContext.request.contextPath }/user/bank_recharge";
		submitForHtml(formData, formAction, obj);	
	}

	function openUserConsumption(page, rows) {
		var obj = $("#userConsumption"); 
		var formData = "page=" + page + "&rows=" + rows;
		var formAction = "${pageContext.request.contextPath }/user/bank_consumption";
		submitForHtml(formData, formAction, obj);	
	}
	
	function openUserIncome(page, rows) {
		var obj = $("#userIncome"); 
		var formData = "page=" + page + "&rows=" + rows;
		var formAction = "${pageContext.request.contextPath }/user/bank_income";
		submitForHtml(formData, formAction, obj);	
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
