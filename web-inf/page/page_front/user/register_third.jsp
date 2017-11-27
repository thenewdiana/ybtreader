<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title><spring:message code="front.global.title"></spring:message>-注册</title>
		<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/common.css"/>
		<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/user.css"/>
		<script type="text/javascript" src="${sessionScope.baseUrl}plugin/jquery-easyui-1.4/jquery.min.js"></script>
		<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/jquery.md5.js"></script>
		<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/statistics_bd.js"></script>
		<script type="text/javascript">
			function submitForm(){
		    	$("#register_form").attr("action","<%=contextPath %>/user/third/register_submit");
		    	$('#register_form').submit();
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
		      	<form id="register_form" method="post">
		      	<input type="hidden" name="name" value="${registerForm.name }"/>
		      	<input type="hidden" name="thirdNick" value="${registerForm.thirdNick }"/>
		      	<input type="hidden" name="userSource" value="${registerForm.userSource }"/>
		      	<input type="hidden" name="headImage" value="${registerForm.headImage }"/>
		    	<div class="u-grl  fl">
		        	<ul>		            	
		                <li>
		                	<label>昵称</label><input id="nick" name="nick" type="text" value="${registerForm.nick }"  class="inputw"/>
		                </li>		                
		              	<li class="last1">
			              	<c:if test="${resBean != null && resBean.code != 0}">
			              	<p class="fl"><span class="red" id="error" ><spring:message code="${resBean.msgKey }"></spring:message></span></p>
	    					<br/>
	    					</c:if>
			              	<input type="button" value="完成登陆" class="f14 succes1" onclick="submitForm();"/>
		              	</li>
		            </ul>
		        </div>
		        </form>	   	  
		      	<!--left begin-->
		      	<div class="clear"></div>
		    </div>
		</div>
		<%@ include file="./user_foot.jsp"%>
	</body>		
</html>