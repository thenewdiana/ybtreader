<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户管理中心-作者申请</title>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/user.css"/>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/jquery.alert.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/main.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/statistics_bd.js"></script>
<script type="text/javascript">
	function submitForm(){
		if(!$("input[type='checkbox']").is(':checked')){
			$.MsgBox.Alert("提示", "请阅读并同意《雁北堂中文网注册投稿协议》！");
			return false;
		}
    }
</script>
</head>


<body>
<!--header begin-->
<%@ include file="./user_header.jsp"%>
<!--header end-->
<div class="body-bg">
 	<div class="w1000">
    	<img src="${sessionScope.baseUrl}pc/images/user/nav-2.jpg" width="954" height="8" alt="" />
        <div class="over u-ct">
        	<!--left begin-->
        	<div class="u-per fl">
        		<%@ include file="./user_left_up.jsp"%>
	        	<jsp:include page="./user_left_down.jsp">
					 <jsp:param name="menu" value="author"/>   
				</jsp:include>
			</div>
        	<!--left end-->
            <!--right begin-->
            <form id="modForm" name="modForm" method="post" onsubmit="return submitForm()"
					action="<%=contextPath%>/user/authorApply">
            <div class="u-perrg">
            	<div class="ce1 over ce9">
                	<h2 class="f16 fl col71">申请作者</h2>
                    <p class="fl">请认真填写以下信息，下述所有项均为必填项。</p>
                    <a href="<%=contextPath%>/user/index" title="" class="fr f14 white red-bg qu-se">取消申请</a>
                </div>
                <!--第二个-->
                
                <!--第三个-->
                <div class="ce3 ce10">
                	<ul>
                    	<li>
                        	<label>昵称</label>
                        	<input type="hidden" name="id" id="id" value="${user.id}" />
                        	<input type="hidden" name="hasModifyNick" id="hasModifyNick" value="${user.hasModifyNick}" />
                        	<input type="text" class="wd1" value="${user.nick}" name="nick" id="nick" <c:if test="${null != user.hasModifyNick&&user.hasModifyNick!=0}">readonly</c:if>  />
                            <span class="red">*仅能修改一次！</span>
                            <span class="ml5">由中、英文或数字组成，禁止特殊符号！</span>
                        </li>
                        <li>
                        	<label>QQ或MSN</label>
                            <input type="text" class="wd1" value="${user.qq}" name="qq" id="qq" /><span class="red">*</span>
                        </li>
                        <li>
                        	<label>电子邮箱</label>
                            <input type="text" class="wd1" value="${user.email}" name="email" id="email" /><span class="red">*</span>
                        </li>
                        <li class="wd5">
                        	<label>个人简介</label>
                            <div class="fl">
                            	<textarea class="wd4" name="intro">${user.intro}</textarea>
                                <div class="over wd6">
                                	<p class="fl"><i class="red">*</i> 请不要超过<i class="red">200</i>字</p> 
                                </div>
                            </div>
                        </li>
                        <c:if test="${resBean != null && resBean.code != 0}">
		                	<li class="ac white" id="u-error"><spring:message code="${resBean.msgKey }"></spring:message></li>
		                </c:if>
		                <c:if test="${resBean != null && resBean.code == 0}">
		                	<li class="ac white" id="u-resuu"><spring:message code="${resBean.msgKey }"></spring:message></li>
		                </c:if>
                    </ul>
                </div>
                
                <!--第四个-->
                <div class="wd11 over">
                	<h2 class="f16 fl">实名认证</h2>
                    <p class="fr red">请务必正确填写个人信息，以免影响及时签约或稿酬获得！</p>
                </div>
                <div class="ce3 ce10">
                	<ul>
                    	<li>
                        	<label>真实姓名</label>
                            <input type="text" class="wd1" value="${user.realName}" name="realName" id="realName" /><span class="red">*</span>
                        </li>
                        <li class="mgwd">
                        	<label>性别</label>
                            <input name="sex" type="radio" value=0 <c:if test="${user.sex == 0}">checked="checked"</c:if> />
                            <span>男</span>
                            <input name="sex" type="radio" value=1 <c:if test="${user.sex == 1}">checked="checked"</c:if> />
                            <span>女</span>
                            <input name="sex" type="radio" value=9 <c:if test="${user.sex == 9}">checked="checked"</c:if> />
                            <span>保密</span><span class="red">*</span>
                        </li>
                        <li class="h2l">
                        	<label>证件号码</label>
                            <div class="wd9 fl">
                            	<div class="se_sea01 ac">
                                	<em class="menubarnew">身份证</em>
                                    <div class="table_dis" style="width:93px;">
                                        <dl>
                                            <dd>身份证</dd>
                                        </dl>
                                   </div>
                            	</div>
                                <input type="text" class="wd1 wd9" value="${user.idcard}" name="idcard" id="idcard" /><span class="red">*</span>
                            </div>
                            <div class="clear"></div>
                        </li>
                        <li>
                        	<label>手机号码</label>
                            <input type="text" class="wd1" value="${user.mobile}" name="mobile" id="mobile" /><span class="red">*</span>
                        </li>
                        <li>
                        	<label>联系地址</label>
                            <input type="text" class="wd1 wd7" value="${user.address}" name="address" id="address" /><span class="red">*</span>
                        </li>
                        <li class="wd8">
                        	<label>&nbsp;</label>
                            <input id="isAgree" name="isAgree" type="checkbox" class="fl"/>
                            <p class="fl">我已阅读并同意<a class="red" href="<%=contextPath%>/user/authorZcxy" target="_blank">《雁北堂中文网注册投稿协议》</a></p>
                        </li>
                        <li>
                        	<label>&nbsp;</label>
                            <input type="submit" class="wd2 f14 strong" value="提交申请" />
                        </li>
                    </ul>
                </div>
            </div>
            </form>
            <!--right end-->
        </div>
    </div>
</div>

<!--foot begin-->
<%@ include file="./user_foot.jsp"%>
<!--foot end-->

    
    
    
</body>
</html>
