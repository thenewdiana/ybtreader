<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户管理中心-我的书架</title>
<link rel="stylesheet" type="text/css"
	href="${sessionScope.baseUrl}pc/css/common.css" />
<link rel="stylesheet" type="text/css"
	href="${sessionScope.baseUrl}pc/css/user.css" />
<link rel="stylesheet" type="text/css"
	href="${sessionScope.baseUrl}pc/css/hljmszhc.css" />
<script type="text/javascript"
	src="${sessionScope.baseUrl}pc/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/main.js"></script>
<script type="text/javascript"
	src="${sessionScope.baseUrl}pc/js/statistics_bd.js"></script>
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
						<jsp:param name="menu" value="index" />
					</jsp:include>
				</div>
				<!--left end-->
				<!--right begin-->
				<div class="u-perrg a-list">
					<!--我的书架-->
					<div class="ce1 over mt25">
						<h2 class="f16 fl col71 icp">订单提交成功</h2>
					</div>
					<div class="mod">
						<div class="bd">
							<c:if test="${recharge.rechargeStatus == 0}">
								<div class="alert pay-wait">
									<h4>提交成功，订单正在处理中。</h4>
									<div class="space-10"></div>
									<p>
										您输入的卡号、密码和面额已交由合作商校验，如果信息不正确，将会导致充值失败。请2分钟后刷新页面查询结果，或查询您的账户余额。
									</p>
									<div class="space-10"></div>
									<p>
										订单号： <b>${recharge.orderNo }</b> <br> 面 额： <b>${recharge.rechargeValue/recharge.ratio
												}元</b> <br>
									</p>
									<div class="space-10"></div>
									<p class="ac">
										<a class="button-input button-blue"
											href="javascript:window.location.reload();">刷新</a>
									</p>
								</div>
							</c:if>
							<c:if test="${recharge.rechargeStatus == 1}">
								<div class="alert alert-success pay-wait">
									<h4>充值成功.</h4>
									<div class="space-10"></div>
									<p>
										订单号： <b>${recharge.orderNo }</b> <br> 面 额： <b>${recharge.rechargeValue/recharge.ratio
												}元</b> <br>
									</p>
									<div class="space-10"></div>
									<p class="ac">
										<a class="button-input button-green"
											href="${pageContext.request.contextPath }/">去看书</a>
									</p>
								</div>
							</c:if>
							<c:if test="${recharge.rechargeStatus == 2}">
								<div class="alert alert-fail pay-wait">
									<h4>您的卡密校验失败，请重新提交订单</h4>
									<div class="space-10"></div>
									<p>
										充值失败可能原因： <br> 1：您是否输入正确的充值卡号和卡密？请仔细检查卡号卡密，注意大小写。 <br>
												2：您是否选择了符合您充值卡的服务接口？服务接口不符，如其他点卡充值QQ卡会造成充值失败。请选择正确的服务商进行充值服务。
												<br> 3：请不要用复制粘贴的形式输入密码和卡密，容易输入多余的空格或者其它符号。 <br>
									</p>
									<div class="space-10"></div>
									<p>
										订单号： <b>${recharge.orderNo }</b> <br> 面 额： <b>${recharge.rechargeValue/recharge.ratio
												}元</b> <br>
									</p>
									<p class="ac">
										<a class="button-input button-orange"
											href="${pageContext.request.contextPath }/recharge/index">重新充值</a>
									</p>
								</div>
							</c:if>
						</div>
					</div>
				</div>
				<!--right end-->
			</div>
		</div>
	</div>

	<!--foot begin-->
	<%@ include file="./user_foot.jsp"%>
	<!--foot end-->
</body>
</html>
