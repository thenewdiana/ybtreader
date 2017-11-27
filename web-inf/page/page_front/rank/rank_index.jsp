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
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/main.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/time.js"></script>
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
    <div class="w1000 p-sec">
    	<!--left begin-->
        <div class="wd-lf mt25 gray">
                <div class="ce-t pos_r clearFix">
                    <div class="wd-1 fl"></div>
                    <div class="wd-3"></div>
                    <strong class="fl">排行榜</strong>
                    <div class="wd-2 fr"></div>
                    <!--<a href="#" title="" class="fr">更多&gt;&gt;</a>-->
                </div>
                <div class="bord over">
                <!--left begin-->
                    <div class="p-seclf  fl">
                        <div class="wd-244 fl bords">
                            <div class="ce-t over new-tab1">
                                <span class="fl">点击榜</span>
                                <ul>
                                    <li>周</li>
                                    <li>月</li>
                                    <li class="on">总</li>
                                </ul>
                                <jsp:include page="../rank/rank_more.jsp">
									 <jsp:param name="action" value="click"/>   
								</jsp:include>
                                
                            </div>
                            <div class="ce-c">
                                <ul class="new-list hide">
                                    <c:forEach items="${clickRankByWeekList }" var="item" varStatus="status">
                                		<%@ include file="sub_rank_click.jsp"%>
                                	</c:forEach>
                                </ul>
                                <ul class="new-list hide">
                                    <c:forEach items="${clickRankByMonthList }" var="item" varStatus="status">
                                		<%@ include file="sub_rank_click.jsp"%>
                                	</c:forEach>
                                </ul>
                                <ul class="new-list show">
                                	<c:forEach items="${clickRankByAllList }" var="item" varStatus="status">
                                		<%@ include file="sub_rank_click.jsp"%>
                                	</c:forEach>                             
                                </ul>
                            </div>
                    	</div>
                        <!--第一块-->
                        <div class="wd-244 fl bords">
                            <div class="ce-t over new-tab2">
                                <span class="fl">打赏榜</span>
                                <ul>
                                    <li>周</li>
                                    <li>月</li>
                                    <li class="on">总</li>
                                </ul>
                                <jsp:include page="../rank/rank_more.jsp">
									 <jsp:param name="action" value="reward"/>   
								</jsp:include>
                            </div>
                            <div class="ce-c">
                              	<ul class="new-list1 hide">
                                    <c:forEach items="${rewardRankByWeekList }" var="item" varStatus="status">
                                		<%@ include file="sub_rank_reward.jsp"%>
                                	</c:forEach>
                                </ul>
                              	<ul class="new-list1 hide">
                                    <c:forEach items="${rewardRankByMonthList }" var="item" varStatus="status">
                                		<%@ include file="sub_rank_reward.jsp"%>
                                	</c:forEach>
                                </ul>
                                <ul class="new-list1 show">
                                    <c:forEach items="${rewardRankByAllList }" var="item" varStatus="status">
                                		<%@ include file="sub_rank_reward.jsp"%>
                                	</c:forEach>
                                </ul>
                            </div>
                    	</div>
                        <!--第二块-->
                        
                        <div class="wd-244 fl bords">
                            <div class="ce-t over new-tab3">
                                <span class="fl">金票榜</span>
                                <ul>
                                    <li>周</li>
                                    <li>月</li>
                                    <li class="on">总</li>
                                </ul>
                                <jsp:include page="../rank/rank_more.jsp">
									 <jsp:param name="action" value="golden"/>   
								</jsp:include>
                            </div>
                            <div class="ce-c">
                                <ul class="new-list2 hide">
                                    <c:forEach items="${goldenRankByWeekList }" var="item" varStatus="status">
                                		<%@ include file="sub_rank_golden.jsp"%>
                                	</c:forEach>
                                </ul>
                                <ul class="new-list2 hide">
                                    <c:forEach items="${goldenRankByMonthList }" var="item" varStatus="status">
                                		<%@ include file="sub_rank_golden.jsp"%>
                                	</c:forEach>
                                </ul>
                                <ul class="new-list2 show">
                                    <c:forEach items="${goldenRankByAllList }" var="item" varStatus="status">
                                		<%@ include file="sub_rank_golden.jsp"%>
                                	</c:forEach>
                                </ul>
                            </div>
                    	</div>
                        
                        <!--第二块-->
                        <div class="wd-244 fl bords">
                            <div class="ce-t over new-tab4">
                                <span class="fl">订阅榜</span>
                                <ul>
                                    <li>周</li>
                                    <li>月</li>
                                    <li class="on">总</li>
                                </ul>
                                <jsp:include page="../rank/rank_more.jsp">
									 <jsp:param name="action" value="rss"/>   
								</jsp:include>
                            </div>
                            <div class="ce-c">
                                <ul class="new-list3 hide">
                                    <c:forEach items="${rssRankByWeekList }" var="item" varStatus="status">
                                		<%@ include file="sub_rank_rss.jsp"%>
                                	</c:forEach>
                                </ul>
                                <ul class="new-list3 hide">
                                    <c:forEach items="${rssRankByMonthList }" var="item" varStatus="status">
                                		<%@ include file="sub_rank_rss.jsp"%>
                                	</c:forEach>
                                </ul>
                                <ul class="new-list3 show">
                                    <c:forEach items="${rssRankByAllList }" var="item" varStatus="status">
                                		<%@ include file="sub_rank_rss.jsp"%>
                                	</c:forEach>
                                </ul>
                            </div>
                    	</div>
                        <!--第二块-->
                        
                        <div class="wd-244 fl bords">
                            <div class="ce-t over new-tab5">
                                <span class="fl">新书榜</span>
                                <ul>
                                    <li>周</li>
                                    <li>月</li>
                                    <li class="on">总</li>
                                </ul>
                                <jsp:include page="../rank/rank_more.jsp">
									 <jsp:param name="action" value="newBook"/>   
								</jsp:include>
                            </div>
                            <div class="ce-c">
                                <ul class="new-list4 hide">
                                    <c:forEach items="${newBookRankByWeekList }" var="item" varStatus="status">
                                		<%@ include file="sub_rank_click.jsp"%>
                                	</c:forEach>
                                </ul>
                                <ul class="new-list4 hide">
                                    <c:forEach items="${newBookRankByMonthList }" var="item" varStatus="status">
                                		<%@ include file="sub_rank_click.jsp"%>
                                	</c:forEach>
                                </ul>
                                <ul class="new-list4 show">
                                    <c:forEach items="${newBookRankByAllList }" var="item" varStatus="status">
                                		<%@ include file="sub_rank_click.jsp"%>
                                	</c:forEach>
                                </ul>
                            </div>
                    	</div>
                        <!--第二块-->
                        
                        <div class="wd-244 fl bords">
                            <div class="ce-t over new-tab6">
                                <span class="fl">女频榜</span>
                                <ul>
                                    <li>周</li>
                                    <li>月</li>
                                    <li class="on">总</li>
                                </ul>
                                <jsp:include page="../rank/rank_more.jsp">
									 <jsp:param name="action" value="female"/>   
								</jsp:include>
                            </div>
                            <div class="ce-c">
                                <ul class="new-list5 hide">
                                    <c:forEach items="${womenChannelRankByWeekList }" var="item" varStatus="status">
                                		<%@ include file="sub_rank_click.jsp"%>
                                	</c:forEach>
                                </ul>
                                <ul class="new-list5 hide">
                                    <c:forEach items="${womenChannelRankByMonthList }" var="item" varStatus="status">
                                		<%@ include file="sub_rank_click.jsp"%>
                                	</c:forEach>
                                </ul>
                                <ul class="new-list5 show">
                                    <c:forEach items="${womenChannelRankByAllList }" var="item" varStatus="status">
                                		<%@ include file="sub_rank_click.jsp"%>
                                	</c:forEach>
                                </ul>
                            </div>
                    	</div>
                        <!--第二块-->
                        
                        <div class="wd-244 fl bords">
                            <div class="ce-t over new-tab7">
                                <span class="fl">土豪粉丝榜</span>
                                <ul>
                                    <li>周</li>
                                    <li>月</li>
                                    <li class="on">总</li>
                                </ul>
                                <jsp:include page="../rank/rank_more.jsp">
									 <jsp:param name="action" value="fans"/>   
								</jsp:include>
                            </div>
                            <div class="ce-c">
                                <ul class="new-list6 hide">
                                    <c:forEach items="${hiapkRankByWeekList }" var="item" varStatus="status">
                                		<%@ include file="sub_rank_hiapk.jsp"%>
                                	</c:forEach>
                                </ul>
                                <ul class="new-list6 hide">
                                    <c:forEach items="${hiapkRankByMonthList }" var="item" varStatus="status">
                                		<%@ include file="sub_rank_hiapk.jsp"%>
                                	</c:forEach>
                                </ul>
                                <ul class="new-list6 show">
                                	<c:forEach items="${hiapkRankByAllList }" var="item" varStatus="status">
                                		<%@ include file="sub_rank_hiapk.jsp"%>
                                	</c:forEach>                                    
                                </ul>
                            </div>
                    	</div>
                        <!--第二块-->
                        
                        <div class="wd-244 fl bords">
                            <div class="ce-t over new-tab8">
                                <span class="fl">新人榜</span>
                                <jsp:include page="../rank/rank_more.jsp">
									 <jsp:param name="action" value="newUser"/>   
								</jsp:include>
                            </div>
                            <div class="ce-c">
                                <ul class="new-list7 show">
                                    <c:forEach items="${newUserRankList }" var="item" varStatus="status">
                                		<%@ include file="sub_rank_newuser.jsp"%>
                                	</c:forEach> 
                                </ul>                                
                            </div>
                    	</div>
                        <!--第二块-->
                        <div class="wd-244 fl bords">
                            <div class="ce-t over new-tab9">
                                <span class="fl">免费榜</span>
                                <ul>
                                    <li>周</li>
                                    <li>月</li>
                                    <li class="on">总</li>
                                </ul>
                                <jsp:include page="../rank/rank_more.jsp">
									 <jsp:param name="action" value="freeBook"/>   
								</jsp:include>
                            </div>
                            <div class="ce-c">
                                <ul class="new-list8 hide">
                                    <c:forEach items="${freeBookRankByWeekList }" var="item" varStatus="status">
                                		<%@ include file="sub_rank_click.jsp"%>
                                	</c:forEach>
                                </ul>
                                <ul class="new-list8 hide">
                                    <c:forEach items="${freeBookRankByMonthList }" var="item" varStatus="status">
                                		<%@ include file="sub_rank_click.jsp"%>
                                	</c:forEach>
                                </ul>
                                <ul class="new-list8 show">
                                    <c:forEach items="${freeBookRankByAllList }" var="item" varStatus="status">
                                		<%@ include file="sub_rank_click.jsp"%>
                                	</c:forEach>
                                </ul>
                            </div>
                    	</div>
                        <!--第二块-->
                        
                    </div>
                
                <!--left begin-->
                <!--right begin-->
                <div class="p-secrg fr">
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
        </div>                    
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


