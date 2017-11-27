<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>动画表情-雁北堂中文网</title>
    <meta name="keywords" content="长江之战,长江之战书评,长江之战预售,长江之战名家推荐,蛇从革访谈"></meta>
    <meta name="description" content="蛇从革宜昌鬼事系列最新力作《大宗师：长江之战》专题，为你提供《长江之战》的各种精彩书评、名家推荐、以及预售、购买渠道"></meta>
    <link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/flash/face.css"/>
    <script type="text/javascript" src="${sessionScope.baseUrl}pc/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="${sessionScope.baseUrl}pc/js/main.js"></script>
    <script type="text/javascript" src="${sessionScope.baseUrl}pc/js/time.js"></script>
    <script type="text/javascript" src="${sessionScope.baseUrl}pc/js/statistics_bd.js"></script>
    <script type="text/javascript">
        function showbq(num){
            $(".biaoqing").hide();
            $("#bq"+num).show();
        }
    </script>
</head>
<body>
<!--header begin-->
<%@ include file="../header.jsp" %>
<!--header end-->
<%@ include file="../header_recomm.jsp" %>
<!--导航-->
<jsp:include page="../banner.jsp">
    <jsp:param name="menu" value="channel_manhua"/>
</jsp:include>
<!--中间-->
<div class="body-bg">
    <div class="content">
        <div class="top">
            <div class="nav-top">
                <ul>
                    <a href="${pageContext.request.contextPath }/flash/manhua"><li><b>漫画精选</b></li></a>
                    <a href="${pageContext.request.contextPath }/flash"><li><b>Flash动画</b></li></a>
                    <a href="${pageContext.request.contextPath }/flash/face"><li class="li-1"><b>动态表情</b></li></a>
                </ul>
            </div>
            <div class="center">
                <p>京剧表演：</p>
                <ul>
                    <a href="javascript:showbq(1)"><li style="margin-left:20px; margin-top:10px; color:#669999;"><span>【丑】</span><span>01</span><span>02</span><span>03</span><span>04</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>05</span><span>06</span><span>07</span><span>08</span><span>09</span><br/><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;10</span><span>11</span><span>12</span>
                    </li></a>
                    <a href="javascript:showbq(2)"><li style="margin-left:90px; margin-top:10px; color:#FF6600; "><span>【花】</span><span>01</span><span>02</span><span>03</span><span>04</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>05</span><span>06</span><span>07</span><span>08</span><span>09</span><br/><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;10</span><span>11</span><span>12</span>
                    </li></a>
                    <a href="javascript:showbq(3)"><li style="margin-left:90px; margin-top:10px; color:#669999;"><span>【净】</span><span>01</span><span>02</span><span>03</span><span>04</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>05</span><span>06</span><span>07</span><span>08</span><span>09</span><br/><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;10</span><span>11</span><span>12</span>
                    </li></a>
                    <a href="javascript:showbq(4)"><li style="margin-left:90px; margin-top:10px; color:#FF6600; "><span>【生】</span><span>01</span><span>02</span><span>03</span><span>04</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>05</span><span>06</span><span>07</span><span>08</span><span>09</span><br/><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;10</span><span>11</span><span>12</span>
                    </li></a>
                </ul>
            </div>
        </div>
        <!--表情1-->
        <div id="bq1" class = "biaoqing">
        <div class="Courier">
            <div style=" margin-top:100px; margin-left:50px; width:120px;">
                <img width="120" height="120"src="${sessionScope.baseUrl}pc/images/flash/chou/1.gif" style="border:1px solid #666;"/>
                <br/>
                <h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;作者：胖不墩儿</h2>

            </div>
            <ul>
                <li><img width="120" height="120"src="${sessionScope.baseUrl}pc/images/flash/chou/1.gif"/>
                    <br/><span>01</span></li>
                <li><img width="120" height="120"src="${sessionScope.baseUrl}pc/images/flash/chou/2.gif"/>
                    <br/><span>02</span>
                </li>
                <li><img width="120" height="120"src="${sessionScope.baseUrl}pc/images/flash/chou/3.gif"/>
                    <br/><span>03</span>
                </li>
                <li><img width="120" height="120"src="${sessionScope.baseUrl}pc/images/flash/chou/4.gif"/>
                    <br/><span>04</span>
                </li>

                <li><img width="120" height="120"src="${sessionScope.baseUrl}pc/images/flash/chou/5.gif"/>
                    <br/><span>05</span>
                </li>
                <li><img width="120" height="120"src="${sessionScope.baseUrl}pc/images/flash/chou/6.gif"/>
                    <br/><span>06</span>
                </li>
                <li><img width="120" height="120"src="${sessionScope.baseUrl}pc/images/flash/chou/7.gif"/>
                    <br/><span>07</span>
                </li>
                <li><img width="120" height="120"src="${sessionScope.baseUrl}pc/images/flash/chou/8.gif"/>
                    <br/><span>08</span>
                </li>
                <li><img width="120" height="120"src="${sessionScope.baseUrl}pc/images/flash/chou/9.gif"/>
                    <br/><span>09</span>
                </li>
                <li><img width="120" height="120"src="${sessionScope.baseUrl}pc/images/flash/chou/10.gif"/>
                    <br/><span>10</span>
                </li>
                <li><img width="120" height="120"src="${sessionScope.baseUrl}pc/images/flash/chou/11.gif"/>
                    <br/><span>11</span>
                </li>
                <li><img width="120" height="120"src="${sessionScope.baseUrl}pc/images/flash/chou/12.gif"/>
                    <br/><span>12</span>
                </li>
            </ul>
            <p style="position:absolute;left:526px;margin-top:450px;">注：作品版权归作者所有，本站仅用于浏览娱乐，不用于盈利等商业范畴。</p>
        </div>
        </div>
        <!--表情2-->
        <div id="bq2" class = "biaoqing hide">
            <div class="Courier">
                <div style=" margin-top:100px; margin-left:50px; width:120px;">
                    <img width="120" height="120"src="${sessionScope.baseUrl}pc/images/flash/hua/1.gif" style="border:1px solid #666;"/>
                    <br/>
                    <h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;作者：胖不墩儿</h2>

                </div>
                <ul>
                    <li><img width="120" height="120"width="120" height="120"width="120" height="120" src="${sessionScope.baseUrl}pc/images/flash/hua/1.gif"/>
                        <br/><span>01</span></li>
                    <li><img width="120" height="120"src="${sessionScope.baseUrl}pc/images/flash/hua/2.gif"/>
                        <br/><span>02</span>
                    </li>
                    <li><img width="120" height="120"src="${sessionScope.baseUrl}pc/images/flash/hua/3.gif"/>
                        <br/><span>03</span>
                    </li>
                    <li><img width="120" height="120"src="${sessionScope.baseUrl}pc/images/flash/hua/4.gif"/>
                        <br/><span>04</span>
                    </li>

                    <li><img width="120" height="120"src="${sessionScope.baseUrl}pc/images/flash/hua/5.gif"/>
                        <br/><span>05</span>
                    </li>
                    <li><img width="120" height="120"src="${sessionScope.baseUrl}pc/images/flash/hua/6.gif"/>
                        <br/><span>06</span>
                    </li>
                    <li><img width="120" height="120"src="${sessionScope.baseUrl}pc/images/flash/hua/7.gif"/>
                        <br/><span>07</span>
                    </li>
                    <li><img width="120" height="120"src="${sessionScope.baseUrl}pc/images/flash/hua/8.gif"/>
                        <br/><span>08</span>
                    </li>
                    <li><img width="120" height="120"src="${sessionScope.baseUrl}pc/images/flash/hua/9.gif"/>
                        <br/><span>09</span>
                    </li>
                    <li><img width="120" height="120"src="${sessionScope.baseUrl}pc/images/flash/hua/10.gif"/>
                        <br/><span>10</span>
                    </li>
                    <li><img width="120" height="120"src="${sessionScope.baseUrl}pc/images/flash/hua/11.gif"/>
                        <br/><span>11</span>
                    </li>
                    <li><img width="120" height="120"src="${sessionScope.baseUrl}pc/images/flash/hua/12.gif"/>
                        <br/><span>12</span>
                    </li>
                </ul>
                <p style="position:absolute;left:526px;margin-top:450px;">注：作品版权归作者所有，本站仅用于浏览娱乐，不用于盈利等商业范畴。</p>
            </div>
        </div>
        <!--表情3-->
        <div id="bq3" class = "biaoqing hide">
            <div class="Courier">
                <div style=" margin-top:100px; margin-left:50px; width:120px;">
                    <img width="120" height="120"src="${sessionScope.baseUrl}pc/images/flash/jing/1.gif" style="border:1px solid #666;"/>
                    <br/>
                    <h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;作者：胖不墩儿</h2>

                </div>
                <ul>
                    <li><img width="120" height="120"src="${sessionScope.baseUrl}pc/images/flash/jing/1.gif"/>
                        <br/><span>01</span></li>
                    <li><img width="120" height="120"src="${sessionScope.baseUrl}pc/images/flash/jing/2.gif"/>
                        <br/><span>02</span>
                    </li>
                    <li><img width="120" height="120"src="${sessionScope.baseUrl}pc/images/flash/jing/3.gif"/>
                        <br/><span>03</span>
                    </li>
                    <li><img width="120" height="120"src="${sessionScope.baseUrl}pc/images/flash/jing/4.gif"/>
                        <br/><span>04</span>
                    </li>

                    <li><img width="120" height="120"src="${sessionScope.baseUrl}pc/images/flash/jing/5.gif"/>
                        <br/><span>05</span>
                    </li>
                    <li><img width="120" height="120"src="${sessionScope.baseUrl}pc/images/flash/jing/6.gif"/>
                        <br/><span>06</span>
                    </li>
                    <li><img width="120" height="120"src="${sessionScope.baseUrl}pc/images/flash/jing/7.gif"/>
                        <br/><span>07</span>
                    </li>
                    <li><img width="120" height="120"src="${sessionScope.baseUrl}pc/images/flash/jing/8.gif"/>
                        <br/><span>08</span>
                    </li>
                    <li><img width="120" height="120"src="${sessionScope.baseUrl}pc/images/flash/jing/9.gif"/>
                        <br/><span>09</span>
                    </li>
                    <li><img width="120" height="120"src="${sessionScope.baseUrl}pc/images/flash/jing/10.gif"/>
                        <br/><span>10</span>
                    </li>
                    <li><img width="120" height="120"src="${sessionScope.baseUrl}pc/images/flash/jing/11.gif"/>
                        <br/><span>11</span>
                    </li>
                    <li><img width="120" height="120"src="${sessionScope.baseUrl}pc/images/flash/jing/12.gif"/>
                        <br/><span>12</span>
                    </li>
                </ul>
                <p style="position:absolute;left:526px;margin-top:450px;">注：作品版权归作者所有，本站仅用于浏览娱乐，不用于盈利等商业范畴。</p>
            </div>
        </div>
        <!--表情4-->
        <div id="bq4" class = "biaoqing hide">
            <div class="Courier">
                <div style=" margin-top:100px; margin-left:50px; width:120px;">
                    <img width="120" height="120"src="${sessionScope.baseUrl}pc/images/flash/sheng/1.gif" style="border:1px solid #666;"/>
                    <br/>
                    <h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;作者：胖不墩儿</h2>

                </div>
                <ul>
                    <li><img width="120" height="120"src="${sessionScope.baseUrl}pc/images/flash/sheng/1.gif"/>
                        <br/><span>01</span></li>
                    <li><img width="120" height="120"src="${sessionScope.baseUrl}pc/images/flash/sheng/2.gif"/>
                        <br/><span>02</span>
                    </li>
                    <li><img width="120" height="120"src="${sessionScope.baseUrl}pc/images/flash/sheng/3.gif"/>
                        <br/><span>03</span>
                    </li>
                    <li><img width="120" height="120"src="${sessionScope.baseUrl}pc/images/flash/sheng/4.gif"/>
                        <br/><span>04</span>
                    </li>

                    <li><img width="120" height="120"src="${sessionScope.baseUrl}pc/images/flash/sheng/5.gif"/>
                        <br/><span>05</span>
                    </li>
                    <li><img width="120" height="120"src="${sessionScope.baseUrl}pc/images/flash/sheng/6.gif"/>
                        <br/><span>06</span>
                    </li>
                    <li><img width="120" height="120"src="${sessionScope.baseUrl}pc/images/flash/sheng/7.gif"/>
                        <br/><span>07</span>
                    </li>
                    <li><img width="120" height="120"src="${sessionScope.baseUrl}pc/images/flash/sheng/8.gif"/>
                        <br/><span>08</span>
                    </li>
                    <li><img width="120" height="120"src="${sessionScope.baseUrl}pc/images/flash/sheng/9.gif"/>
                        <br/><span>09</span>
                    </li>
                    <li><img width="120" height="120"src="${sessionScope.baseUrl}pc/images/flash/sheng/10.gif"/>
                        <br/><span>10</span>
                    </li>
                    <li><img width="120" height="120"src="${sessionScope.baseUrl}pc/images/flash/sheng/11.gif"/>
                        <br/><span>11</span>
                    </li>
                    <li><img width="120" height="120"src="${sessionScope.baseUrl}pc/images/flash/sheng/12.gif"/>
                        <br/><span>12</span>
                    </li>
                </ul>
                <p style="position:absolute;left:526px;margin-top:450px;">注：作品版权归作者所有，本站仅用于浏览娱乐，不用于盈利等商业范畴。</p>
            </div>
        </div>
        <!--客服-->
        <a href="${pageContext.request.contextPath }/callcenter"><img src="${sessionScope.baseUrl}pc/images/flash/flash_kefu.jpg"
             style=" position:relative; left:200px; top:0px;"/></a>
    </div>
    <div class="sub mt15"></div>
</div>

<!--footer-->
<%@ include file="../footer.jsp" %>
<!--footer-->
</body>

</html>
