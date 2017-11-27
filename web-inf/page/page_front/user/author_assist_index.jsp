<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><spring:message code="front.global.title"></spring:message>-用户管理中心-作品管理</title>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/user.css"/>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/jquery.alert.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}plugin/My97DatePicker/WdatePicker.js"></script>
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
        	<div class="u-per fl">            	
                <%@ include file="./user_left_up.jsp"%>                
                <jsp:include page="./user_left_down.jsp">
					 <jsp:param name="menu" value="authorbooklistbytable"/>   
				</jsp:include>
            </div>
            <!--right begin-->
            <div class="u-perrg draft">
            	<div class="ce1 over">
                	<h2 class="f16 fl col71">作品管理</h2>
                    <a href="${pageContext.request.contextPath }/author/book/index?bookId=${bookId }&tabNick=bookcomment" title="" class="fr f14 white red-bg">返回书评管理</a>
                </div>
              	
                <!--第二个-->
                <div class="mt20 ac f12 p-list">
                    <ul class="bgf3 strong over ">
                        <li class="wd6">管家</li>
                        <li class="wd3">操作</li>
                    </ul>
                    <c:forEach items="${assistList }" var="item">
                    <ul class="over">
                        <li class="wd6">${item.assistNick }</li>
                        <li class="wd3">
                            <a href="${pageContext.request.contextPath }/author/assist/del?bookId=${bookId }&assistId=${item.assistId}" title=""><img src="${sessionScope.baseUrl}pc/images/user/u-img18.jpg" width="16" height="15" alt="" class="ml5" /></a>
                        </li>
                    </ul>
                    </c:forEach>
                </div>
                <!--  
                <div class="bor-t ar"><a href="#" title="" class="red-bg white">全部清空</a></div>
                -->
                <div class="ce1 f14 pos_r">
                	<form id="search_form" action="${pageContext.request.contextPath }/author/assist/search" method="post">
                	<strong>邀请管家</strong>
                	<input type="hidden" name="bookId" value="${bookId }"/>
                	<input type="text" class="ser" name="searchName" placeholder="按Enter进行搜素"/>
                    <em id="btn_search" onclick="searchAssist();"></em>
                    </form>
                </div>
                
                <div class="f12 p-list ac">
                    <ul class="bgf3 strong over ">
                        <li class="wd2">用户昵称</li>
                        <li class="wd05">操作</li>
                    </ul>
                    <c:forEach items="${userList }" var="item">
                    <ul class="over">
                        <li class="wd2">${item.nick } </li>
                        <li class="wd05 red"><a href="${pageContext.request.contextPath }/author/assist/add?bookId=${bookId }&assistId=${item.id}" title="">邀请</a></li>
                    </ul>
                    </c:forEach>
                </div>
            </div>
            <!--right end-->
        </div>
    </div>
</div>
<%@ include file="./user_foot.jsp"%>
<script type="text/javascript">
	function searchAssist(){
		$("#search_form").submit();
	}
</script>
</body>
</html>
