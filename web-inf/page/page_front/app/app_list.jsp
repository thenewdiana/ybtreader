<%--
  Created by IntelliJ IDEA.
  User: hljmszhc-dell
  Date: 2016/11/17
  Time: 23:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>app下载页面_雁北堂_阅读江湖新力量</title>
	<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/common.css"/>
	<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/style.css"/>
	<style>
	</style>
</head>

<body >
<div class="app_load">
	<div  class="load_top">
		<div class="load_wrap">
			<a href="${pageContext.request.contextPath }/" class="curosr: pointer">
			<img src="${sessionScope.baseUrl}pc/images/dongman/logo.jpg" alt="" class="load_logo">
			<span class="load_index">首页</span>
			</a>
		</div>
	</div>
	<div>
		<div class="bg_top">
			<div class="load_wrap"><img src="${sessionScope.baseUrl}pc/images/dongman/icon_tran.png" alt=""></div>
		</div>
		<div class="mainbox clearFix">
			<div class="load_wrap">
				<div class="fl load_pic">
					<img src="${sessionScope.baseUrl}pc/images/dongman/pic_book.png" alt="">
				</div>
				<div class="fl load_info">
					<img src="${sessionScope.baseUrl}pc/images/dongman/app_logo.png" alt="">
					<img src="${sessionScope.baseUrl}pc/images/dongman/text_feel.png" alt="">
					<div class="load_link">
						<div class="fl load_type">
							<a href="${iosUrl}"><img src="${sessionScope.baseUrl}pc/images/dongman/ios_load.png" alt=""></a>
							<a href="${androidUrl}"><img src="${sessionScope.baseUrl}pc/images/dongman/andr_load.png" alt=""></a>
						</div>
						<div class="fr load_ma">
							<img src="${sessionScope.baseUrl}pc/images/dongman/download_app.png" alt="">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="load_footer">
		Copyright 2015 雁北堂中文网 版权所有 京ICP证161342号
	</div>
</div>
</body>
</html>


