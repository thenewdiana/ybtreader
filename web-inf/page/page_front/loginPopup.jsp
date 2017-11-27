<%@ page contentType="text/html; charset=UTF-8" %>
<div class="popup-ebt popup-login" id="jsLoginPopup">
    <div class="wrapper">
        <form method="POST">
            <div class="body">
                <p class="account field">
                    <input type="text" class="input" placeholder="您的邮箱/手机号" /></p>
                <p class="password field"><input type="password" class="input"  placeholder="您的密码" />
                </p>
                <p class="forgot"><a href="${pageContext.request.contextPath }/user/forget" target="_blank" class="link">忘记密码</a></p>
                <button class="button submit" id="jsLoginSubmit" type="button">登录</button>
                <p class="warning">123123</p>
            </div>
            <div class="other">
                <h3 class="title">第三方账号登录</h3>
                <p class="item">
                    <a href="${pageContext.request.contextPath }/user/third/weixin/login" target="_blank" class="link"><span class="icon icon-weixin"></span></a>
                    <a href="${pageContext.request.contextPath }/user/third/sina/login" target="_blank" class="link"><span class="icon icon-weibo"></span></a>
                    <a href="${pageContext.request.contextPath }/user/third/qq/login" target="_blank" class="link"><span class="icon icon-QQ"></span></a>
                </p>
            </div>
            <div class="options">
                <p class="option">还没有账号？<a href="${pageContext.request.contextPath }/user/register" target="_blank" class="link">立即注册</a>
                </p>
            </div>
        </form>
    </div>
</div>