<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common.jsp" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${book.name}_${book.name}全文阅读，${book.authorNick }的小说_雁北堂_阅读江湖新力量</title>
<meta name="keywords" content="${keywords }" />
<meta name="description" content="${book.name}是${book.authorNick }在雁北堂的原创独家首发小说, 请密切关注雁北堂中文网" />
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/common/base.css"/>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/common/popup.css"/>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/style.css"/>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/uaredirect.js" ></script>
<script type="text/javascript">uaredirect("http://m.ebtang.com/m/book/${book.id}");</script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/lib/jquery.msg.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/lib/jquery.reward.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/util/common.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/main.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/scrolling.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/statistics_bd.js"></script>

<style type="text/css">
.css_img_reward_type_on {border:2px solid #FAC23B;margin:0 1px 4px; display:block;}
.css_img_reward_type {margin:0 1px 4px; display:block;}
</style>
</head>

<body>
<!--header begin-->
<%@ include file="../header.jsp"%>
<!--header end-->
<%@ include file="../header_recomm.jsp"%>
<!--导航-->
<jsp:include page="../banner.jsp">
	 <jsp:param name="menu" value="bookroom"/>   
</jsp:include>
<!--中间-->
<div class="body-bg book-detail" id="ybtframe">
    <!--模块二-->
    <div class="w1000 bords pos_r" id="mt20">
    	<!--right begin-->
    	<div class="share" id="share">
            <dl>
                <dt>分享到:</dt>
                <dd><a href="javascript:;"><img src="${sessionScope.baseUrl}pc/images/share1.png"  width="58" height="58"/></a></dd>
                <dd><a href="javascript:;"><img src="${sessionScope.baseUrl}pc/images/share2.png"  width="58" height="58"/></a></dd>
                <dd><a href="javascript:;"><img src="${sessionScope.baseUrl}pc/images/share5.png"  width="58" height="58"/></a></dd>
                <dd><a href="javascript:;"><img src="${sessionScope.baseUrl}pc/images/share3.png"  width="58" height="58"/></a></dd>
                <dd><a href="javascript:;"><img src="${sessionScope.baseUrl}pc/images/share4.png"  width="58" height="58"/></a></dd>
            </dl>
        </div>
        <div class="zp-wdlf fl pos_r">
        	<c:choose>
        		<c:when test="${book.isFinish == 1 }">
        			<img src="${sessionScope.baseUrl}pc/images/over.jpg" width="111" height="24"/>
        		</c:when>
        		<c:otherwise>
        			<img src="${sessionScope.baseUrl}pc/images/zp-img.jpg" width="111" height="24"/>	
        		</c:otherwise>
        	</c:choose>
        	<!-- <a href="javascript:void(0);" title="分享" class="shares f14" id="shares">分享</a> -->
            <a href="javascript:void(0);" class="collect <c:if test="${isColl}">collectyes</c:if> f14" name="btn_collect">收藏（已有<strong class="red">${book.collValue }</strong>人收藏）</a>
            <div class="column <c:if test="${book.isZhuJian==2}">zhujian</c:if>">
            	<h1 class="gray1">${book.name }</h1>
                <p class="gray1 over"><span class="fl">${book.clickValue }点击 | ${book.categoryName } | ${book.words }字 | 签约级别：</span>
                <c:choose>
                <c:when test="${book.permissionType==3}">
	                <img src="${sessionScope.baseUrl}pc/images/s1.jpg" width="9" height="13" alt="" class="fl mt2" />
	                <img src="${sessionScope.baseUrl}pc/images/s1.jpg" width="9" height="13" alt="" class="fl mt2" />
	                <img src="${sessionScope.baseUrl}pc/images/s1.jpg" width="9" height="13" alt="" class="fl mt2" />
                </c:when>
                <c:otherwise>${book.permissionTypeCN}</c:otherwise>
                </c:choose></p>
                <div class="ce-c over">
                    <div class="w202 fl">
                    	<p class="bords"><img src="${book.bigCoverImage }" width="200" height="280" alt="${book.name }" /></p>
                        <div class="img1 ac" id="div_golden" style="cursor:pointer;"><p class="size">金票数</p><p class="size2">${book.goldenValue }</p></div>
                        <div class="mt20">
                        	<div class="over">
                            	 <a href="${pageContext.request.contextPath }/book/${book.id}/directory" title="目 录" class="wdpt fl"><img src="${sessionScope.baseUrl}pc/images/s5.jpg" width="63" height="33" /></a>
                                 <a href="${pageContext.request.contextPath }/book/${book.id}/${firstChapterId}" id="jsStartReading" title="开始阅读" class="fl"><img src="${sessionScope.baseUrl}pc/images/s6.jpg"  width="117" height="33" /></a>
                            </div>
                            <div class="over read-auto mt10">
                            	<span class="fl">自动订阅</span>
                            	<c:choose>
	                    			<c:when test="${isRss}">
	                    			<a href="javascript:void(0);" class="open1" ><img icps src="${sessionScope.baseUrl}pc/images/s4.jpg" width="89" height="27" class="fl ml10" /></a>
	                    			</c:when>
	                    			<c:otherwise>
	                    			<a href="javascript:void(0);" class="open1"><img src="${sessionScope.baseUrl}pc/images/s3.jpg" width="89" height="27" class="fl ml10" /></a>
	                    			</c:otherwise>
	                    		</c:choose>
                            </div>
                        </div>
                    </div>
                    <div class="w460 fr f14">
                    	<div class="minh">
                    		<pre class="note">${fn:escapeXml(book.info)}</pre>
                    	</div>
                    	<div class="book-1 mt20">
                        	《${book.name }》为雁北堂中文网签约作者[${book.authorNick }]
                        	<c:if test="${book.permissionType==0}">
                        		的原创作品，
                        	</c:if>
                        	<c:if test="${book.permissionType==1}">
                        		签约驻站的原创作品，
                        	</c:if>
                        	<c:if test="${book.permissionType==2}">
                        		非独家、首发的签约原创作品，
                        	</c:if>
                        	<c:if test="${book.permissionType==3}">
                        		独家、首发的签约原创作品，
                        	</c:if>
                        	章节由作者亲自发布，欢迎订阅、打赏、投票、并用心评价~
                        </div>
                        <div class="book-1 book-2">
                      		《${book.name }》为雁北堂中文网签约作者[${book.authorNick }]所著的虚构作品，仅代表作者个人观点，请勿将杜撰作品联系现实人物事件~
                        </div>
                        <div class="book-1 book-3">
                        	《${book.name }》是作者辛苦耕耘的心血之作，请您务必支持正版、多多宣传，便是对作者的尊重与鼓励！
                        </div>
                    </div>
                </div>
                <c:if test="${latestBookChapter != null }">
                <div class="ce-c2 over">
                	<div class="fl"><img src="${sessionScope.baseUrl}pc/images/pic/pic26.jpg" width="86" height="80" alt="最新文章" /></div>
                    <div class="rg-wd fl">
                    	<div class="c-top over"><a href="${pageContext.request.contextPath }/book/${book.id}/${latestBookChapter.id}" class="fl">${latestBookChapter.title }  >></a><span class="fr">${latestBookChapter.publishTimeFormatHour }</span></div>
                        <div class="col66 mt5">${latestBookChapter.shortContent }</div>                        
                    </div>
                    <a href="${pageContext.request.contextPath }/book/${book.id}/${latestBookChapter.id}" class="sj-rg"></a>
                </div>
                </c:if>
                <!-- 打赏 -->
                <div class="ce-c3 ce-c03 mt20" id="template_reward">
                	<form action="">
		            	<input type="hidden" name="bookId" value="${book.id }"/>
		                <input type="hidden" name="rewardType"/>
		                <dl class="col66 over">
		                	<c:forEach items="${rewardList }" var="item">
		                	<dd>
		                    	<a href="javascript:void(0);" name="btn_reward_type" id="${item.reward.id }">
		                        <img class="css_img_reward_type" src="${sessionScope.customUrl}reward/${item.reward.image}" width="66" height="66" alt="" />
		                        </a>
		                        <h2 class="red"><a href="javascript:void(0);" title="${item.reward.nick }">${item.reward.nick }</a></h2>
		                        <p>(${item.reward.rewardValue }糖豆)</p>
		                        <p>已有<strong class="red" id="${item.reward.id }">${item.rewardTypeCount }</strong>${item.reward.unit }</p>
		                    </dd>
		                	</c:forEach>                    	
		                    <dt><a href="javascript:void(0);" name="btn_submit"><img src="${sessionScope.baseUrl}pc/images/pic/pic27.jpg" alt="打赏" /></a></dt>
		                </dl>
		            </form>    
	                
	                
	                <div class="ce-c04">
                        <marquee class="reward-move-list" direction="up" width="650" height="130" loop="infinite" scrollamount="2" onmouseover=this.stop() onmouseout=this.start()>
                        	<c:forEach items="${userRewardList }" var="item">
		                    	<ul>
		                        	<li><a href="${pageContext.request.contextPath }/book/listbyauthor/${item.fromUserId }"><img src="${item.fromUserPic }" width="33" height="33" alt="${item.fromUserNick }" /></a></li>
		                            <li><strong>${item.fromUserNick }</strong><span class="v${item.vipValues.id }">&nbsp;</span></li>
		                            <li class="pa20"><em>豪气万丈</em>的打赏了</li>
		                            <c:if test="${empty item.reward.image}">
		                            	<li class="ml20"><img src="${item.rewardImage}" width="26" height="26" alt="" /></li>		                            
		                            </c:if>
		                            <c:if test="${not empty item.reward.image}">
		                            	<li class="ml20"><img src="${sessionScope.customUrl}reward/${item.reward.image}" width="26" height="26" alt="" /></li>		                            
		                            </c:if>
		                            <li class="red strong">x ${item.rewardCount }</li>
		                            <li class="fr">${item.createTimeFormat }</li>
		                        </ul>
	                        </c:forEach>
                       	</marquee>
                        <p class="reds ar"><a href="${pageContext.request.contextPath }/book/${book.id}/reward/more">更多&gt;&gt;</a></p>
                    </div>
		            <div class="clear"></div>
                </div>
                <div id="div_comment">
	                			        			        
		        </div>                 
            </div>
        </div>
       <!-- right end-->
       <!--left begin-->
       <div class="zp-wdrg fr">
      		<div class="sec ac">
            	<a href="${pageContext.request.contextPath }/book/listbyauthor/${user.id }" title=""><img src="${user.userpic}" width="80" height="80" alt="" /></a>
                <p class="strong"><a href="${pageContext.request.contextPath }/book/listbyauthor/${user.id }" title="${user.nick }">${user.nick }</a></p>
            </div>
            <!--  
            <div class="bords sec1 col99">
            	<span class="gray1">作者简介：</span>女神倒贴上来，跟我说一些不可思议的事情。房子被挖掘机挖掉之后，我们展开了同居...`
            </div>
            -->
            <div class="sec2">
            	<div class="ft1 strong"><a href="${pageContext.request.contextPath }/book/listbyauthor/${user.id }" title="">${user.nick }的其它作品</a></div>
            	<c:forEach items="${relatedBookList }" var="item">
                <dl>
                	<dt class="fl"><a href="${pageContext.request.contextPath }/book/${item.id}" title=""><img src="${item.smallCoverImage}" width="45" height="63" alt="" /></a></dt>
                    <dd>
                    	<p>作品名称</p>
                        <p class="gray1">${item.name }</p>
                    </dd>
                </dl>
                </c:forEach>
            </div>
            
            <div class="sec3">
            	<div class="tp-img"><h2 class="fl white">土豪粉丝榜</h2>
            	<a href="${pageContext.request.contextPath }/rank/fans" title="" class="fr"><img src="${sessionScope.baseUrl}pc/images/zp-img6.jpg" width="14" height="12" alt=""  class="fr" /></a>
            	</div>
                <div class="wd-244">
                    <div class="ce-c over">
                        <ul>
                        	<c:forEach items="${fansRankList }" var="item" varStatus="status">
                            	<%@ include file="../rank/sub_rank_fans.jsp"%>
                            </c:forEach>                            
                        </ul>
                    </div>
            	</div>
            </div>
            
            <div class="wd-244 ml5">
                <div class="ce-t over new-tab5 bords">
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
                    		<%@ include file="../rank/sub_rank_click.jsp"%>
                    	</c:forEach>
                    </ul>
                    <ul class="new-list4 hide">
                        <c:forEach items="${newBookRankByMonthList }" var="item" varStatus="status">
                    		<%@ include file="../rank/sub_rank_click.jsp"%>
                    	</c:forEach>
                    </ul>
                    <ul class="new-list4 show">
                        <c:forEach items="${newBookRankByAllList }" var="item" varStatus="status">
                    		<%@ include file="../rank/sub_rank_click.jsp"%>
                    	</c:forEach>
                    </ul>
                </div>
            </div>
            <div class="sec3">
            	<div class="tp-img mt8"><h2 class="white">作者关注</h2></div>
            	<c:forEach items="${collBookList }" var="item">
                <dl>
                	<dt><img src="${item.smallCoverImage}" width="45" height="63" alt="" /></dt>
                    <dd>
                    	<h2><a href="${pageContext.request.contextPath }/book/${item.id}" title="">${item.name }</a></h2>
                        <p>类别：${item.categoryName }</p>
                    </dd>
                </dl>
                </c:forEach>
            </div>   
            <div class="sec3">
            	<div class="tp-img mt8"><h2 class="white">热门标签</h2></div>
                    <div class="wd-244 ce-link over">
            	<c:forEach items="${links }" var="link">
                <a class="strong f14 hotlink" href="${link.targetUrl }" title="">${link.linkText }</a>&nbsp;
                </c:forEach>
                </div>
            </div> 
       </div>
       <!--left end-->
        <!--模块二-->
    </div>
    <form action="" id="pageForm" method="post">
    	<input type="hidden" name="bookId" value="${book.id }"/>
    	<input type="hidden" name="isShowPage" value="false"/>
    	<input type="hidden" id="tabNick" name="tabNick" value="bookComment"/>
		<input type="hidden" id="page" name="page" value="1"/>
	    <input type="hidden" id="rows" name="rows" value="10"/>
	    <input type="hidden" id="rows" name="isRss" value="${isRss}"/>
	</form>
</div>
<!--footer-->
<%@ include file="../footer.jsp"%>
<!--footer-->
<!-- JiaThis Button BEGIN -->
<div class="jiathis_share_slide jiathis_share_24x24" id="jiathis_share_slide">
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
	slide:{
		divid:'ybtframe',
		pos:'left',
		gt:'true'
	}
};
</script>
<script type="text/javascript" src="http://v3.jiathis.com/code/jia.js" charset="utf-8"></script>	
<script type="text/javascript" src="http://v3.jiathis.com/code/jiathis_slide.js" charset="utf-8"></script>
</div></div></div>
<!-- JiaThis Button END -->
<script type="text/javascript">
$(function() {
  initRss();
  initCollect();
  initReward();
  initGolden();
  loadComment("latest", 1, 30);
  $("#scrollNews").scrolling();
  getTempMark();
  hasRewardActivity();
});

function hasRewardActivity() {
  var name, data, imageUrl, value, unit, type,resourcePath, imgOne, imgTwo, imgThree, imgFour, rewardHtml, iconUrl;
  name = "${rewardTool.nick}";
  imageUrl = "${rewardTool.image}";
  value = "${rewardTool.rewardValue}";
  unit = "${rewardTool.unit}";
  type = "${rewardTool.type}";
  resourcePath = '${sessionScope.baseUrl}pc/images/activity/';
  imgOne = 'reward-holiday-130.png'; //小尺寸图片
  imgTwo = 'reward-holiday-336.png'; //书籍详情页图片
  imgThree = 'reward-holiday-400.png'; //首页铸剑入口图片
  imgFour = 'reward-holiday-btn.png'; //铸剑活动页面打赏按钮图片
  data = {};
  if (name.length > 0) {
    if ($('.book-detail').length > 0) {
      rewardHtml = '<img class="reward-btn" id="jsCustomRewardBtn" src="' + resourcePath + imgTwo + '"/>';
      $('.book-detail').append(rewardHtml);
      $('#jsCustomRewardBtn').on('click', function() {
        if (hasLogin()) {
          data.name = name;
          data.imageUrl = imageUrl;
          data.iconUrl = resourcePath + imgOne;
          data.value = value;
          data.unit = unit;
          data.defaultNum = 1;
          data.type = type;
          data.bookId='${book.id}';
          customReward.reward.init(data);
        } else {
          MsgBox.msgBox.Alert('请登录后参与活动');
        }
      });
    }
  }
}

function getTempMark() {
  var rootPath, href, data, url, bookId, chapterId, markContent;
  if (hasLogin()) {
    rootPath = "${pageContext.request.contextPath }";
    href = rootPath + "/book/${book.id}/";
    url = rootPath + "/book/temmark";
    data = {
      bookId: '${book.id}'
    };
    $.ajax({
		type: "GET",
		data: data,
		url: url,
		dataType: "json",
		cache: false,
		success: function(json) {
	    console.log(json);
	      if (json.resBean.code == 0 && json.temmark.length > 0) {
	        chapterId = json.temmark[json.temmark.length - 1].bookChapterId;
	        markContent = json.temmark[json.temmark.length - 1].markContent;
	        modifyTime=json.temmark[json.temmark.length - 1].modifyTime;
	        href += chapterId + '?hr=1&fr='+json.temmark[json.temmark.length - 1].chapterSort;
	        $('#jsStartReading').attr('href', href);
	        utilCommon.tools.cookie('ybtModifyTime', modifyTime);
	        utilCommon.tools.cookie('ybtLastReadContent', markContent);
	      }
	    }
	});
  }

}

function initRss() {
  $(".open1").bind("click", function() {
    if (!isLogin()) {
      return;
    }
    var obj = $(this);
    var content = $(obj).html();

    if (content.indexOf("icps") > 0) {
      //关闭订阅
      MsgBox.msgBox.Confirm("是否确定关闭订阅", function() {
        var formData = "bookId=${book.id}";
        $.ajax({
          type: "POST",
          dataType: "json",
          data: formData,
          async: true,
          url: "${pageContext.request.contextPath }/book/delete_rss",
          success: function(json) {
            if (json.resBean.code == 0) {
              $(obj).html("<img src='${sessionScope.baseUrl}pc/images/s3.jpg' width='89' height='27' class='fl ml10' />");
            } else {
              MsgBox.msgBox.Alert(json.resBean.msg);
            }
          }
        });
      });
    } else {
      //打开订阅
      MsgBox.msgBox.Confirm("是否确定打开订阅", function() {
        var formData = "bookId=${book.id}";
        $.ajax({
          type: "POST",
          dataType: "json",
          data: formData,
          async: true,
          url: "${pageContext.request.contextPath }/book/rss",
          success: function(json) {
            if (json.resBean.code == 0) {
              $(obj).html("<img src='${sessionScope.baseUrl}pc/images/s4.jpg' width='89' height='27' class='fl ml10' icps />");
            } else {
              MsgBox.msgBox.Alert(json.resBean.msg);
            }
          }
        });
      });
    }
  });
}

function initCollect() {
  $("a[name='btn_collect']").bind("click", function() {
    if (!isLogin()) {
      return;
    }
    var obj = $(this);
    $.ajax({
      type: "POST",
      dataType: "json",
      data: "bookId=${book.id}",
      async: true,
      url: "${pageContext.request.contextPath }/book/collect",
      success: function(json) {
        if (json.resBean.code != 0) {
          MsgBox.msgBox.Alert(json.resBean.msg);
        } else {
          $(obj).addClass("collectyes");
          $(obj).text("收藏（已有" + json.collectValue + "人收藏）");
        }
      }
    });
  });
}

function initReward() {
  var template_reward = $("#template_reward");
  var rewardForm = $(template_reward).find("form");
  var btnSubmit = $(template_reward).find("a[name='btn_submit']");
  var btnRewardType = $(template_reward).find("a[name='btn_reward_type']");
  var inputRewardType = $(template_reward).find("input[name='rewardType']");
  var strongRewardCount = $(template_reward).find(".red");

  //选择奖励
  $(btnRewardType).unbind("click");
  $(btnRewardType).bind("click", function() {
    var obj = $(this);
    var id = $(obj).attr("id");
    $(btnRewardType).each(function() {
      var tempObj = $(this);
      $(tempObj).find("img").removeClass();
      $(tempObj).find("img").addClass("css_img_reward_type");
    });

    $(obj).find("img").addClass("css_img_reward_type_on");
    $(inputRewardType).attr("value", id);
  });


  //提交
  $(btnSubmit).unbind("click");
  $(btnSubmit).bind("click", function() {
    if (!isLogin()) {  
      return;
    }

    MsgBox.msgBox.Confirm("是否确定打赏?", function() {
      var formData = $(rewardForm).serialize();
      $.ajax({
        type: "POST",
        dataType: "json",
        data: formData,
        async: true,
        url: "${pageContext.request.contextPath }/book/reward",
        success: function(json) {
          if (json.resBean.code == 0) {
            var rewardCount = json.userReward.rewardTypeCount;
            var rewardType = json.userReward.rewardType;
            $(strongRewardCount).each(function() {
              var id = $(this).attr("id");
              if (rewardType == id) {
                $(this).text(rewardCount);
              }
            });
            /* window.location.href="${pageContext.request.contextPath }/book/${book.id}"; */
          } else if (json.resBean.code == 2) {
            MsgBox.msgBox.ConfirmBtn(json.resBean.msg, "我要充值", null, function() {
              window.location.href = "${pageContext.request.contextPath }/recharge/index";
            });
          } else {
            MsgBox.msgBox.Alert(json.resBean.msg);
          }
        }
      });
    });
  });
}

function initGolden() {
  $("#div_golden").bind("click", function() {
    if (!isLogin()) {
      return;
    }
    var obj = $(this);
    MsgBox.msgBox.Confirm("是否确定进行投票", function() {
      var formData = "bookId=${book.id}";
      $.ajax({
        type: "POST",
        dataType: "json",
        data: formData,
        async: true,
        url: "${pageContext.request.contextPath }/book/golden",
        success: function(json) {
          if (json.resBean.code == 0) {
            $(obj).find(".size2").text(json.golden);
            MsgBox.msgBox.Alert("金票打赏成功");
          } else {
            MsgBox.msgBox.Alert(json.resBean.msg);
          }
        }
      });
    });
  });
}

function loadComment(tabNick, pageNoValue, pageSizeValue) {
  if (tabNick != null) {
    $("#tabNick").attr("value", tabNick);
  }
  $("#page").attr("value", pageNoValue);
  $("#rows").attr("value", pageSizeValue);
  var formData = $('#pageForm').serialize();
  var formAction = "${pageContext.request.contextPath }/comment/listbybook";
  $.ajax({
    type: "POST",
    dataType: "html",
    data: formData,
    async: true,
    url: formAction,
    success: function(html) {
      $("#div_comment").html(html);
      initComment();
      initCommentReply();
      initCommentDel();
      initCommentTop();
      initCommentHot();
      initCommentCancelHot();
      initCommentCancelTop();
    }
  });
}

function paper(pageNoValue, pageSizeValue) {
  loadComment(null, pageNoValue, pageSizeValue);
}

function paperTabNick(tabNick) {
  $("#tabNick").attr("value", tabNick);
}

function initComment() {
  var template_comment = $("#template_comment");
  $(template_comment).hide();

  var commentForm = $(template_comment).find("form");
  var btnSubmit = $(template_comment).find("a[name='btn_submit']");
  var imgRandom = $(template_comment).find("img[name='randomImg']");
  var error = $(template_comment).find(".red");

  $("a[name='btn_comment']").unbind("click");
  $("a[name='btn_comment']").bind("click", function() {
    if (!isLogin()) {
      return;
    }

    var hidden = $(template_comment).is(":hidden");
    if (hidden) {
      $(template_comment).show();
      $(imgRandom).trigger("click");
    } else {
      $(template_comment).hide();
    }
  });

  //提交
  $(btnSubmit).unbind("click");
  $(btnSubmit).bind("click", function() {
    if (!isLogin()) {
      return;
    }
    var formData = $(commentForm).serialize();
    $.ajax({
      type: "POST",
      dataType: "json",
      data: formData,
      async: true,
      url: "${pageContext.request.contextPath }/comment/addbybook",
      success: function(json) {
        $(imgRandom).trigger("click");
        if (json.resBean.code != 0) {
          $(error).text(json.resBean.msg);
        } else {
          loadComment("latest", 1, 10);
        }
      }
    });
  });

  //验证码       
  $(imgRandom).unbind("click");
  $(imgRandom).bind("click", function() {
    $(this).attr("src", "${pageContext.request.contextPath }/kaptcha.jpg?" + Math.floor(Math.random() * 100));
  });
}

function initCommentReply() {
  $("a[name='btn_comment_reply']").each(function() {
    var replyDiv = $(this).parent().parent().next("div");
    $(replyDiv).hide();
  });

  //我要回复
  $("a[name='btn_comment_reply']").unbind("click");
  $("a[name='btn_comment_reply']").bind("click", function() {
    if (!isLogin()) {
      return;
    }
    var replyDiv = $(this).parent().parent().next("div");
    var hidden = $(replyDiv).is(":hidden");
    if (hidden) {
      $(replyDiv).show();
    } else {
      $(replyDiv).hide();
    }
  });

  //提交回复
  $("input[name='btn_sumbit_comment_reply']").unbind("click");
  $("input[name='btn_sumbit_comment_reply']").bind("click", function() {
    if (!isLogin()) {
      return;
    }
    var replyForm = $(this).parent();
    var formData = $(replyForm).serialize();
    $.ajax({
      type: "POST",
      dataType: "json",
      data: formData,
      async: true,
      url: "${pageContext.request.contextPath }/comment/reply",
      success: function(json) {
        if (json.resBean.code != 0) {
          $(replyForm).find(".red").text(json.resBean.msg);
        } else {
          loadComment(null, 1, 10);
        }
      }
    });
  });
}

function initCommentDel() {
  $("a[name='btn_comment_del']").unbind("click");
  $("a[name='btn_comment_del']").bind("click", function() {
    if (!isLogin()) {
      return;
    }

    var commentId = $(this).attr("id");
    var formData = "bookId=${book.id}&commentId=" + commentId;
    MsgBox.msgBox.Confirm("是否确定删除", function() {
      $.ajax({
        type: "POST",
        dataType: "json",
        data: formData,
        async: true,
        url: "${pageContext.request.contextPath }/comment/del",
        success: function(json) {
          if (json.resBean.code != 0) {
            MsgBox.msgBox.Alert(json.resBean.msg);
          } else {
            loadComment(null, 1, 10);
          }
        }
      });
    });
  });
}

function initCommentTop() {
  $("a[name='btn_comment_top']").unbind("click");
  $("a[name='btn_comment_top']").bind("click", function() {
    if (!isLogin()) {
      return;
    }
    var commentId = $(this).attr("id");
    var formData = "bookId=${book.id}&commentId=" + commentId;
    $.ajax({
      type: "POST",
      dataType: "json",
      data: formData,
      async: true,
      url: "${pageContext.request.contextPath }/comment/top",
      success: function(json) {
        if (json.resBean.code != 0) {
          MsgBox.msgBox.Alert(json.resBean.msg);
        } else {
          MsgBox.msgBox.Alert("设置置顶成功");
        }
      }
    });
  });
}

function initCommentCancelTop() {
  $("a[name='btn_comment_canceltop']").unbind("click");
  $("a[name='btn_comment_canceltop']").bind("click", function() {
    if (!isLogin()) {
      return;
    }
    var commentId = $(this).attr("id");
    var formData = "bookId=${book.id}&commentId=" + commentId;
    $.ajax({
      type: "POST",
      dataType: "json",
      data: formData,
      async: true,
      url: "${pageContext.request.contextPath }/comment/canceltop",
      success: function(json) {
        if (json.resBean.code != 0) {
          MsgBox.msgBox.Alert(json.resBean.msg);
        } else {
          MsgBox.msgBox.Alert("取消置顶成功");
        }
      }
    });
  });
}

function initCommentHot() {
  $("a[name='btn_comment_hot']").unbind("click");
  $("a[name='btn_comment_hot']").bind("click", function() {
    if (!isLogin()) {
      return;
    }
    var commentId = $(this).attr("id");
    var formData = "bookId=${book.id}&commentId=" + commentId;
    $.ajax({
      type: "POST",
      dataType: "json",
      data: formData,
      async: true,
      url: "${pageContext.request.contextPath }/comment/hot",
      success: function(json) {
        if (json.resBean.code != 0) {
          MsgBox.msgBox.Alert(json.resBean.msg);
        } else {
          MsgBox.msgBox.Alert("设置精华成功");
        }
      }
    });
  });
}


function initCommentCancelHot() {
  $("a[name='btn_comment_cancelhot']").unbind("click");
  $("a[name='btn_comment_cancelhot']").bind("click", function() {
    if (!isLogin()) {
      return;
    }
    var commentId = $(this).attr("id");
    var formData = "bookId=${book.id}&commentId=" + commentId;
    $.ajax({
      type: "POST",
      dataType: "json",
      data: formData,
      async: true,
      url: "${pageContext.request.contextPath }/comment/cancelhot",
      success: function(json) {
        if (json.resBean.code != 0) {
          MsgBox.msgBox.Alert(json.resBean.msg);
        } else {
          MsgBox.msgBox.Alert("取消精华成功");
        }
      }
    });
  });
}

function isLogin() {
  var userId = "${sessionScope.sessionFrontBean.userId}";
  if (userId == null || userId == "") {
    var redirectUrl = "/book/${book.id}";
    window.location.href = "${pageContext.request.contextPath }/user/login?redirectUrl=" + redirectUrl;
    return false;
  }

  return true;
}

function hasLogin() {
  var userId = "${sessionScope.sessionFrontBean.userId}";
  if (userId == null || userId == "") {
    return false;
  }
  return true;
}
</script>
</body>
</html>