<%@ page contentType="text/html; charset=UTF-8" %>
<div class="login_xx">
	<input type="hidden" id="cookieUserId" value="${sessionScope.sessionFrontBean.userId}">
	<c:choose>
		<c:when test="${sessionScope.sessionFrontBean != null}">
			<h2>最近阅读：<span class="login_g"></span><a id="nearReadBookUrl" href="javascript:void(0)"><span id="nearReadBook" class="col991e23" datalength="6">暂无最近阅读</span></a><span class="login_g ml4"></span><!-- <a href="#" >消息</a> --></h2>
			<h3><a title="${sessionScope.sessionFrontBean.userNick}" href="${pageContext.request.contextPath }/m/userCenter/${sessionScope.sessionFrontBean.userId}"><em><c:if test="${sessionScope.sessionFrontBean.sex!=1}"><img src="${sessionScope.sessionFrontBean.userpic}" onerror="this.src='${sessionScope.customUrl}defaultAvatar/man.jpg'" width="24" height="24"/></c:if><c:if test="${sessionScope.sessionFrontBean.sex==1}"><img src="${sessionScope.sessionFrontBean.userpic}" onerror="this.src='${sessionScope.customUrl}defaultAvatar/male.jpg'" width="24" height="24"/></c:if></em><span class="interceptStringno" datalength="4">${sessionScope.sessionFrontBean.userNick}</span></a></h3>
			<h4><a href="${pageContext.request.contextPath }/m/userCenter/shelf/${sessionScope.sessionFrontBean.userId}">藏书<em></em></a></h4>
		</c:when>
		<c:otherwise>
			<div class="login_xx replace">
				<a href="${pageContext.request.contextPath }/m/user/login" title="登录">登陆</a><span class="login_g"></span><a href="${pageContext.request.contextPath }/m/user/register" title="注册">注册</a>
			</div>
		</c:otherwise>
	</c:choose>   	  		
  	
</div>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/jquery.cookie.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/time.js"></script>
<script type="text/javascript">
	$(function(){
		var cookieUserId = $("#cookieUserId").val();
		var cookieBookId = "";
		var cookieBookName = "";
		if(cookieUserId){
			cookieBookId = $.cookie("cookieUserId-"+cookieUserId+"-bookId");  
			cookieBookName = $.cookie("cookieUserId-"+cookieUserId+"-bookName");
		}else{
			cookieBookId = $.cookie("cookieUserId-bookId");  
			cookieBookName = $.cookie("cookieUserId-bookName"); 
		}
		if(typeof cookieBookName == 'string'){
			var length = $("#nearReadBook").attr("datalength");
			if(length<cookieBookName.length){
				var returnString = cookieBookName.substr(0,length);
				$("#nearReadBook").html(returnString+"...");
			}else{
				$("#nearReadBook").html(cookieBookName);
			}
			$("#nearReadBookUrl").attr("href","/m/book/"+cookieBookId);
			$("#nearReadBookUrl").attr("title",cookieBookName);
		}
	});
</script>