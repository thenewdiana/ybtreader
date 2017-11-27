define(['jquery'], function() {
	//漫画库组件
	function Collect(userConfig) {
		this.defaultConfig = {
			ele: '',
			pageItemNum: 14,
			boxAlign: 'vertical'
		}
		this.settings = $.extend(this.defaultConfig, userConfig);
		this.elem = $('#' + this.settings.ele);
		this.btn = this.elem.find('.shift .item');
		this.wrapper = this.elem.find('.wrapper');
		this.flag = true;
	}
	Collect.prototype = {
		init: function() {
			this.show();
			this.shift();
			this.pager();
		},
		shift: function() {
			var self = this;
			$(this.btn).click(function() {
				var index = $(this).index();
				$(this).addClass('on').siblings().removeClass('on');
				self.wrapper.eq(index).fadeIn(500).siblings('.wrapper').hide();
				self.pager();
			});
		},
		show: function() {
			var index = this.elem.attr('data-collect');
			this.elem.find('.shift .item').eq(index).addClass('on').siblings('.item').removeClass('on');
			this.elem.find('.wrapper').eq(index).show();
		},
		pager: function() {
			if (this.elem.find('.wrapper').is(':visible')) {
				var wrapper = this.elem.find('.wrapper:visible');
				var itemNum = wrapper.find('.list .item').size();
				var pageNum = Math.ceil(itemNum / this.settings.pageItemNum);
				if (!wrapper.find('.page').length > 0) {
					var pageHtml = '<div class="page">';
					for (var i = 0; i < pageNum; i++) {
						pageHtml += '<a href="javascript:;" class="num">' + (i + 1) + '</a>';

					}
					pageHtml += '</div>';
					wrapper.append(pageHtml);
				}
				var self = this;
				wrapper.find('.page .num').eq(0).addClass('on');
				wrapper.find('.page .num').click(function() {
					var index = $(this).index();
					var offset = self.settings.columnHeight;
					$(this).addClass('on').siblings('.num').removeClass('on');
					if (self.flag) {
						wrapper.find('.list').animate({
							top: -index * offset
						}, function() {
							self.flag = true;
						});
						self.flag = false;
					}
				})
			}
		}

	}
	return {
		Collect: Collect
	}
});