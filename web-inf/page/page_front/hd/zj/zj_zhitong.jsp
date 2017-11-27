<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>铸剑计划-雁北堂2017小说征文大赛</title>
<meta name="keywords" content="铸剑计划,征文大赛,小说征文,长篇小说征文,征文比赛,征稿启事,征文启事"></meta>
<meta name="description" content="铸剑计划是雁北堂中文网斥重金打造的2017年长篇小说征文大赛，将面向全国征集悬疑小说、推理小说、科幻小说、武侠小说、魔幻小说、奇幻小说、历史小说等小说品类，对获奖作品提供丰厚的奖金稿酬，以及图书出版、影视、游戏改编等全方位IP开发。"></meta>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}hd/zj/css/reset.css">
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}hd/zj/css/zhujian.css">
</head>

<body>
<div class="nav">
    <div class="container">
        <a class="left" href="${pageContext.request.contextPath }/">
            <span class="home sprite"></span>
            <span class="topic  sprite"></span>
        </a>
        <div class="right">
            <ul class="menu clearfix">
                <li class="item">[本日金票数：<span class="gold-num">${goldenCount}</span>]</li>
                <c:choose>
                    <c:when test="${sessionScope.sessionFrontBean != null}">
                        <li class="item"><a class="link" href="${pageContext.request.contextPath }/user" title="">[${sessionScope.sessionFrontBean.userNick}]</a></li>
                        <input type="hidden" id="isLogin" name="isLogin" value="1"><!--登录状态码-->
                    </c:when>
                    <c:otherwise>
                        <%--<li class="item"><a id="jsLoginBtn" class="link" href="${pageContext.request.contextPath }/user/login?redirectUrl=<%=rootPath %>/activity/zj/zhitong" title="">[登录]</a></li>--%>
                        <li class="item"><a id="jsLoginBtn" class="link" href="javascript:void(0);" title="">[登录]</a></li>
                        <input type="hidden" id="isLogin" name="isLogin" value="0"><!--登录状态码-->
                    </c:otherwise>
                </c:choose>

            </ul>
        </div>
    </div>
</div>
<div class="popup-ebt popup-login" id="jsLoginPopup">
    <div class="wrapper">
        <form method="POST">
            <div class="body">
                <p class="account field">
                    <input type="text" class="input" placeholder="您的邮箱/手机号" /></p>
                <p class="password field"><input type="password" class="input"  placeholder="您的密码" />
                </p>
                <p class="forgot"><a href="${pageContext.request.contextPath }/user/forget" class="link">忘记密码</a></p>
                <button class="button submit" id="jsLoginSubmit" type="button">登录</button>
                <p class="warning">123123</p>
            </div>
            <div class="other">
                <h3 class="title">第三方账号登录</h3>
                <p class="logo">
                    <a href="${pageContext.request.contextPath }/user/third/weixin/login" class="link"><span class="icon icon-weixin"></span></a>
                    <a href="${pageContext.request.contextPath }/user/third/sina/login" class="link"><span class="icon icon-weibo"></span></a>
                    <a href="${pageContext.request.contextPath }/user/third/qq/login" class="link"><span class="icon icon-QQ"></span></a>
                </p>
            </div>
            <div class="options">
                <p class="option">还没有账号？<a href="${pageContext.request.contextPath }/user/register" class="link">立即注册</a>
                </p>
            </div>
        </form>
    </div>
</div>
<div class="popup-ebt popup-zj" id="jsZJPopup">
    <div class="wrapper sprite">
        <div class="head"></div>
        <div class="body">
        </div>
        <div class="foot">
        </div>
    </div>
