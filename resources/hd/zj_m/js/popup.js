;
(function() {
	define(['jquery', 'vue', 'common'], function($, Vue, com) {
		function Popup(usersetting) {
			this.defaultSetting = {};
			this.userSetting = usersetting;
			this.settings = $.extend(this.defaultSetting, this.userSetting);
			this.settings.box = $('#' + this.settings.box);
			this.settings.triggerBtn = $('#' + this.settings.triggerBtn);
		}
		Popup.prototype = {
			init: function() {
				this.size();
				if (!com.Com.isMobile()) {
					var self = this;
					$(window).resize(function() {
						self.size();
					});
				}
				this.voteClick();
				this.wrapperClose();
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
			},
			voteClick: function() {
				var btn = 'button.' + this.settings.button;
				var self = this;
				$(function() {
					$('body').on('click', btn, function() {
						if (self.settings.box.find('.note').length) {
							self.settings.box.find('.note').hide();
						}
						self.size();
						var wrapper = self.settings.box.find('.wrapper');
						var loginVal = $('#isLogin').val();
						wrapper.find('.head').text(self.settings.title);
						if (loginVal === '0') { //判断登录状态：未登录
							if (self.settings.button === 'gold') { //判断按钮类型：投金票按钮
								var num = $('.gold-num').text();
								if (num > 0) { //判断金票数量是否足够
									var bookId = $(this).siblings('.book-id').val();
									var url = '/activity/zj/golden_json'; //ajax请求投金票接口
									self.goldAjax(url, bookId, num);
								} else {
									self.settings.note = '登录后，更多金票~';
									wrapper.find('.body').html('<div class="outer"><p class="text">' + self.settings.note + '</p></div>');
									wrapper.find('.foot').html('<button type="button" class="confirm sprite">确定</button>');
									self.settings.box.fadeIn(500);
									self.popupBtnClick();
								}
							} else if (self.settings.button === 'tip') { //判断按钮类型：打赏按钮
								self.settings.triggerBtn.trigger('click'); //调出登录框
							}
						} else if (loginVal === '1') { //判断登录状态：已登录
							if (self.settings.button === 'gold') { //判断按钮类型：投金票按钮
								var num = $('.gold-num').text();
								if (num > 0) { //判断金票数量是否足够
									var bookId = $(this).siblings('.book-id').val();
									var url = '/activity/zj/golden_json'; //ajax请求投金票接口
									self.goldAjax(url, bookId, num);
								} else {
									self.settings.note = '小主，您今日的金票已经告罄啦，明天记得再来哦~';
									self.settings.box.find('.wrapper').find('.body').html('<div class="outer"><p class="text">' + self.settings.note + '</p></div>');
									self.settings.box.find('.wrapper').find('.foot').html('<button type="button" class="confirm sprite">确定</button>');
									self.settings.box.fadeIn(500);
									self.popupBtnClick();
								}
							} else if (self.settings.button === 'tip') { //判断按钮类型：打赏按钮 
								wrapper.find('.body').html('<div class="outer"><p class="calculate" id="app"><span class="fire sprite"></span><button type="button" class="minus operate" @click="minus">-</button><input type="text" v-model="fireNum" class="input" @keyup="round" @focus="select" @blur="min" ref="beans" /><button type="button" class="add operate" @click="add">+</button type="button"><span class="num">{{beanNum}}</span>糖豆</p><p class="note">您的余额已不足，请充值<a href="/recharge/index" target="_blank" class="charge">充值</a></p></div>');
								wrapper.find('.foot').html('<button type="button" class="tip-confirm sprite">确定</button><button type="button" class="cancel sprite" >取消</button>');
								new Vue({
									el: '#app',
									data: {
										fireNum: 5,
									},
									computed: {
										beanNum: function() {
											var beans = parseInt(this.fireNum) * 50;
											if (beans > 49950) {
												beans = 49950;
											}
											if (isNaN(beans)) {
												beans = 0
											}
											return beans;
										}
									},
									methods: {
										minus: function() {
											this.fireNum--;
											if (this.fireNum < 1) {
												this.fireNum = 1;
											}
										},
										add: function() {

											this.fireNum++;
											if (this.fireNum > 999) {
												this.fireNum = 999;
											}
										},
										round: function() {
											if (isNaN(this.fireNum)) {
												this.fireNum = 0;
											}
											if (this.fireNum < 1) {
												return;
											}
											if (this.fireNum > 999) {
												this.fireNum = 999;
											}
										},
										select: function() {
											this.$refs.beans.select();
										},
										min: function() {
											if (this.$refs.beans.value === '' || isNaN(this.fireNum) || parseInt(this.fireNum) === 0) {
												this.fireNum = 1;
											}
										}
									}
								});
								var bookId = $(this).siblings('.book-id').val();
								self.settings.box.fadeIn(500);
								self.popupBtnClick(bookId, $(this));
							}
						}
						if (com.Com.isMobile()) {
							self.settings.box.bind("touchmove", function(e) {
								e.preventDefault();
							});
						}
					});
				});
			},
			popupBtnClick: function(id, btn) {
				var wrapper = this.settings.box.find('.wrapper');
				var confirm = wrapper.find('.confirm');
				var cancel = wrapper.find('.cancel');
				var tipConfirm = wrapper.find('.tip-confirm');
				var self = this;
				tipConfirm.click(function() {
					var torchNum = parseInt(wrapper.find('.calculate .input').val());
					var bookId = id;
					var url = '/activity/zj/reward_json'; //ajax请求打赏接口
					self.tipAjax(url, bookId, torchNum, btn);
				})
				confirm.click(function() {
					self.settings.box.fadeOut(500);
				});
				cancel.click(function() {
					self.settings.box.fadeOut(500);
				});
			},
			goldAjax: function(url, bookId, num) {
				var self = this;
				$.post(
					url, {
						bookId: bookId //投金票请求发送数据
					},
					function(result) {
						if (result.code == 0) {
							num--;
							$('.gold-num').text(num);
							self.settings.box.find('.wrapper').find('.body').html('<div class="outer"><p class="text">' + self.settings.note + '</p></div>');
							self.settings.box.find('.wrapper').find('.foot').html('<button type="button" class="confirm sprite">确定</button>');
							self.settings.box.fadeIn(500);
							self.popupBtnClick();
						} else if (result.code == 1) {
							self.settings.box.find('.wrapper').find('.body').html('<div class="outer"><p class="text">' + result.msg + '</p></div>');
							self.settings.box.find('.wrapper').find('.foot').html('<button type="button" class="confirm sprite">确定</button>');
							self.settings.box.fadeIn(500);
							self.popupBtnClick();
						}
					}
				);
			},
			tipAjax: function(url, bookId, torchNum, btn) {
				var self = this;
				$.post(
					url, {
						bookId: bookId,
						rewardCount: torchNum //投金票请求发送数据
					},
					function(res) {
						if (res.code === '0') {
							self.settings.box.find('.wrapper .body .outer').html('<p class="text">打赏成功，感谢！</p>');
							self.settings.box.find('.wrapper .foot').html('<button type="button" class="confirm sprite" >确认</button>');
							var name = $('.nav .menu .item').eq(1).find('.link').text();
							var name = name.substring(1, name.length - 1);
							var html = '<span class="type">粉丝</span><span class="name">' + name + '</span>打赏<span class="icon sprite "></span>火把X<span class="num">' + torchNum + '</span>';
							if (btn.parent().siblings().hasClass('tip')) {
								btn.parent().siblings('.tip').html(html);
							} else if (btn.parent().parent().siblings().hasClass('tip')) {
								btn.parent().parent().siblings('.tip').html(html);
							} else if (btn.parent().parent().siblings().hasClass('update')) {
								btn.parent().parent().siblings('.update').find('.tip').html(html);
							}
							self.popupBtnClick();
						} else if (res.code === '1') {
							self.settings.box.find('.wrapper').find('.note').show();
						}
					}
				);
			}
		}
		return {
			Popup: Popup
		}
	});
})();