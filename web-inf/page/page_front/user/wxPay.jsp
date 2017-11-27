<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<%@ include file="../common.jsp" %>
	<link rel="stylesheet" type="text/css" href="<%=contextPath %>/static/css/weixin_pay.min.css">
	<%-- <script type="text/javascript" src="<%=contextPath %>/static/js/plugins/jquery.qrcode.min.js"></script> --%>
	<script type="text/javascript" src="<%=contextPath %>/static/js/plugins/qrcode.js"></script>
	<script type="text/javascript">
		$(function(){
			/* var url = "weixin://wxpay/bizpayurl?pr=jngHgKK";
			jQuery('#qrcode').qrcode({render:'table',text:$('#code_url').val(),width: 200,height:200}); */
			//参数1表示图像大小，取值范围1-10；参数2表示质量，取值范围'L','M','Q','H'
			var qr = qrcode(10, 'M');
			qr.addData($('#code_url').val());
			qr.make();
			$("#qrcode").html(qr.createImgTag(4));
			
			var ajFlag = true;
			var getStatus = function () {
				if (!ajFlag) {
					return false;
				} else {
					ajFlag = false;
				}
				$.ajax({
					type: "POST",
					url: "<%=contextPath %>/payment/wxpay/status",
					data: {orderNo:'${order_no}',p_id:'${p_id}',m_id:'${m_id}'},
					dataType: "json",
					success: function (o) {
						if (o.status != -1) {
							var return_url = $('#return_url').val();
							location.href = return_url && return_url != ''?return_url:o.return_url;
						} else {
							ajFlag = true;
						}
					}
				});
			};
	
			setInterval(function () {
				getStatus();
			}, 2000);
		});
	</script>
</head>
<body>
	<div class="software_intro">
		<div class="common_title01"><span>微信支付</span></div>
	</div>
	<input type="hidden" id="code_url" value="${code_url }"/>
	<input type="hidden" id="order_no" value="${order_no }"/>
	<input type="hidden" id="return_url" value="${return_url }"/>
	<%-- 
	<div id="qrcode"></div> --%>
	<!--订单号-->
	<div class="software_intro">
		<div class="bor_bac">
			<div class="order_information">
				<div class="order_tit01">订单号：
					<span>${order_no }</span>
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
						<p class="soft_mall_p fl"><strong>￥${total_fee }</strong></p>
						<a class="detail fr">订单详情</a>
					</div>
					<div class="weixin_pay" id="qrcode">
					</div>
					<div class="weixin_saomiao">
						<p class="saoYiSao">请使用微信扫一扫<br>扫描二维码支付</p>
						<p class="shouAn">长按图片识别二维码</p>
				</div>
				</div>
				<div class="weixin_pay_r fl"><img src="<%=contextPath %>/static/css/images/weixin_pic.jpg" alt=""></div>
			</div>
		</div>
	</div>
</body>
</html>