;
(function() {
	define(['jquery', 'swiper', 'lazy', 'timer', 'sign', 'popup', 'pagination'], function($, swiper, lazy, timer, sign, popup, page) {
		//设炉、制铜倒计时
		var countDown = new timer.CountDown({
			endText: '投稿已结束',
			endYear: 2018,
			endMonth: 3,
			endDay: 31,
			endH: 17,
			endM: 0,
			endS: 0,
			callFunc: null,
			box: 'jsTimer'
		});
		//赛程滑动
		var aswiper = new Swiper('.swiper-container', {
			nextButton: '.swiper-button-next',
			prevButton: '.swiper-button-prev',
			loop: true
		});
		//懒加载
		$(".lazy").lazyload({
			failurelimit: 10,
			effect: 'fadeIn',
			placeholder: "./images/grey.gif",
			threshold: 600
		});
		countDown.init();
		//热度
		$('.hots .tops .block').each(function() {
			var heat = $(this).find('.heat .text').text();
			var heatHtml = '<strong class="bigger">' + heat.substr(0, 1) + '</strong>' + heat.substr(1);
			$(this).find('.heat .text').html(heatHtml);
			if ($(this).index() === 2) {
				$(this).addClass('last');
			}
		});
		//大咖推荐
		$('.recommand .block').each(function() {
			var heat = $(this).find('.heat .text').text();
			var heatHtml = '<strong class="bigger">' + heat.substr(0, 1) + '</strong>' + heat.substr(1);
			$(this).find('.heat .text').html(heatHtml);
		});
		//登录弹窗
		var loginIn = new sign.Sign({
			box: 'jsLoginPopup',
			button: 'jsLoginBtn',
			submit: 'jsLoginSubmit'
		});
		loginIn.init();

		//我要参赛按钮
		var loginStatus = $('#isLogin').val();
		$('.subject .join .btn').click(function() {
			if (loginStatus === '0') { //未登录时显示登录弹窗
				$('#jsLoginBtn').trigger('click');
			} else if (loginStatus === '1') { //已登录时跳转到发文页面
				$(this).attr('href', '/author/book/listbypic');
			}
		});

		//投金票
		var goldPopup = new popup.Popup({
			box: 'jsZJPopup',
			button: 'gold',
			title: '投金票',
			note: '投金票成功！感谢！'
		});
		goldPopup.init();

		//作品列表分页
		var total = parseInt($('#jsPageCtrl').find('#total').attr('rel'));
		var pagination = new page.Pagination({
			box: 'jsPageContent',
			pageSize: 16,
			firstPageStart: 10,
			totalRecords: total,
			pageBox: 'jsPageCtrl'
		});
		pagination.init();
	});
})()