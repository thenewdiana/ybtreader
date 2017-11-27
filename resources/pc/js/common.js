define(['jquery'], function($) {
	//简介推荐随机颜色
	function getColorByRandom(colorList) {
		var colorIndex = Math.floor(Math.random() * colorList.length);
		var color = colorList[colorIndex];
		return color;
	}
	/*
	var textArr = [];
	var urlArr = [];
	$('.abstract .desc').each(function(index, el) {
		textArr.push($(this).text());
		urlArr.push($(this).parent().attr("href"));
	});
	textArr.sort(function(x, y) {
		return x.length - y.length;
	});
	$('.abstract').empty();
	for (var i = 0; i < textArr.length; i++) {
		var linkEl = '<a href="' + urlArr[i] + '" class="link"><span class="hot">HOT</span><span class="desc">' + textArr[i] + '</span></a>';
		$('.abstract').append(linkEl);
	}
	*/
	$('.abstract .desc').each(function(index, el) {
		var colorArr = ['#FF744B', '#2CA3F2', '#A7D300'];
		var color = getColorByRandom(colorArr);
		$(this).css({
			color: color
		});
	});

	$('.send').click(function() { //发表评论 需要接口
		var commentVal = $(this).siblings('.text').val();
		if ($.trim(commentVal) !== '') {
			var commentHtml = '<div class="box" style="display:none"><div class="left"><img src="images/avatar.png" alt="" class="pic"><h4 class="user"> 用户昵称</h4><div class="desc"><img src="" class=""></div></div><div class="right"><p class="text">' + commentVal + '</p><p class="time">2017-05-04 11:11:34</p > </div><div class="del" title="删除评论"></div></div>';
			$(this).parent().siblings('.details').append(commentHtml).find('.box:last').fadeIn(500);
			$(this).siblings('.text').val('');
			var commentNum = parseInt($(this).parent().siblings('.details').find('.desc .num').text());
			$(this).parent().siblings('.details').find('.desc .num').text(commentNum + 1);
		}
	})
	$(document).on('click', '.del', function() { //删除评论按钮 需要接口
		$(this).parent().remove();
	});
});