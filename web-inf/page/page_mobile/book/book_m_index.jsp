<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common_m.jsp" %>

<!DOCTYPE html>
<html>
<head>
<title>${book.name}_${book.name}全文阅读，${book.authorNick }的小说_雁北堂_阅读江湖新力量_手机版</title>
<meta name="keywords" content="${book.name}_${book.name}全文阅读，${book.authorNick }的小说_手机版"></meta>
<meta name="description" content="${book.name}是${book.authorNick }在雁北堂的原创独家首发小说, 请密切关注雁北堂中文网_手机版"></meta>
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="${sessionScope.baseUrl}mobile/css/common.css"/>
<link rel="stylesheet" href="${sessionScope.baseUrl}mobile/css/style.css"/>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/statistics_bd.js"></script>
<script type="text/javascript"  src="${sessionScope.baseUrl}mobile/js/jquery.min.js"></script>
<!--[if lt IE 9]>
<script type="text/javascript"  src="${sessionScope.baseUrl}mobile/js/html5.js"></script>
<![endif]-->
<script type="text/javascript" src="${sessionScope.baseUrl}mobile/js/main.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}mobile/js/tip.js"></script>
<link rel="stylesheet" href="${sessionScope.baseUrl}mobile/js/nativeShare/nativeShare.css"/>
<script type="text/javascript" src="${sessionScope.baseUrl}mobile/js/nativeShare/nativeShare.js"></script>
<script>
	window._bd_share_config = {
		common : {
			bdText : document.title,	
			bdDesc : document.description,	
			bdUrl : window.location.href, 	
			bdPic : ''
		},
		share : [{
			"bdSize" : 32
		}]
	}
	with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?cdnversion='+~(-new Date()/36e5)];
	
</script>
</head>
<body>
<div class="zhezhao hide"></div>
<c:if test="${source == 'app' }">
	<jsp:include page="../common/awaken_app_m.jsp"></jsp:include>
</c:if>
<header> 
<!--header begin-->
<jsp:include page="../header_m.jsp">
	 <jsp:param name="menu" value="index"/>   
</jsp:include>
<!--header end-->
</header>
<%@ include file="../header_user_m.jsp"%>
<%@ include file="../header_tips.jsp"%>
<section class="cons_cont">
	<dl class="zp_dl">
		<dt><img src="${book.bigCoverImage }"  alt="${book.name }"></dt>
		<dd>
			<h2>${book.name }</h2>
			<h3>作者：<a href="${pageContext.request.contextPath }/m/userCenter/${book.authorId }">${book.authorNick }</a>    签约级别：${book.permissionTypeCN}</h3>
			<p>金票：<span class="colf6a738">${book.goldenValue }</span></p>
			<p>点击：${book.clickValue }</p>
			<p>字数：${book.words }字</p>
			<p>状态：<span class="lzz"><c:choose><c:when test="${book.isFinish == 1 }">完成</c:when><c:otherwise>连载中...</c:otherwise></c:choose></span></p>
		</dd>
	</dl>
	<ul class="zp_link">
	<li class="zp_link_li01"><a href="${pageContext.request.contextPath }/m/book/${book.id}/${firstChapterId}">开始阅读</a></li>
		<li class="zp_link_li02 <c:if test="${isColl }">zp_link_red</c:if>"><a href="javascript:void(0);" title="heart"></a></li>
		<c:choose>
			<c:when test="${isRss }">
				<li class="rssClass zp_link_li01"><a href="javascript:void(0);" id="cancelRss">取消订阅</a></li>				
			</c:when>
			<c:otherwise>
				<li class="rssClass zp_link_li03"><a href="javascript:void(0);" id="rss">自动订阅</a></li>	
			</c:otherwise>
		</c:choose>
	</ul>
	
	<p class="zp_p interceptString" datalength="65"">${book.shotInfo }</p>
	<c:if test="${latestBookChapter != null }">
	<a href="${contextPath }/m/book/${book.id}/${book.lastChapterId}">
	<dl class="zp_new clearfix"><dt><span class="zp_new_icon"></span><span>${latestBookChapter.title }</span></dt><dd>${latestBookChapter.createTimeFormatDay }</dd></dl>
	</a>
	</c:if>
	<section class="pos-r">
	<ul class="zp_icon clearfix">
		<li class="no"><a href="javascript:void(0);" id="shares"><em class="zp_i01"></em>分享</a></li>
		<li><a href="${pageContext.request.contextPath }/m/book/${book.id}/directory"><em class="zp_i02"></em>目录</a></li>
		<li><a href="javascript:void(0);"><em class="zp_i03"></em>金票</a></li>
		<li><a href="${pageContext.request.contextPath }/m/book/${book.id}/reward"><em class="zp_i04"></em>打赏</a></li>
	</ul>
	<div id="baiduShare" class="share">
		<div id="bdsharebuttonbox" class="bdsharebuttonbox" data-tag="share_1">
		<section class=" card" id="share">
	        <dl>
	            <dt>分享到:</dt>
				<dd><a class="bds_sqq" data-cmd="sqq"></a></dd>
				<dd><a class="bds_tsina" data-cmd="tsina"></a></dd>
				<dd><a class="bds_weixin" data-cmd="weixin"></a></dd>
				<dd><a class="bds_qzone" data-cmd="qzone"></a></dd>
	        </dl>
	    </section>
    </div>
		<a onclick="shareHide();" class="share_hide"><div align="center">取消</div></a>
	</div>
	<div id="nativeShare" class="share"></div>
