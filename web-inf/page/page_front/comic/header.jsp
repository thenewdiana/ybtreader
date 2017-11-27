<%@ page contentType="text/html; charset=UTF-8" %>
        <!--header begin-->
        <div class="top w1000">
            <a ahref="http://www.ebtang.com/" class="link"><img class="pic" src="${sessionScope.baseUrl}pc/images/comic/logo.png"></a>
        </div>
        <div class="nav w1000">
            <ul>
            	<li><a href="<%=contextPath %>/flash/strips" title="" class="a">四格漫画</a></li>
            	<li><a href="<%=contextPath %>/flash/flash" title="" class="a2">FLASH动画</a></li>
            	<li><a href="<%=contextPath %>/flash/expression" title="" class="a5">动态表情</a></li>
            	<li><a href="<%=contextPath %>/flash/top" title="" class="a3">精品漫画</a></li>
                <li><a href="<%=contextPath %>/flash/manhua" title="" class="a4">漫画库</a></li>
            </ul>
        </div>
        <!--header end-->

        <!--service客服 begin-->
        <a class="service" href="/callcenter">
            <img src="${sessionScope.baseUrl}pc/images/comic/service.png" alt="" class="pic">
        </a>
        <!--service end-->
