<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户管理中心-作者信息</title>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/user.css"/>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/jquery.alert.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/main.js"></script>
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
                	<h2 class="f16 fl col71">作者信息</h2>
                </div>
                <!--第二个-->
                
                <!--第三个-->
                <div class="ce3 ce10">
                	<ul>
                    	<li>
                        	<label>昵称: </label>
                        	<input type="hidden" name="id" id="id" value="${user.id}" />
                        	<input type="hidden" name="hasModifyNick" id="hasModifyNick" value="${user.hasModifyNick}" />
                        	<c:out value="${user.nick}" escapeXml="false"></c:out>
                        </li>
                        <li>
                        	<label>QQ或MSN: </label>
                        	<c:out value="${user.qq}" escapeXml="false"></c:out>
                        </li>
                        <li>
                        	<label>电子邮箱: </label>
                        	<c:out value="${user.email}" escapeXml="false"></c:out>
                        </li>
                        <li class="wd5">
                        	<label>个人简介: </label>
                            <c:out value="${user.intro}" escapeXml="false"></c:out>
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
                </div>
                <div class="ce3 ce10">
                	<ul>
                    	<li>
                        	<label>真实姓名: </label>
                        	<c:out value="${user.realName}" escapeXml="false"></c:out>
                        </li>
                        <li class="mgwd">
                        	<label>性别: </label>
                        	<c:if test="${user.sex == 0}"><span>男</span></c:if>
                        	<c:if test="${user.sex == 1}"><span>女</span></c:if>
                        	<c:if test="${user.sex == 9}"><span>保密</span></c:if>
                        </li>
                        <li>
                        	<label>证件号码: </label>
                        	<c:out value="${user.idcard}" escapeXml="false"></c:out>
                        </li>
                        <li>
                        	<label>手机号码: </label>
                        	<c:out value="${user.mobile}" escapeXml="false"></c:out>
                        </li>
                        <li>
                        	<label>联系地址: </label>
                        	<c:out value="${user.address}" escapeXml="false"></c:out>
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
