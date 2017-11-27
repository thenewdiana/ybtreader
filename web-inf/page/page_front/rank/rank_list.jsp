<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>小说排行榜_悬疑小说排行榜_原创小说排行榜-网络小说排行榜-雁北堂中文网</title>
<meta name="keywords" content="小说排行榜,悬疑小说排行榜,原创小说排行榜,网络小说排行榜"></meta>
<meta name="description" content="雁北堂中文网小说排行版提供站内悬疑小说排行榜、原创小说排行榜、网络小说排行榜等小说排行榜。"></meta>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/js/slideBox.css"/>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/style.css"/>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/time.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/main.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/statistics_bd.js"></script>
</head>


<body>
<!--header begin-->
<%@ include file="../header.jsp"%>
<!--header end-->
<%@ include file="../header_recomm.jsp"%>
<!--导航-->
<jsp:include page="../banner.jsp">
	 <jsp:param name="menu" value="rank"/>   
</jsp:include>
<!--中间-->
<div class="body-bg">
    <!--模块二-->
    <div class="w1000 p-sec bords" id="mt20">
    	<!--left begin-->
        <div class="phb">
        	<div class="ce-t">
            	<h2 class="red fl">${name}</h2>
            	<c:if test="${action != 'newUser' and action !='fans' }">
            		<ul>
	                	<li class="on">总</li>
	                    <li>月</li>
	                    <li>周</li>
	                </ul>
            	</c:if>
            </div>
            <c:if test="${action != 'newUser' and action !='fans' }">
           		<!--总-->
	            <div class="ce-c ac">
	            	<ul class="mt20">
	                	<li class="ce bgcol">
	                    	<div class="wd1">序号</div>
	                        <div class="wd2">书名/最新章节</div>
	                        <div class="wd3">作者</div>
	                        <div class="wd4">字数</div>
	                        <div class="wd4">点击</div>
	                        <div class="wd4">收藏</div>
	                        <div class="wd5">更新时间</div>
	                    </li>
	                    <c:forEach items="${rankByAllList }" var="item" varStatus="status">
	                    	<li <c:if test="${status.index%2==1 }">class="bgcol"</c:if> >
		                    	<div class="wd1">${status.count }</div><!-- ${item.lastChapterId} -->
		                        <div class="wd2"><a href="${pageContext.request.contextPath }/book/${item.id}" title="" class="mja">${item.name } ${item.lastChapterTitle }</a></div>
		                        <div class="wd3"><a href="${contextPath }/book/listbyauthor/${item.authorId}">${item.authorNick}</a></div>
		                        <div class="wd4">${item.words}</div>
		                        <div class="wd4">${item.clickValue}</div>
		                        <div class="wd4">${item.collValue}</div>
		                        <div class="wd5 mdhm">${item.lastModifyTime}</div>
		                    </li>
	                    </c:forEach>
	                </ul>
	            </div>
	            <!--总-->
	            <!--月-->
	             <div class="ce-c ac hide">
	            	<ul class="mt20">
	                	<li class="ce bgcol">
	                    	<div class="wd1">序号</div>
	                        <div class="wd2">书名/最新章节</div>
	                        <div class="wd3">作者</div>
	                        <div class="wd4">字数</div>
	                        <div class="wd4">点击</div>
	                        <div class="wd4">收藏</div>
	                        <div class="wd5">更新时间</div>
	                    </li>
	                    <c:forEach items="${rankByMonthList }" var="item" varStatus="status">
	                    	<li <c:if test="${status.index%2==1 }">class="bgcol"</c:if> >
		                    	<div class="wd1">${status.count }</div><!-- ${item.lastChapterId} -->
		                        <div class="wd2"><a href="${pageContext.request.contextPath }/book/${item.id}" title="" class="mja">${item.name } ${item.lastChapterTitle }</a></div>
		                        <div class="wd3"><a href="${contextPath }/book/listbyauthor/${item.authorId}">${item.authorNick}</a></div>
		                        <div class="wd4">${item.words}</div>
		                        <div class="wd4">${item.clickValue}</div>
		                        <div class="wd4">${item.collValue}</div>
		                        <div class="wd5 mdhm">${item.lastModifyTime}</div>
		                    </li>
	                    </c:forEach>
	                </ul>
	            </div>
	            <!--月-->
	            <!--周-->
	            <div class="ce-c ac hide">
	            	<ul class="mt20">
	                	<li class="ce bgcol">
	                    	<div class="wd1">序号</div>
	                        <div class="wd2">书名/最新章节</div>
	                        <div class="wd3">作者</div>
	                        <div class="wd4">字数</div>
	                        <div class="wd4">点击</div>
	                        <div class="wd4">收藏</div>
	                        <div class="wd5">更新时间</div>
	                    </li>
	                    <c:forEach items="${rankByWeekList }" var="item" varStatus="status">
	                    	<li <c:if test="${status.index%2==1 }">class="bgcol"</c:if> >
		                    	<div class="wd1">${status.count }</div><!-- ${item.lastChapterId} -->
		                        <div class="wd2"><a href="${pageContext.request.contextPath }/book/${item.id}" title="" class="mja">${item.name } ${item.lastChapterTitle }</a></div>
		                        <div class="wd3"><a href="${contextPath }/book/listbyauthor/${item.authorId}">${item.authorNick}</a></div>
		                        <div class="wd4">${item.words}</div>
		                        <div class="wd4">${item.clickValue}</div>
		                        <div class="wd4">${item.collValue}</div>
		                        <div class="wd5 mdhm">${item.lastModifyTime}</div>
		                    </li>
	                    </c:forEach>
	                </ul>
	            </div>
	            <!--周-->
           	</c:if>
            <c:if test="${action =='fans' }">
            	<div class="ce-c ac">
	            	<ul class="mt20">
	                	<li class="ce bgcol">
	                    	<div class="wd1">序号</div>
	                        <div class="wd2">昵称</div>
	                    </li>
	                    <c:forEach items="${rankByAllList }" var="item" varStatus="status">
	                    	<li <c:if test="${status.index%2==1 }">class="bgcol"</c:if> >
		                    	<div class="wd1">${status.count }</div>
		                        <div class="wd2"><a href="${pageContext.request.contextPath }/book/listbyauthor/<c:if test="${action == 'newUser'}">${item.id}</c:if><c:if test="${action =='fans' }">${item.userId}</c:if>" title="" class="mja">${item.nick }</a></div>
		                    </li>
	                    </c:forEach>
	                </ul>
	            </div>
            </c:if>
			<c:if test="${action == 'newUser'}">
				<div class="ce-c ac">
					<ul class="mt20">
						<li class="ce bgcol">
							<div class="wd1">序号</div>
							<div class="wd2">昵称</div>
						</li>
						<c:forEach items="${newUserRankList }" var="item" varStatus="status">
							<li <c:if test="${status.index%2==1 }">class="bgcol"</c:if> >
								<div class="wd1">${status.count }</div>
								<div class="wd2"><a href="${pageContext.request.contextPath }/book/listbyauthor/<c:if test="${action == 'newUser'}">${item.id}</c:if><c:if test="${action =='fans' }">${item.userId}</c:if>" title="" class="mja">${item.nick }</a></div>
							</li>
						</c:forEach>
					</ul>
				</div>
			</c:if>
        </div>
        <!--left begin-->
         <!--right begin-->
            <div class="p-secrg fr p-secrg1">
            	<dt><img src="${sessionScope.baseUrl}pc/images/gongg-9.jpg" width="246" height="67" alt="" /></dt>
                <dl>
                    <dd <c:if test="${action == 'click' }">class="on"</c:if>><a href="${pageContext.request.contextPath }/rank/click" title="点击榜">点击榜</a></dd>
                    <dd <c:if test="${action == 'reward' }">class="on"</c:if>><a href="${pageContext.request.contextPath }/rank/reward" title="打赏榜">打赏榜</a></dd>
                    <dd <c:if test="${action == 'golden' }">class="on"</c:if>><a href="${pageContext.request.contextPath }/rank/golden" title="金票榜">金票榜</a></dd>
                    <dd <c:if test="${action == 'rss' }">class="on"</c:if>><a href="${pageContext.request.contextPath }/rank/rss" title="订阅榜">订阅榜</a></dd>
                    <dd <c:if test="${action == 'newBook' }">class="on"</c:if>><a href="${pageContext.request.contextPath }/rank/newBook" title="新书榜">新书榜</a></dd>
                    <dd <c:if test="${action == 'female' }">class="on"</c:if>><a href="${pageContext.request.contextPath }/rank/female" title="女频榜">女频榜</a></dd>
                    <dd <c:if test="${action == 'fans' }">class="on"</c:if>><a href="${pageContext.request.contextPath }/rank/fans" title="土豪粉丝榜">土豪粉丝榜</a></dd>
                    <dd <c:if test="${action == 'newUser' }">class="on"</c:if>><a href="${pageContext.request.contextPath }/rank/newUser" title="新人榜">新人榜</a></dd>
                    <dd <c:if test="${action == 'freeBook' }">class="on"</c:if>><a href="${pageContext.request.contextPath }/rank/freeBook" title="免费榜">免费榜</a></dd>
                </dl>
            </div>
            <!--right begin-->
            
        
    </div>
    <!--模块二-->
    
