<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><spring:message code="front.global.title"></spring:message>-用户管理中心-在线充值</title>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/qrcode.min.js"></script>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/pay/weixin_pay.min.css"/>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/statistics_bd.js"></script>
<script type="text/javascript">
	$(function(){
		var qrcode = new QRCode('qrcode', {
		  text: '${code_url}',
		  width: 256,
		  height: 256,
		  colorDark: '#000000',
		  colorLight: '#ffffff',
		  correctLevel: QRCode.CorrectLevel.H
		});
	});
	
</script>
</head>
<body>
	<div class="software_intro">
		<div class="common_title01"><span>微信支付</span></div>
	</div>
	<input type="hidden" id="code_url" value="${code_url }"/>
	<input type="hidden" id="order_no" value="${recharge.orderNo }"/>
	<%-- 
	<div id="qrcode"></div> --%>
	<!--订单号-->
	<div class="software_intro">
		<div class="bor_bac">
			<div class="order_information">
				<div class="order_tit01">订单号：
					<span>${recharge.orderNo }</span>
					<p>请您及时付款，以便订单尽快处理！</p>
				</div>
			</div>
		</div>
	</div>
	<div class="software_intro">
		<div class="bor_bac">
			<div class="weixin_pay_box">
				<div class="weixin_pay_l fl">
					<div class="weixin_pay_text">
						<span class="fl">应付金额：</span>
						<p class="soft_mall_p fl"><strong>¥${recharge.rechargeValue/100}</strong></p>
						<a class="detail fr"></a>
					</div>
					<div class="weixin_pay" id="qrcode">
					</div>
					<div class="weixin_saomiao">
						<p class="saoYiSao">请使用微信扫一扫<br>扫描二维码支付</p>
						<p class="shouAn">长按图片识别二维码</p>
				</div>
				</div>
				<div class="weixin_pay_r fl"><img src="${sessionScope.baseUrl}pc/css/pay/images/weixin_pic.jpg" alt=""></div>
			</div>
		</div>
	</div>
</body>


</html>