</div>
<div class="main">
    <!--参赛阶段导航 start-->
    <div class="nav-float show" data-progress='2' id='jsNavFloat'>
        <div class="icon folder"></div>
        <ul class="menu">
            <li class="item"><a id="xuanfuButton" class="link" href="javascript:void(0)" target="_blank">我要参赛</a></li>
            <li class="item"><a class="link" href="${pageContext.request.contextPath }/activity/zj" target="_blank">设炉(预热)</a></li>
            <li class="item on"><a class="link"  href="${pageContext.request.contextPath }/activity/zj/zhitong">制铜(入围)</a></li>
            <li class="item off"><a class="link" href="javascript:void(0)">天选(决赛)</a></li>
        </ul>
    </div>
    <!--参赛阶段导航 end-->
    <!--制铜主题 start-->
    <div class="subject listed">
        <div class="container">
            <div class="top sprite">
            </div>
            <div class="sum">
                <span class="img sprite"></span>
            </div>
            <div class="join">
                <a id="cansaiButton" class="attend btn sprite" href="javascript:void(0)" target="_blank"></a>
                <a class="detail btn sprite" href="${pageContext.request.contextPath }/activity/zj" target="_blank"></a>
            </div>
            <div class="count-down">
                <p class="text">距投稿结束还有</p>
                <p class="time" id="jsTimer"><em class="bigger">xx</em><span class="normal">天</span><em class="bigger">xx</em><span class="normal">小时</span></p>
            </div>
            <div class="desc">
                <div class="left sprite"></div>
                <div class="right sprite"></div>
            </div>
        </div>
    </div>
    <!--制铜主题 end-->

    <!--作品展示 start-->
    <div class="hots">
        <div class="container">
            <div class="header sprite">
            </div>

            <!--作品前三甲展示 start-->
            <div class="tops">
                <c:forEach items="${top3List}" var="item" varStatus="status">
                    <div class="block">
                        <div class="wrapper">
                            <h3 class="heat">
                                <span class="icon sprite"></span><em class="text">${item.hot}</em>
                            </h3>
                            <a class="cover" href="${pageContext.request.contextPath }/book/${item.bookId}">
                                <img class="pic" src="${item.bigCoverImage}" alt="">
                            </a>
                            <h4 class="book-name">${item.bookName}</h4>
                            <p class="author"><em class="text">${item.authorName}</em><em class="type">${item.categoryName}</em></p>
                            <div class="vote">
                                <input type="hidden" value="${item.bookId}" name="bookId" class="book-id"><!--书籍编号-->
                                <button class="gold sprite" type="button"></button>
                                <button class="tip sprite" type="button"></button>
                            </div>
                            <p class="gold text">
                                <c:if test="${null!=item.hdZhuJianScoreDetail}">
                                    <span class="type">编辑</span><span class="name">${item.hdZhuJianScoreDetail.username}</span>投票+<span class="num">${item.hdZhuJianScoreDetail.score}</span> HOT值
                                </c:if>
                            </p>
                            <p class="tip text">
                                <c:if test="${null!=item.userRewardResBean}">
                                     <c:if test="${item.userRewardResBean.rewardType=='1' }">
                                    <span class="type">粉丝</span><span class="name">${item.userRewardResBean.fromUserNick}</span>打赏<span class="icon sprite"></span>${item.userRewardResBean.rewardName }X<span class="num">${item.userRewardResBean.rewardCount}</span>
                                    </c:if>
                                    <c:if test="${item.userRewardResBean.rewardType!='1' }">
                                    <span class="type">粉丝</span><span class="name">${item.userRewardResBean.fromUserNick}</span>打赏<span class="icon sprite holiday"></span>${item.userRewardResBean.rewardName }X<span class="num">${item.userRewardResBean.rewardCount}</span>
                                    </c:if>                                </c:if>
                            </p>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <!--作品前三甲展示 end-->

            <!--作品4-12名展示 start-->
            <div class="ahead">
                <c:forEach items="${secondList}" var="item" varStatus="status">
                    <div class="block">
                        <div class="wrapper">
                            <div class="top">
                                <h3 class="heat">
                                    <span class="icon sprite"></span><em class="text">${item.hot}</em>
                                </h3>
                                <a class="cover" href="${pageContext.request.contextPath }/book/${item.bookId}">
                                    <img class="pic" src="${item.bigCoverImage}" alt="">
                                </a>
                                <h4 class="book-name">${item.bookName}</h4>
                                <p class="type">${item.categoryName}</p>
                                <p class="author">${item.authorName}</p>
                                <div class="vote">
                                    <input type="hidden" value="${item.bookId}" name="bookId" class="book-id"><!--书籍编号-->
                                    <button class="gold sprite" type="button"></button>
                                    <button class="tip sprite" type="button"></button>
                                </div>
                            </div>
                            <p class="gold text">
                                <c:if test="${null!=item.hdZhuJianScoreDetail}">
                                    <span class="type">编辑</span><span class="name">${item.hdZhuJianScoreDetail.username}</span>投票+<span class="num">${item.hdZhuJianScoreDetail.score}</span> HOT值
                                </c:if>
                            </p>
                            <p class="tip text">
                                <c:if test="${null!=item.userRewardResBean}">
                                	<c:if test="${item.userRewardResBean.rewardName=='火把' }">
                                    <span class="type">粉丝</span><span class="name">${item.userRewardResBean.fromUserNick}</span>打赏<span class="icon sprite"></span>${item.userRewardResBean.rewardName }X<span class="num">${item.userRewardResBean.rewardCount}</span>
                                    </c:if>
                                    
                                    <c:if test="${item.userRewardResBean.rewardName!='火把' }">
                                    <span class="type">粉丝</span><span class="name">${item.userRewardResBean.fromUserNick}</span>打赏<span class="icon sprite holiday"></span>${item.userRewardResBean.rewardName }X<span class="num">${item.userRewardResBean.rewardCount}</span>
                                    </c:if>
                                </c:if>
                            </p>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <!--作品4-12名展示 end-->
        </div>
    </div>
    <!--作品13-all展示 start-->
    <div class="works">
        <div class="container">
            <div class="header sprite">
            </div>
            <div class="content">
                <table id="jsPageContent">
                    <thead>
                        <tr class="item">
                            <td class="title">排名</td>
                            <td class="title">书名</td>
                            <td class="title">HOT值</td>
                            <td class="title">分类</td>
                            <td class="title">打赏情况</td>
                            <td class="title"></td>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
            <div class="page" id="jsPageCtrl">
                <a href="javascript:void(0)" class="btn prev"></a>
                <input type="hidden" rel="1" id="cur">
                <input type="hidden" rel="${total}" id="total"><!--总记录数-->
                <a href="javascript:void(0)" class="btn next"></a>
            </div>
        </div>
    </div>
    <!--作品13-all展示 end-->
</div>
<div style="display:none">
<input type="hidden" id="resourcePath" value="${sessionScope.baseUrl}">
<input type="hidden" id="hasAct" value="${ifHaveAct}">
<input type="hidden" id="rewardName" value="${rewardTool.nick}">
<input type="hidden" id="rewardImage" value="${rewardTool.image}">
<input type="hidden" id="rewardValue" value="${rewardTool.rewardValue}">
<input type="hidden" id="rewardUnit" value="${rewardTool.unit}">
<input type="hidden" id="rewardType" value="${rewardTool.type}">
</div>
<div class="footer">
    <div class="container">
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
                        <img class="pic" src="${sessionScope.baseUrl}hd/zj/images/pc-weixin.jpg" alt="雁北堂微信公众号">
                    </div>
                </div>
                <div class="box">
                    <div class="wrapper">
                        <h4 class="title">雁北堂IOS APP</h4>
                        <img class="pic" src="${sessionScope.baseUrl}hd/zj/images/pc-app.jpg" alt="雁北堂IOS APP">
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
<script type="text/javascript" src="${sessionScope.baseUrl}hd/zj/js/require.min.js" data-main="${sessionScope.baseUrl}hd/zj/config.js"></script>
</body>
</html>