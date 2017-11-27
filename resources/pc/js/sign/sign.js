;
(function() {
	define(['common', 'md5'], function(com, md5) {
		var m_sign = {
			init: function(a) {
				this.wrapperClose(a);
				this.loginSumbitClick(a);
			},
			wrapperClose: function(a) {
				$(document).on('click', a.controlObj, function(e) {
					$(a.controlObj).fadeOut();
				});
				$(a.controlObj).find('.wrapper').on('click', function(e) {
					e.stopPropagation();
				});
			},
			loginBtnClick: function(a) {
				var self = this;
				$(a.startBtn).bind('click', function() {
					$(a.controlObj).fadeIn(500);
					if (com.tools.isMobile()) {
						$(a.controlObj).bind("touchmove", function(e) {
							e.preventDefault();
						});
					}
				});
			},
			loginSumbitClick: function(a) {
				$(a.btn).bind('click', function() {
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
								submitBtn.unbind();
								window.location.reload();
							} else if (res.code === '1') {
								var text = res.msg;
								submitBtn.siblings('.warning').show().text(text);
							}
						}
					);
				});
			}
		}
		return {
			m_sign: m_sign
		}
	});
})();
;