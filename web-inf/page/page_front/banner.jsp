<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="common.jsp" %>
<div class="w1000">
	<div class="nav over">
    	<ul>
        	<li <c:if test="${param.menu == 'index' }">class="on"</c:if>><a href="${pageContext.request.contextPath }/" title="" >首 页</a></li>
            <li <c:if test="${param.menu == 'bookroom' }">class="on"</c:if>><a href="${pageContext.request.contextPath }/book" title="" class="a2">书 库</a></li>                                              
            <li <c:if test="${param.menu == 'rank' }">class="on"</c:if>><a href="${pageContext.request.contextPath }/rank" title="" class="a3">排行榜</a></li>
            <li <c:if test="${param.menu == 'channel_suspense' }">class="on"</c:if>><a href="${pageContext.request.contextPath }/suspense" title="" class="a4">悬疑惊悚</a></li>
            <li <c:if test="${param.menu == 'channel_women' }">class="on"</c:if>><a href="${pageContext.request.contextPath }/female" title="" class="a5">女生频道</a></li>
            <%--<li <c:if test="${param.menu == 'channel_men' }">class="on"</c:if>><a href="${pageContext.request.contextPath }/male" title="" class="a6">男生频道</a></li>--%>
            <!--<li <c:if test="${param.menu == 'channel_manhua' }">class="on"</c:if>><a href="${pageContext.request.contextPath }/flash/manhua" title="" class="a6">漫画频道</a></li>-->
            <li <c:if test="${param.menu == 'channel_manhua' }">class="on"</c:if>><a href="${pageContext.request.contextPath }/flash/strips" title="" class="a6">漫画频道</a></li>
        </ul>
    </div>
    
    <div class="nav-tilet over mt5">
    	<div class="fl tilet1">
        	<%--<a href="${pageContext.request.contextPath }/mostUpdate" title="" <c:if test="${param.menu == 'mostUpdate' }">class="on"</c:if>>日更5000</a>--%>
            <%--<a href="${pageContext.request.contextPath }/activity/zj" title="" <c:if test="${param.menu == 'zhujian' }">class="on"</c:if>>铸剑计划</a>--%>
            <a href="${pageContext.request.contextPath }/activity/zj" title="" target="_blank"><img src='${sessionScope.baseUrl}hd/zj/images/text-14.png' alt="铸剑计划"/></a>
            <a href="javascript:void(0)" title="">世界残酷物语</a>
            <a href="javascript:void(0)" title="">影视征稿</a>
            <a href="${pageContext.request.contextPath }/cjzz" title="" <c:if test="${param.menu == 'star' }">class="on"</c:if>>大咖专区</a>
        	<a href="/vote/pk2015" id="lkvote2015"><font style="color:red">雁北堂年终大决战</font></a>
        </div>
        <a class="tilet3 fr"  href="${pageContext.request.contextPath }/author/book/addinit">我要写书</a>
        <div class="w200 tilet2 fr ar">
        	<a href="${pageContext.request.contextPath }/callcenter" title="">小编办公室</a>|<a href="${pageContext.request.contextPath }/fuli" target="_blank">作家福利</a>|<a href="${pageContext.request.contextPath }/recharge/index" title="">充值</a>
        </div>
        
    </div>
    <script type="text/javascript">
    $(function(){
		$.ajax({
			type : "POST",
			dataType : "json",
			async:true,
			url : "${pageContext.request.contextPath }/vote/pk2015_isopen",
			success : function(json) {
				if (json.resBean.code != 0) {
					$("#lkvote2015").hide();
				} else {
					$("#lkvote2015").show();
				}
			}
		});
	});
	
    </script>
</div>