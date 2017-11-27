<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><spring:message code="front.global.title"></spring:message>-用户管理中心-在线充值</title>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/user.css"/>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/statistics_bd.js"></script>
</head>


<body>
<!--header begin-->
<%@ include file="./user_header.jsp"%>
<!--header end-->
<div class="body-bg">
 	<div class="w1000">
    	<img src="${sessionScope.baseUrl}pc/images/user/nav-2.jpg" width="954" height="8" alt="" />
        <div class="over u-ct">
            <div class="u-perrg a-list">
            	<div class="ce1 over">
                	<h2 class="f16 fl col71">充值结果</h2>                    
                </div>
              <!--第二个-->
                <div class="c-ctgl f14 bd-bottom">
                	<ul>
                    	<li><strong>状态：</strong>
                    	<c:choose>
                    		<c:when test="${orderStatus == 1 }">成功</c:when>
                    		<c:otherwise>失败</c:otherwise>
                    	</c:choose>                    	
                    	</li>
                        <li><strong>订单号：</strong>${orderNo}</li>
                        <li><strong>支付宝交易号：</strong>${tradeNo}</li>
                    </ul>
                </div>
                <div class="ce3">
                	<ul>
                        <li>
                        	<label>&nbsp;</label>                        	
                            <input type="button" name="backIndex" class="wd2 f14 strong" value="返回首页" />
                            <input type="button" name="backUserIndex" class="wd2 f14 strong" value="返回个人中心" />
                        </li>
                    </ul>
                </div>                
            </div>
            <!--right end-->
        </div>
    </div>
</div>
<%@ include file="./user_foot.jsp"%>        

<script type="text/javascript">
$(function(){
	$("input[name='backIndex']").bind("click", function(){
		window.location.href="${pageContext.request.contextPath }/index";
	});
	
	$("input[name='backUserIndex']").bind("click", function(){
		if (!isLogin()) {
			return;
		}
		window.location.href="${pageContext.request.contextPath }/user/index";
	});
});

function isLogin() {
	var userId = "${sessionScope.sessionFrontBean.userId}";
	if (userId == null || userId == "") {
		var redirectUrl = "/user/index";
		window.location.href="${pageContext.request.contextPath }/user/login?redirectUrl=" + redirectUrl;	
		return false;
	}
	
	return true;
}
</script>
</body>
</html>