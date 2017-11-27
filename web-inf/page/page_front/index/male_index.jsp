<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>男生小说_男性小说_都市小说_玄幻小说_武侠小说-雁北堂中文网</title>
<meta name="keywords" content="男生小说,男性小说,好看的男生小说,都市小说,玄幻小说,武侠小说,历史小说 "></meta>
<meta name="description" content="雁北堂中文网男生频道提供都市小说、玄幻小说、武侠小说、历史小说等好看的男性向小说推荐，方便读者在线阅读各类男生小说。"></meta>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/slideBox.css"/>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/style.css"/>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/jquery-1.9.1.min.js"></script>
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
	 <jsp:param name="menu" value="channel_men"/>   
</jsp:include>
<!--中间-->
<div class="body-bg">
	<div class="w1000">
    	<!--left begin-->
	 	<div class="wd-lf fl mt15">
            <div class="ce-c over bords nv-sec nv-sec10">
                <div class="nv-wd1 fl">
                	<div class="leaf">
                		<c:forEach items="${subjectMap['one_left']}" var="item" varStatus="status">
                			<div class="img-bd pad8 bords">
                				<a href="${contextPath }/book/${item.bookId}" target="_blank"><img src="${item.bookBigImage}" onerror="this.src='${item.errorBigImage}'" width="278" height="355"/></a>
	                        </div>
	                   
	                        <div class="sec red-bg">
	                            <h2><a href="${contextPath }/book/${item.bookId}" target="_blank">${item.bookShortRecommTitle}</a></h2>
		                        <p>${item.bookShortRecommDec}</p>
	                        </div>
                		</c:forEach>
                    </div>
                </div>
            
                
                <!--right begin-->
                <div class="wf-2 fr">
                	<div class="wome">
	                	<c:forEach items="${subjectMap['one_mid_up']}" var="item" varStatus="status">
	                		<dl>
		                    	<dt><a href="${contextPath }/book/${item.bookId}" target="_blank">${item.bookShortRecommTitle}</a></dt>
		                        <dd>${item.bookShortRecommDec}</dd>
		                    </dl>
	               		</c:forEach>
               		</div>
                    <div>
                    	<div class="fl"><img src="${sessionScope.baseUrl}pc/images/nv-img1.jpg" width="21" height="77"  /></div>
                        <div class="lf-wd1 fl mt15">
                        	<ul class="lf-wd2 fl bd">
                        		<c:forEach items="${subjectMap['one_mid_down_left']}" var="item" varStatus="status">
			                		<li><a href="${contextPath }/book/${item.bookId}" target="_blank">${item.bookShortRecommTitle}</a></li>
			               		</c:forEach>
                            </ul>
                            <ul class="lf-wd2 fl">
                            	<c:forEach items="${subjectMap['one_mid_down_right']}" var="item" varStatus="status">
			                		<li><a href="${contextPath }/book/${item.bookId}" target="_blank">${item.bookShortRecommTitle}</a></li>
			               		</c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
                <!--right end-->
                
            </div>
        </div>
        <!--left begin-->
        <!--right begin-->
    	<div class="wd-rg fr mt5">
    		<div class="ce-t white ar"><a href="${contextPath }/book" target="_blank">更多&gt;&gt;</a></div>
            	<div class="ce-c bord ce-c10">
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
		        	<li><a href="${item.bannerUrl}" target="_blank" title=""><img src="${item.bannerImage}" width="999" height="90"  /></a></li>
		       	</c:forEach>
            </ul>
        </div>
      </div>
    
    <div class="sub mt15"></div>
    <!--模块二-->
    <div class="w1000">
    	<div class="over">
        	<div class="wd-743 fl mt15">
            	<div class="nv-sec2 bords">
            		<dl>
	            		<c:forEach items="${subjectMap['two_left_left']}" var="item" varStatus="status">
				        	<c:if test="${status.count==1}">
				        		<dt><a href="${contextPath }/book/${item.bookId}" target="_blank"><img src="${item.bookBigImage}" onerror="this.src='${item.errorBigImage}'" width="174" height="229"/></a></dt>
		                        <dd>
		                        	<h2 class="ac">${item.bookShortRecommTitle}</h2>
									<p class="col99">${item.bookShortRecommDec}</p>
		                        </dd>
	 			        	</c:if>
				       	</c:forEach>
				       	<dd>
					       	<c:forEach items="${subjectMap['two_left_left']}" var="item" varStatus="status">
					       		<c:if test="${status.count==2||status.count==3}">
			                            <p><span>[${item.cgName}]</span><a href="${contextPath }/book/${item.bookId}" target="_blank">${item.bookShortRecommTitle}</a></p>
					        	</c:if>
					       	</c:forEach>
				       	</dd>
			       	</dl>
			       	<dl>
	            		<c:forEach items="${subjectMap['two_left_mid']}" var="item" varStatus="status">
				        	<c:if test="${status.count==1}">
				        		<dt><a href="${contextPath }/book/${item.bookId}" target="_blank"><img src="${item.bookBigImage}" onerror="this.src='${item.errorBigImage}'" width="174" height="229"/></a></dt>
		                        <dd>
		                        	<h2 class="ac">${item.bookShortRecommTitle}</h2>
									<p class="col99">${item.bookShortRecommDec}</p>
		                        </dd>
	 			        	</c:if>
				       	</c:forEach>
				       	<dd>
					       	<c:forEach items="${subjectMap['two_left_mid']}" var="item" varStatus="status">
					        	<c:if test="${status.count==2||status.count==3}">
			                            <p><span>[${item.cgName}]</span><a href="${contextPath }/book/${item.bookId}" target="_blank">${item.bookShortRecommTitle}</a></p>
					        	</c:if>
					       	</c:forEach>
				       	</dd>
			       	</dl>
			       	<dl>
	            		<c:forEach items="${subjectMap['two_left_right']}" var="item" varStatus="status">
				        	<c:if test="${status.count==1}">
				        		<dt><a href="${contextPath }/book/${item.bookId}" target="_blank"><img src="${item.bookBigImage}" onerror="this.src='${item.errorBigImage}'" width="174" height="229"/></a></dt>
		                        <dd>
		                        	<h2 class="ac">${item.bookShortRecommTitle}</h2>
									<p class="col99">${item.bookShortRecommDec}</p>
		                        </dd>
	 			        	</c:if>
				       	</c:forEach>
				       	<dd>
					       	<c:forEach items="${subjectMap['two_left_right']}" var="item" varStatus="status">
					        	<c:if test="${status.count==2||status.count==3}">
			                            <p><span>[${item.cgName}]</span><a href="${contextPath }/book/${item.bookId}" target="_blank">${item.bookShortRecommTitle}</a></p>
					        	</c:if>
					       	</c:forEach>
				       	</dd>
			       	</dl>
                </div>
            </div>
            <!--right begin-->
            <div class="wd-244 fr bords mt15">
                <div class="ce-t over new-tab6">
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
                    <ul class="new-list5 hide">
                        <c:forEach items="${bookRankMap['goldenRankByWeekList'] }" var="item" varStatus="status">
                            <%@ include file="../rank/sub_rank_golden.jsp"%>
                       </c:forEach>
                    </ul>
					<ul class="new-list5 hide">
						<c:forEach items="${bookRankMap['goldenRankByMonthList'] }" var="item"
							varStatus="status">
							<%@ include file="../rank/sub_rank_golden.jsp"%>
						</c:forEach>
					</ul>
					<ul class="new-list5 show">
                    	<c:forEach items="${bookRankMap['goldenRankByAllList'] }" var="item" varStatus="status">
                        	<%@ include file="../rank/sub_rank_golden.jsp"%>
                         </c:forEach>
                    </ul>
				</div>
            </div>
             <!--right begin-->           
        </div>
       	<!--模块二--> 
       	<c:forEach items="${subjectMap['two_banner']}" var="item" varStatus="status">
        	<li><a href="${item.bannerUrl}" target="_blank" title=""><img src="${item.bannerImage}" width="999" height="90"  /></a></li>
       	</c:forEach>
        <!--模块三-->
        <div class="bords mt10">
        	<div class="nv-sec3 over">
        		<c:forEach items="${subjectMap['three']}" var="item" varStatus="status">
        			<dl>
	                    <dt class="bords"><a href="${contextPath }/book/${item.bookId}" title=""><img src="${item.bookBigImage}" width="174" height="229" alt="" /></a></dt>
	                    <dd>
	                        <h2 class="f14"><a href="${contextPath }/book/${item.bookId}" title="">${item.bookShortRecommTitle}</a></h2>
	                        <p>作者：<a href="${contextPath }/book/listbyauthor/${item.bookAuthorId}">${item.bookAuthorNick}</a></p>
	                        <p class="col99 mt5">${item.bookShortRecommDec}</p>
	                        <p class="f14 red mt10"><a href="${contextPath }/book/${item.bookId}" target="_blank">[点击阅读]</a><!-- <a href="#" title="">[最新章节]</a> --></p>
	                    </dd>
	                </dl>
		       	</c:forEach>
            </div>
            <div class="nv-sec4 over">
            	<c:forEach items="${subjectMap['four']}" var="item" varStatus="status">
            		<dl <c:if test="${status.count==6}">class="mrno"</c:if>>
	                	<dt><a href="${contextPath }/book/${item.bookId}" title=""><img src="${item.bookBigImage}" width="118" height="148" alt="" /></a></dt>
	                    <dd>${item.bookShortRecommDec}</dd>
	                </dl>
		       	</c:forEach>
            </div>
        </div>
        
        <!--模块三 -->
        <div class="over">
            <div class="wd-lf fl mt25 sec5 gray nv-sec5">
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
	                            	<li class="tit1"><a href="#" title="">[${item.categoryName}]</a></li>
	                                <li class="tit2 <c:if test="${item.isVip==1}">vip</c:if>"><a href="${contextPath }/book/${item.id}" target="_blank" class="f14" title="">${item.name}</a></li>
	                                <li class="tit3"><a href="${pageContext.request.contextPath }/book/listbyauthor/${item.authorId }" title="">${item.authorNick}</a></li>
	                                <li class="tit1 gray1 mdhm">${item.modifyTime}</li>
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
	                            	<li class="tit1"><a href="#" title="">[${item.categoryName}]</a></li>
	                                <li class="tit2 <c:if test="${item.isVip==1}">vip</c:if>"><a href="${contextPath }/book/${item.id}" target="_blank" class="f14" title="">${item.name}</a></li>
	                                <li class="tit3"><a href="${pageContext.request.contextPath }/book/listbyauthor/${item.authorId }" title="">${item.authorNick}</a></li>
	                                <li class="tit1 gray1 mdhm">${item.modifyTime}</li>
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
	                            	<li class="tit1"><a href="#" title="">[${item.categoryName}]</a></li>
	                                <li class="tit2 <c:if test="${item.isVip==1}">vip</c:if>"><a href="${contextPath }/book/${item.id}" target="_blank" class="f14" title="">${item.name}</a></li>
	                                <li class="tit3"><a href="${pageContext.request.contextPath }/book/listbyauthor/${item.authorId }" title="">${item.authorNick}</a></li>
	                                <li class="tit1 gray1 mdhm">${item.modifyTime}</li>
	                            </ul>
		                	</c:forEach>
                        </div>
                    </div>
                </div>
            </div>
    <!--left begin-->
    <!--right begin-->
            <div class="wd-244 fr mt25">
                <div class="bords">
                    <div class="ce-t over new-tab8">
                        <span class="fl">新人榜</span>
                        <jsp:include page="../rank/rank_more.jsp">
							 <jsp:param name="action" value="newUser"/>   
						</jsp:include>
                    </div>
                    <div class="ce-c">
                        <ul class="new-list7 show">
                        	<c:forEach items="${newUserRankList }" var="item" varStatus="status">
	                       		<%@ include file="../rank/sub_rank_newuser.jsp"%>
	                       	</c:forEach>
                        </ul>
                    </div>
                </div>
                <!--免费榜-->
                <div class="bords mt10">
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
							<c:forEach items="${bookRankMap['freeBookRankByWeekList'] }" var="item"
								varStatus="status">
								<%@ include file="../rank/sub_rank_click.jsp"%>
							</c:forEach>
						</ul>
                        <ul class="new-list8 hide">
							<c:forEach items="${bookRankMap['freeBookRankByMonthList'] }" var="item"
								varStatus="status">
								<%@ include file="../rank/sub_rank_click.jsp"%>
							</c:forEach>
						</ul>
						<ul class="new-list8 show">
							<c:forEach items="${bookRankMap['freeBookRankByAllList'] }" var="item"
								varStatus="status">
								<%@ include file="../rank/sub_rank_click.jsp"%>
							</c:forEach>
						</ul>
                    </div>
                </div>
                
            </div>
    <!--right begin-->
    	</div>
    </div>
    <!--模块二-->
</div>

<!--footer-->
<%@ include file="../footer.jsp"%>
<!--footer-->

<script type="text/javascript">
	jQuery(function($) {
		$("#bannerSlideBox").slideBox({
			width : 999,
			height : 90,
			page : true,
			pageContent : [ 'z', 4, 5 ],
			speed : 3,
			circle : true,
			isWords:false
		});

		//滑动门
		$(".tabs").selfTabs();
	});
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
