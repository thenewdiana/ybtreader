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
    <title>关于雁北堂</title>
    <script type="text/javascript">
   		document.addEventListener('plusready', function(){
   			//console.log("所有plus api都应该在此事件发生后调用，否则会出现plus is undefined。"
   			
   		});
    </script>
</head>
<body>
<div class="wrap">
	<article class="mainBox">
		<section class="block_main">
			<div class="floor">
			    <div class="logo">
			    	<img src="${sessionScope.baseUrl}api/images/logo_ybt.png" />
			    	<span>雁北堂中文网</span>
			    </div>
			    <p class="about_text">雁北堂中文网是雁北堂（北京）文化传媒有限公司旗下的原创文学网站旨在为所有喜爱文学的人提供最新锐最便捷的网络阅读和写作平台。</p>
			</div>		
		</section>
	</article>
</div>
	<script type="text/javascript" src="js/zepto.min.js"></script>
	<script>
       document.write('<script src=' +
		('__proto__' in {} ? 'zepto.min' : 'jquery') +
		'.js><\/script>')
	</script>
	<script type="text/javascript">
			;(function($){	
			/*删除*/
			  $('.btn_close').bind('click',function(){
			  	$(this).parents('div.news_block').remove();
			  })
              
			})(Zepto); 
	</script>
</body>
</html>
