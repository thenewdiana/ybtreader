<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><spring:message code="front.global.title"></spring:message>-用户管理中心-在线充值</title>
<link rel="stylesheet" type="text/css"
	href="${sessionScope.baseUrl}pc/css/common.css" />
<link rel="stylesheet" type="text/css"
	href="${sessionScope.baseUrl}pc/css/user.css" />
<link rel="stylesheet" type="text/css"
	href="${sessionScope.baseUrl}pc/css/style.css" />
<link rel="stylesheet" type="text/css"
	href="${sessionScope.baseUrl}pc/css/dialog.css" />
<script type="text/javascript"
	src="${sessionScope.baseUrl}pc/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/util/common.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/pay/pay.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/valid.js"></script>
<script type="text/javascript"
	src="${sessionScope.baseUrl}pc/js/statistics_bd.js"></script>
</head>
<body>
	<!--header begin-->
	<%@ include file="./user_header.jsp"%>
	<!--header end-->
	<div class="taba hide"></div>
	<div class="mt25"></div>
	<div class="body-bg">
		<div class="w1000">
			<img src="${sessionScope.baseUrl}pc/images/user/nav-2.jpg" width="954"
				height="8" alt="" />
			<div class="over u-ct">
				<div class="u-per fl">
					<%@ include file="./user_left_up.jsp"%>
					<jsp:include page="./user_left_down.jsp">
						<jsp:param name="menu" value="bank" />
					</jsp:include>
				</div>
				<!--right begin-->
				<div class="u-perrg">
					<!--tab-->
					<div class="pay-type">
						<ul>
							<li class="item on" ><a href="javascript:void(0);" title="支付宝充值">支付宝充值</a></li>
							<li class="item" ><a href="javascript:void(0);" title="银行卡充值">银行卡充值</a></li>
							<li class="item"><a href="javascript:void(0);" title="微信充值">微信充值</a></li>  
							<li class="item"><a href="javascript:void(0);" title="电话卡充值">电话卡充值</a></li>
							<li class="item" ><a href="javascript:void(0);" title="游戏卡充值">游戏卡充值</a></li>
						</ul>
					</div>
					<!--tab-->
					<!--支付宝-->
					<div class="pay-content">
						<div class="ce7 over">
							<div class="fl">
								<img src="${sessionScope.baseUrl}pc/images/user/u-img11.png"
									width="54" height="54" alt="" />
							</div>
							<div class="rg-wd fl">
								<p>支付宝（中国）网络技术有限公司是中国领先的独立第三方支付平台，是阿里巴巴集团的关联公司。</p>
								<p>无论您使用的是任何货币支付，支付宝均以人民币进行折算。</p>
								<p class="blue">
									<a href="javascript:void(0);" title="">了解更多</a>
								</p>
							</div>
						</div>
						<form action="${pageContext.request.contextPath }/recharge/api" id="alipayRechargeForm">
							<div class="ce3 ce8">
								<ul>
									<li class="item"><label>充值金额</label> <input type="text" class="wd1 wd3" id="alipay_input"
										name="rechargeValue" value="20" /><span>元（请输入整数）</span>
									</li>
									<li class="item"><label>&nbsp;</label>
										<div class="fl money">
											<p class="f12 colbb">
												单笔最低金额为<i class="red">20</i>人民币、最高金额为<i class="red">8000</i>人民币(注：人民币1元=100糖豆)
											</p>
											<c:if test="${resBean != null && resBean.code != 0 }">
												<p class="f12 colbb">
													<i class="red"><spring:message
															code="${resBean.msgKey }"></spring:message></i>
												</p>
											</c:if>
											<div id="alipayMsg" class="msg-wrapper align-left f16"></div>
										</div>
									</li>

									<li class="item mt10"><label>&nbsp;</label> <input
										type="button" class="wd2 f14 strong" value="前往充值" id="alipaySubmitBtn"
										name="btn_submit" />
									</li>
								</ul>
							</div>
						</form>
					</div>
					<!--支付宝end-->

					<!--银行卡-->
					<div class="pay-content hide">
						<dl>
							<dt class="f16">选择银行卡：(单笔最低金额为<i class="red">20</i>人民币、最高金额为<i class="red">8000</i>人民币(注：人民币1元=100糖豆))</dt>
							<dd>
								<a href="javascript:void(0);" title="" class="bank-btn" ><img
									src="${sessionScope.baseUrl}pc/images/user/cd-img5.jpg" width="139"
									height="35" alt="" /> </a>
							</dd>
							<dd>
								<a href="javascript:void(0);" title="" class="bank-btn" ><img
									src="${sessionScope.baseUrl}pc/images/user/cd-img6.jpg" width="139"
									height="35" alt="" /> </a>
							</dd>
							<dd>
								<a href="javascript:void(0);" title="" class="bank-btn" ><img
									src="${sessionScope.baseUrl}pc/images/user/cd-img7.jpg" width="139"
									height="35" alt="" /> </a>
							</dd>
							<dd>
								<a href="javascript:void(0);" title="" class="bank-btn" ><img
									src="${sessionScope.baseUrl}pc/images/user/cd-img8.jpg" width="139"
									height="35" alt="" /> </a>
							</dd>
							<dd>
								<a href="javascript:void(0);" title="" class="bank-btn" ><img
									src="${sessionScope.baseUrl}pc/images/user/cd-img9.jpg" width="139"
									height="35" alt="" /> </a>
							</dd>
							<dd>
								<a href="javascript:void(0);" title="" class="bank-btn" ><img
									src="${sessionScope.baseUrl}pc/images/user/cd-img10.jpg" width="139"
									height="35" alt="" /> </a>
							</dd>
							<dd>
								<a href="javascript:void(0);" title="" class="bank-btn" ><img
									src="${sessionScope.baseUrl}pc/images/user/cd-img11.jpg" width="139"
									height="35" alt="" /> </a>
							</dd>
							<dd>
								<a href="javascript:void(0);" title="" class="bank-btn"  ><img
									src="${sessionScope.baseUrl}pc/images/user/cd-img13.jpg" width="139"
									height="35" alt="" /> </a>
							</dd>
							<dd>
								<a href="javascript:void(0);" title="" class="bank-btn"  ><img
									src="${sessionScope.baseUrl}pc/images/user/cd-img15.jpg" width="139"
									height="35" alt="" /> </a>
							</dd>
							<dd>
								<a href="javascript:void(0);" title="" class="bank-btn" " ><img
									src="${sessionScope.baseUrl}pc/images/user/cd-img16.jpg" width="139"
									height="35" alt="" /> </a>
							</dd>
							<dd>
								<a href="javascript:void(0);" title="" class="bank-btn" ><img
									src="${sessionScope.baseUrl}pc/images/user/cd-img18.jpg" width="139"
									height="35" alt="" /> </a>
							</dd>
							<dd>
								<a href="javascript:void(0);" title="" class="bank-btn" ><img
									src="${sessionScope.baseUrl}pc/images/user/cd-img17.jpg" width="139"
									height="35" alt="" /> </a>
							</dd>
							<dd>
								<a href="javascript:void(0);" title="" class="bank-btn" ><img
									src="${sessionScope.baseUrl}pc/images/user/cd-img27.jpg" width="139"
									height="35" alt="" /> </a>
							</dd>
							<dd>
								<a href="javascript:void(0);" title="" class="bank-btn" ><img
									src="${sessionScope.baseUrl}pc/images/user/cd-img19.jpg" width="139"
									height="35" alt="" /></a>
							</dd>
						</dl>
						<form action="${pageContext.request.contextPath }/recharge/bank/api" name="bankRechargeForm" id="bankRechargeForm">
							<input id="bankCode" name="bankCode" type="hidden"/>
							<input id="bankRechargeValue" name="rechargeValue" type="hidden"/>
							<div class="discus7 bank-ta hide">
								<!--头部-->
								<div class="card-top over">
									<h2>银行卡支付</h2>
									<span id="bankName" class="fl f14">工商银行</span><span class="close10 close-btn">x</span>
								</div>
								<!--头部-->
								<!--充值金额-->
								<div class="card-ct f14">
									<dl class="over">
										<dt>充值金额</dt>
										<dd>
											<input type="radio" id="bank_20" class="bank-amount" name="bankValue" value="20">20元</input>
										</dd>
										<dd>
											<input type="radio" id="bank_50" class="bank-amount" name="bankValue" value="50">50元</input>
										</dd>
										<dd>
											<input type="radio" id="bank_100" class="bank-amount" name="bankValue" value="100">100元</input>
										</dd>
										<dt>
											<input type="radio" id="bank_other" name="bankValue" value="" ><span>其他充值金额</span></input>
											<input type="text" maxlength="4"  id="bank_input" name="inputRechargeValue" class="money1 ml5" />元</input>
										</dt>
									</dl>
								</div>
								<!--底部-->
								<div class="card-bt over">
									<a href="javascript:void(0);" id="bankSubmitBtn"  name="bank_button">前往充值</a>
									<div id="bankMsg" class="msg-wrapper fr f16"><p class="text">可获得<span class="reds f20">2000</span>糖豆</p></div>
								</div>
								<!--底部-->
							</div>
							<div class="mt25"></div>
						</form>
					</div>
					
					<!--银行卡END -->

					<!--微信支付-->
					<div class="pay-content hide">
						<dl class="ui10">
							<dd>
								<a href="javascript:void(0);" title="" id="jsWeixinBtn"><img
									src="${sessionScope.baseUrl}pc/images/user/cd-img4.jpg" width="71"
									height="71" alt="" /> </a><br /> <a href="#" title="">微信支付</a>
							</dd>
						</dl>
						<form action="${pageContext.request.contextPath }/recharge/weixin/api" name="weixinRechargeForm" id="weixinRechargeForm">
							<input id="weixinRechargeValue" name="rechargeValue" type="hidden"/>
							<div class="discus7 weixin-ta hide">
								<!--头部-->
								<div class="card-top over">
									<h2>微信支付</h2>
									<span class="close10 close-btn">X</span>
								</div>
								<!--头部-->
								<!--充值金额-->
								<div class="card-ct f14">
									<dl class="over">
										<dt>充值金额</dt>
										<dd>
											<input type="radio" id="weixin_10" class="weixin-amount" value="10" name="weixinValue" >10元</input>
										</dd>
										<dd>
											<input type="radio" id="weixin_20" name="weixinValue" class="weixin-amount" value="20"  >20元</input>
										</dd>
										<dd>
											<input type="radio" id="weixin_50" name="weixinValue"  class="weixin-amount" value="50" >50元</input>
										</dd>
										<dd>
											<input type="radio" id="weixin_100" name="weixinValue"  class="weixin-amount" value="100" >100元</input>
										</dd>
										<dt>
											<input type="radio" id="weixin_other" name="weixinValue" value=""><span>其他充值金额</span></input>
											<input type="text" maxlength="4"  id="weixin_input" name="inputWeixinValue" class="money1 ml5" />元</input>
										</dt>
									</dl>
								</div>
								<!--底部-->
								<div class="card-bt over">
									<a href="javascript:void(0);" id="weixinSubmitBtn"  name="weixin_button">前往充值</a>
									<div id="weixinMsg" class="msg-wrapper fr f16"><p class="text">可获得<span class="reds f20">1000</span>糖豆</p></div>
								</div>
								<!--底部-->
							</div>
							<div class="mt25"></div>
						</form>
					</div>
					
					<!--微信支付END-->

					<!--电话卡-->
					<div class="pay-content hide">
						<dl class="ui10 ui11">
							<c:forEach items="${mpc}" var="mpc">
								<dd>
									<a href="javascript:void(0);" class="card-btn" title="" data-ratio="${mpc.ratio}" data-code="${mpc.bankCode}" data-name="${mpc.typeName}" data-nick="${mpc.nick}"><img
										src="${sessionScope.baseUrl}pc/images/user/${mpc.image}" width="178"
										height="63" alt="${mpc.nick}" /></a>
								</dd>
							</c:forEach>
						</dl>
					</div>
					<!--电话卡结束-->

					<!--游戏卡-->
					<div class="pay-content hide">
						<dl class="ui10 ui11">
							<c:forEach items="${gp}" var="gp">
								<dd>
									<a href="javascript:void(0);" title="" class="card-btn" data-ratio="${gp.ratio}" data-code="${gp.bankCode}" data-name="${gp.typeName}" data-nick="${gp.nick}"><img
										src="${sessionScope.baseUrl}pc/images/user/${gp.image}" width="150"
										height="74" alt="${gp.nick}" /></a>
								</dd>
							</c:forEach>
						</dl>
					</div>
					<!--游戏卡结束-->

					<!--电话卡和游戏卡支付 -->
					<form action="${pageContext.request.contextPath }/recharge/yeepay/api" name="yeepayRechargeForm" id="yeepayRechargeForm">
						<input id="yeepayRechargeValue" name="rechargeValue" type="hidden"/>
						<input id="yeepayCode" name="bankCode" type="hidden"/>
						<input id="ratio" name="ratio" type="hidden"/>
					  <div class="discus7 yeepay-ta hide">
					    <!--头部-->
			        <div class="card-top over">
			        	<h2 id="yeepayType">充值类型</h2>
		            <span class="fl f14" id="yeepayCardType">充值卡类型</span>
		            <p style="color:red">请确保所选的充值额与卡面额度相同，否则将造成金额丢失。</p>
		            <span class="close10 close-btn">X</span>
			        </div>
			        <!--头部-->
			        <!--充值金额-->
			        <div class="card-ct f14">
			        	<dl class="over">
									<dt>充值金额</dt>
									<dd>
										<input type="radio" id="yeepay_20" class="yeepay-amount" name="yeepayValue" value="20">20元</input>
									</dd>
									<dd>
										<input type="radio" id="yeepay_30" class="yeepay-amount" name="yeepayValue" value="30">30元</input>
									</dd>
									<dd>
										<input type="radio" id="yeepay_50" class="yeepay-amount" name="yeepayValue" value="50">50元</input>
									</dd>
									<dd>
										<input type="radio" id="yeepay_100" class="yeepay-amount"  name="yeepayValue" value="100">100元</input>
									</dd>
									<dt>
										<input type="radio" id="yeepay_other" name="yeepayValue" value="" ><span>其他充值金额</span></input>
										<input type="text" maxlength="4"  id="yeepay_input" name="inputYeepayValue" class="money1 ml5" />元</input>
									</dt>
								</dl>
			        </div>
			        <dl class="card-ct1">
			        	<dd>
			            	<label>卡&nbsp;&nbsp;&nbsp;号：</label>
			                <input type="text" id="cardNumber" name="cardNumber" maxlength="30"/>
			            </dd>
			            <dd>
			            	<label>密&nbsp;&nbsp;&nbsp;码：</label>
			                <input type="text" id="password" name="password" maxlength="30"/>
			            </dd>
			            <dd>
			            	<label>验证码：</label><input id="randomCode" name="randomCode" type="text" class="card-img" maxlength="4"/>
			                <span><img src="<%=contextPath%>/kaptcha.jpg" width="63" height="32" alt="" class="mg" id="randomImg"/></span>
	                	<span class="f12">看不清？ <a href="javascript:void(0);" onclick="refresh_randomImg()" title="" class="red">换一张</a></span>
			            </dd>
			        </dl>
			        <!--底部-->
			        <div class="card-bt over">
			          <a href="javascript:void(0);" id="yeepay_button"  name="yeepay_button">前往充值</a>
								<div id="yeepayMsg" class="msg-wrapper fr f16"><p class="text">可获得<span class="reds f20">2000</span>糖豆</p></div>
			        </div>
					    <!--底部-->
					  </div>
						<div class="mt25"></div>
					</form>
					<!--电话卡和游戏卡支付end-->
					<div class="card3">
          	<p class="yell0w">充值提醒</p>
              <p><span class="yell0w">①</span>支付宝、网银充值最低限额20元</p>
              <p><span class="yell0w">②</span>微信充值最低限额10元</p>
              <p><span class="yell0w">③</span>手机充值卡1元=85糖豆，最低充值20元</p>
              <p><span class="yell0w">④</span>游戏点卡1元=75糖豆，最低充值20元</p>
              <p>如您在使用过 程中遇到任何问题请联系我们<span class="yell0w"> email：ebtang@ebtang.com</span></p>
          </div>
				</div>
				<!--right end-->
			</div>
		</div>
	</div>
	<input type="hidden" id="contextPath" value="<%=contextPath%>">
	<%@ include file="./user_foot.jsp"%>
	<input type="hidden" id="resourcePath" value="${sessionScope.baseUrl}">
</body>
</html>
