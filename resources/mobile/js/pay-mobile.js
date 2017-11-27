m_mobilePay = {
	payWaysData: [{
		type: 'alipay',
		minVal: 50,
		ratio: 100,
		value: 50
	}, {
		type: 'weixin',
		minVal: 50,
		ratio: 100,
		value: 50
	}],
	getResourcePath: function() {
		return $('#resourcePath').val();
	},
	getRootPath: function() {
		return $('#rootPath').val();
	},
	init: function() {
		var self;
		self = this;
		url = '/book/activity_rules';
		$.get(url, function(json) {
			if (json.activity !== '' && json.activityRules !== undefined) {
				self.getActivityInfo(json);
			} else {
				self.alipayRecharge(self.payWaysData[0]);
				self.wxRecharge(self.payWaysData[1]);
			}
		});
	},
	getActivityInfo: function(json) {
		console.log(json);
		if (json.giveWayType === 1) {
			var data = {};
			data.name = json.activity.name;
			data.start = json.activity.rechargeStart;
			data.end = json.activity.rechargeEnd;
			if (json.activity.imgUrl.indexOf('null') >= -1) {
				data.imgUrl = this.getResourcePath() + 'pc/images/pay/gift.png';
			} else {
				data.imgUrl = json.activity.imgUrl;
			}
			data.rules = json.activityRules;
			aliPayData = $.extend(true, {}, data, this.payWaysData[0]);
			weixinData = $.extend(true, {}, data, this.payWaysData[1]);
			this.showActivityTitle(data);
			this.alipayRecharge(aliPayData);
			this.wxRecharge(weixinData);
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
	showActivityTitle: function(data) {
		var title = '<p class="text"><img class="icon" src="' + data.imgUrl + '"><span class="msg">' + data.name + '活动时间：' + utilCommon.tools.formatDate(new Date(data.start), 'MM.dd') + '—' + utilCommon.tools.formatDate(new Date(data.end), 'MM.dd') + '</span></p>';
		$('#payTitle').addClass('holiday').html(title);
	},
	showMsg: function(data) {
		var self, giftedBean;
		self = this;
		if (data.name !== undefined) {
			giftedBean = self.getGiftedBean(data.rules, data.value, data.ratio);
			if (giftedBean > 0) {
				$('#' + data.type + 'Msg').html('<p class="holiday">= <span>' + parseInt(data.value) * data.ratio + '</span>糖豆(再赠<span>' + giftedBean + '</span>糖豆)</p>');
			} else {
				$('#' + data.type + 'Msg').html('可获得<span>' + parseInt(data.value) * data.ratio + '</span>糖豆');
			}
		} else {
			$('#' + data.type + 'Msg').html('可获得<span>' + parseInt(data.value) * data.ratio + '</span>糖豆');
		}
	},
	alipayRecharge: function(data) { //支付宝
		var api = this.getRootPath() + '/m/recharge/api';
		this.rechageEvent(data, api);
	},
	wxRecharge: function(data) { //微信
		var api = this.getRootPath() + '/m/recharge/weixin/api';
		this.rechageEvent(data, api);
	},
	rechageEvent: function(data, api) {
		var self, value, that;
		self = this;
		this.showMsg(data);
		$('#' + data.type + 'RechargeInput').on('input', function() {
			that = $(this);
			setTimeout(function() {
				data.value = $(that).val();
				if (self.validateValue($(that).val(), data.type + 'Msg')) {
					self.showMsg(data);
				}
			}, 500);
		});
		$('#' + data.type + 'SubmitButton').on("click", function() {
			value = $('#' + data.type + 'RechargeInput').val();
			if (self.validateValue(value, data.type + 'Msg')) {
				$('#rechargeValue').val(value);
				$('#rechargeForm').attr("action", api);
				$('#rechargeForm').submit();
			}
		});
	},
	validateValue: function(value, id) {
		if (isNaN(value)) {
			$('#' + id).html('<span class="reds">输入的格式不正确！</span>');
			return false;
		}
		if (!validText(value, true, 100)) {
			$('#' + id).html('<span class="reds">充值金额不可以为空！</span>');
			return false;
		}
		if (value < 20 || value > 8000) {
			$('#' + id).html('<span class="reds">范围在20-8000元人民币！</span>');
			return false;
		}
		return true;
	}
};
$(function() {
	m_mobilePay.init();
});