</section>
</section>
<section class="cons_cont">
	<ul class="zuoP_dash">
	<c:forEach items="${rewardList }" var="item">
	  	<li><span class="ds_img"><img src="${sessionScope.baseUrl}mobile/images/reward/${item.reward.image}"  title="${item.reward.nick }" alt="${item.reward.nick }"></span>
		<span class="cola21812 disb">${item.rewardTypeCount }</span>
		<span class="col898989 disb">${item.reward.unit}</span>
		</li>
	</c:forEach> 
	</ul>
	<section class="protect">
    <c:forEach items="${userRewardList }" var="item" varStatus="status">  
    <p class="ds_p <c:if test="${status.last}">no</c:if>">
	    <a href="${pageContext.request.contextPath }/m/userCenter/${item.fromUserId}"><span>${item.fromUserNick }</span></a>
	    <span class="b_num v_${item.vipValues.id }"></span><span>豪气万丈的打赏了</span><span class="daS_img ml5">
	    <c:if test="${empty item.reward.image}"><img src="${item.rewardImage}" width="20" height="20"></c:if>
    	<c:if test="${not empty item.reward.image}"><img src="${sessionScope.customUrl}reward/${item.reward.image}" width="20" height="20"></c:if></span>
	    <span class="cola21812 pl5">×${item.rewardCount }</span>
    </p>                            
		                            
    </c:forEach>	
    </section>
    <h2 class="ds_more"><a href="${pageContext.request.contextPath }/m/book/${book.id}/reward/more">全部打赏记录...</a></h2>
</section>

<section class="index_tj">
	<ul class="clearfix">
		<c:forEach items="${relatedBookFirstList }" var="item">
	    <li style="width:25%;"><a href="${pageContext.request.contextPath }/m/book/${item.id}"><img src="${item.bigCoverImage }"></a></li>
	    </c:forEach>	    
  	</ul>
  	<c:forEach items="${relatedBookSecondList }" var="item">
  	<p>
	  	<a href="${pageContext.request.contextPath }/m/book/${item.id}"><span class="col991e23">[${item.categoryName }]&nbsp;</span>${item.name }</a>
	  	<c:if test="${item.isFinish == 0 }"><em class="lz_icon">连载中...</em></c:if>
  	</p>
  	</c:forEach>
