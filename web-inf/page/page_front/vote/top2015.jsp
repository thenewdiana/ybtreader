<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="baidu-site-verification" content="5GyDuFcAyQ" />
<meta property="wb:webmaster" content="d4230f7a301ff22c" />
<meta property="qc:admins" content="255257467665241676375" />
<title>＃雁北堂年终大决战＃</title>
<meta name="keywords" content="＃雁北堂年终大决战＃"></meta>
<meta name="description" content="2015雁北堂好书年度人气评选，快来为您喜欢的作品投上宝贵的一票吧～"></meta>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/slideBox.css"/>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/style.css"/>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/images/vote/vote.css"/>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/jquery.alert.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/main.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/tabs.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/slideBox.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/time.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/statistics_bd.js"></script>

<style type="text/css">
.css_img_reward_type_on {border:2px solid #FAC23B;margin:0 1px 4px; display:block;}
.css_img_reward_type {margin:0 1px 4px; display:block;}
</style>
</head>

<body>

<!--中间-->
<div class="body-bg">
<!--header begin-->
<%@ include file="./header.jsp"%>
<!--header end-->
        <div class="rule-body">
            <div class="h15"></div>
            <div class="topm">
                <div><a href="rule2015"><img style="width:400px" src="${sessionScope.baseUrl}pc/images/vote/rule.png" /></a><a href="best2015"><img style="width:400px" src="${sessionScope.baseUrl}pc/images/vote/bestbook.png" /></a></div>
                <div class="h30"></div>
                <!-- 第一名 -->
                <div class="top1">
                    <div class="topleft">
                        <div class="topbox p3" style="width: 172px; height: 228px;">
                            <a href="/book/${top1.book.id }"><img src="${top1.book.bigCoverImage}" onerror="this.src='${sessionScope.customUrl}book/simgs/default_book.jpg'" width="172" height="228" alt="" /></a>
                        </div>
                        <div class="h3"></div>
                        <div class="votenum">
                        	<a class="votelink" href="javascript:void();" bookId="${top1.book.id}">投票 / ${top1.voteNum}</a>
                        </div>
                    </div>
                    <div class="topright">
                        <div>
                            <a href="/book/${top1.book.id }" title="${top1.book.name }"><span class="topbname colorblack">《${top1.book.name}》</span></a><span class="f18">${top1.book.authorNick}/</span>文
                            <hr />
                        </div>
                        <div class="bdesc"><a href="/book/${top1.book.id }">${fn:escapeXml(top1.topInfo)}</a></div>
                        <div>
                            <div class="booknum">收藏 ${top1.book.collValue }</div>
                            <div class="booknum">金票  ${top1.book.goldenValue }</div>
                            <div class="clear"></div>
                            <div class="booknum">打赏  ${top1.book.rewardValue }</div>
                            <div class="booknum">点击  ${top1.book.clickValue }</div>
                            <div class="clear"></div>
                        </div>
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="h30"></div>
                <div><hr /></div>
                
                <!--Top2、Top3-->
                <div class="top23">
                    <div class="top2">
                        <div class="topleft2">
                            <div class="topbox p1" style="width: 124px; height: 168px;">
                                <a href="/book/${top2.book.id }"><img src="${top2.book.midCoverImage}" onerror="this.src='${sessionScope.customUrl}book/simgs/default_book.jpg'" width="124" height="168" alt="" /></a>
                            </div>
                            <div class="votenum">
                                <a class="votelink" href="javascript:void();" bookId="${top2.book.id}">投票 / ${top2.voteNum}</a>
                            </div>
                        </div>
                        <div class="topright2">
                            <div>
                                <a href="/book/${top2.book.id }" title="${top2.book.name }"><div class="f20b  colorblack">《${top2.topName}》</div></a><span class="f18">${top2.book.authorNick}/</span>文
                            </div>
                            <div class="bdesc2"><a href="/book/${top2.book.id }">${fn:escapeXml(top2.shortInfo)}</a></div>
                            <div>
                                <div class="booknum2">收藏 ${top2.book.collValue }</div>
                                <div class="booknum2">金票  ${top2.book.goldenValue }</div>
                                <div class="clear"></div>
                                <div class="booknum2">打赏 ${top2.book.rewardValue }</div>
                                <div class="booknum2">点击${top2.book.clickValue }</div>
                                <div class="clear"></div>
                            </div>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="top2">
                        <div class="topleft2">
                            <div class="topbox p1" style="width: 124px; height: 168px;">
                                <a href="/book/${top3.book.id }"><img src="${top3.book.midCoverImage}" onerror="this.src='${sessionScope.customUrl}book/simgs/default_book.jpg'" width="124" height="168" alt="" /></a>
                            </div>
                            <div class="votenum">
                                <a class="votelink" title="${top3.book.name }" href="javascript:void();" bookId="${top3.book.id}">投票 / ${top3.voteNum}</a>
                            </div>
                        </div>
                        <div class="topright2 bt3">
                            <div>
                                <a href="/book/${top3.book.id }"><div class="f20b  colorblack">《${top3.topName}》</div></a><span class="f18">${top3.book.authorNick}/</span>文
                            </div>
                            <div class="bdesc2"><a href="/book/${top3.book.id }">${fn:escapeXml(top3.shortInfo)}</a></div>
                            <div>
                                <div class="booknum2">收藏 ${top3.book.collValue }</div>
                                <div class="booknum2">金票  ${top3.book.goldenValue }</div>
                                <div class="clear"></div>
                                <div class="booknum2">打赏 ${top3.book.rewardValue }</div>
                                <div class="booknum2">点击${top3.book.clickValue }</div>
                                <div class="clear"></div>
                            </div>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="top15">
                    <ul class="top15header">
                        <li class="colbimg">&nbsp;</li>
                        <li class="colrank">&nbsp;</li>
                        <li class="colbname">书名</li>
                        <li class="colauthor">作者</li>
                        <li class="colfav">收藏</li>
                        <li class="colgold">金票</li>
                        <li class="colreward">打赏</li>
                        <li class="colclick">点击</li>
                        <li class="colvote">&nbsp;</li>
                    </ul>
                    <% int row = 1; %>
                    <c:forEach items="${top15 }" var="top">
                    <ul class='<%= row % 2 == 1 ? "rankalt" : "rank" %>'>
                        <li class="colbimg"><a href="/book/${top.book.id }"><img src="${top.book.smallCoverImage }" height="65"/></a></li>
                        <li class="colrank"><%= row+3 %></li>
                        <li class="colbname" style="text-align:left;white-space:nowrap"><a href="/book/${top.book.id }" title="${top.book.name }"><font style="color:black">《${top.topName}》</font></a>&nbsp;</li>
                        <li class="colauthor" style="text-align:left">${top.book.authorNick}&nbsp;</li>
                        <li class="colfav">${top.book.collValue }&nbsp;</li>
                        <li class="colgold">${top.book.goldenValue }&nbsp;</li>
                        <li class="colreward">${top.book.rewardValue }&nbsp;</li>
                        <li class="colclick">${top.book.clickValue }&nbsp;</li>
                        <li class="colvote">
                       
                        	<a class="votelink" href="javascript:void();" bookId="${top.book.id}"><div class="votenum limc">投票 / ${top.voteNum}</div></a>&nbsp;
                       
						</li>
                    </ul>
                    <% row++; %>
                    </c:forEach>
                    <div class="clear"></div>
                </div>
                <div class="top50">
                	<% row = 1; %>
                    <c:forEach items="${bookList }" var="top">
                    <ul class='<%= row % 2 == 0 ? "rank50" : "rankalt50" %>'>
                        <li class="colbname"><a href="/book/${top.book.id }"><font style="color:black"><%= row+15 %>.《${top.book.name}》</font></a>&nbsp;</li>
                        <li class="colauthor">${top.book.authorNick}&nbsp;</li>
                        <li class="colfav">${top.book.collValue }&nbsp;</li>
                        <li class="colgold">${top.book.goldenValue }&nbsp;</li>
                        <li class="colreward">${top.book.rewardValue }&nbsp;</li>
                        <li class="colclick">${top.book.clickValue }&nbsp;</li>
                        <li class="colvote">
	                        	<a class="votelink" href="javascript:void();" bookId="${top.book.id}"><div class="votenum limc">投票 / ${top.voteNum}</div></a>&nbsp;
						</li>
                    </ul>
                    <% row ++; %>
                    </c:forEach>
                    <div class="clear"></div>
                </div>
            </div>
            <div class="h30"></div>
			<div class="rule-bg-corp f20">
                <img src="${sessionScope.baseUrl}pc/images/vote/logoybt.png" /><br />
                <a href="http://www.iqiyi.com">爱奇艺</a> / <a href="http://www.letv.com">乐视</a> /
				<a href="http://cctv.cntv.cn">央视影视频道</a> / <a href="http://www.hezhongruike.com">合众睿客</a> /
				<a href="http://www.lujiangpub.com">鹭江出版社</a> / <a href="http://www.bjlhcb.com">北京联合出版社</a><br />
                <a href="http://www.tourpress.cn">广东旅游出版社</a> / <a href="http://www.pup.cn">北京大学出版社</a> /
                <a href="http://www.bhzwy.com">百花洲文艺出版社</a>
            </div>
            <div class="rule-bg-server f20 t30">
                	客服：油焖小鳄鱼：3223285096 栗子君：806311453
            </div>
        </div>
    </div>
<!--footer-->
<!-- JiaThis Button BEGIN -->
<div class="jiathis_share_slide jiathis_share_24x24" id="jiathis_share_slide" style="display:none">
<div class="jiathis_share_slide_top" id="jiathis_share_title"></div>
<div class="jiathis_share_slide_inner">
<div class="jiathis_style_24x24">
<a class="jiathis_button_cqq"></a>
<a class="jiathis_button_tsina"></a>
<a class="jiathis_button_weixin"></a>
<a class="jiathis_button_qzone"></a>
<a class="jiathis_button_"></a>
<a href="http://www.jiathis.com/share" class="jiathis jiathis_txt jtico jtico_jiathis" target="_blank"></a>
<script type="text/javascript">
var jiathis_config = {
/*
	slide:{
		divid:'ybtframe',
		pos:'right',
		gt:'true'
	}
*/
	summary:"",
	shortUrl:false,
	hideMore:false
};
</script>
<script type="text/javascript" src="http://v3.jiathis.com/code/jia.js" charset="utf-8"></script>	
<script type="text/javascript" src="http://v3.jiathis.com/code/jiathis_slide.js" charset="utf-8"></script>
</div></div></div>
<!-- JiaThis Button END -->
<script type="text/javascript">
$(function(){
	initVote();
	$("#jiathis_share_slide").hide();
});

jQuery(function($){
    
});



function initVote() {
	$(".votelink").bind("click", function() {
		if (!isLogin()) {
			return;
		}
		var obj = $(this);
		//alert($(obj).attr("bookid"));
		$.ajax({
			type : "POST",
			dataType : "json",
			data : "bookId=" + $(obj).attr("bookid"),
			async:true,
			url : "${pageContext.request.contextPath }/vote/vote2015",
			success : function(json) {
				if (json.resBean.code != 0) {
					$.MsgBox.Alert("提示", json.resBean.msg);
				} else {
					if( $(obj).parent()[0].tagName == "DIV") {
						$(obj).text("投票 / " + json.voteNum);
					} else {
						$(obj).html("<div class='votenum limc'>投票 / " + json.voteNum + "</div>");
					}
				}
			}
		});
	});
}


function isLogin() {
	var userId = "${sessionScope.sessionFrontBean.userId}";
	if (userId == null || userId == "") {
<c:if test="${is_mob==0}">
	var redirectUrl = "<%=contextPath%>/vote/best2015";
</c:if>
<c:if test="${is_mob==1}">
	var redirectUrl = "<%=contextPath%>/m/vote/best2015";
</c:if>
		window.location.href="${pageContext.request.contextPath }/user/login?redirectUrl=" + redirectUrl;	
		return false;
	}
	
	return true;
}
</script>
</body>
</html>