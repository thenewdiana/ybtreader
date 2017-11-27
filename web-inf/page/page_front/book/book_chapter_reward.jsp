<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common.jsp" %>	
		<div class="ar"><a href="javascript:void(0);" name="btn_close"><img src="${sessionScope.baseUrl}pc/images/close.jpg" width="19" height="20" alt="" /></a></div>
        <div class="ce-c3 over mt5">
        	<form action="">
            	<input type="hidden" name="bookId" value="${book.id }"/>
                <input type="hidden" name="rewardType"/>
                <dl class="col66">
                	<c:forEach items="${rewardList }" var="item">
                	<dd>
                    	<a href="javascript:void(0);" name="btn_reward_type" id="${item.reward.id }">
                        <img class="css_img_reward_type" src="${sessionScope.customUrl}reward/${item.reward.image}" width="98" height="98" alt="" />
                        </a>
                        <h2 class="red"><a href="javascript:void(0);" title="${item.reward.nick }">${item.reward.nick }</a></h2>
                        <p>（${item.reward.rewardValue }糖豆）</p>
                        <p>已有<strong class="red" id="${item.reward.id }">${item.rewardTypeCount }</strong>个</p>
                    </dd>
                	</c:forEach>                    	
                    <dt><a href="javascript:void(0);" name="btn_submit"><img src="${sessionScope.baseUrl}pc/images/pic/pic27.jpg" width="65" height="146" alt="" /></a></dt>
                </dl>
            </form>            
        </div>