</section>
<section class="cons_cont">
	<div class="dis_title"><span class="fl">最新评论</span> <a href="${pageContext.request.contextPath }/m/book/comment?callBackUrl=m/book/${book.id}&bookId=${book.id}" class="fr"><em></em>写评论</a></div>
  	<c:forEach items="${lastestCommentList }" var="item" varStatus="status">
  	<div class="dis_pl_outer clearfix <c:if test="${status.last}">bdno</c:if>">
    	<dl class="dis_o clearfix">
      		<dt>
      			<a href="${pageContext.request.contextPath }/m/userCenter/${item.userId}"><span class="col898989">${item.userNick }</span></a><span class="b_num v_${item.vipValues.id }"></span><span class="dis_icon ${item.fansValues.mobileCss }">${item.fansValues.name }</span>
      		</dt>
      		<dd>&nbsp;${item.createTimeFormat }&nbsp;<a href="${pageContext.request.contextPath }/m/book/comment/reply?callBackUrl=m/book/${book.id}&commentId=${item.id}">回复</a> </dd>
    	</dl>
    	<p class="pt5">
    		<c:if test="${item.isTop == 1 && status.count <= 4}">
    		<span class="col339933">[置顶]</span>
    		</c:if>
    		<c:if test="${item.isHot == 1  && status.count <= 4}">
    		<span class="colcc6633">[精华]</span>
    		</c:if>
    		<span class="f12 pl5"><a href="${pageContext.request.contextPath }/m/book/${book.id}/${item.id }/comment/more">${item.title }</a></span>
    	</p>
    	<p class="f12 col898989 pt5">${item.content }</p>
    	<c:if test="${item.replyCommentList.size() > 0 }">
    	<div class="dis_pl_inner clearfix">
    		<c:forEach items="${item.replyCommentList }" var="replyItem" varStatus="status">
      		<dl class="clearfix">
        		<dt >
        			<a href="${pageContext.request.contextPath }/m/userCenter/${replyItem.userId}"><span class="col0099cc">${replyItem.userNick }</span></a><span class="b_num v_${replyItem.vipValues.id }"></span><span class="dis_icon ${replyItem.fansValues.mobileCss }">${replyItem.fansValues.name }</span>
        			：${replyItem.content }
        		</dt>
        		<dd >
        			<span class="fl col999999">${replyItem.createTimeFormat }</span>
        			<span class="fr">
        			<commauth:commauth operType="del" bookAuthorId="${book.authorId }" commentUserId="${replyItem.userId }">
        			<a href="javascript:void();" name="btn_comment_del" id="${replyItem.id }">删除</a>
        			</commauth:commauth>
        			</span>
        		</dd>
      		</dl>
      		</c:forEach>
      		<c:if test="${item.replyCommentList.size() > 6 }">      		  
      		<span class="pl_more">查看剩余<em class="pl_num"></em>条评论</span>
      		</c:if> 
    	</div>
    	</c:if>
	</div>
	</c:forEach>
  	<a class="zuoP_more" href="${pageContext.request.contextPath }/m/book/${book.id}/comment/more">查看剩余${totalComment }条评论</a>
</section>
<c:if test="${collBookList.size() > 0 }">
<section class="cons_cont">
	<h2 class="read_title col991e23">作者关注</h2>
  	<ul class="zuoP_book clearfix">
  		<c:forEach items="${collBookList }" var="item">
    	<li> <a href="${pageContext.request.contextPath }/m/book/${item.id}"><img src="${item.bigCoverImage }"></a></li>
    	</c:forEach>
  	</ul>
