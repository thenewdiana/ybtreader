<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common_m.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="format-detection" content="telephone=no" />
    <meta content="email=no" name="format-detection" /> 
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <!-- 是否启用 WebApp 全屏模式，删除苹果默认的工具栏和菜单栏 -->
    <meta name="apple-mobile-web-app-status-bar-style" content="black"/>
    <!-- 设置苹果工具栏颜色 -->
    <link rel="stylesheet" href="${sessionScope.baseUrl}api/css/reset.css" />
    <link rel="stylesheet" href="${sessionScope.baseUrl}api/css/commen.css" />
    <link rel="stylesheet" href="${sessionScope.baseUrl}api/css/style.css" />
    <title>VIP等级规则</title>
    <script type="text/javascript">
    	document.addEventListener('plusready', function(){
			//console.log("所有plus api都应该在此事件发生后调用，否则会出现plus is undefined。"
			
		});
    </script>
</head>
<body>
<div class="wrap wrap1">
	<article class="mainBox">
		<section class="block">
			<div class="floor">
				<h1 class="main_title">关于虚拟币兑换、VIP成长体系、权限、金票的设定</h1>
				<h3 class="title2">【积分的获取方式】</h3>
				<ul class="way_list">
					<li>1、每充值50雁北堂豆获得2积分</li>
					<li>2、每消耗10雁北堂豆获得1积分</li>
					<li>3、每投1张金票获得1积分</li>
				</ul>
			</div>
		</section>
		<section class="block">
			<div class="floor">
				<h3 class="title1">【会员成长体系】</h3>
				<table class="table_vip">
					<tr><th width="27%" class="tl">VIP等级</th><th  class="br">积分要求</th><th width="23%">VIP等级</th><th width="27%">积分要求</th></tr>
					<tr><td class="tl">VIP1</td><td  class="br">1</td><td>VIP2</td><td>199</td></tr>
					<tr><td class="tl">VIP3</td><td  class="br">499</td><td>VIP4</td><td>999</td></tr>
					<tr><td class="tl">VIP5</td><td  class="br">4999</td><td>VIP6</td><td>9999</td></tr>
					<tr><td class="tl">VIP7</td><td  class="br">29999</td><td>VIP8</td><td>19999</td></tr>
					<tr><td class="tl">VIP9</td><td  class="br">399999</td><td></td><td></td></tr>
				</table>
			</div>
		</section>
		<section class="block">
			<div class="floor">
				<h3 class="title1">【会员等级特权】</h3>
				<table class="table_vip">
					<tr><th width="27%" >VIP等级</th><th width="23%" class="bor_ri">订阅折扣</th><th width="23%">保底金票</th><th width="27%" >神秘特权</th></tr>
					<tr><td>VIP0</td><td>无</td><td>1</td ><td rowspan="10" style="border-bottom:none;">即<br/>将<br />上<br />线</td></tr>
					<tr><td>VIP1</td><td>无</td><td>2</td></tr>
					<tr><td>VIP2</td><td>9折</td><td>2</td></tr>
					<tr><td>VIP3</td><td>8折</td><td>3</td></tr>
					<tr><td>VIP4</td><td>6折</td><td>3</td></tr>
					<tr><td>VIP5</td><td>6折</td><td>3</td></tr>
					<tr><td>VIP6</td><td>5折</td><td>4</td></tr>
					<tr><td>VIP7</td><td>4折</td><td>4</td></tr>
					<tr><td>VIP8</td><td>4折</td><td>4</td></tr>
					<tr><td>VIP9</td><td>4折</td><td>5</td></tr>
				</table>
				<%--<div class="vip_info">--%>
					<%--<p>12个豆的话   8折9个豆  7折8个豆  6折7个豆  5折是6个豆 4折4个豆 。</p>--%>
					<%--<p>原价299，8折239个豆  7折209个豆  6折179个豆 5折是149个豆  4折119个豆</p>--%>
				<%--</div>--%>
			</div>
		</section>
		<section class="block block_last">
			<div class="floor" >
				<div class="qu1">
				<h3 class="title2">【金票是什么?】</h3>
				<p>金票是雁北堂中文网所有注册用户的独享权利，用以支持自己喜爱的作品，给予作者鼓励。</p>
				</div>
				<div class="qu1">
				<h3 class="title2">【金票的用法】</h3>
				<p>金票可对全站S签和A签的作品使用。</p>
				</div>
				<%--<div class="qu1">--%>
				<%--<h3 class="title2">【VIP包月书包特权】</h3>--%>
				<%--<p>VIP3及以上用户可免费观看VIP包月书包内所有图书，VIP0-2的用户可半价观看VIP包月书包内所有图书。</p>--%>
				<%--</div>--%>
			</div>
		</section>
	</article>
</div>
</body>
</html>
