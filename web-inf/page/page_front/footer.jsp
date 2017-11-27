<%@ page contentType="text/html; charset=UTF-8" %>
<div class="footer">
	<div class="w1000 over">
     	<div class="w500 fl">
        	<img src="${sessionScope.baseUrl}pc/images/footer-logo.jpg" width="221" height="61" alt="雁北堂中文网" />
            <h2>雁北堂（北京）文化传媒有限公司</h2>
            <P>客服邮箱：ebtang@ebtang.com</P>
            <P>联系电话：01082060189</P>
            <P>地址：北京市西城区德胜门外大街83号1201-04</P>
        </div>
        <div class="w500 fl">
        	<P class="p1">
        	<a href = "http://service.weibo.com/share/share.php?url=http://www.ebtang.com&title=<spring:message code="front.global.title"></spring:message>&language=zh_cn" target="_blank" title="新浪微博分享">
        	<img src="${sessionScope.baseUrl}pc/images/weibo-m.png" alt="分享到微博" width="24" height="24"/>
        	</a>
        	<a href = "http://connect.qq.com/widget/shareqq/index.html?url=http://www.ebtang.com&title=<spring:message code="front.global.title"></spring:message>" target="_blank" title="QQ空间分享">
        	<img src="${sessionScope.baseUrl}pc/images/qq-m.png" alt="分享到QQ空间" width="24" height="24"/>
        	</a>
        	</P>
            <P>
	            <a href="${pageContext.request.contextPath }/about" target="_blank">关于雁北堂</a>   |   
	            <a href="${pageContext.request.contextPath }/fuli" target="_blank">奖励计划</a>   |  
	            <a href="${pageContext.request.contextPath }/law" target="_blank"> 法律声明</a>   |  
	            <a href="${pageContext.request.contextPath }/callcenter" target="_blank"> 技术支持</a>   |  
	            <a href="${pageContext.request.contextPath }/callcenter" target="_blank"> 投诉建议 </a>  |  
	            <a href="${pageContext.request.contextPath }/callcenter" target="_blank"> 联系方式</a>
            </P>
            <P>Copyright 2017 雁北堂中文网 版权所有  京ICP证161342号</P>
        </div>
	</div>
</div>