<%@ page contentType="text/html; charset=UTF-8" %>
<footer class="clearfix">
  <p><a href="${pageContext.request.contextPath }/index">Web 版</a>| <a class="f_up">TOP<em></em></a> | <span class="cole8441b">微信公众号：yanbeitang</span> 
  <c:choose>
		<c:when test="${sessionScope.sessionFrontBean != null}">
			<a href="${pageContext.request.contextPath }/m/user/logout" class="cole8441b ml5">退出</a></p>
		</c:when>
	</c:choose>   	
  
  <p>商务洽淡：01082060189</p>
  <p>版权/投稿咨询：ebtang@ebtang.com</p>
  <p>工作时间：09:00-18:00</p>
  <p>京ICP Copyright 2015 雁北堂中文网 版权所有  京ICP证161342号</p>
  <span class="f_wx"><img src="${sessionScope.baseUrl}mobile/images/bottom_wx.png" width="60" height="60"></span> 
</footer>