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
		<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/jquery.alert.js"></script>
		<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/jquery.md5.js"></script>
		<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/valid.js"></script>
		<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/statistics_bd.js"></script>
		<script type="text/javascript">
			function submitForm(){
				if(!$('#hasReadNotice').is(':checked')){
					$.MsgBox.Alert("提示", "请先阅读条款！");
					return false;
				}
				
				var loginName = $('#name').val();
				if(!validEmail(loginName,true,100)){
					$.MsgBox.Alert("提示", "账号必须是邮箱！");
					return false;
				}
			
				var password = $('#password').val();
				var passwordConfirm = $('#passwordConfirm').val();
				
				if(getLength(password)<6){
					$.MsgBox.Alert("提示", "用户密码不能小于6位！");
					return false;
				}
				
				if(password!=passwordConfirm){
					$.MsgBox.Alert("提示", "两次输入密码不一致！");
					return false;
				}
				
				if(!validText($("#nick").val(),true,100)){
					$.MsgBox.Alert("提示", "昵称不能为空！");
					return false;
				}
				if(!validText($("#randomCode").val(),true,100)){
					$.MsgBox.Alert("提示", "验证码不能为空！");
					return false;
				}
				
				var reg = /^[a-zA-Z\d`~@#\$%\^&\*\(\)\-_=\+\[\]\{\}\\\|;\:'",<\.>\/\?]{0,16}$/;
        		v=$("#nick").val();
        		var vv = v.replace(/[^\x00-\xff]/g, "aa");
	            if(!(reg.test(vv))){
	            	$.MsgBox.Alert("提示", "昵称可包含中文、英文、数字的组合，长度不超过16个字符!");
					return false;
	            }
				
				if(password != null && password != ''){
					var md5Password = $.md5(password);
					$('#password').val(md5Password);
				}  
				
				if(passwordConfirm != null && passwordConfirm != ''){
					var md5PasswordConfirm = $.md5(passwordConfirm);
					$('#passwordConfirm').val(md5PasswordConfirm);
				}
				
		    	$("#register_form").attr("action","<%=contextPath %>/user/register_submit");
		    	$('#register_form').submit();
		    }
			
			function refresh_randomImg() {
				$("#randomImg").attr("src", "<%=contextPath%>/kaptcha.jpg?" + Math.floor(Math.random()*100));
			}
			
			/* $("#nick").keyup(function(){  
	             var c=$(this);    
	             if(/[a-zA-Z0-9]{0,16}|\u4e00-\u9fa5]{0,8}/.test(c.val())){
		              $("#reminder").show();
	             }    
	        })  */ 
	        
	        $(function() {
	        	$("#nick").bind("change",function(event){
		        	var c=$(this); 
	        		/* var regx1 = /^[\u4E00-\u9FA5]{0,8}$/;
	        		var regx2 = /^[A-Za-z0-9]{0,16}$/;
	        		var regx = /^[a-zA-Z0-9]{0,16}|[\u4e00-\u9fa5]{0,8}$/; */
	        		var reg = /^[a-zA-Z\d`~@#\$%\^&\*\(\)\-_=\+\[\]\{\}\\\|;\:'",<\.>\/\?]{0,16}$/;
	        		v=c.val();
	        		var vv = v.replace(/[^\x00-\xff]/g, "aa");
		            if(!(reg.test(vv))){
			             $("#reminder").show();
		            }else{
		            	$("#reminder").hide();
		            }
		            /* if((!regx1.test(c.val()))|(!regx2.test(c.val()))){
		            	$("#reminder").show();
		            }  */
				});
	        });
	        
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
		    	<div class="u-grl  fl">
		        	<ul>
		            	<li>
		                	<label>账 号</label><input id="name" name="name" type="text" placeholder=" 请使用邮箱注册 " value="${registerForm.name }" class="inputw"/>
		                </li>
		                <li>
		                	<label>密 码</label><input id="password" name="password" type="password" value="" class="inputw"/>
		                </li>
		                <li>
		                	<label>密码确认</label><input id="passwordConfirm" name="passwordConfirm" type="password" value="" class="inputw"/>
		                </li>		                
		                <li>
		                	<label>昵称</label><input id="nick" name="nick" type="text" value="${registerForm.nick }"  class="inputw"/>
		                </li>
		                <li class="last1" style="display: none;" id="reminder">
		                	<p class="fl"><span class="red" id="error" >昵称可包含中文、英文、数字的组合，长度不超过16个字符</span></p>
		                </li>
		                <li>
		                	<label>验证码</label><input id="randomCode" name="randomCode" type="text" value="" class="inputw input2"/>
		                	<span><img src="<%=contextPath%>/kaptcha.jpg" width="63" height="32" alt="" class="mg" id="randomImg"/></span>
		                	<span class="f12">看不清？ <a href="javascript:void();" onclick="refresh_randomImg()" title="" class="red">换一张</a></span>
		                </li>
		                <li class="f12 last">
		                	<label>&nbsp;</label><input id="hasReadNotice" name="hasReadNotice" type="checkbox" value="true" checked="checked"/><span>我已阅读并同意<a href="#" title="" class="red">会员条款</a></span>
		                </li>
		                
		              	<li class="last1">
			              	<c:if test="${resBean != null && resBean.code != 0}">
			              	<p class="fl"><span class="red" id="error" ><spring:message code="${resBean.msgKey }"></spring:message></span></p>
	    					<br/>
	    					</c:if>
			              	<input type="button"  value="完成注册" class="f14 succes1" onclick="submitForm();"/>
		              	</li>
		            </ul>
		        </div>
		        </form>	   	  
		      	<!--left begin-->
		        <!--right begin-->
		        <div class="u-grf fl ac">
		        	<p>已有账号？请直接登录<a href="<%=contextPath%>/user/login" title="" class="login1 white strong">登陆账户</a></p>
		            <p class="strong p1">使用合作网站账号直接登录,快速完成注册！</p>
		            <p><a href="https://api.weibo.com/oauth2/authorize?client_id=${sinaAppId }&redirect_uri=${sinaRedirectUrl}"><img src="${sessionScope.baseUrl}pc/images/pic/z-img1.jpg" width="120" height="24" /></a></p>		            
		            <p><a href="https://graph.qq.com/oauth2.0/authorize?response_type=code&client_id=${qqAppId }&redirect_uri=${qqRedirectUrl}" title=""><img src="${sessionScope.baseUrl}pc/images/pic/z-img3.jpg" width="124" height="24" /></a></p>
		            <p><a href="<%=contextPath%>/user/third/weixin/login"><img src="${sessionScope.baseUrl}pc/images/pic/weixin.png" width="120" height="24" /></a></p>		            
		            <p><a href="<%=contextPath%>/user/third/baidu/login" title=""><img src="${sessionScope.baseUrl}pc/images/pic/baidu.png" width="124" height="24" /></a></p>
		        </div> 
		        <!--right begin-->
		      	<div class="clear"></div>
		    </div>
		</div>
		<%@ include file="./user_foot.jsp"%>
	</body>		
</html>