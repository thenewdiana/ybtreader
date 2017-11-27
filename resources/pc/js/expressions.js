define(['jquery'], function($) {
	//表情切换
	$('.face-show .content .list:gt(0)').hide();
	var list = $('.face-show .content .list').eq(0);
	var imgSrc = list.find('.item').eq(0).find('.pic').attr('src');
	$('.face-show .info').find('.pic').attr('src', imgSrc);
	$('.face-info .list .item').click(function() {
		var index = $(this).index();
		var list = $('.face-show .content .list').eq(index);
		list.show().siblings().hide();
		var imgSrc = list.find('.item').eq(0).find('.pic').attr('src');
		$('.face-show .info').find('.pic').attr('src', imgSrc);
	});
});