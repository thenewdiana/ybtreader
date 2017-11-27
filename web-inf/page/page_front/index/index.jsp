<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="baidu-site-verification" content="5GyDuFcAyQ" />
<meta name="shenma-site-verification" content="e926ea9eb55e45133faa4d8f1f5056de_1453949352"/>
<meta property="wb:webmaster" content="d4230f7a301ff22c" />
<meta property="qc:admins" content="255257467665241676375" />
<title>雁北堂中文网_悬疑小说_网络小说_小说在线阅读_原创文学-雁北堂有故事</title>
<meta name="keywords" content="雁北堂,雁北堂中文网,悬疑小说,原创小说,小说在线阅读,网络小说,原创文学,悬疑文学,雁北堂有故事"></meta>
<meta name="description" content="雁北堂有故事。雁北堂中文网提供悬疑小说、原创小说、免费小说等网络小说、原创文学作品的在线阅读"></meta>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/slideBox.css"/>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/style.css"/>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/uaredirect.js"></script>
<script type="text/javascript">uaredirect("http://m.ebtang.com/m");</script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/jquery.lazyload.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/jquery.alert.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/main.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/tabs.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/slideBox.js"></script>
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
	 <jsp:param name="menu" value="index"/>   
</jsp:include>
<!--中间-->
<div class="body-bg">
<%@ include file="../vote/votepop.jsp"%>
	<div class="w1000">
		<!--left begin-->
		<div class="wd-lf fl mt15">
            <div class="ce-c over bords">
            	<div class="wf-1 fl">
                	<div class="bords pic over " id="slideBox">
	                    <ul class="fl w280 slideBox-content over">
	                    	<c:forEach items="${subjectMap['one_left']}" var="item" varStatus="status">
		            			<li><a href="${contextPath }/book/${item.bookId}" target="_blank" ><img src="${item.bookBigImage}" onerror="this.src='${item.errorBigImage}'" width="280" height="350" alt="${item.bookShortRecommTitle}" /></a></li>
		               		</c:forEach>
                        </ul>
                        <ul class="fr w50 slideBox-page over flashs hide">
                        	<c:forEach items="${subjectMap['one_left']}" var="item" varStatus="status">
		            			<li><a ><img src="${item.bookSmallImage}" onerror="this.src='${item.errorSmallImage}'" width="48" height="61" alt="" /></a></li>
		               		</c:forEach>
                        </ul>
                        
                    </div>
                    <div class="slideBox-texts">
	                    <c:forEach items="${subjectMap['one_left']}" var="item" varStatus="status">
	                    	<c:if test="${status.count==1}">
	                    		<div class="sec red-bg">
			                    	<h2>${item.bookShortRecommTitle}</h2>
			                        <p>${item.bookShortRecommDec}</p>
	                    		</div>
	                    	</c:if>
			            	<c:if test="${status.count>1}">
	                    		<div class="sec red-bg hide">
			                    	<h2>${item.bookShortRecommTitle}</h2>
			                        <p>${item.bookShortRecommDec}</p>
	                    		</div>
	                    	</c:if>
	               		</c:forEach>
               		</div>
                </div>
                
                <!--right begin-->
                <div class="wf-2 fr">
                	<dl>
                		<c:forEach items="${subjectMap['one_mid_up']}" var="item" varStatus="status">
		            		<c:if test="${status.count==1}">
		            			<dt><a href="${contextPath }/book/${item.bookId}" target="_blank" >${item.bookShortRecommTitle}</a></dt>
		            		</c:if>
		               	</c:forEach>
		               	<dd>
		               	<c:forEach items="${subjectMap['one_mid_up']}" var="item" varStatus="status">
		            		<c:if test="${status.count==2}">
		            			<a href="${contextPath }/book/${item.bookId}" target="_blank" >${item.bookShortRecommTitle}</a> 
		            		</c:if>
		            		<c:if test="${status.count==3}">
		            			| <a href="${contextPath }/book/${item.bookId}" target="_blank" >${item.bookShortRecommTitle}</a> 
		            		</c:if>
		            		<c:if test="${status.count==4}">
		            			| <a href="${contextPath }/book/${item.bookId}" target="_blank" >${item.bookShortRecommTitle}</a>
		            		</c:if>
		               	</c:forEach>
		                </dd>
		                <dd>
		               	<c:forEach items="${subjectMap['one_mid_up']}" var="item" varStatus="status">
		            		<c:if test="${status.count==5}">
		            			<a href="${contextPath }/book/${item.bookId}" target="_blank" >${item.bookShortRecommTitle}</a> 
		            		</c:if>
		            		<c:if test="${status.count==6}">
		            			| <a href="${contextPath }/book/${item.bookId}" target="_blank" >${item.bookShortRecommTitle}</a> 
		            		</c:if>
		            		<c:if test="${status.count==7}">
		            			| <a href="${contextPath }/book/${item.bookId}" target="_blank" >${item.bookShortRecommTitle}</a>
		            		</c:if>
		               	</c:forEach>
		                </dd>
                    </dl>
                    <dl>
                    	<c:forEach items="${subjectMap['one_mid_mid']}" var="item" varStatus="status">
		            		<c:if test="${status.count==1}">
		            			<dt><a href="${contextPath }/book/${item.bookId}" target="_blank" >${item.bookShortRecommTitle}</a></dt>
		            		</c:if>
		               	</c:forEach>
		               	<dd>
		               	<c:forEach items="${subjectMap['one_mid_mid']}" var="item" varStatus="status">
		            		<c:if test="${status.count==2}">
		            			<a href="${contextPath }/book/${item.bookId}" target="_blank" >${item.bookShortRecommTitle}</a> 
		            		</c:if>
		            		<c:if test="${status.count==3}">
		            			| <a href="${contextPath }/book/${item.bookId}" target="_blank" >${item.bookShortRecommTitle}</a> 
		            		</c:if>
		            		<c:if test="${status.count==4}">
		            			| <a href="${contextPath }/book/${item.bookId}" target="_blank" >${item.bookShortRecommTitle}</a>
		            		</c:if>
		               	</c:forEach>
		                </dd>
		                <dd>
		               	<c:forEach items="${subjectMap['one_mid_mid']}" var="item" varStatus="status">
		            		<c:if test="${status.count==5}">
		            			<a href="${contextPath }/book/${item.bookId}" target="_blank" >${item.bookShortRecommTitle}</a> 
		            		</c:if>
		            		<c:if test="${status.count==6}">
		            			| <a href="${contextPath }/book/${item.bookId}" target="_blank" >${item.bookShortRecommTitle}</a> 
		            		</c:if>
		            		<c:if test="${status.count==7}">
		            			| <a href="${contextPath }/book/${item.bookId}" target="_blank" >${item.bookShortRecommTitle}</a>
		            		</c:if>
		               	</c:forEach>
		                </dd>
                    </dl>
                    <dl>
                    	<c:forEach items="${subjectMap['one_mid_down']}" var="item" varStatus="status">
		            		<c:if test="${status.count==1}">
		            			<dt><a href="${contextPath }/book/${item.bookId}" target="_blank" >${item.bookShortRecommTitle}</a></dt>
		            		</c:if>
		               	</c:forEach>
		               	<dd>
		               	<c:forEach items="${subjectMap['one_mid_down']}" var="item" varStatus="status">
		            		<c:if test="${status.count==2}">
		            			<a href="${contextPath }/book/${item.bookId}" target="_blank" >${item.bookShortRecommTitle}</a> 
		            		</c:if>
		            		<c:if test="${status.count==3}">
		            			| <a href="${contextPath }/book/${item.bookId}" target="_blank" >${item.bookShortRecommTitle}</a> 
		            		</c:if>
		            		<c:if test="${status.count==4}">
		            			| <a href="${contextPath }/book/${item.bookId}" target="_blank" >${item.bookShortRecommTitle}</a>
		            		</c:if>
		               	</c:forEach>
		                </dd>
		                <dd>
		               	<c:forEach items="${subjectMap['one_mid_down']}" var="item" varStatus="status">
		            		<c:if test="${status.count==5}">
		            			<a href="${contextPath }/book/${item.bookId}" target="_blank" >${item.bookShortRecommTitle}</a> 
		            		</c:if>
		            		<c:if test="${status.count==6}">
		            			| <a href="${contextPath }/book/${item.bookId}" target="_blank" >${item.bookShortRecommTitle}</a> 
		            		</c:if>
		            		<c:if test="${status.count==7}">
		            			| <a href="${contextPath }/book/${item.bookId}" target="_blank" >${item.bookShortRecommTitle}</a>
		            		</c:if>
		               	</c:forEach>
		                </dd>
                    </dl>
                    <p class="gad f14 over"><strong class="fl">公告：</strong><marquee direction="left" scrollamount="2" class="marleft fl"><a href="${contextPath }/notice/${notice.id }"  class="red">${notice.title }</a></marquee></p>
                </div>
                <!--right end-->
            </div>
        </div>
        
	<!--right begin-->
    <div class="wd-rg fr mt5">
    	<div class="ce-t white ar"><a href="${contextPath }/book" target="_blank">更多&gt;&gt;</a></div>
            <div class="ce-c bord">
            	<c:forEach items="${subjectMap['shizishan']}" var="item" varStatus="status">
            		<c:if test="${status.count<3}">
	               		 <dl>
	                    	<dt><a href="${contextPath }/book/${item.bookId}" target="_blank" ><img src="${item.bookBigImage}" onerror="this.src='${item.errorMidImage}'" width="76" height="106" alt="" /></a></dt>
	                    	<dd>
		                    	<h2 class="f14"><a href="${contextPath }/book/${item.bookId}" target="_blank" >${item.bookShortRecommTitle}</a></h2>
		                        <p class="col99 h40">${item.bookShortRecommDec}</p>
		                        <p class="gray">作者：<a href="${contextPath }/book/listbyauthor/${item.bookAuthorId}">${item.bookAuthorNick}</a></p>
		                        <p class="red">[<a href="${contextPath }/book/${item.bookId}" target="_blank" >阅读</a>] [<a href="javascript:collection(${item.bookId})" >收藏</a>]</p>
		                    </dd>
	                    </dl>
                    </c:if>
               	</c:forEach>
                <ul>
                	<c:forEach items="${subjectMap['shizishan']}" var="item" varStatus="status">
	            		<c:if test="${status.count>2}">
	            			<li><span><a>[${item.cgName}]</a></span><a href="${contextPath }/book/${item.bookId}" target="_blank"  >${item.bookShortRecommTitle}</a></li>
		               	</c:if>
	               	</c:forEach>
                </ul>
            </div>
      </div>
        <!--right begin-->
       	<div class="clear"></div>
        <div class="mt15" id="bannerSlideBox">
            <ul class="slideBox-content">
                <c:forEach items="${subjectMap['one_banner']}" var="item" varStatus="status">
		        	<li><a href="${item.bannerUrl}" target="_blank" ><img src="${item.bannerImage}" width="999" height="90" alt="" /></a></li>
		       	</c:forEach>
            </ul>
        </div>

	</div>
    
    <div class="sub mt15"></div>
    
     
    <!--模块二-->
    <div class="w1000">
    	<!--left begin-->
        <div class="over">
            <div class="wd-lf fl mt25 wd-743 gray">
                <div class="ce-t pos_r clearFix">
                    <div class="wd-1 fl"></div>
                    <div class="wd-3"></div>
                    <stong class="fl">书库精品选</stong>
                    <div class="wd-2 fr"></div>
                    <a href="${contextPath }/book" class="fr">更多&gt;&gt;</a>
                </div>
                <div class="ce-c over bord">
                    <div class="wf-3 fl">
                    	<c:forEach items="${subjectMap['two_left_up']}" var="item" varStatus="status">
                       		<dl>
	                            <dt class="f16 ac strong"><a href="${contextPath }/book/${item.bookId}" target="_blank" >${item.bookShortRecommTitle}</a></dt>
	                            <dd class="ac lin30">作者：<a href="${contextPath }/book/listbyauthor/${item.bookAuthorId}">${item.bookAuthorNick}</a></dd>
	                            <dd class="text">${item.bookShortRecommDec}<a class="red" href="${contextPath }/book/${item.bookId}" target="_blank" >[阅读]</a></dd>
	                        </dl>
	                	</c:forEach>
	                	<div class="newul1">
                        	<c:forEach items="${subjectMap['two_left_mid_left']}" var="item" varStatus="status">
                        		<dl class="ul1">
	                                <dt class="f16 ac strong"><a href="${contextPath }/book/${item.bookId}" target="_blank" >${item.bookShortRecommTitle}</a></dt>
	                                <dd class="ac lin30">作者：<a href="${contextPath }/book/listbyauthor/${item.bookAuthorId}">${item.bookAuthorNick}</a></dd>
	                                <dd class="text">${item.bookShortRecommDec}<a class="red" href="${contextPath }/book/${item.bookId}">[阅读]</a></dd>
	                            </dl>
		                	</c:forEach>
	                        <ul class="ul2">
	                        	<c:forEach items="${subjectMap['two_left_down_left']}" var="item" varStatus="status"> 	
	                        		<li><a href="${contextPath }/book/${item.bookId}" target="_blank" ><img src="${item.bookSmallImage}" onerror="this.src='${item.errorSmallImage}'" width="52" height="72" alt="" /></a></li>
			                	</c:forEach>
	                        </ul>
	                	</div>
	                	<div class="newul1 bdno">
                            <c:forEach items="${subjectMap['two_left_mid_right']}" var="item" varStatus="status">
                        		<dl class="ul1">
	                                <dt class="f16 ac strong"><a href="${contextPath }/book/${item.bookId}" target="_blank" >${item.bookShortRecommTitle}</a></dt>
	                                <dd class="ac lin30">作者：<a href="${contextPath }/book/listbyauthor/${item.bookAuthorId}">${item.bookAuthorNick}</a></dd>
	                                <dd class="text">${item.bookShortRecommDec}<a class="red" href="${contextPath }/book/${item.bookId}">[阅读]</a></dd>
	                            </dl>
		                	</c:forEach>
	                        <ul class="ul2">
	                        	<c:forEach items="${subjectMap['two_left_down_right']}" var="item" varStatus="status"> 	
	                        		<li><a href="${contextPath }/book/${item.bookId}" target="_blank" ><img src="${item.bookSmallImage}" onerror="this.src='${item.errorSmallImage}'" width="52" height="72" alt="" /></a></li>
			                	</c:forEach>
	                        </ul>
	                	</div>
                    </div>
                    
                    <!--right begin-->
                    <dl class="dl1 fr">
                    	<c:forEach items="${subjectMap['two_mid_left']}" var="item" varStatus="status">
                       		<c:if test="${status.count==1}">
                       			<dt><a href="${contextPath }/book/${item.bookId}" target="_blank" ><img src="${item.bookBigImage}" onerror="this.src='${item.errorMidImage}'" width="120" height="155" alt="" /></a></dt>
		                        <dd>
		                            <h2><a href="${contextPath }/book/${item.bookId}" target="_blank" >${item.bookShortRecommTitle}</a></h2>
		                            <p>${item.bookShortRecommDec}</p>
		                         </dd>
                       		</c:if>
                       		<c:if test="${status.count==2}">
                       			<dd class="bd-top">
		                            <h2><a href="${contextPath }/book/${item.bookId}" target="_blank" >${item.bookShortRecommTitle}</a></h2>
		                            <p>${item.bookShortRecommDec}</p>
		                         </dd>
                       		</c:if>
	                	</c:forEach>
                    </dl>
                    <dl class="dl1 fr">
                        <c:forEach items="${subjectMap['two_mid_right']}" var="item" varStatus="status">
                       		<c:if test="${status.count==1}">
                       			<dt><a href="${contextPath }/book/${item.bookId}" target="_blank" ><img src="${item.bookBigImage}" onerror="this.src='${item.errorMidImage}'" width="120" height="155" alt="" /></a></dt>
		                        <dd>
		                            <h2><a href="${contextPath }/book/${item.bookId}" target="_blank" >${item.bookShortRecommTitle}</a></h2>
		                            <p>${item.bookShortRecommDec}</p>
		                         </dd>
                       		</c:if>
                       		<c:if test="${status.count==2}">
                       			<dd class="bd-top">
		                            <h2><a href="${contextPath }/book/${item.bookId}" target="_blank" >${item.bookShortRecommTitle}</a></h2>
		                            <p>${item.bookShortRecommDec}</p>
		                         </dd>
                       		</c:if>
	                	</c:forEach>
                    </dl>
                    <!--right end-->
                    
                </div>
            </div>
        <!--left begin-->
        <!--right begin-->
        <div class="wd-244 fr mt25 bords">
            <div class="ce-t over"><span class="fl">点击榜</span>
            <jsp:include page="../rank/rank_more.jsp">
				 <jsp:param name="action" value="click"/>   
			</jsp:include>
            </div>
            <div class="ce-c">
                <ul>
                	<c:forEach items="${bookRankMap['clickRankByAllList']}" var="item" varStatus="status">
                		<%@ include file="../rank/sub_rank_click.jsp"%>
             	</c:forEach>
                </ul>
            </div>
        </div>
        <!--right begin-->
        </div>
        
        <!--模块二-->
        <div class="over zq1 zq2 zq02">
            <div class="wd-743 fl sec3 mt20">
                <div class="ce-c bords pos_r">
                	<div class="top3 clearFix">
                    	<div class="bd1"></div>
                        <div  class="fl bd2 f14">男生频道</div>
                        <c:forEach items="${subjectMap['three_mid']}" var="item" varStatus="status">
                        	<dl>
	                            <dt><a href="${contextPath }/book/${item.bookId}" title=""><img src="${item.bookBigImage}" onerror="this.src='${item.errorMidImage}'" width="90" height="126" alt="${item.bookShortRecommTitle}" /></a></dt>
	                            <dd  class="col66">
	                                <h2><a href="${contextPath }/book/${item.bookId}" title="">${item.bookShortRecommTitle}</a></h2>
	                                <p class="text">${item.bookShortRecommDec}</p>
	                                <p class="gray1"><span class="col99">作者：</span><a href="${contextPath }/book/listbyauthor/${item.bookAuthorId}">${item.bookAuthorNick}</a></p>
	                            </dd>
	                        </dl>
	                	</c:forEach>
                   </div>   
                   <div class="bott"></div>  
                   <div class="top3 clearFix">
                    	<div class="bd1 bd4"></div>
                        <div  class="fl bd2 bd3 f14">女生频道</div>
                        <c:forEach items="${subjectMap['three_right']}" var="item" varStatus="status">
                        	<dl>
	                            <dt><a href="${contextPath }/book/${item.bookId}" title=""><img src="${item.bookBigImage}" onerror="this.src='${item.errorMidImage}'" width="90" height="126" alt="${item.bookShortRecommTitle}" /></a></dt>
	                            <dd  class="col66">
	                                <h2><a href="${contextPath }/book/${item.bookId}" title="">${item.bookShortRecommTitle}</a></h2>
	                                <p class="text">${item.bookShortRecommDec}</p>
	                                <p class="gray1"><span class="col99">作者：</span><a href="${contextPath }/book/listbyauthor/${item.bookAuthorId}">${item.bookAuthorNick}</a></p>
	                            </dd>
	                        </dl>
	                	</c:forEach>
                   </div>              
                </div>
            </div>
            <div class="wd-244 fr mt20 bords">
               <div class="ce-t over"><span class="fl">打赏榜</span>
               	<jsp:include page="../rank/rank_more.jsp">
					 <jsp:param name="action" value="reward"/>   
				</jsp:include>
                </div>
                <div class="ce-c">
                    <ul>
                       	<c:forEach items="${bookRankMap['rewardRankByAllList']}" var="item" varStatus="status">
                			<%@ include file="../rank/sub_rank_reward.jsp"%>
             		</c:forEach>
                    </ul>
                </div>
            </div>
        </div>
        
        <c:forEach items="${subjectMap['two_banner']}" var="item" varStatus="status">
        	<div class="mt15"><a href="${item.bannerUrl}" target="_blank" ><img src="${item.bannerImage}" width="999" height="90" alt="" /></a></div>
       	</c:forEach>
    	<!--模块三 -->
        <div class="over zq2">
        	<div class="wd-lf mt25 gray sec3 fl">
                <div class="ce-t pos_r clearFix">
                    <div class="wd-1 fl"></div>
                    <div class="wd-3"></div>
                    <stong class="fl">奇幻魔幻</stong>
                    <div class="wd-2 fr"></div>
                    <!--<a href="#"  class="fr">更多&gt;&gt;</a>-->
                </div>
                <div class="ce-c bord over">
                	<c:forEach items="${subjectMap['four']}" var="item" varStatus="status">
	                    <dl>
	                    	<dt><a href="${contextPath }/book/${item.bookId}" target="_blank" ><img src="${item.bookBigImage}" onerror="this.src='${item.errorMidImage}'" width="90" height="125" alt="" /></a></dt>
	                        <dd  class="col66">
	                        	<h2><a href="${contextPath }/book/${item.bookId}" target="_blank" >${item.bookShortRecommTitle}</a></h2>
	                            <p class="text">${item.bookShortRecommDec}</p>
	                            <p class="gray1"><span class="col99">作者：</span><a href="${contextPath }/book/listbyauthor/${item.bookAuthorId}">${item.bookAuthorNick}</a></p>
	                        </dd>
	                    </dl>
                	</c:forEach>
                </div>
                
            </div>
            <div class="wd-244 fr mt25 bords">
                    <div class="ce-t over"><span class="fl">金票榜</span>
                    <jsp:include page="../rank/rank_more.jsp">
						 <jsp:param name="action" value="golden"/>   
					</jsp:include>
                    </div>
                    <div class="ce-c">
                        <ul>
                            <c:forEach items="${bookRankMap['goldenRankByAllList']}" var="item" varStatus="status">
                    			<%@ include file="../rank/sub_rank_golden.jsp"%>
	                		</c:forEach>
                        </ul>
                    </div>
                </div>
         </div> 
        <!--模块三-->
        
        <!--模块三 -->
        <div class="over zq2">
        	<div class="wd-lf mt25 gray sec3 sec4 fl">
                <div class="ce-t pos_r clearFix">
                    <div class="wd-1 fl"></div>
                    <div class="wd-3"></div>
                    <stong class="fl">幽默搞笑 </stong>
                    <div class="wd-2 fr"></div>
                    <!--<a href="#"  class="fr">更多&gt;&gt;</a>-->
                </div>
                <div class="ce-c bord">
                	<c:forEach items="${subjectMap['five']}" var="item" varStatus="status">
                		 <dl>
	                    	<dt><a href="${contextPath }/book/${item.bookId}" target="_blank" ><img src="${item.bookBigImage}" onerror="this.src='${item.errorMidImage}'" width="90" height="125" alt="" /></a></dt>
	                        <dd  class="col66">
	                        	<h2><a href="${contextPath }/book/${item.bookId}" target="_blank" >${item.bookShortRecommTitle}</a></h2>
	                            <p class="text">${item.bookShortRecommDec}</p>
	                            <p class="gray1"><span class="col99">作者：</span><a href="${contextPath }/book/listbyauthor/${item.bookAuthorId}">${item.bookAuthorNick}</a></p>
	                        </dd>
	                    </dl>
                	</c:forEach>
                </div>
                
            </div>
            <div class="wd-244 fr mt25 bords">
                    <div class="ce-t over new-tab">
                    <span class="fl on">新书榜</span>
                    <span class="fl">新人榜</span>
                    <jsp:include page="../rank/rank_more.jsp">
						 <jsp:param name="action" value="newBook"/>   
					</jsp:include>
                    </div>
                    <div class="ce-c">
                        <ul class="new-list show">
                            <c:forEach items="${bookRankMap['newBookRankByAllList']}" var="item" varStatus="status">
	                    		<%@ include file="../rank/sub_rank_click.jsp"%>
	                		</c:forEach>
                        </ul>
                        <ul class="new-list hide">
                            <c:forEach items="${newUserRankList }" var="item" varStatus="status">
	                       		<%@ include file="../rank/sub_rank_newuser.jsp"%>
	                       	</c:forEach> 
                        </ul>
                    </div>
                </div>
        </div>
        <!--模块三-->
        <!--模块四-->
        <div class="over">
            <div class="wd-lf fl mt25 sec5 gray">
                <div class="ce-t pos_r clearFix">
                    <div class="wd-1 fl"></div>
                    <div class="wd-3"></div>
                    <stong class="fl">最新小说更新列表</stong>
                    <div class="wd-2 fr"></div>
                    <a href="${contextPath }/book" target="_blank" class="fr">更多&gt;&gt;</a>
                </div>
                <div class="ce-c over bord tabs">
                    <ul class="tabs-title ar">
                        <li name=".tabs-1" class="on">VIP小说</li>
                        <li name=".tabs-2">免费小说</li>
                        <li name=".tabs-3">全本小说</li>
                    </ul>
                	<div class="tabs-content">
                        <div class="tabs-1 show">
                        	<ul class="tit over">
                            	<li class="tit1">分类</li>
                                <li class="tit2">书名 </li>
                                <li class="tit3">作者</li>
                                <li class="tit1">更新时间</li>
                            </ul>
                            <c:forEach items="${lastUpdateMap['vipBookList']}" var="item" varStatus="status">
                            	<ul class="tit0  gray2">
	                            	<li class="tit1"><a href="javascript:void(0);" >[${item.categoryName}]</a></li>
	                                <li class="tit2 <c:if test="${item.isVip==1}">vip</c:if>"><a href="${contextPath }/book/${item.id}" target="_blank" class="f14" >${item.name}</a></li>
	                                <li class="tit3"><a href="${pageContext.request.contextPath }/book/listbyauthor/${item.authorId }" >${item.authorNick}</a></li>
	                                <li class="tit1 gray1 mdhm">${item.lastModifyTime}</li>
	                            </ul>
		                	</c:forEach>
                        </div>
                        <div class="tabs-2 hide">
                        	<ul class="tit over">
                            	<li class="tit1">分类</li>
                                <li class="tit2">书名 </li>
                                <li class="tit3">作者</li>
                                <li class="tit1">更新时间</li>
                            </ul>
                            <c:forEach items="${lastUpdateMap['freeBookList']}" var="item" varStatus="status">
                            	<ul class="tit0  gray2">
	                            	<li class="tit1"><a href="javascript:void(0);" >[${item.categoryName}]</a></li>
	                                <li class="tit2 <c:if test="${item.isVip==1}">vip</c:if>"><a href="${contextPath }/book/${item.id}" target="_blank" class="f14" >${item.name}</a></li>
	                                <li class="tit3"><a href="${pageContext.request.contextPath }/book/listbyauthor/${item.authorId }" >${item.authorNick}</a></li>
	                                <li class="tit1 gray1 mdhm">${item.lastModifyTime}</li>
	                            </ul>
		                	</c:forEach>
                        </div>
                        <div class="tabs-3 hide">
                        	<ul class="tit over">
                            	<li class="tit1">分类</li>
                                <li class="tit2">书名 </li>
                                <li class="tit3">作者</li>
                                <li class="tit1">更新时间</li>
                            </ul>
                            <c:forEach items="${lastUpdateMap['finishBookList']}" var="item" varStatus="status">
                            	<ul class="tit0  gray2">
	                            	<li class="tit1"><a href="javascript:void(0);" >[${item.categoryName}]</a></li>
	                                <li class="tit2 <c:if test="${item.isVip==1}">vip</c:if>"><a href="${contextPath }/book/${item.id}" target="_blank" class="f14" >${item.name}</a></li>
	                                <li class="tit3"><a href="${pageContext.request.contextPath }/book/listbyauthor/${item.authorId }" >${item.authorNick}</a></li>
	                                <li class="tit1 gray1 mdhm">${item.lastModifyTime}</li>
	                            </ul>
		                	</c:forEach>
                        </div>
               		</div>
                </div>
            </div>
        <!--left begin-->
        <!--right begin-->
            <div class="wd-244 fr mt25 sec6">
            	<div class="bords">
                    <div class="ce-t over"><span class="fl">免费榜</span>
                    <jsp:include page="../rank/rank_more.jsp">
						 <jsp:param name="action" value="freeBook"/>   
					</jsp:include>
                    </div>
                    <div class="ce-c">
                        <dl class="mt5">
                        	<c:forEach items="${bookRankMap['freeBookRankByAllList']}" var="item" varStatus="status">
                    			<%@ include file="../rank/sub_rank_click.jsp"%>
	                		</c:forEach>
                        </dl>
                    </div>
                </div>
                <div class="bords mt7">
                    <div class="ac1 ac"><img src="${sessionScope.baseUrl}pc/images/pic/android.png" width="210" height="214" alt="" /></div>
                    <div class="ce-t1 text">雁北堂小说APP</div>
                </div>
            </div>
        <!--right begin-->
        </div>
        <!--模块四-->
        
        <!-- 站内链接 -->
        <div class="link-copy ac mt10">
         	<div class="ce-link over">
            	<c:forEach items="${links }" var="link">
                <a class="hotlink" href="${link.targetUrl }" title="">${link.linkText }</a>
				<c:if test="${links.indexOf(link) < links.size()-1 }">|</c:if>
                </c:forEach>
           	</div>
        </div>
        
        <!--友情链接开始-->
		<%-- <%@ include file="../interlink.jsp"%> --%>
		<div class="link-copy ac mt10">
			<c:forEach items="${interLinks }" var="interLink" varStatus="status">
				<a href="${interLink.linkUrl }" target="_blank">${interLink.linkName }</a>
				<c:if test="${status.count%9!=0&&interLinks.indexOf(interLink) < interLinks.size()-1 }"> | </c:if>	
				<c:if test="${status.count%9==0 }"><br /></c:if>																			
			</c:forEach>
		</div>
        <!--友情链接结束-->
		<!--铸剑活动页开始-->
		<%@ include file="../hd/zj/zj_entrance.jsp"%>
		<!--铸剑活动页结束-->

    </div>
    <!--模块二-->
