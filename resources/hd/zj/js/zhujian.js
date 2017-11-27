;
(function() {
	define(['jquery', 'timer', 'sign', 'popup', 'pagination'], function($, timer, sign, popup, page) {
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
		countDown.init();
		//悬浮导航
		if ($('#jsNavFloat').attr('data-progress')) {
			var index = $('#jsNavFloat').attr('data-progress');
			$('#jsNavFloat .menu').find('.item').eq(index).addClass('on');
		}
		//热度值首个数字增大
		$('.hots .tops .block,.hots .ahead .block').each(function() {
			var heat = $(this).find('.heat .text').text();
			var heatHtml = '<strong class="bigger">' + heat.substr(0, 1) + '</strong>' + heat.substr(1);
			$(this).find('.heat .text').html(heatHtml);
			if ($(this).index() === 2) {
				$(this).addClass('last');
			}
		});
		$('.hots .ahead .block').each(function() {
			var heat = $(this).find('.heat .text').text();
			var heatHtml = '<strong class="bigger">' + heat.substr(0, 1) + '</strong>' + heat.substr(1);
			$(this).find('.heat .text').html(heatHtml);
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

		//未登录时点击我要参赛按钮
		var loginStatus = $('#isLogin').val();
		$('.subject .join .attend').click(function() {
			if (loginStatus === '0') { //未登录
				$('#jsLoginBtn').trigger('click');
			} else if (loginStatus === '1') { //已登录时跳转到发文页面
				$(this).attr('href', '/author/book/listbypic');
			}
		});
		$('.nav-float .menu .item').eq(0).find('.link').click(function() {
			if (loginStatus === '0') { //未登录时显示登录弹窗
				$('#jsLoginBtn').trigger('click');
			} else if (loginStatus === '1') { //已登录时跳转到发文页面
				$(this).attr('href', '/author/book/listbypic');
			}
		});
		//投金票与打赏
		var goldPopup = new popup.Popup({
			box: 'jsZJPopup',
			button: 'gold',
			title: '投金票',
			note: '投金票成功！感谢！'
		});
		goldPopup.init();

		//作品列表分页
		var total = parseInt($('#jsPageCtrl').find('#total').attr('rel'));

		if ($('#hasAct').val() == 1) {
			var data;
			data = getRewardData();
			data.box = 'jsZJPopup';
			data.button = 'tip';
			data.title = '打赏';
			data.note = '打赏成功！感谢！';
			data.triggerBtn = 'jsLoginBtn';
			addRewardBtn();
			var tipPopup = new popup.Popup(data);
			tipPopup.init();
			var pagination = new page.Pagination({
				box: 'jsPageContent',
				pageSize: 10,
				firstPageStart: 12,
				totalRecords: total,
				pageBox: 'jsPageCtrl',
				rewardBtnImg: data.rewardImgBtnUrl
			});
			pagination.init();
		} else {
			var tipPopup = new popup.Popup({
				box: 'jsZJPopup',
				button: 'tip',
				title: '打赏',
				note: '打赏成功！感谢！',
				triggerBtn: 'jsLoginBtn'
			});
			tipPopup.init();
			var pagination = new page.Pagination({
				box: 'jsPageContent',
				pageSize: 10,
				firstPageStart: 12,
				totalRecords: total,
				pageBox: 'jsPageCtrl',
				hasRewardAct: $('#hasAct').val()
			});
			pagination.init();
		}

		function addRewardBtn() {
			var imgBtnUrl, path, imgBtnHtml;
			path = $('#resourcePath').val();
			imgBtnUrl = path + 'pc/images/activity/reward-holiday-btn.png'; //铸剑活动页面打赏按钮图片
			imgBtnHtml = '<img src="' + imgBtnUrl + '" class="img"/>';
			$('.vote .tip').addClass('btn-reward').html(imgBtnHtml);
		} 

		function getRewardData() {
			var data, path, imgBtnUrl;
			data = {};
			path = $('#resourcePath').val();
			imgBtnUrl = path + 'pc/images/activity/reward-holiday-btn.png'; //铸剑活动页面打赏按钮图片
			data.rewardName = $('#rewardName').val();
			data.rewardImageUrl = $('#rewardImage').val();
			data.rewardValue = $('#rewardValue').val();
			data.rewardUnit = $('#rewardUnit').val();
			data.rewardType = $('#rewardType').val();
			data.rewardDefaultNum = 1;
			data.rewardImgBtnUrl = imgBtnUrl;
			return data;
		}
	});
})();