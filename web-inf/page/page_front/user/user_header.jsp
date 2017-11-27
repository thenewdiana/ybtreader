<%@ page contentType="text/html; charset=UTF-8" %>
<div class="hade-top pos_r over">
	<a href="${pageContext.request.contextPath }/" class="logo fl">雁北堂</a>
    <div class="mt25 fr w300 pos_r">
        <form action="${pageContext.request.contextPath }/book/search" method="post" id="bookSearchForm">
    	<input type="hidden" name="searchType" value="0"/>
        <input type="text" id="searchName" name="searchName" class="l-ser" value="请输入书名和作者"/>
        <span class="l-serg"></span>        
        </form>
    </div>
</div>
<div class="u-nav">
	<div class="w1000 over">
    	<ul class="fl strong f14">
        	<li class="on"><a href="${pageContext.request.contextPath }/" title="">首  页</a></li>
            <li><a href="${pageContext.request.contextPath }/book" title="">书  库</a></li>
            <li><a href="${pageContext.request.contextPath }/rank" title="">排行榜</a></li>
            <li><a href="${pageContext.request.contextPath }/suspense" title="">悬疑惊悚</a></li>
            <li><a href="${pageContext.request.contextPath }/female" title="">女生频道</a></li>
            <li><a href="${pageContext.request.contextPath }/male" title="">男生频道</a></li>
        </ul>
        <a href="#" title="客户端" class="fr"><img src="${sessionScope.baseUrl}pc/images/user/nav-1.jpg" width="142" height="43" alt="" /></a>
    </div>
</div>
