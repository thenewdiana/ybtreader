<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../../common_m.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <!--<meta name="flexible" content="initial-dpr=2,maximum-dpr=3" />-->
    <!--<meta name="viewport" content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">-->
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="yes" name="apple-touch-fullscreen">
    <meta content="telephone=no,email=no" name="format-detection">
    <meta name="App-Config" content="fullscreen=yes,useHistoryState=yes,transition=yes">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <script src="http://g.tbcdn.cn/mtb/lib-flexible/0.3.4/??flexible_css.js,flexible.js"></script>
    <title>铸剑计划-雁北堂2017小说征文大赛</title>
    <meta name="keywords" content="铸剑计划,征文大赛,小说征文,长篇小说征文,征文比赛,征稿启事,征文启事"></meta>
    <meta name="description" content="铸剑计划是雁北堂中文网斥重金打造的2017年长篇小说征文大赛，将面向全国征集悬疑小说、推理小说、科幻小说、武侠小说、魔幻小说、奇幻小说、历史小说等小说品类，对获奖作品提供丰厚的奖金稿酬，以及图书出版、影视、游戏改编等全方位IP开发。"></meta>
    <link rel="stylesheet" href="${sessionScope.baseUrl}hd/zj_m/css/swiper.min.css">
    <link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}hd/zj_m/css/m-zhujian.css">
</head>

<body>
<div class="nav">
    <div class="left border-box"><a href="${pageContext.request.contextPath }/m"><img class="lazy img" data-original="${sessionScope.baseUrl}hd/zj_m/images/logo.png"></a></div>
    <div class="right">
        <ul class="menu clearfix">
            <li class="item"><a class="link" href="${pageContext.request.contextPath }/m">[ 雁北堂中文网 ]</a></li>
            <c:choose>
                <c:when test="${sessionScope.sessionFrontBean != null}">
                    <li class="item"><a class="link">[${sessionScope.sessionFrontBean.userNick}]</a></li>
                </c:when>
                <c:otherwise>
                    <li class="item"><a class="link" href="${pageContext.request.contextPath }/m/user/login?redirectUrl=<%=rootPath %>/m/activity/zj" title="">[登录]</a></li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>
