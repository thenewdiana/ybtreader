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

<div class="body-bg">
<!--header begin-->
<%@ include file="./header.jsp"%>
<!--header end-->
	<div class="rule-body">
            <div class="h15"></div>
            <div class="rule-main">
                <div><a href="rule2015"><img style="width:400px" src="${sessionScope.baseUrl}pc/images/vote/rule2.png" /></a><a href="pk2015"><img style="width:400px" src="${sessionScope.baseUrl}pc/images/vote/bestbook2.png" /></a></div>
                <!--评选规则-->
                <div class="rule-rules">
                    <div class="rule-rules-title">评选规则</div>
                    <div class="rule-rules-detail">
                        <div class="rule-rules-left"><img src="${sessionScope.baseUrl}pc/images/vote/book.png" /></div>
                        <div class="rule-rules-right">
                            <ul>
                                <li>（1）2015年开始创作和发布的作品。</li>
                                <li>（2）选题符合国家法律法规，作者价值观积极。</li>
                                <li>（3）不得含有色情、暴力、血腥、反动等不良内容；</li>
                                <li>（4）严禁涉嫌临摹、剽窃、侵犯他人著作权；</li>
                                <li>（5）作品为原创作品，不能抄袭，不能雷同。</li>
                            </ul>
                        </div>
                        <div class="clear"></div>
                    </div>
                </div>
                <!--评选办法-->
                <div class="rule-method">
                    <div class="rule-method-title">评选办法</div>
                    <div class="rule-method-time">
                        投票周期：<span class="timespan">2015年11月1日至2015年12月31日截止</span>
                    </div>
                    <div class="rule-method-fangfa">投票规则：<span class="ff">每天每个雁北堂用户ID共持有3票，可分别投票支持喜欢的作品，且3票不可投给重复书籍。</span></div>
                </div>
                <!--评选奖项-->
                <div class="rule-reward-item">
                    <div class="rule-reward-lvl1">2万<span class="unit">元</span></div>
                    <div class="rule-reward-lvl1-num">年度最佳作品奖 1名</div>
                </div>
                <div class="rule-reward-lvl2">
                    <div class="item">
                        <div class="amount">3千<span class="unit">元</span></div>
                        <div class="info">年度最佳新人王 1名</div>
                    </div>
                    <div class="item">
                        <div class="amount">3千<span class="unit">元</span></div>
                        <div class="info">年度最佳女王奖 1名</div>
                    </div>
                    <div class="item">
                        <div class="amount">3千<span class="unit">元</span></div>
                        <div class="info">年度的最佳悬疑王 1名</div>
                    </div>
                    <div class="item">
                        <div class="amount">3千<span class="unit">元</span></div>
                        <div class="info">年度最佳创意奖 1名</div>
                    </div>
                </div>
                <!--投票办法-->
                <div class="rule-votemethod">
                    <div class="title">投票办法</div>
                    <div class="info">微信投票，在微信进行投票拉票活动，<br />可发动读者进行转发拉票每个id可以投票一次</div>
                </div>
                <!--分享-->
                <div class="rule-share" id="ybtframe">
                    <div class="desc">雁北堂网站投票,制作投票页面,并实现分享功能,可分享到</div>
                    <div class="shareicon">
                        <div class="shareicon-desc">
                            <a href="javascript:void();" class="jiathis_button_cqq"><img class="rule-share-img" src="${sessionScope.baseUrl}pc/images/vote/shareqq.png" /></a><br />QQ好友/群
                        </div>
                        <div class="shareicon-desc">
                            <a href="javascript:void();" class="jiathis_button_tsina"><img class="rule-share-img" src="${sessionScope.baseUrl}pc/images/vote/shareweibo.png" /></a><br />新浪微博
                        </div>
                        <div class="shareicon-desc">
                            <a href="javascript:void();" class="jiathis_button_weixin"><img class="rule-share-img" src="${sessionScope.baseUrl}pc/images/vote/shareweixin.png" /></a><br />微信朋友圈
                        </div>
                        <div class="shareicon-desc">
                            <a href="javascript:void();" class="jiathis_button_qzone"><img class="rule-share-img" src="${sessionScope.baseUrl}pc/images/vote/shareqqzone.png" /></a><br />QQ空间
                        </div>
                        <div class="clear"></div>
                    </div>
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
/*
	slide:{
		divid:'ybtframe',
		pos:'none',
		gt:'true'
	},
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
$(function() {
	$("#jiathis_share_slide").hide();
});
</script>
</body>
</html>