</div>


<!--footer-->
<%@ include file="../footer.jsp"%>
<!--footer-->
<script type="text/javascript">
    jQuery(function($) {
    	$('.new-tab1 li').click(function(){
			$(this).addClass('on').siblings('li').removeClass('on');
			o_index=$(this).index();
			$('.new-list').hide().eq(o_index).show();		
		});    	
    	$('.new-tab1 li').last().trigger("click");
    	
		$('.new-tab2 li').click(function(){
			$(this).addClass('on').siblings('li').removeClass('on');
			o_index=$(this).index();
			$('.new-list1').hide().eq(o_index).show();
		});
		$('.new-tab2 li').last().trigger("click");
		
		$('.new-tab3 li').click(function(){
			$(this).addClass('on').siblings('li').removeClass('on');
			o_index=$(this).index();
			$('.new-list2').hide().eq(o_index).show();
		});
		$('.new-tab3 li').last().trigger("click");
		
		$('.new-tab4 li').click(function(){
			$(this).addClass('on').siblings('li').removeClass('on');
			o_index=$(this).index();
			$('.new-list3').hide().eq(o_index).show();
		});
		$('.new-tab4 li').last().trigger("click");
		
		$('.new-tab5 li').click(function(){
			$(this).addClass('on').siblings('li').removeClass('on');
			o_index=$(this).index();
			$('.new-list4').hide().eq(o_index).show();
		});
		$('.new-tab5 li').last().trigger("click");
		
		$('.new-tab6 li').click(function(){
			$(this).addClass('on').siblings('li').removeClass('on');
			o_index=$(this).index();
			$('.new-list5').hide().eq(o_index).show();
		});
		$('.new-tab6 li').last().trigger("click");
		
		$('.new-tab7 li').click(function(){
			$(this).addClass('on').siblings('li').removeClass('on');
			o_index=$(this).index();
			$('.new-list6').hide().eq(o_index).show();
		});
		$('.new-tab7 li').last().trigger("click");
		
		$('.new-tab8 li').click(function(){
			$(this).addClass('on').siblings('li').removeClass('on');
			o_index=$(this).index();
			$('.new-list7').hide().eq(o_index).show();
		});
		$('.new-tab8 li').last().trigger("click");
		
		$('.new-tab9 li').click(function(){
			$(this).addClass('on').siblings('li').removeClass('on');
			o_index=$(this).index();
			$('.new-list8').hide().eq(o_index).show();
		});
		$('.new-tab9 li').last().trigger("click");
    });
</script> 
</body>
</html>


