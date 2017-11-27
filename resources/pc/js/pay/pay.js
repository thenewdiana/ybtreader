;
(function(factory) {
	if (typeof define === 'function' && define.amd) {
		define(factory);
	} else {
		window.pay = factory();
	}
})(function() {
	var m_pay = {
		bankInfo: [{
			code: 'ICBC-DEBIT',
			name: '中国工商银行'
		}, {
			code: 'CMB-DEBIT',
			name: '招商银行'
		}, {
			code: 'COMM-DEBIT',
			name: '交通银行'
		}, {
			code: 'BOC-DEBIT',
			name: '中国银行'
		}, {
			code: 'CIB',
			name: '兴业银行'
		}, {
			code: 'CCB-DEBIT',
			name: '中国建设银行'
		}, {
			code: 'ABC',
			name: '中国农业银行'
		}, {
			code: 'SPDB',
			name: '浦发银行'
		}, {
			code: 'CMBC',
			name: '民生银行'
		}, {
			code: 'BJBANK',
			name: '北京银行'
		}, {
			code: 'PSBC-DEBIT',
			name: '中国邮政储蓄'
		}, {
			code: 'CEB-DEBIT',
			name: '中国光大银行'
		}, {
			code: 'CITIC-DEBIT',
			name: '中信银行'
		}, {
			code: 'SPA-DEBIT',
			name: '平安银行'
		}],
		payWaysData: [{
			type: 'alipay',
			minVal: 20,
			ratio: 100
		}, {
			type: 'bank',
			minVal: 20,
			ratio: 100
		}, {
			type: 'weixin',
			minVal: 10,
			ratio: 100
		}, {
			type: 'yeepay',
			minVal: 20,
			ratio: 'custom'
		}],
		fullScreenShade: '.taba',
		getResourcePath: function() {
			return $('#resourcePath').val();
		},
		activityData: null,
		init: function() {
			this.switchTabs();
			this.hasActivity();
		},
		switchTabs: function() {
			var index;
			$('.pay-type .item').click(function() {
				$(this).addClass('on').siblings('.item').removeClass('on');
				index = $(this).index();
				$('.pay-content').addClass('hide').eq(index).removeClass('hide');
			});
		},
		hasActivity: function() {
			var self;
			self = this;
			url = '/book/activity_rules';
			$.get(url, function(json) {
				if (json.activity !== '' && json.activityRules !== undefined) {
					self.getActivityInfo(json);
				} else {
					self.alipayRecharge(self.payWaysData[0]);
					self.bankRecharge(self.payWaysData[1]);
					self.wxRecharge(self.payWaysData[2]);
					self.cardRecharge(self.payWaysData[3]);
					self.closePanel();
				}
			});
		},
		getActivityInfo: function(json) {
			this.activityData = json;
			console.log(json);
			if (this.activityData.giveWayType === 1) {
				var data = {};
				data.name = this.activityData.activity.name;
				data.start = this.activityData.activity.rechargeStart;
				data.end = this.activityData.activity.rechargeEnd;
				if (this.activityData.activity.imgUrl.indexOf('null') != -1) {
					data.imgUrl = this.getResourcePath() + 'pc/images/pay/gift.png';
				} else {
					data.imgUrl = this.activityData.activity.imgUrl;
				}
				data.rules = this.activityData.activityRules;
				aliPayData = $.extend(true, {}, data, this.payWaysData[0]);
				bankData = $.extend(true, {}, data, this.payWaysData[1]);
				weixinData = $.extend(true, {}, data, this.payWaysData[2]);
				yeepayData = $.extend(true, {}, data, this.payWaysData[3]);
				this.alipayRecharge(aliPayData);
				this.bankRecharge(bankData);
				this.wxRecharge(weixinData);
				this.cardRecharge(yeepayData);
				this.closePanel();
			}
		},
		getGiftedBean: function(rules, val, ratio) {
			var beansCount, giftedBean;
			giftedBean = 0;
			beansCount = parseInt(val) * parseInt(ratio);
			rules.forEach(function(item, index) {
				if (item.maxValue == 0) {
					item.maxValue = Number.POSITIVE_INFINITY;
				}
				if (beansCount >= item.minValue && beansCount < item.maxValue) {
					giftedBean += Math.floor((Math.abs(item.giftValue) / 10) * beansCount);
				}
			});
			return giftedBean;
		},
		showMsg: function(data) {
			var self, giftedBean;
			self = this;
			if (data.name !== undefined) {
				giftedBean = self.getGiftedBean(data.rules, data.value, data.ratio);
				if (giftedBean > 0) {
					$('#' + data.type + 'Msg').html('<p class="text">=<span>' + parseInt(data.value) * data.ratio + '</span>糖豆(再赠<span>' + giftedBean + '</span>糖豆)</p><p class="text holiday f12"><img class="icon" src="' + data.imgUrl + '"/><span>' + data.name + '赠豆时间：' + utilCommon.tools.formatDate(new Date(data.start), 'MM/dd') + '—' + utilCommon.tools.formatDate(new Date(data.end), 'MM/dd') + '</span></p>');
				} else {
					$('#' + data.type + 'Msg').html('<p class="text">可获得<span class="red f16">' + parseInt(data.value) * data.ratio + '</span>糖豆</p>');
				}
			} else {
				$('#' + data.type + 'Msg').html('<p class="text">可获得<span class="red f16">' + parseInt(data.value) * data.ratio + '</span>糖豆</p>');
			}
		},
		alipayRecharge: function(data) {
			var self, value;
			self = this;
			this.initMinAmount(data);
			$('#' + data.type + '_input').keyup(function() {
				var value = $(this).val();
				data.value = value;
				if (m_validate.validateMoney(data.value, data.type, data.minVal)) {
					self.showMsg(data);
				}
			});
			//支付宝
			$("#alipaySubmitBtn").on("click", function() {
				var value;
				value = $('#' + data.type + '_input').val();
				if (m_validate.validateMoney(value, data.type, data.minVal)) {
					$('#' + data.type + 'RechargeForm').submit();
				}
			});
		},
		bankRecharge: function(data) { //银行付款
			var self;
			self = this;
			$('.bank-btn').on('click', function() {
				var index, code, name;
				index = $(this).parent().index() - 1;
				code = self.bankInfo[index].code;
				name = self.bankInfo[index].name;
				$(self.fullScreenShade).show();
				$(".bank-ta").show();
				$("#bankCode").val(code);
				$("#bankName").html(name);
				self.initMinAmount(data);
			});
			this.chooseAmount(data);
			$("#bankSubmitBtn").on("click", function() {
				var value = m_validate.isEmpty($("input[name='bankValue']:checked").val()) ? $("#bank_input").val() : $("input[name='bankValue']:checked").val();
				if (m_validate.validateMoney(value, data.type, data.minVal)) {
					$("#bankRechargeValue").val(value);
					$("#bankRechargeForm").submit();
				}
			});
		},
		wxRecharge: function(data) { //微信
			var self = this;
			$('#jsWeixinBtn').on('click', function() {
				$(self.fullScreenShade).show();
				$(".weixin-ta").show();
				self.initMinAmount(data);
			});
			this.chooseAmount(data);
			$("#weixinSubmitBtn").on("click", function() {
				var value = m_validate.isEmpty($("input[name='weixinValue']:checked").val()) ? $("#weixin_input").val() : $("input[name='weixinValue']:checked").val();
				if (m_validate.validateMoney(value, data.type, data.minVal)) {
					$("#weixinRechargeValue").val(value);
					$("#weixinRechargeForm").submit();
				}
			});
		},
		cardRecharge: function(data) { //电话卡游戏卡支付
			var self = this;
			$('.card-btn').on('click', function() {
				var name, nick, ratio, code;
				name = $(this).attr('data-name');
				nick = $(this).attr('data-nick');
				ratio = $(this).attr('data-ratio');
				code = $(this).attr('data-code');
				$(self.fullScreenShade).show();
				$(".yeepay-ta").show();
				$("#ratio").val(ratio);
				$("#yeepayCode").val(code);
				$("#yeepayType").html(name);
				$("#yeepayCardType").html(nick);
				$("#cardNumber").val("");
				$("#randomCode").val("");
				$("#password").val("");
				self.refresh_randomImg();
				self.initMinAmount(data);
			});
			this.chooseAmount(data);
			this.submitCardPay(data);
		},
		submitCardPay: function() {
			$("#yeepay_button").on("click", function() {
				var value = isEmpty($("input[name='yeepayValue']:checked").val()) ? $("#yeepay_input").val() : $("input[name='yeepayValue']:checked").val();
				var randomCode = $("#randomCode").val();
				if (m_validate.validateMoney(value, data.type, data.minVal) && m_validate.validateCard(data.type)) {
					$.ajax({
						type: "POST",
						url: "yeepay/validate?randomCode=" + randomCode,
						dataType: "json",
						success: function(data) {
							if (data.code == "1") {
								$("#yeepayRechargeValue").val(value);
								$("#yeepayRechargeForm").submit();
							} else {
								$("#yeepayMsg").html('<span class="reds f16">验证码不正确</span>');
								self.refresh_randomImg();
							}
						},
						error: function(msg) {
							$("#yeepayMsg").html('<span class="reds f16">验证码不正确</span>');
							self.refresh_randomImg();
						}
					});
				}
			});
		},
		chooseAmount: function(data) {
			var self = this;
			$('.' + data.type + '-amount').click(function() {
				data.value = $(this).val();
				if (typeof data.ratio !== 'number') {
					data.ratio = $('#ratio').val();
				}
				self.showMsg(data);
				$('#' + data.type + '_input').val("");
			});
			$('#' + data.type + '_other').click(function() {
				$('#' + data.type + '_input').focus();
				var value = $('#' + data.type + '_input').val();
				m_validate.validateMoney(value, data.type, data.minVal);
			});
			$('#' + data.type + '_input').click(function() {
				$('#' + data.type + '_other').click();
				var value = $('#' + data.type + '_input').val();
				m_validate.validateMoney(value, data.type, data.minVal);
			});
			$('#' + data.type + '_input').keyup(function() {
				var value = $('#' + data.type + '_input').val();
				m_validate.validateMoney(value, data.type, data.minVal);
				if (typeof data.ratio !== 'number') {
					data.ratio = $('#ratio').val();
				}
				data.value = $(this).val();
				if (m_validate.validateMoney(value, data.type, data.minVal)) {
					self.showMsg(data);
				}
			});
		},
		closePanel: function() { //关闭选择面板
			var self = this;
			$(".card-top .close-btn").click(function() {
				$(self.fullScreenShade).hide();
				$(this).parent().parent().hide();
				//self.initMinAmount('all');
			});
		},
		initMinAmount: function(data) {
			if (data.type == 'alipay') {
				value = $('#' + data.type + '_input').val();
				data.value = value;
				if (m_validate.validateMoney(data.value, data.type, data.minVal)) {
					this.showMsg(data);
				}
			}
			$('.' + data.type + '-amount').eq(0).trigger('click');
		},
		refresh_randomImg: function() {
			var src = $('#contextPath').val() + "/kaptcha.jpg?" + Math.floor(Math.random() * 100);
			$("#randomImg").attr("src", src);
		}
	}
	var m_validate = {
		validateMoney: function(value, type, minval) {
			if (this.isEmpty(value)) {
				$('#' + type + 'Msg').html('<p>请输入金额</p>');
				return false;
			}
			if (!this.isPositiveNum(value)) {
				$('#' + type + 'Msg').html('<p class="reds f16">只能填写整数</p>');
				return false;
			}
			if (value > 8000) {
				$('#' + type + 'Msg').html('<p class="reds f16">最多充值8000块钱</p>');
				return false;
			}
			if (value < minval) {
				$('#' + type + 'Msg').html('<p class="reds f16">最少充值' + minval + '块钱</p>');
				return false;
			}
			return true;
		},
		validateCard: function(type) {
			var card = $("#cardNumber").val();
			var pass = $("#password").val();
			if (this.isEmpty(card)) {
				$('#' + type + 'Msg').html('<p class="reds f16">卡号不能为空</p>');
				return false;
			}
			if (this.isEmpty(pass)) {
				$('#' + type + 'Msg').html('<p class="reds f16">密码不能为空</p>');
				return false;
			}
			return true;
		},
		isEmpty: function(objValue) {
			var value = objValue;
			if (value == null) return true;
			for (var i = 0; i < value.length; i++) {
				if (value.charAt(i) != ' ' && value.charAt(i) != '\t' && value.charAt(i) != '\r' && value.charAt(i) != '\n') {
					return false;
				}
			}
			return true;
		},
		isPositiveNum: function(s) { // 是否为正整数
			var re = /^[0-9]*[1-9][0-9]*$/;
			return re.test(s);
		}
	}
	$(function() {
		m_pay.init();
	});
});