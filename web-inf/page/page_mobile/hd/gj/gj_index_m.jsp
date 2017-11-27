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
    <title>来测测你是什么鬼吧？</title>
    <script src="http://g.tbcdn.cn/mtb/lib-flexible/0.3.4/??flexible_css.js,flexible.js"></script>
    <script type="text/javascript" src="${sessionScope.baseUrl}pc/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="${sessionScope.baseUrl}hd/gj_m/js/jquery.cookie.js"></script>
    <script type="text/javascript" src="${sessionScope.baseUrl}hd/gj_m/js/ghost.js"></script>
    <link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}hd/gj_m/css/reset.css">
    <link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}hd/gj_m/css/base.css">
    <link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}hd/gj_m/css/m-style.css">
    <script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
</head>

<body>
<div class="wx-pic" style="display: none">
    <img src="${sessionScope.baseUrl}hd/gj_m/img/ghost-10.jpg"  id="js_wx_thumb" class="img">
</div>
<div class="ybt-one ybt-activity">
    <div class="wrapper">
        <div class="title title-one">
            <p><img src="${sessionScope.baseUrl}hd/gj_m/img/tomb.png" alt="" class="img" /><span class="text">测测</span></p>
            <p><span class="text">你是什么鬼</span><i class="question-mark">?</i></p>
        </div>
        <div class="form" id="js_form">
            <div class="form-control"><input class="input user" id="js_userInput" type="text" maxlength="12" name="yourname" placeholder="输入名字"></div>
            <div class="form-control"><a javascript="void(0)" class="input submit" id="js_userSubmit" type="button">确认</a></div>
        </div>
    </div>
    <div class="view-wrapper"></div>
</div>
<div class="ybt-two ybt-activity">
    <div class="wx-share">
        <div class="wrapper">
            <p class="text">点击右上角</p>
            <p class="text">分享到朋友圈</p>
        </div>
    </div>
    <div class="wrapper">
        <div class="title title-two">
            <p><img src="${sessionScope.baseUrl}hd/gj_m/img/tomb.png" alt="" class="img" /><span class="text user" id="js_user">噗噗噗</span></p>
            <p><span class="text">是</span><i class="text ghost" id="js_ghost_type">可爱鬼</i></p>
        </div>
        <div class="ghost-pic">
            <div class="wrapper">
                <img src="${sessionScope.baseUrl}hd/gj_m/img/ghost-1.jpg" id="js_ghost_pic" alt="" class="img">
                <div class="desc" id="js_ghost_desc">
                </div>
            </div>
            <div id="js_loading" class="loading"><img class="icon" src="${sessionScope.baseUrl}hd/gj_m/img/loading.gif"></div>
        </div>
        <div class="share-qr">
            <div class="left"><p class="text">长按识别二维码</p><p class="text">参与测试</p></div>
            <div class="right"><img src="${sessionScope.baseUrl}hd/gj_m/img/qr-code.png" class="img"></div>
        </div>
        <div class="info">
            <p class="text"><a href="https://mp.weixin.qq.com/mp/profile_ext?action=home&__biz=MzIwOTI3OTg5NA==&scene=124#wechat_redirect" class="link">关注“雁北堂”微信公众号</a>，回复“鬼节”</p>
            <p class="text">即可参与活动，赢取雁北堂专属辟邪神器！</p>
        </div>
        <div class="again">
            <button class="btn" id="js_onemore">再测一次</button>
        </div>
    </div>
</div>
<input id="appId" value="${appId}" type="hidden"/>
<input id="nonceStr" value="${nonceStr}" type="hidden"/>
<input id="timestamp" value="${timestamp}" type="hidden"/>
<input id="signature" value="${signature}" type="hidden"/>
</body>
</html>