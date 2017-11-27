<%@ page contentType="text/html; charset=UTF-8" %>
<div class="top-bg">
	<div class="w1000 overflow">
   		<div class="fl">
   			<c:choose>
   				<c:when test="${sessionScope.sessionFrontBean != null}">
   					欢迎您，<a href="${pageContext.request.contextPath }/user" title="">${sessionScope.sessionFrontBean.userNick}</a>(<a href="${pageContext.request.contextPath }/user/logout">退出</a>)   	
   					<input type="hidden" id="isLogin" value="1"/>	
   				</c:when>
   				<c:otherwise>
   					<a href="${pageContext.request.contextPath }/user/register" title="">注册</a>|<a href="${pageContext.request.contextPath }/user/login" title="">登录</a>	
   				</c:otherwise>
   			</c:choose>   	  		
   	  	</div>
   	  	<c:if test="${sessionScope.sessionFrontBean != null}"><div class="fl ml10 xinx"><a href="${pageContext.request.contextPath }/user/notice/list?tabNick=messageList" title="">消息(<span id="message" class="red">${sessionScope.sessionFrontBean.messageNum}</span>)</a><a href="${pageContext.request.contextPath }/user/notice/list?tabNick=letterList" title="">站短(<span id="letter" class="red">${sessionScope.sessionFrontBean.letterNum}</span>)</a></div></c:if>
   	  	
   	  	
        <div class="w500 fr ar">
        	<a href="javascript:AddFavorite('雁北堂文学网',location.href)" title="">收藏本站</a>
        </div>
    </div>
</div>
<script type="text/javascript">
$(function(){
	if($("#isLogin").val()){
		$.ajax({
			type: "POST",
			url:"${pageContext.request.contextPath }/user/notify/number",
			dataType: "json",
			success:function(data){
				if(data){
					$("#message").html(data.messageNum);
					$("#letter").html(data.letterNum);
				}
			}
		});
	}
	 
});


function AddFavorite(title, url){
	try{
		window.external.AddFavorite(url, title);
	}catch(e){
		try{
			window.sidebar.addPanel(title, url, "");
		}catch(e){
			alert("抱歉，您所使用的浏览器无法完成此操作。\n\n加入收藏失败，请使用Ctrl+D进行添加");
		}
	}
}
</script>