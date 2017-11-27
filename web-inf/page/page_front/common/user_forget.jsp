<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="找回密码-雁北堂中文网"></meta>
<meta name="description" content="找回密码-雁北堂中文网 -www.ebtang.com"></meta>
<title>找回密码</title>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/user.css"/>
<script type="text/javascript" src="${sessionScope.baseUrl}plugin/jquery-easyui-1.4/jquery.min.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/jquery.alert.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/valid.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/statistics_bd.js"></script>
</head>


<body>
<div class="hade-top pos_r over">
	<a href="${pageContext.request.contextPath }/index" class="logo fl">雁北堂</a>
</div>
<!--header begin-->
<%@ include file="../header.jsp"%>
<!--header end-->
<div class="body-bg">
 	<div class="u-bg w1000 f14 over c00" id="mt20">
      <!--left begin-->
      <form id="forget_form" method="post">
    	<div class="u-grl  fl repass">
        	<ul>
            	<li>
                	<input type="text" placeholder=" 请输入您的邮箱" value="" name="email" id="email"  class="inputw"/></span>
                    <div class="clear"></div>
                </li>
                
                <li>
                	<input type="text" value=""  class="inputw input2" placeholder=" 请输入验证码" name="randomCode" id="randomCode"/>
                	<span><img src="<%=contextPath%>/kaptcha.jpg" width="63" height="32" alt="" class="mg" id="randomImg"/></span>
		            <span class="f12">看不清？ <a href="javascript:void();" onclick="refresh_randomImg()" title="" class="red">换一张</a></span>
                </li>
              <li>
              	<c:if test="${resBean != null && resBean.code != 0}">
             	<p class="fl"><span class="red" id="error" ><spring:message code="${resBean.msgKey }"></spring:message></span></p>
				<br/>
				</c:if>
              <input type="button"  value="提交" class="f14 login1" style="cursor:pointer;" onclick="forgetPwd();"/></li>
            </ul>
        </div>
   	  </form>
      <!--left begin-->
        <!--right begin-->
        <div class="u-grf fl ac">
		        	<p>没有账号？马上注册一个吧<a href="<%=contextPath%>/user/register" title="" class="succes1 white strong">轻松注册</a></p>
		            <p class="strong p1">使用合作网站账号直接登录,快速完成注册！</p>
		            <p><a href="https://api.weibo.com/oauth2/authorize?client_id=${sinaAppId }&redirect_uri=${sinaRedirectUrl}"><img src="${sessionScope.baseUrl}pc/images/pic/z-img1.jpg" width="120" height="24" /></a></p>		            
		            <p><a href="https://graph.qq.com/oauth2.0/authorize?response_type=code&client_id=${qqAppId }&redirect_uri=${qqRedirectUrl}" title=""><img src="${sessionScope.baseUrl}pc/images/pic/z-img3.jpg" width="124" height="24" /></a></p>
		        </div>  
        <!--right begin-->
      <div class="clear"></div>
    </div>
</div>
<%@ include file="../user/user_foot.jsp"%>
<script type="text/javascript">
function forgetPwd(){
	var email = $('#email').val();
	if(!validEmail(email,true,100)){
		$.MsgBox.Alert("提示", "账号必须是邮箱！");
		return false;
	}
	if(getLength($("#randomCode").val())!=4){
		$.MsgBox.Alert("提示", "验证码必须是4位！");
		return false;
	}
   	$("#forget_form").attr("action","<%=contextPath %>/user/forget");
   	$('#forget_form').submit();
   }

function refresh_randomImg() {
	$("#randomImg").attr("src", "<%=contextPath%>/kaptcha.jpg?" + Math.floor(Math.random()*100));
}
</script>
</body>
</html>
