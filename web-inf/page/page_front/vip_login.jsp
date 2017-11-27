<%@ page contentType="text/html; charset=UTF-8" %>
<div class="fs-shade" style="display:none" id="jsVipLogin">
	<div class="outer outer-m">
		<div class="content wrapper">
	    <div class="summary login">订阅VIP章节，请先登陆
	    </div>
	    <div class="option">
		    <dl class="item">
		      <dt><a class="btn" href="${pageContext.request.contextPath }/user/login?redirectUrl=/book/${book.id}/${chapterId}" id="jsLoginBtn">登录</a>
		      </dt>
		    </dl>
		    <dl class="item">
		      <dt><a class="btn" href="${pageContext.request.contextPath }/book/${book.id}">返回作品</a>
		      </dt>
		    </dl>
		  </div>
		</div>
	</div>
</div>