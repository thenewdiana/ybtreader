;
(function() {
	define(['jquery', 'common', 'md5.min'], function($, com, md5) {
		function Sign(usersetting) {
			this.defaultSetting = {};
			this.userSetting = usersetting;
			this.settings = $.extend(this.defaultSetting, this.userSetting);
			this.settings.button = $('#' + this.settings.button);
			this.settings.box = $('#' + this.settings.box);
			this.settings.submit = $('#' + this.settings.submit);
		}
		Sign.prototype = {
			init: function() {
				this.size();
				if (!com.Com.isMobile()) {
					var self = this;
					$(window).resize(function() {
						self.size();
					});
				}
				this.loginBtnClick();
				this.wrapperClose();
				this.loginSumbitClick();
			},
			size: function() {
				var w = $(document).width();
				var h = $(document).height();
				var windowH = $(window).height();
				var wrapper = this.settings.box.find('.wrapper');
				this.settings.box.css({
					height: h
				});
				wrapper.css({
					left: (w - wrapper.width()) / 2 + 'px',
					top: ($(window).height() - wrapper.height()) / 2 + "px"
				});
				this.settings.box.bind("touchmove", function(e) {
					e.preventDefault();
				});
			},
			wrapperClose: function() {
				var self = this;
				self.settings.box.bind('click', function(e) {
					self.settings.box.fadeOut();
				});
				self.settings.box.find('.wrapper').bind('click', function(e) {
					e.stopPropagation();
				});
			},
			loginBtnClick: function() {
				var self = this;
				this.settings.button.bind('click', function() {
					self.size();
					self.settings.box.fadeIn(500);
					if (com.Com.isMobile()) {
						self.settings.box.bind("touchmove", function(e) {
							e.preventDefault();
						});
					}
				});
			},
			loginSumbitClick: function() {
				var self = this;
				this.settings.submit.bind('click', function() {
					var userName = $(this).siblings('.account').find('.input').val();
					var password = $(this).siblings('.password').find('.input').val();
					if ($.trim(userName) === '' || $.trim(password) === '') {
						return false;
					}
					var submitBtn = $(this);
					var pwd = md5(password);
					var data = { //登录请求发送数据
						name: userName,
						password: pwd
					};
					$.post(
						'/user/login_json', //ajax请求登录接口
						data,
						function(res) {
							if (res.code === '0') {
								var num = res.body.goldNum;
								var username = "[" + res.body.name + "]";
								self.settings.box.fadeOut();
								self.settings.button.attr('href', '/user').text(username);
								self.settings.button.parent().siblings('#isLogin').val('1');
								self.settings.button.parent().siblings('.item').find('.gold-num').text(num);
								self.settings.button.unbind();
							} else if (res.code === '1') {
								var text = res.msg;
								submitBtn.siblings('.warning').show().text(text);
							}
						}
					);
				})
			}
		}
		return {
			Sign: Sign
		}
	});
})();