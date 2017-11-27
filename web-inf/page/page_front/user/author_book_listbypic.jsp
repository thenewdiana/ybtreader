<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><spring:message code="front.global.title"></spring:message>-用户管理中心-作者专区</title>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/user.css"/>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/jquery.alert.js"></script>
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
					 <jsp:param name="menu" value="authorbooklistbypic"/>   
				</jsp:include>
            </div>
            <!--right begin-->
            <div class="u-perrg a-list">
            	<div class="ce1 over">
                	<h2 class="f16 fl col71">作品列表</h2>
                    <a href="${pageContext.request.contextPath }/author/book/addinit" title="" class="fr f14 white red-bg">新建作品</a>
                    <a href="${pageContext.request.contextPath }/user/authorInfo" title="" class="fr f14 white red-bg">作者信息</a>
                </div>
              <!--第二个-->
                <div class="sub2 col71">
                	<c:forEach items="${bookList }" var="item">
                	<dl>
                    	<dt class="ac bords">
                        	<img src="${item.midCoverImage }" width="88" height="126" />
                            <a href="${pageContext.request.contextPath }/author/book/modinit?bookId=${item.id}">修改作品信息</a>
                        </dt>
                        <dd class="f14">
                       		<p>作品名称：<strong><a href="#" title="">${item.name }</a></strong></p>
                            <p>审核状态：<span class="green">${item.statusCN }</span></p>
                            <p class="over chapter">
                            	<a href="${pageContext.request.contextPath }/author/book/index?bookId=${item.id}&tabNick=booksection">分卷管理</a>
                                <a href="${pageContext.request.contextPath }/author/book/index?bookId=${item.id}&tabNick=bookchapteradd">章节管理</a>
                                <c:if test="${item.isZhuJian == 0}"><a class="hdzj${item.id }" href="javascript:zj_apply(${item.id })">参加铸剑计划</a></c:if>
                                <c:if test="${item.isZhuJian == 1}"><a class="hdzj${item.id }" >已申请铸剑计划</a></c:if>
                                <c:if test="${item.isZhuJian == 2}"><a class="hdzj${item.id }" >参赛作品</a></c:if>
                                <c:if test="${item.isZhuJian == 3}"><a class="hdzj${item.id }" >审核失败</a></c:if>
                            </p>
                        </dd>
                    </dl>
                    </c:forEach>                    
                </div>
            </div>
            <!--right end-->
        </div>
    </div>
</div>
<script type="application/javascript">
    function zj_apply(bookId) {
        $.ajax({
            type : "POST",
            dataType : "json",
            data : "bookId="+bookId,
            async:true,
            url : "${pageContext.request.contextPath }/activity/zj/apply",
            success : function(resBean) {
                if (resBean.code != 0) {
                    $.MsgBox.Alert("提示", resBean.msg);
                } else {
                    $(".hdzj"+bookId).html("已申请铸剑计划");
                    $(".hdzj"+bookId).removeAttr("href");
                    $.MsgBox.Alert("提示", resBean.msg);
                }
            }
        });
    }
</script>

<%@ include file="./user_foot.jsp"%>            
</body>
</html>
