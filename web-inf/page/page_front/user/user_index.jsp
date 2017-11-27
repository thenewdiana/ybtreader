<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户管理中心-我的书架</title>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/user.css"/>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/jquery-1.9.1.min.js"></script>
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
					 <jsp:param name="menu" value="index"/>   
				</jsp:include>
			</div>
        	<!--left end-->
            <!--right begin-->
            <div class="u-perrg a-list">
            	<div class="ce1 over">
                	<h2 class="f16 fl col71">用户基本信息</h2>
                	<a href="${pageContext.request.contextPath }/author/book/addinit" title="" class="fr f14 white red-bg">我要写书</a>
                    <a href="${pageContext.request.contextPath }/recharge/index" title="" class="fr f14 white red-bg">我要充值</a>
                    <span class="fr mr10">剩余糖豆：<strong class="red">${resBean.balanceValue}</strong></span>
                </div>
              <!--第二个-->
                <div class="c-ctgl f14 bd-bottom">
                	<ul>
                    	<li><strong>昵称：</strong>${sessionBean.userNick}</li>
                        <li class="bg1"><strong>QQ号码：</strong>${sessionBean.qq}</li>
                        <li><strong>当前积分：</strong>${resBean.pointValue}</li>
                        <li class="bg1"><strong>我的优惠：</strong>${resBean.vipValues.discount}</li>
                        <li><strong>所持金票：</strong>${resBean.goldenValue}</li>
                    </ul>
                </div>
                <!--我的书架-->
                <div class="ce1 over mt25">
                	<h2 class="f16 fl col71 icp">我的书架</h2>
                    <span class="fr"><a href="${contextPath }/user/shelf">查看所有（<strong class="red" />${fn:length(userBookList)}</strong>）</a></span>
                </div>
                <c:if test="${fn:length(userBookList)>0}">
                <div class="visit ac  visits f14">
                	<div class="house" id="userCollection">
                	<div class="ce-t1 strong bg1">
						<ul class="over f14">
							<li class="wd8">书名</li>
							<li class="wd8">最新章节</li>
							<li class="wd8">最近更新时间</li>
							<li class="wd2">作者</li>
						</ul>
					</div>
					<div class="ce-t1 ce-t2">
						<c:forEach items="${userBookList}" var="item" varStatus="status">
							<ul>
								<li class="wd8 red"><a href="${contextPath }/book/${item.bookId}" target="_blank" >${item.bookName}&nbsp;</a></li>
								<li class="wd8"><a href="#" title="">${item.lastChapterTitle}&nbsp;</a></li>
								<li class="wd8 examTime">${item.lastModifyTime}&nbsp;</li>
								<li class="wd2">${item.authorNick}&nbsp;</li>
							</ul>
						</c:forEach>
					</div>
					</div>
					</div>
                </c:if>
                <c:if test="${fn:length(userBookList)<=0}">
                <div class="r-book f14 ac">您还没有收藏过一本书，快去<a href="${contextPath }/index" class="red strong">首页</a>看看吧！</div>
                </c:if>
            </div>
            <!--right end-->
        </div>
    </div>
</div>

<!--foot begin-->
<%@ include file="./user_foot.jsp"%>
<!--foot end-->
<script type="text/javascript">
$(function () {
	if($(".examTime").get(0)){
	    $(".examTime").each(function(i,e){
	        var t = new Date(parseInt($(e).text()));
	        var hh = t.getHours();
	        var mm = t.getMinutes();
	        var ss = t.getSeconds();
	        if(hh<10){ hh = '0'+hh;}
	        if(mm<10){ mm = '0'+mm;}
	        if(ss<10){ ss = '0'+ss;}
	        $(e).text(t.getFullYear()+"年"+(t.getMonth()+1)+"月"+t.getDate()+"日 "+hh+":"+mm+":"+ss);
	    });
	}
});
</script>
    
    
    
</body>
</html>