</div>
<section class="content" id="view">
    <div class="subject border-box">
        <div class="top sprite ">
        </div>
        <div class="slogin sprite">
        </div>
        <div class="join">
            <!--zhujian link-->
            <a class="btn sprite" href="${pageContext.request.contextPath }/author/book/listbypic" ></a>
        </div>
        <div class="count-down">
            <p class="text">距投稿结束还有</p>
            <p class="time" id="jsTimer"><em class="bigger">334</em><span class="normal">天</span><em class="bigger">00</em><span class="normal">小时</span></p>
        </div>
        <div class="story sprite">
        </div>
    </div>
    <div class="progress border-box">
        <div class="header sprite">
        </div>
        <div class="content">
            <!-- Swiper -->
            <div class="swiper-container">
                <div class="swiper-wrapper">
                    <a href="${pageContext.request.contextPath }/m/activity/zj" class="swiper-slide"><img class="pic" src="${sessionScope.baseUrl}hd/zj_m/images/progress-1.png" alt="设炉"></a>
                    <a href="${pageContext.request.contextPath }/m/activity/zj/zhitong" class="swiper-slide"><img class="pic" src="${sessionScope.baseUrl}hd/zj_m/images/progress-2.png" alt="制铜"></a>
                    <a href="javascript:void(0)" class="swiper-slide"><img class="pic" src="${sessionScope.baseUrl}hd/zj_m/images/progress-3.png" alt="天选"></a>
                </div>
                <!-- Add Navigation -->
                <div class="swiper-button-prev"></div>
                <div class="swiper-button-next"></div>
            </div>
            <!-- jQuery
            <script data-original="js/jquery-3.2.1.min.js"></script>
             Swiper JS
            <script data-original="js/swiper-3.4.2.jquery.min.js"></script>
             Initialize Swiper
            <script>
            var swiper = new Swiper('.swiper-container', {
                nextButton: '.swiper-button-next',
                prevButton: '.swiper-button-prev',
                loop:true
            });
            </script>-->
        </div>
    </div>
    <div class="reward">
        <div class="header sprite">
        </div>
        <div class="content">
            <div class="money sprite"></div>
            <div class="desc">
                <h4 class="title">参与福利</h4>
                <p class="text">1、2017年5月1日后新签约的作品将获得30~500元/千字的保底稿费，入围达6万字后，根据编辑组评定追加10元/千字或以上的金牌买断价格，稿酬从作品3万字以后开始补齐并顺延。</p>
                <p class="text">2、同一作者入围多部作品，只要满足获奖条件则奖金叠加，不与全勤奖冲突。</p>
                <p class="text">3、每部签约参赛作品都将获得出版成书的机会，并参与影视改编计划。</p>
            </div>
            <div class="fixed-pic">
                <img class="lazy img" data-original="${sessionScope.baseUrl}hd/zj_m/images/sword.png"/>
            </div>
        </div>
    </div>
    <div class="description">
        <div class="header sprite">
        </div>
        <div class="content">
            <div class="type"><img data-original="${sessionScope.baseUrl}hd/zj_m/images/desc-1.png" alt="" class="lazy img"></div>
            <div class="type even"><img data-original="${sessionScope.baseUrl}hd/zj_m/images/desc-2.png" alt="" class="lazy img"></div>
            <div class="type"><img data-original="${sessionScope.baseUrl}hd/zj_m/images/desc-3.png" alt="" class="lazy img"></div>
            <div class="type even"><img data-original="${sessionScope.baseUrl}hd/zj_m/images/desc-4.png" alt="" class="lazy img"></div>
            <div class="type"><img data-original="${sessionScope.baseUrl}hd/zj_m/images/desc-5.png" alt="" class="lazy img"></div>
        </div>
    </div>
    <div class="rater">
        <div class="header sprite">
        </div>
        <div class="content">
            <div class="row first">
                <div class="box">
                    <img class="lazy avatar" data-original="${sessionScope.baseUrl}hd/zj_m/images/rater-1.jpg"  alt="">
                    <h4 class="name">雷米</h4>
                    <p class="desc">小说《心理罪》作者</p>
                    <p class="desc">专业技术二级警督</p>
                    <p class="desc">犯罪学博士</p>
                </div>
                <div class="box">
                    <img  class="lazy avatar" data-original="${sessionScope.baseUrl}hd/zj_m/images/rater-2.jpg" alt="">
                    <h4 class="name">莲蓬</h4>
                    <p class="desc">天涯社区</p>
                    <p class="desc">“莲蓬鬼话”创始人</p>
                    <p class="desc">任职最久的首席版主</p>
                </div>
                <div class="box">
                    <img  class="lazy avatar" data-original="${sessionScope.baseUrl}hd/zj_m/images/rater-3.jpg" alt="">
                    <h4 class="name">吴又</h4>
                    <p class="desc">云莱坞创始人</p>
                    <p class="desc">著名出版人、制片人</p>
                    <p class="desc">曾创立读客图书</p>
                </div>

            </div>
            <div class="row">
                <div class="box">
                    <img  class="lazy avatar" data-original="${sessionScope.baseUrl}hd/zj_m/images/rater-4.jpg" alt="">
                    <h4 class="name">许耀文</h4>
                    <p class="desc">宋城演艺</p>
                    <p class="desc">基金投资总裁</p>
                    <p class="desc"> </p>
                </div>
                <div class="box">
                    <img  class="lazy avatar" data-original="${sessionScope.baseUrl}hd/zj_m/images/rater-5.jpg" alt="">
                    <h4 class="name">罗斐</h4>
                    <p class="desc">新九州 创始人</p>
                </div>
                <div class="box">
                    <img  class="lazy avatar" data-original="${sessionScope.baseUrl}hd/zj_m/images/rater-6.jpg" alt="">
                    <h4 class="name">铁鱼</h4>
                    <p class="desc">作家、诗人</p>
                    <p class="desc">雁北堂创始人</p>
                </div>
            </div>
            <div class="row">
                <div class="box">
                    <img  class="lazy avatar" data-original="${sessionScope.baseUrl}hd/zj_m/images/rater-7.jpg" alt="">
                    <h4 class="name">何无忌</h4>
                    <p class="desc">小说家、影评人</p>
                    <p class="desc">爱奇艺自制剧开发中心</p>
                    <p class="desc">文学总监</p>
                </div>
                <div class="box">
                    <img  class="lazy avatar" data-original="${sessionScope.baseUrl}hd/zj_m/images/rater-8.jpg" alt="">
                    <h4 class="name">俞胜利</h4>
                    <p class="desc">《大宅门》</p>
                    <p class="desc">《大宋提刑官》</p>
                    <p class="desc">等电视剧总制片人</p>
                </div>
                <div class="box">
                    <img  class="lazy avatar" data-original="${sessionScope.baseUrl}hd/zj_m/images/rater-9.jpg" alt="">
                    <h4 class="name">凡目</h4>
                    <p class="desc">雁北堂总编</p>
                    <p class="desc">前天涯文学社区主编</p>
                </div>
            </div>
            <div class="row">
                <div class="box">
                    <img  class="lazy avatar" data-original="${sessionScope.baseUrl}hd/zj_m/images/rater-10.jpg" alt="">
                    <h4 class="name">菜菜</h4>
                    <p class="desc">黑天工作室</p>
                    <p class="desc">旗下资深人气COSER</p>
                    <p class="desc">优秀的项目策划人</p>
                </div>
                <div class="box">
                    <img  class="lazy avatar" data-original="${sessionScope.baseUrl}hd/zj_m/images/rater-11.jpg" alt="">
                    <h4 class="name">蜘蛛</h4>
                    <p class="desc">现象级畅销书、超级IP</p>
                    <p class="desc">《十宗罪》缔造者</p>
                </div>
                <div class="box"></div>
            </div>
        </div>
    </div>
    <div class="editor">
        <div class="header">
            <h4 class="title">编辑阵容</h4>
        </div>
        <div class="content">
            <img class="lazy pic" data-original="${sessionScope.baseUrl}hd/zj_m/images/editors.png">
        </div>
    </div>
