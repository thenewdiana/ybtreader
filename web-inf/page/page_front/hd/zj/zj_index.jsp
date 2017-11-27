<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
                <li class="item"><a class="link" href="javascript:AddFavorite('雁北堂文学网',location.href)">[ 收藏 ]</a></li>
                <c:choose>
                    <c:when test="${sessionScope.sessionFrontBean != null}">
                        <li class="item"><a class="link" href="${pageContext.request.contextPath }/user" title="">[${sessionScope.sessionFrontBean.userNick}]</a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="item"><a class="link" href="${pageContext.request.contextPath }/user/login?redirectUrl=<%=rootPath %>/activity/zj" title="">[登录]</a></li>
                    </c:otherwise>
                </c:choose>
                <li class="item"><a class="link" href="${pageContext.request.contextPath }/">[ 雁北堂中文网 ]</a></li>
            </ul>
        </div>
    </div>
</div>
<div class="main">
    <div class="nav-float show" data-progress="1"  id="jsNavFloat">
        <div class="icon folder"></div>
        <ul class="menu">
            <li class="item"><a class="link" href="${pageContext.request.contextPath }/author/book/listbypic?redirectUrl=<%=rootPath %>/activity/zj">我要参赛</a></li>
            <li class="item on"><a class="link"  href="${pageContext.request.contextPath }/activity/zj">设炉(预热)</a></li>
            <li class="item"><a class="link"  href="${pageContext.request.contextPath }/activity/zj/zhitong">制铜(入围)</a></li>
            <li class="item off"><a class="link"  href="javascript:void(0)">天选(决赛)</a></li>
        </ul>
    </div>
    <div class="subject">
        <div class="container">
            <div class="top sprite">
            </div>
            <div class="slogin sprite">
            </div>
            <div class="join">
                <a class="btn sprite" href="${pageContext.request.contextPath }/author/book/listbypic?redirectUrl=<%=rootPath %>/activity/zj" ></a>
            </div>
            <div class="count-down">
                <p class="text">距投稿结束还有</p>
                <p class="time" id="jsTimer"><em class="bigger">xx</em><span class="normal">天</span><em class="bigger">xx</em><span class="normal">小时</span></p>
            </div>
            <div class="sum">
                <span class="img sprite"></span>
            </div>
        </div>
    </div>
    <div class="set">
        <div class="container">
            <div class="header">
                <span class="header-img sprite"></span>
            </div>
            <div class="img sprite">
            </div>
        </div>
    </div>
    <div class="reward">
        <div class="container">
            <div class="header">
                <span class="header-img sprite"></span>
            </div>
            <div class="content">
                <div class="img sprite"></div>
                <div class="desc">
                    <h4 class="title">参与福利</h4>
                    <p class="text">1、2017年5月1日后新签约的作品将获得30~500元/千字的保底稿费，入围达6万字后，根据编辑组评定追加10元/千字或以上的金牌买断价格，稿酬从作品3万字以后开始补齐并顺延。</p>
                    <p class="text">2、同一作者入围多部作品，只要满足获奖条件则奖金叠加，不与全勤奖冲突。</p>
                    <p class="text">3、每部签约参赛作品都将获得出版成书的机会，并参与影视改编计划。</p>
                </div>
                <div class="fixed-pic">
                    <img src="${sessionScope.baseUrl}hd/zj/images/smallsword.png" >
                </div>
            </div>
        </div>
    </div>
    <div class="process">
        <div class="container">
            <div class="header">
                <span class="header-img sprite"></span>
            </div>
            <div class="content">
                <div class="box type odd">
                    <div class="left sprite"></div>
                    <div class="right sprite"></div>
                </div>
                <div class="box condition">
                    <div class="left sprite"></div>
                    <div class="right sprite"></div>
                </div>
                <div class="box certify odd">
                    <div class="left sprite"></div>
                    <div class="right sprite"></div>
                </div>
                <div class="box time">
                    <div class="left sprite"></div>
                    <div class="right sprite"></div>
                </div>
                <div class="box way odd">
                    <div class="left sprite"></div>
                    <div class="right sprite"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="rater">
        <div class="contianer">
            <div class="header">
                <span class="header-img sprite"></span>
            </div>
            <div class="content">
                <div class="grid first">
                    <div class="box">
                        <div><img class="avatar"src="${sessionScope.baseUrl}hd/zj/images/rater-1.jpg"  alt=""></div>
                        <h4 class="name">雷米</h4>
                        <p class="desc">小说《心理罪》作者</p>
                        <p class="desc">专业技术二级警督</p>
                        <p class="desc">犯罪学博士</p>
                    </div>
                    <div class="box">
                        <div><img  class="avatar" src="${sessionScope.baseUrl}hd/zj/images/rater-2.jpg" alt=""></div>
                        <h4 class="name">莲蓬</h4>
                        <p class="desc">天涯社区</p>
                        <p class="desc">“莲蓬鬼话”创始人</p>
                        <p class="desc">任职最久的首席版主</p>
                    </div>
                    <div class="box">
                        <div><img  class="avatar" src="${sessionScope.baseUrl}hd/zj/images/rater-3.jpg" alt=""></div>
                        <h4 class="name">吴又</h4>
                        <p class="desc">云莱坞创始人</p>
                        <p class="desc">著名出版人、制片人</p>
                        <p class="desc">曾创立读客图书</p>
                    </div>
                    <div class="box">
                        <div><img  class="avatar" src="${sessionScope.baseUrl}hd/zj/images/rater-4.jpg" alt=""></div>
                        <h4 class="name">许耀文</h4>
                        <p class="desc">宋城演艺</p>
                        <p class="desc">基金投资总裁</p>
                        <p class="desc"> </p>
                    </div>
                    <div class="box">
                        <div><img  class="avatar" src="${sessionScope.baseUrl}hd/zj/images/rater-5.jpg" alt=""></div>
                        <h4 class="name">罗斐</h4>
                        <p class="desc">新九州 创始人</p>
                    </div>
                    <div class="box">
                        <div><img  class="avatar" src="${sessionScope.baseUrl}hd/zj/images/rater-6.jpg" alt=""></div>
                        <h4 class="name">铁鱼</h4>
                        <p class="desc">作家、诗人</p>
                        <p class="desc">雁北堂创始人</p>
                    </div>
                </div>
                <div class="grid second">
                    <div class="box">
                        <div><img  class="avatar" src="${sessionScope.baseUrl}hd/zj/images/rater-7.jpg" alt=""></div>
                        <h4 class="name">何无忌</h4>
                        <p class="desc">小说家、影评人</p>
                        <p class="desc">爱奇艺自制剧开发中心</p>
                        <p class="desc">文学总监</p>
                    </div>
                    <div class="box">
                        <div><img  class="avatar" src="${sessionScope.baseUrl}hd/zj/images/rater-8.jpg" alt=""></div>
                        <h4 class="name">俞胜利</h4>
                        <p class="desc">《大宅门》</p>
                        <p class="desc">《大宋提刑官》</p>
                        <p class="desc">等电视剧总制片人</p>
                    </div>
                    <div class="box">
                        <div><img  class="avatar" src="${sessionScope.baseUrl}hd/zj/images/rater-9.jpg" alt=""></div>
                        <h4 class="name">凡目</h4>
                        <p class="desc">雁北堂总编</p>
                        <p class="desc">前天涯文学社区主编</p>
                    </div>
                    <div class="box">
                        <div><img  class="avatar" src="${sessionScope.baseUrl}hd/zj/images/rater-10.jpg" alt=""></div>
                        <h4 class="name">菜菜</h4>
                        <p class="desc">黑天工作室</p>
                        <p class="desc">旗下资深人气COSER</p>
                        <p class="desc">优秀的项目策划人</p>
                    </div>
                    <div class="box">
                        <div><img  class="avatar" src="${sessionScope.baseUrl}hd/zj/images/rater-11.jpg" alt=""></div>
                        <h4 class="name">蜘蛛</h4>
                        <p class="desc">现象级畅销书、超级IP</p>
                        <p class="desc">《十宗罪》缔造者</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="editor">
        <div class="container">
            <div class="header">
                <h4 class="title">编辑阵容</h4>
            </div>
            <div class="content">
                <img class="pic" src="${sessionScope.baseUrl}hd/zj/images/editors.png">
            </div>
        </div>
    </div>
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
<script type="text/javascript">
    function AddFavorite(title, url){
        try{
            window.external.AddFavorite(url, title);
        }catch(e){
            try{
                window.sidebar.addPanel(title, url, "");
            }catch(e){
                alert("抱歉，您所使用的浏览器无法完成此操作。\n\n加入收藏失败，请使用Ctrl+D进行添加");
            }
        }
    }
</script>
</html>