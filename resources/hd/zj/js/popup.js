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
				this.settings.box.bind('click', function(e) {
					self.settings.box.fadeOut();
				});
				this.settings.box.find('.wrapper').bind('click', function(e) {
					e.stopPropagation();
				});
			},
			size: function() {
				var w, h, windowH, wrapper, wrapperHeight;
				w = $(document).width();
				h = $(document).height();
				windowH = $(window).height();
				wrapper = this.settings.box.find('.wrapper');
				wrapperHeight = wrapper.outerHeight();
				this.settings.box.css({
					height: h
				});
				wrapper.css({
					left: (w - wrapper.width()) / 2 + 'px',
					top: ($(window).height() - wrapper.outerHeight()) / 2 + "px"
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
						if($(self.settings.box).hasClass('popup-holiday')){
							$(self.settings.box).removeClass('popup-holiday');
						}
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
								if (self.settings.rewardName != undefined) {
									wrapper.find('.body').html('<div class="outer" ><p class="calculate" ><input type="radio" name="rewardType"  class="reward-radio" /><span class="sprite fire holiday">' + '<img src="' + self.settings.rewardImageUrl + '" class="img"/></span><button type="button" class="minus operate" >-</button><input type="text" id="holidayNum" class="input" data-name="' + self.settings.rewardName + '" data-type="' + self.settings.rewardType + '" data-ratio="' + self.settings.rewardValue + '" value="' + self.settings.rewardDefaultNum + '"/><button type="button" class="add operate" >+</button type="button"><span class="num">' + self.settings.rewardValue * self.settings.rewardDefaultNum + '</span>糖豆</p><p class="calculate" ><input type="radio" name="rewardType" value="1"  class="reward-radio"/><span class="fire sprite"></span><button type="button" class="minus operate">-</button><input data-name="火把" type="text" data-type="1" id="fireNum" data-ratio="50" class="input" value="1"/><button type="button" class="add operate" >+</button type="button"><span class="num">50</span>糖豆</p><p class="reward-result">打赏' + '<span class="reward-type">火鸡</span>' + 'x<span class="reward-count">' + self.settings.rewardDefaultNum + '</span></p><p class="note">您的余额已不足，请充值<a href="/recharge/index" target="_blank" class="charge">充值</a></p></div>');
									wrapper.find('.foot').html('<button type="button" class="tip-confirm sprite">确定</button><button type="button" class="cancel sprite" >取消</button>');
									wrapper.parent('.popup-zj').addClass('popup-holiday');
									var holidayRewardValue = self.settings.value;
									$("input:radio[name='rewardType']").eq(0).trigger('click');
									self.btnAdd();
									self.btnMinus();
									self.inputFocus();
									self.inputKeyup();
									self.radioCheck();
								} else {
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
								}
								var bookId = $(this).siblings('.book-id').val();
								self.settings.box.fadeIn(500);
								self.size();
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
			btnAdd: function() {
				var self = this;
				$("#jsZJPopup .calculate .add").unbind("click");
				$("#jsZJPopup .calculate .add").on('click', function() {
					var value, ratio;
					value = parseInt($(this).siblings('.input').val());
					ratio = parseInt($(this).siblings('.input').attr('data-ratio'));
					self.radioIsChecked($(this));
					if (value >= 999) {
						return false;
					} else {
						value++;
						self.setVal($(this).siblings('.input'), $(this).siblings('.num'), value, ratio);
					}
				});
			},
			btnMinus: function() {
				var self = this;
				$("#jsZJPopup .calculate .minus").unbind("click");
				$("#jsZJPopup .calculate .minus").on('click', function() {
					var value, ratio;
					value = parseInt($(this).siblings('.input').val());
					ratio = parseInt($(this).siblings('.input').attr('data-ratio'));
					self.radioIsChecked($(this));
					if (!$(this).siblings('.reward-radio').attr('checked')) {
						$(this).siblings('.reward-radio').trigger('click');
					}
					if (value <= 1) {
						return false;
					} else {
						value--;
						self.setVal($(this).siblings('.input'), $(this).siblings('.num'), value, ratio);
					}
				});
			},
			inputKeyup: function() {
				var self = this;
				$("#jsZJPopup .calculate .input").unbind("keyup");
				$("#jsZJPopup .calculate").on('keyup', '.input', function() {
					var that = $(this);
					ratio = parseInt($(this).attr('data-ratio'));
					setTimeout(function() {
						var value = isNaN($(that).val()) || $(that).val() < 1 ? 1 : parseInt($(that).val());
						if (value < 1) {
							value = 1;
							self.setVal($(that), $(that).siblings('.num'), value, ratio);
							return false;
						} else if (value > 999) {
							value = 999;
							self.setVal($(that), $(that).siblings('.num'), value, ratio);
							return false;
						} else {
							self.setVal($(that), $(that).siblings('.num'), value, ratio);
						}
					}, 500);
				});
			},
			inputFocus: function() {
				var self = this;
				$("#jsZJPopup .calculate .input").unbind("focus");
				$("#jsZJPopup .calculate").on('focus', '.input', function() {
					self.radioIsChecked($(this));
				});
			},
			setVal: function(obj1, obj2, num, value) {
				var name = $(obj1).attr('data-name');
				$(obj1).val(num);
				if ($('.reward-result .reward-type').text() != name) {
					$('.reward-result .reward-type').text(name);
				}
				$('.reward-result .reward-count').text(num);
				$(obj2).text(num * value);
			},
			radioIsChecked: function(obj) {
				if (!$(obj).siblings('.reward-radio').prop('checked')) {
					$(obj).siblings('.reward-radio').trigger('click');
				}
			},
			radioCheck: function() {
				$("#jsZJPopup .reward-radio").unbind("click");
				$("#jsZJPopup .reward-radio").on('click', function() {
					var name = $(this).siblings('.input').attr('data-name');
					var num = $(this).siblings('.input').val();
					if ($('.reward-result .reward-type').text() != name) {
						$('.reward-result .reward-type').text(name);
					}
					$('.reward-result .reward-count').text(num);
				});
			},
			popupBtnClick: function(id, btn) {
				var wrapper = this.settings.box.find('.wrapper');
				var confirm = wrapper.find('.confirm');
				var cancel = wrapper.find('.cancel');
				var tipConfirm = wrapper.find('.tip-confirm');
				var self = this;
				tipConfirm.click(function() {
					if (self.settings.rewardName != undefined) {
						var data, rewardType, rewardCount;
						var data = {};
						var rewardType = $('.calculate .reward-radio:checked').siblings('input').attr('data-type');
						var rewardCount = $('.calculate .reward-radio:checked').siblings('input').val();
						var rewardName = $('.calculate .reward-radio:checked').siblings('input').attr('data-name');
						data.bookId = id;
						data.rewardType = rewardType;
						data.rewardCount = rewardCount;
						data.rewardName = rewardName;
						if (!self.settings.box.find('.wrapper').find('.note').is(":visible")) {
							self.settings.box.find('.wrapper').find('.note').hide();
						}
						var url = '/activity/zj/reward_turkey_json'; //打赏道具活动期间ajax请求打赏接口
						self.tipAjax(url, data, btn, true);
					} else {
						var data, torchNum, url;
						var torchNum = parseInt(wrapper.find('.calculate .input').val());
						data = {};
						data.bookId = id;
						data.rewardCount = torchNum;
						url = '/activity/zj/reward_json'; //ajax打赏请求打赏接口
						self.tipAjax(url, data, btn, false);
					}
				});
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
			tipAjax: function(url, data, btn, hasAct) {
				var self = this;
				$.post(
					url, data,
					function(res) {
						if (res.code === '0') {
							var userName, rewardHtml;
							userName = $('.nav .menu .item').eq(1).find('.link').text();
							userName = userName.substring(1, userName.length - 1);
							rewardHtml = '';
							if (hasAct) {
								self.settings.box.find('.wrapper .body .outer').html('<p class="text">打赏成功，感谢！</p>');
								self.settings.box.find('.wrapper .foot').html('<button type="button" class="confirm sprite" >确认</button>');
								rewardHtml = '<span class="type">粉丝</span><span class="name">' + userName + '</span>打赏<span class="icon sprite';
								if (data.rewardType != 1) {
									rewardHtml += ' holiday';
								}
								rewardHtml += '"></span>' + data.rewardName + 'X<span class="num">' + data.rewardCount + '</span>';
								if ($(btn).parent().siblings().hasClass('tip')) {
									$(btn).parent().siblings('.tip').html(rewardHtml);
								} else if ($(btn).parent().parent().siblings().hasClass('tip')) {
									$(btn).parent().parent().siblings('.tip').html(rewardHtml);
								} else if ($(btn).parent().parent().siblings().hasClass('update')) {
									$(btn).parent().parent().siblings('.update').find('.tip').html(rewardHtml);
								}
								self.popupBtnClick();
							} else {
								self.settings.box.find('.wrapper .body .outer').html('<p class="text">打赏成功，感谢！</p>');
								self.settings.box.find('.wrapper .foot').html('<button type="button" class="confirm sprite" >确认</button>');
								rewardHtml += '<span class="type">粉丝</span><span class="name">' + userName + '</span>打赏<span class="icon sprite "></span>火把X<span class="num">' + data.rewardCount + '</span>';
								if ($(btn).parent().siblings().hasClass('tip')) {
									$(btn).parent().siblings('.tip').html(rewardHtml);
								} else if ($(btn).parent().parent().siblings().hasClass('tip')) {
									$(btn).parent().parent().siblings('.tip').html(rewardHtml);
								} else if ($(btn).parent().parent().siblings().hasClass('update')) {
									$(btn).parent().parent().siblings('.update').find('.tip').html(rewardHtml);
								}
								self.popupBtnClick();
							}
						} else if (res.code === '1') {
							self.settings.box.find('.wrapper').find('.note').show();
							self.size();
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