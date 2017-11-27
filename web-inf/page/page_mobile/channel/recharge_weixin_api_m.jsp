<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common_m.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript"  src="${sessionScope.baseUrl}mobile/js/jquery.min.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/jquery.qrcode.min.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/statistics_bd.js"></script>
<title>充值_雁北堂_雁北堂中文网_手机版</title>
</head>
<body>
	<div align="center" id="qrcode">
		<p>
			支付金额¥${recharge.rechargeValue/100}，请使用微信扫描下方二维码完成支付
		</p>
	</div>
</body>

<script type="text/javascript">
	var url = "${code_url}";
	$("#qrcode").qrcode({ 
	    //render: "table", //table方式 
	    width: 200, //宽度 
	    height:200, //高度 
	    text: url //任意内容 
	}); 
	/* //参数1表示图像大小，取值范围1-10；参数2表示质量，取值范围'L','M','Q','H'
	var qr = qrcode(10, 'H');
	qr.addData(url);
	qr.make();
	var dom = document.createElement('DIV');
	dom.innerHTML = qr.createImgTag();
	var element = document.getElementById("qrcode");
	element.appendChild(dom); */
	
</script>
</html>
