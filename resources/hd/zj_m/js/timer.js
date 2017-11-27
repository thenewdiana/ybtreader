;
(function() {
	define(['jquery'], function($) {
		function CountDown(usersetting) {
			this.defaultSetting = {
				endText: '投稿已结束',
				endYear: 2017,
				endMonth: 6,
				endDay: 30,
				endH: 17,
				endM: 0,
				endS: 0,
				callFunc: null
			};
			this.interval = 1000;
			this.userSetting = usersetting;
			this.settings = $.extend(this.defaultSetting, this.userSetting);
			this.settings.box = $('#' + this.settings.box);
			this.endDate = new Date(this.settings.endYear, (this.settings.endMonth - 1), this.settings.endDay, this.settings.endH, this.settings.endM, this.settings.endS);
			this.currentTime;
		}
		CountDown.prototype = {
			init: function() {
				var self = this;
				$.ajax({
					type: "get",
					dataType: "jsonp",
					url: 'http://www.ebtang.com/api/serverTime',
					data: '',
					jsonp: 'callback',
					async: false, //设置为同步请求，让这段ajax执行完毕再在执行别的操作
					success: function(result) {
						var theTime = JSON.parse(result);
						self.currentTime = theTime;
						var timer = window.setInterval(function() {
							self.count();
						}, self.interval);
						if (self.count() === 'done') {
							clearInterval(timer);
							self.settings.box.html('<em class="bigger">' + '00' + '</em><span class="normal">天</span><em class="bigger">' +
								'00' + '</em><span class="normal">小时</span>');
						}
					}
				});
			},
			count: function() {
				var leftTime, leftSecond, leftDay, leftHour, leftMinute, leftSecond;
				leftTime = this.endDate.getTime() - this.currentTime;
				leftSecond = parseInt(leftTime / 1000);
				leftDay = Math.floor(leftSecond / (60 * 60 * 24));
				leftHour = Math.floor((leftSecond - leftDay * 24 * 60 * 60) / 3600);
				leftMinute = Math.floor((leftSecond - leftDay * 24 * 60 * 60 - leftHour * 3600) / 60);
				leftSecond = Math.floor(leftSecond - leftDay * 24 * 60 * 60 - leftHour * 3600 - leftMinute * 60);
				this.settings.box.html('<em class="bigger">' + leftDay + '</em><span class="normal">天</span><em class="bigger">' +
					leftHour + '</em><span class="normal">小时</span>');
				if (leftTime <= 0) {
					return 'done';
				}
			}
		}
		return {
			CountDown: CountDown
		}
	});
})();