</section>
</c:if>
<!--footer-->
<%@ include file="../footer_m.jsp"%>
<!--footer-->
<script type="text/javascript">
	$(function(){
		saveCookie();
		initRss();
		initColl();
		initGolden();
		initCommentDel(); 	
		hasCustomReward()
		var config = {
	        url:window.location.href,
	        title:document.title,
	        desc:document.description
	    };
	    var share_obj = new nativeShare('nativeShare',config);
	});
	function hasCustomReward(){
		var name, data, imageUrl, value, unit, type,resourcePath, imgOne, imgTwo, imgThree, imgFour, rewardHtml, iconUrl;
		  imageUrl = "${rewardTool.image}";
		  if(imageUrl.length>0){
			  html='<a href="/m/book/'+'${book.id}'+'/reward"><img style="width:50px;height:50px;position:absolute;top:100px;right:20px;" src="'+imageUrl+'"/></a>';
			  $('.zp_dl').append(html).css({'position':'relative'});
		  }
	}
	function saveCookie(){
		var cookieUserId = $("#cookieUserId").val();
		if(cookieUserId){
			$.cookie("cookieUserId-"+cookieUserId+"-bookId", '${book.id }',{path: "/",expires:365});  
			$.cookie("cookieUserId-"+cookieUserId+"-bookName", '${book.name}',{path: "/",expires:365});
		}else{
			$.cookie("cookieUserId-bookId", '${book.id }',{path: "/",expires:365});  
			$.cookie("cookieUserId-bookName", '${book.name}',{path: "/",expires:365}); 
		} 
	}
	
	function initRss() {
		$(".rssClass").bind("click", function() {
			if (!isLogin()) {
				return;
			}
			
			var obj = $(this);
			var content = $(obj).html();
			
			if (content.indexOf("cancelRss") > 0) {
				var formData = "bookId=${book.id}";
				$.ajax({
					type : "POST",
					dataType : "json",
					data : formData,
					async:true,
					url : "${pageContext.request.contextPath }/m/book/delete_rss",
					success : function(json) {	
						if (json.resBean.code == 0) {						
							$(obj).removeClass("zp_link_li01");
							$(obj).addClass("zp_link_li03");
							$(obj).html("<a href=\"javascript:void(0);\" id=\"rss\">自动订阅</a>");	
							$.MsgTip.succ("取消订阅成功");
						} else {
							$.MsgTip.fail(json.resBean.msg);
						}
					}
				});
			} else {
				var formData = "bookId=${book.id}";
				$.ajax({
					type : "POST",
					dataType : "json",
					data : formData,
					async:true,
					url : "${pageContext.request.contextPath }/m/book/rss",
					success : function(json) {			
						if (json.resBean.code == 0) {			
							$(obj).removeClass("zp_link_li03");
							$(obj).addClass("zp_link_li01");
							$(obj).html("<a href=\"javascript:void(0);\" id=\"cancelRss\">取消订阅</a>");	
							$.MsgTip.succ("自动订阅成功");
						} else {
							$.MsgTip.fail(json.resBean.msg);
						}
					}
				});
			}
		});
	}
	
	function initColl() {
		$(".zp_link_li02").bind("click", function() {
			if (!isLogin()) {
				return;
			}
			
			$.ajax({
				type : "POST",
				dataType : "json",
				data : "bookId=${book.id}",
				async:true,
				url : "${pageContext.request.contextPath }/m/book/collect",
				success : function(json) {
					if (json.resBean.code != 0) {
						$.MsgTip.fail(json.resBean.msg);
					} else {
						$.MsgTip.succ("收藏成功");
					}
				}
			});
		});
	}
	
	function initGolden() {
		$(".zp_icon li").eq(2).bind("click", function() {
			if (!isLogin()) {
				return;
			}
			
			var formData = "bookId=${book.id}";
			$.ajax({
				type : "POST",
				dataType : "json",
				data : formData,
				async:true,
				url : "${pageContext.request.contextPath }/m/book/golden",
				success : function(json) {						
					if (json.resBean.code == 0) {												
						$.MsgTip.succ("金票打赏成功");	
						$(".colf6a738").text(json.golden);
					} else {
						$.MsgTip.fail(json.resBean.msg);
					}
				}
			});
		});
	}
	
	function initCommentDel() {
		$("a[name='btn_comment_del']").bind("click", function() {
			if (!isLogin()) {
				return;
			}
			
			var commentId = $(this).attr("id");
			var formData = "bookId=${book.id}&commentId=" + commentId;
			var replyDiv = $(this).parent().parent().parent();
			$.ajax({
				type : "POST",
				dataType : "json",
				data : formData,
				async:true,
				url : "${pageContext.request.contextPath }/m/book/comment/del",
				success : function(json) {						
					if (json.resBean.code == 0) {												
						$(replyDiv).remove();
					} else {
						$.MsgTip.fail(json.resBean.msg);
					}
				}
			});
		});
	}
	
	function isLogin() {
		var userId = "${sessionScope.sessionFrontBean.userId}";
		if (userId == null || userId == "") {
			var redirectUrl = "/m/book/${book.id}";
			window.location.href="${pageContext.request.contextPath }/m/user/login?redirectUrl=" + redirectUrl;	
			return false;
		}
		return true;
	}
</script>
</body>
</html>