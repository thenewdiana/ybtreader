<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="com.ebtang.common.bean.FansValues"%>
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
    <title>详细粉丝值</title>
    <script type="text/javascript">
   		document.addEventListener('plusready', function(){
   			//console.log("所有plus api都应该在此事件发生后调用，否则会出现plus is undefined。"
   			
   		});
    </script>
</head>
<body>
<div class="wrap">
	<article class="mainBox">
		<section class="block block_last">
			<div class="floor">
				<div class="fans_text">
					<h1 class="fans_title">粉丝成长值的定义：</h1>
					<p class="fans_info">当用户对小说A产生消费或投金票时，便能获得对应于A小说的粉丝值。</p>
					<ul class="way_list fans_list">
						<li>1/阅VIP小说章节，每消费1书币获得1粉丝值。</li>
						<li>2/金票，每票获得100粉丝值</li>
						<li>3/打赏作者，每消费1个书币获得1粉丝成长值。</li>
						<li>4/成长等级说明</li>
					</ul>
				</div>
				<table class="table_vip">
					<tr><th width="10%" class="tl">等级</th><th width="70%">粉丝成长值</th><th width="20%">称号</th></tr>
					<%
						for (FansValues fans : FansValues.values()) {
					%>
						<tr><td><%=fans.getId() %></td><td><%=fans.getMinFans() %></td><td><%=fans.getName() %></td></tr>
					<%
						}
					%>
					
					<!-- 另外两种方式 -->
					<%-- <tr><td><%=FansValues.FANS0.getId() %></td><td><%=FansValues.FANS0.getMaxFans() %></td><td><%=FansValues.FANS0.getName() %></td></tr>
					<tr><td><%=FansValues.FANS1.getId() %></td><td><%=FansValues.FANS1.getMaxFans() %></td><td><%=FansValues.FANS1.getName() %></td></tr>
					<tr><td><%=FansValues.FANS2.getId() %></td><td><%=FansValues.FANS2.getMaxFans() %></td><td><%=FansValues.FANS2.getName() %></td></tr>
					<tr><td><%=FansValues.FANS3.getId() %></td><td><%=FansValues.FANS3.getMaxFans() %></td><td><%=FansValues.FANS3.getName() %></td></tr>
					<tr><td><%=FansValues.FANS4.getId() %></td><td><%=FansValues.FANS4.getMaxFans() %></td><td><%=FansValues.FANS4.getName() %></td></tr>
					<tr><td><%=FansValues.FANS5.getId() %></td><td><%=FansValues.FANS5.getMaxFans() %></td><td><%=FansValues.FANS5.getName() %></td></tr>
					<tr><td><%=FansValues.FANS6.getId() %></td><td><%=FansValues.FANS6.getMaxFans() %></td><td><%=FansValues.FANS6.getName() %></td></tr>
					
					<tr><td>1</td><td>1</td><td>书生</td></tr>
					<tr><td>2</td><td>2000</td><td>小侠</td></tr>
					<tr><td>3</td><td>20000</td><td>侠客</td></tr>
					<tr><td>4</td><td>50000</td><td>财主</td></tr>
					<tr><td>5</td><td>100000</td><td>金主</td></tr>
					<tr><td>6</td><td>500000</td><td>真豪</td></tr> --%>
				</table>
			</div>
		</section>
	</article>
</div>
</body>
</html>