</div>
<!-- <div id="left_layer" style="position:fixed; top:40px; left:0px;"> -->
<!--   	<div class="block"> -->
<!-- 		<a href="${contextPath }/acitivity/offer/task" target="_blank"><img src="${sessionScope.baseUrl}pc/images/new/bg.png" /></a> -->
<!-- 		<a href="javascript:;" onclick="javascript:document.getElementById('left_layer').style.display='none';"><div class="close"><img src="${sessionScope.baseUrl}pc/images/new/close.jpg"></div></a> -->
<!-- 	</div> -->
<!-- </div> -->
<!-- <style type="text/css"> -->
<!-- 	.block{position: relative;} -->
<!-- 	.block img{width:100%;margin-top: 24px;} -->
<!-- 	.close{width:12%;position: absolute;right:0px;top: 0px; } -->
<!-- 	.close img{width:100%;} -->
<!-- </style> -->
<!--footer-->
<%@ include file="../footer.jsp"%>
<!--footer-->

<script type="text/javascript">
	jQuery(function($) {
		//图片轮播
		$("#slideBox").slideBox({
            width:280,
            height:355,
            page:true,
            pageContent:[],
            speed:4,
            circle:true,
            isWords:true
        });
        $("#bannerSlideBox").slideBox({
            width:999,
            height:90,
            page:true,
            pageContent:['z',4,5],
            speed:3,
            circle:true,
            isWords:false
        });
		//滑动门
        $(".tabs").selfTabs();
		hasRewardActivity();
    });
    function hasRewardActivity(){
    	var signal='${ifHaveAct}';
    	if(signal === '1'){
    		var popupUrl,url,html;
    		$('.sm-popup').append(html).addClass('sm-popup-reward');
    		popupUrl='${sessionScope.baseUrl}pc/images/activity/'+'reward-zhujian.jpg';
    		$('.sm-popup-reward').find('img').attr('src',popupUrl);
    		url='${sessionScope.baseUrl}pc/images/activity/'+'reward-holiday-400.png';
    		html='<img src="'+url+'" class="reward-img" />';
    		$('.sm-popup').append(html);
    	}
    }
    function collection(bookId){
		if (!isLoginIndex(bookId)) {
			return;
		}
		$.ajax({
			type : "POST",
			dataType : "json",
			data : "bookId="+bookId,
			async:true,
			url : "${contextPath }/book/collect",
			success : function(json) {
				if (json.resBean.code != 0) {
					$.MsgBox.Alert("提示", json.resBean.msg);
				}
			}
		});
	}
	
	function isLoginIndex(bookId) {
		var userId = "${sessionScope.sessionFrontBean.userId}";
		if (userId == null || userId == "") {
			var redirectUrl = "/book/"+bookId;
			window.location.href="${contextPath }/user/login?redirectUrl=" + redirectUrl;	
			return false;
		}
		
		return true;
	}
</script>
</body>

</html>
