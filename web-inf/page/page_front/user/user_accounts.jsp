<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户管理中心-我的书架</title>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/user.css"/>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/jquery.alert.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/main.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}plugin/uploadPreview/uploadPreview.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/jquery.md5.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/statistics_bd.js"></script>
<script type="text/javascript">
	window.onload = function () { 
        new uploadPreview({ UpBtn: "myfile", DivShow: "imgdiv", ImgShow: "imgShow" });
    };

	function submitForm(){
		var oldPassword = $('#oldPassword').val();
		if(oldPassword != null && oldPassword != ''){
			var md5Password = $.md5(oldPassword);
			$('#oldPassword').val(md5Password);
		}  
		var newPassword = $('#newPassword').val();
		if(newPassword != null && newPassword != ''){
			var md5PasswordConfirm = $.md5(newPassword);
			$('#newPassword').val(md5PasswordConfirm);
		}
		var newPasswordConfirm = $('#newPasswordConfirm').val();
		if(newPasswordConfirm != null && newPasswordConfirm != ''){
			var md5PasswordConfirm = $.md5(newPasswordConfirm);
			$('#newPasswordConfirm').val(md5PasswordConfirm);
		}
    }
    
    function getPhotoSize(obj){
	    photoExt=obj.value.substr(obj.value.lastIndexOf(".")).toLowerCase();//获得文件后缀名
	    if(photoExt!='.jpg'){
	        $.MsgBox.Alert("提示", "请上传后缀名为jpg的照片!");
	        obj.outerHTML=obj.outerHTML;
	        return false;
	    }
	
	    var fileSize = 0;
	    var isIE = /msie/i.test(navigator.userAgent) && !window.opera;            
	
	    if (isIE && !obj.files) {         
	         var filePath = obj.value;    
	         var fileSystem = new ActiveXObject("Scripting.FileSystemObject");  
	         var file = fileSystem.GetFile (filePath);  
	         fileSize = file.Size;   
	    }else {  
	         fileSize = obj.files[0].size;     
	
	    }
	    fileSize=Math.round(fileSize/1024*100)/100; //单位为KB
	
	    if(fileSize>=1536){
	        $.MsgBox.Alert("提示", "照片最大尺寸为1.5MB，请重新上传!");
	        obj.outerHTML=obj.outerHTML;
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
					 <jsp:param name="menu" value="accounts"/>   
				</jsp:include>
			</div>
        	<!--left end-->
            <!--right begin-->
            <form id="modForm" name="modForm" method="post" onsubmit="return submitForm()"
					action="<%=contextPath%>/user/accounts"  enctype="multipart/form-data">
            <div class="u-perrg">
            	<div class="ce1 over">
                	<h2 class="f16 fl col71">个人资料</h2>
                    <a href="<%=contextPath%>/user/authorApply" title="" class="fr f14 white red-bg">申请作者</a>
                </div>
                <!--第二个-->
                <div class="ce2 over">
                	<div id="imgdiv" class="lf1 ac fl">
                		<input type="hidden" name="userpic" id="userpic" value="${user.userpic}" />
                    	<a><c:if test="${user.sex!=1}"><img id="imgShow" src="${user.userpic}" onerror="this.src='${sessionScope.customUrl}defaultAvatar/man.jpg'" width="80" height="80"/></c:if><c:if test="${user.sex==1}"><img src="${user.userpic}" onerror="this.src='${sessionScope.customUrl}defaultAvatar/male.jpg'" width="80" height="80"/></c:if>
                    	</a>
                        <p>当前头像</p>
                    </div>
                  	<div class="lf2 fl">
                    	<p class="over">
                    		<input id="myfile" class="fl" type="file" name="myfile" onchange="getPhotoSize(this)"/>
                        </p>
                        <p>*图片格式为jpg格式，大小为1.5M以内</p>
                    </div>
                    
                </div>
                <!--第三个-->
                <div class="ce3">
                	<ul>
                    	<li>
                        	<label>昵称</label>
                        	<input type="hidden" name="id" id="id" value="${user.id}" />
                        	<input type="hidden" name="hasModifyNick" id="hasModifyNick" value="${user.hasModifyNick}" />
                            <input type="text" class="wd1" value="${user.nick}" name="nick" id="nick" <c:if test="${null != user.hasModifyNick&&user.hasModifyNick!=0}">readonly</c:if>  />
                            <span class="red">*仅能修改一次！</span>
                        </li>
                        <li class="mgwd">
                        	<label>性别</label>
                            <input name="sex" type="radio" value=0 <c:if test="${user.sex == 0}">checked="checked"</c:if> />
                            <span>男</span>
                            <input name="sex" type="radio" value=1 <c:if test="${user.sex == 1}">checked="checked"</c:if> />
                            <span>女</span>
                            <input name="sex" type="radio" value=9 <c:if test="${user.sex == 9}">checked="checked"</c:if> />
                            <span>保密</span>
                        </li>
                        <li>
                        	<label>QQ或MSN</label>
                            <input type="text" class="wd1" value="${user.qq}" name="qq" id="qq" />
                        </li>
                        <li>
                        	<label>电子邮箱</label>
                            <input type="text" class="wd1" value="${user.email}" name="email" id="email" <c:if test="${null != user.emailLoginName}">readonly</c:if>/>
                            <c:if test="${null != user.emailLoginName}"><span class="red">已经绑定邮箱，不支持修改</span></c:if>
                        </li>
                        <li>
                        	<label>手机号码</label>
                            <input type="text" class="wd1" value="${user.mobile}" name="mobile" id="mobile" <c:if test="${null != user.mobileLoginName}">readonly</c:if> />
                            <c:if test="${null != user.mobileLoginName}"><span class="red">已经绑定手机，不支持修改</span></c:if>
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
                <div class="ce3">
                	<ul>
                    	<li>
                        	<label>原密码</label>
                            <input type="password" class="wd1" name="oldPassword" id="oldPassword" />
                        </li>
                        <li>
                        	<label>新密码</label>
                            <input type="password" class="wd1" name="newPassword" id="newPassword" />
                        </li>
                        <li>
                        	<label>确认新密码</label>
                            <input type="password" class="wd1" name="newPasswordConfirm" id="newPasswordConfirm" />
                        </li>
                        <li>
                        	<label>&nbsp;</label>
                            <input type="submit" class="wd2 f14 strong" value="保存修改" />
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
