<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><spring:message code="front.global.title"></spring:message>-用户管理中心-作品列表</title>
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
        	<div class="u-per fl">            	
                <%@ include file="./user_left_up.jsp"%>                
                <jsp:include page="./user_left_down.jsp">
					 <jsp:param name="menu" value="authorbooklistbytable"/>   
				</jsp:include>
            </div>
             <!--right begin-->
            <div class="u-perrg p-list">
            	<div class="ce1 over">
                	<h2 class="f16 fl col71">作品列表</h2>
                    <a href="${pageContext.request.contextPath }/author/book/addinit" title="" class="fr f14 white red-bg">新建作品</a>
                </div>
              	
                <div class="sub ac">                	
                	<ul class="bgf3 strong over">
                        <li class="wd1">ID</li>
                        <li class="wd2">书名</li>                 
                        <li class="wd3"> 最新章节</li>          
                        <li>收藏数</li>     
                        <li>状态</li>       
                        <li class="wd4">更新时间</li>       
                        <li>操作</li>
                    </ul>                    
                    <c:forEach items="${bookList }" var="item">
                    <ul class="over">
                        <li class="wd1">${item.id }</li>
                        <li class="wd2">${item.name }</li>                 
                        <li class="wd3">${item.lastChapterTitle }</li>          
                        <li>${item.collValue }</li>     
                        <li class="green">${item.statusCN }</li>       
                        <li class="wd4">${item.createMinuteFormat }</li>       
                        <li class="font"><a href="${pageContext.request.contextPath }/author/book/index?bookId=${item.id}&tabNick=bookdetail">编辑</a></li>
                    </ul>
                    </c:forEach>                    
                </div>
            </div>
            <!--right end-->
        </div>
    </div>
</div>

<%@ include file="./user_foot.jsp"%>            
</body>
</html>