</section>
<div class="content">
    <div class="footer">
        <div class="rules">
            <h4 class="title">参赛规则</h4>
            <p class="text">作者拥有作品著作权，可全版权授权作品</p>
            <p class="text">选题符合国家法规法律，作者价值观积极，严禁抄袭盗文、涉黄涉暴</p>
            <p class="text">所有入围作品须签约雁北堂（北京）文化传媒有限公司，否则视为自动放弃获奖资格</p>
            <p class="text">如有违反上述规定，一经发现，主办方有权取消其参赛和获奖资格</p>
        </div>
        <div class="contact">
            <h4 class="title">
                联系方式
            </h4>
            <div class="qr-code">
                <div class="box">
                    <div class="wrapper">
                        <h4 class="title">雁北堂公众号</h4>
                        <img class="lazy pic" data-original="${sessionScope.baseUrl}hd/zj_m/images/weixin.jpg" alt="雁北堂微信公众号">
                    </div>
                </div>
                <div class="box">
                    <div class="wrapper">
                        <h4 class="title">雁北堂IOS APP</h4>
                        <img class="lazy pic" data-original="${sessionScope.baseUrl}hd/zj_m/images/app.jpg" alt="雁北堂IOS APP">
                    </div>
                </div>
            </div>
        </div>
        <div class="bottom">
            <p class="text">客服QQ : 2167265231</p>
            <p class="text">Copyright 2015 雁北堂中文网 版权所有 京ICP备161342号</p>
        </div>
    </div>
</div>
<script type="text/javascript" src="${sessionScope.baseUrl}hd/zj_m/js/require.min.js" data-main="${sessionScope.baseUrl}hd/zj_m/js/config.js"></script>
</body>
</html>