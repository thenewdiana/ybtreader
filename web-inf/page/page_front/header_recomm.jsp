<%@ page contentType="text/html; charset=UTF-8" %>
<div class="hade-top pos_r over">
	<a href="${pageContext.request.contextPath }/" class="logo fl">雁北堂</a>	
    <div class="mt25 fl w300 pos_r mr115">
    	<form action="${pageContext.request.contextPath }/book/search" method="post" id="bookSearchForm">
    	<input type="hidden" name="searchType" value="0"/>
        <input type="text" id="searchName" name="searchName" class="l-ser" value="请输入书名/作者"/>
        <span class="l-serg"></span>
        <p class="mt5">热词：
        <c:forEach items="${sessionScope.hotwordsList}" var="item" varStatus="status">
            <c:if test="${item.bannerUrl==null or item.bannerUrl==''}">
                <a href="javascript:void(0);" onclick="doHotWords('${item.bookRecommTitle}')">${item.bookRecommTitle}</a>
            </c:if>
            <c:if test="${item.bannerUrl!=null and item.bannerUrl!=''}">
                <a href="${item.bannerUrl}" target="_blank">${item.bookRecommTitle}</a>
            </c:if>
        </c:forEach>
        <a href="${pageContext.request.contextPath }/activity/zj " target="_blank"><strong>铸剑</strong></a>
        <strong>hot</strong>
        </p>
        </form>
        <script type="text/javascript">
        	jQuery(function($) {
        		if($(".interceptStringHead")){
					$(".interceptStringHead").each(function(i,e){
						var data = $(e).text();
						var length = $(e).attr("datalength");
						if(length<data.length){
							var returnString = data.substr(0,length);
							$(e).text(returnString+"...");
						}
			        });
				}
        	});
        	
        
        
        	function doHotWords(word) {
        		$(".l-ser").attr("value", word);
        		$(".l-serg").trigger("click");
        	}
        	
        	function collection(bookId){
        		if (!isLoginIndex(bookId)) {
					return;
				}
        		$.ajax({
					type : "POST",
					dataType : "json",
					data : "bookId="+bookId,
					async:true,
					url : "${pageContext.request.contextPath }/book/collect",
					success : function(json) {
						if (json.resBean.code != 0) {
							$.MsgBox.Alert("提示", json.resBean.msg);
						}
					}
				});
        	}
        	
        	function isLoginIndex(bookId) {
				var userId = "${sessionScope.sessionFrontBean.userId}";
				if (userId == null || userId == "") {
					var redirectUrl = "/book/"+bookId;
					window.location.href="${pageContext.request.contextPath }/user/login?redirectUrl=" + redirectUrl;	
					return false;
				}
				
				return true;
			}
        </script>
    </div>
    <div class="mt20 w230 fl">
    	<c:forEach items="${sessionScope.rightUpList}" var="item" varStatus="status">
    		<c:if test="${status.count==1}">
    			<a href="${pageContext.request.contextPath }/book/${item.bookId}" target="_blank"><img src="${item.bookSmallImage}" onerror="this.src='${item.errorSmallImage}'" width="50" height="70" class="fl"/></a>
		        <div class="scw fr"><a href="javascript:collection(${item.bookId})" title="">收藏</a></div>
		        <div class="fr wf1">
		            <p>[推荐] <a href="${pageContext.request.contextPath }/book/${item.bookId}" target="_blank">${item.bookShortRecommTitle}</a></p>
		            <P class="interceptStringHead" datalength="15">${item.bookRecommDec}</P>
		        </div>
    		</c:if>
    	</c:forEach>    	
    </div>
</div>
