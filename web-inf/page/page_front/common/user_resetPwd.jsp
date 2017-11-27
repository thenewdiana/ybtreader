<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="keywords" content="重置密码-雁北堂中文网"></meta>
<meta name="description" content="重置密码-雁北堂中文网 -www.ebtang.com"></meta>
<title>重置密码-雁北堂中文网</title>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/user.css"/>
<script type="text/javascript" src="${sessionScope.baseUrl}plugin/jquery-easyui-1.4/jquery.min.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/jquery.alert.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/jquery.md5.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/valid.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/statistics_bd.js"></script>
<script type="text/javascript">
	function modPwd(){
		var password = $('#password').val();
		var passwordConfirm = $('#passwordConfirm').val();
		
		if(getLength(password)<6||getLength(password)>16){
			$.MsgBox.Alert("提示", "用户密码应该在6-16位！");
			return false;
		}
		if(password!=passwordConfirm){
			$.MsgBox.Alert("提示", "两次输入密码不一致！");
			return false;
		}
		if(password != null && password != ''){
			var md5Password = $.md5(password);
			$('#password').val(md5Password);
		}  
    	$("#modForm").attr("action","<%=contextPath %>/user/updatePassword");
    	$('#modForm').submit();
    }
</script>
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
      <form id="modForm" method="post" >
    	<div class="u-grl repas1">
        	<ul>
            	<li>
                	<label>新密码</label>
                	<input id="password" name="password" type="password" value="" class="inputw"/>
                </li>
                <li>
                	<label>再次输入</label>
                	<input id="passwordConfirm" name="passwordConfirm" type="password" value="" class="inputw"/>
                </li>
              <li class="last1">
              <c:if test="${resBean != null && resBean.code != 0}">
             	<p class="fl"><span class="red" id="error" ><spring:message code="${resBean.msgKey }"></spring:message></span></p>
				<br/>
				</c:if>
              <input type="button"  value="提交" class="f14 login1" onclick="modPwd()"/></li>
            </ul>
            <p class="erroa">1.为保证您的安全，新密码必须与旧密码不同。<br />
2.密码由6-16位字符（字母、数字、符号）组合而成。</p>
        </div>
   	  </form>
      <!--left begin-->
        <!--right begin--><!--right begin-->
      <div class="clear"></div>
    </div>
</div>
<%@ include file="../user/user_foot.jsp"%>

    
    
    
</body>
</html>
