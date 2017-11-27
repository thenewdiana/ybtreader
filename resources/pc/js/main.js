// JavaScript Document
$(function() {

	$(".l-ser").focus(function(e){
		$(this).val("");
	}).blur(function(){
		if ($(this).val() == "") {
			$(this).val("请输入书名和作者");	
		}			 
	});
	
	$(".l-serg").click(function(){
		var searchName = $(".l-ser").val(); 
		if (searchName != "" && searchName != "请输入书名和作者"){
			$(".l-serg").parent("form").submit();
		}
	});

	// 新书榜 新人榜
	$('.new-tab span').click(function() {
		$(this).addClass('on').siblings('span').removeClass('on');
		o_index = $(this).index();
		$('.new-list').hide().eq(o_index).show();

	});
	// 排行榜
	$('.new-tab1 li').click(function() {
		$(this).addClass('on').siblings('li').removeClass('on');
		o_index = $(this).index();
		$('.new-list').hide().eq(o_index).show();

	});
	$('.new-tab2 li').click(function() {
		$(this).addClass('on').siblings('li').removeClass('on');
		o_index = $(this).index();
		$('.new-list1').hide().eq(o_index).show();

	});

	$('.new-tab3 li').click(function() {
		$(this).addClass('on').siblings('li').removeClass('on');
		o_index = $(this).index();
		$('.new-list2').hide().eq(o_index).show();

	});

	$('.new-tab4 li').click(function() {
		$(this).addClass('on').siblings('li').removeClass('on');
		o_index = $(this).index();
		$('.new-list3').hide().eq(o_index).show();

	});

	$('.new-tab5 li').click(function() {
		$(this).addClass('on').siblings('li').removeClass('on');
		o_index = $(this).index();
		$('.new-list4').hide().eq(o_index).show();

	});

	$('.new-tab6 li').click(function() {
		$(this).addClass('on').siblings('li').removeClass('on');
		o_index = $(this).index();
		$('.new-list5').hide().eq(o_index).show();

	});

	$('.new-tab7 li').click(function() {
		$(this).addClass('on').siblings('li').removeClass('on');
		o_index = $(this).index();
		$('.new-list6').hide().eq(o_index).show();

	});

	$('.new-tab8 li').click(function() {
		$(this).addClass('on').siblings('li').removeClass('on');
		o_index = $(this).index();
		$('.new-list7').hide().eq(o_index).show();

	});

	$('.new-tab9 li').click(function() {
		$(this).addClass('on').siblings('li').removeClass('on');
		o_index = $(this).index();
		$('.new-list8').hide().eq(o_index).show();

	});
	// 阅读页-作品主页
	$('.reviews .ct-t li').hover(function() {
		$(this).addClass('on').siblings('li').removeClass('on');
		o_index = $(this).index();
		$('.new-list').hide().eq(o_index).show();

	});
	// 阅读页-作品主页 回复
	$('.reviews .controls .reply').click(function() {
		$(this).addClass('on').siblings('li').removeClass('on');
		o_index = $(this).index();
		$('.replay').hide().eq(o_index).show();

	});
	// 排行榜新
	$('.phb .ce-t li').click(function() {
		$(this).addClass('on').siblings('li').removeClass('on');
		o_index = $(this).index();
		$('.ce-c').hide().eq(o_index).show();

	});
	// 游客角度
	$('.visit .ce-t li').hover(function() {
		$(this).addClass('on').siblings('li').removeClass('on');
		o_index = $(this).index();
		$('.house').hide().eq(o_index).show();

	});

	// 女频轮播
	$('.leave li').hover(function() {
		$(this).addClass('on').siblings('li').removeClass('on');
		o_index = $(this).index();
		$('.leaf').hide().eq(o_index).show();

	});
	// 更多打赏
	$('.reward .ce-t li').click(function() {
		$(this).addClass('on').siblings('li').removeClass('on');
		o_index = $(this).index();
		$('.ce-c04').hide().eq(o_index).show();

	});
	// 点击弹出
	$('.se_sea01').click(function() {
			$(this).children('.table_dis').show();
			$(this).siblings('.se_sea01').children('.table_dis').hide()
		})
		// 筛选
	$('.table_dis dl dd').click(
			function() {
				$(this).parents('dl').find('dd').removeClass('itemSelected');
				$(this).addClass('itemSelected');
				var this_text = $(this).text()
				$(this).parents('.se_sea01').children('.menubarnew').text(
					this_text).css('color', '#333');
				$(this).parents('.table_dis').fadeOut('fast');
			})
		// 草稿箱
	$(".sub6 ul span").eq(0).show();
	$(".sub6 li").click(function() {
		$(".sub6 li span").removeClass("jian");
		$(this).children("span").addClass("jian");
		$(".sub6 li dl").hide();
		$(this).children("dl").show();
	});

	// 首页轮播
	$('.flashs li img').hover(function() {
		$(this).addClass('on').siblings('li').removeClass('on');
		o_index = $(this).index();
		$('.red-bg').hide().eq(o_index).show();

	});
	// 首页轮播
	$('.pv-slideBox-page li img').hover(function() {
		$(this).addClass('on').siblings('li').removeClass('on');
		o_index = $(this).index();
		$('.red-bg').hide().eq(o_index).show();

	});

	$("#shares").on("click", function() {
		$("#share").toggle();
		return false;
	});
	/*$(document).on('click',function(e){
		var e = e || window.event;
		var elem = e.target || e.srcElement;
		while (elem) {
			if (elem.id && elem.id == "share") {
				return;
			}
			elem = elem.parentNode;
		}
		$('#share').hide();
	});*/

})