$(function(){
//首页tab
$('.index_tab ul li').click(function(){
	$(this).addClass('active').siblings('li').removeClass('active')
	var index=$(this).index();
	$('.index_pm').hide().siblings('.index_pm').eq(index).show();
	
	})

//搜索关键词关闭
$('.search_close').click(function(){
	$(this).siblings('input').val('');
	
	})
//点击YOP返回到顶部
$('.f_up').click(function() {
  $('html, body').animate({
   scrollTop: 0
  },400)
})
//控制字体大小
var curfontsize = 18;
var d_kzFont=$('#d_kzFont');
$('.d_Add').click(function(){
	if(curfontsize<24){
		curfontsize += 2;
		d_kzFont.css("font-size",curfontsize+"px");
		d_kzFont.css("line-height",curfontsize*1.5+"px");
	}
	//d_kzFont.removeClass('d_font12').removeClass('d_font14').addClass('d_font16');
	});
$('.d_Ajj').click(function(){
	if(curfontsize>12){
		curfontsize -= 2;
		d_kzFont.css("font-size",curfontsize+"px");
		d_kzFont.css("line-height",curfontsize*1.5+"px");
	}
	//d_kzFont.removeClass('d_font16').removeClass('d_font14').addClass('d_font12');
	
	});
//$('.d_kz').click(function(){
//	curfontsize = 18;
//	d_kzFont.css("font-size",curfontsize+"px");
//	d_kzFont.css("line-height",curfontsize*1.5+"px");
////	d_kzFont.removeClass('d_font12').removeClass('d_font16').addClass('d_font14');
//	});
//消费查询记录
$('.c_select').click(function(){
	$(this).children('.c_ul').show();
	})
$('.c_ul a').click(function(){
		var t_text=$(this).text();
	    $(this).parents('.c_select').find('em').text(t_text);
		$(this).parent().fadeOut()
		})
$('.c_ul').mouseleave(function(){
	$(this).fadeOut()
	})
$('.c_lx').click(function(){
	$(this).children('.c_lxul').show();
	})
$('.c_lxul a').click(function(){
		var t_text=$(this).text();
	    $(this).parents('.c_lx').find('em').text(t_text);
		$(this).parent().fadeOut()
		})
$('.c_lxul').mouseleave(function(){
	$(this).fadeOut()
	})
//打赏更多
$('.daS_more:last').css('border','none')
$('.daS_tab li').click(function(){
	$(this).addClass('daS_current').siblings('li').removeClass('daS_current');
	var index=$(this).index();
	$('.daS_cont').hide().eq(index).show();
	})

//阅读页
$('.read_tab li:last').css('border','none')	
$('.read_cont p:last').css('border','none')	
$('.read_tab li').click(function(){
	$(this).addClass('read_current').siblings('li').removeClass('read_current');
	var index=$(this).index();
	$('.read_cont').hide().eq(index).show();
	})
//评论

$('.dis_pl:last').css('background','none')

$('.pl_num').each(function(){
	var _num=$(this).parent().siblings('dl').length;
	$(this).text(_num-6)
	
	})

$('.dis_pl_inner').each(function(){
	var dl_length=$(this).find('dl').length;
	for(var i=0;i<6;i++){
		$(this).children('dl').eq(i).show();
		}
	})
	$('.pl_more').each(function(){
		var m_html=$(this).html();
		$(this).click(function(){
			if($(this).html()==m_html){
				$(this).parent().children('dl').show();
	            $(this).html('收起')
				}
			else{
				var dl_length=$(this).parent().children('dl').length
				$(this).parent().children('dl').hide();
				for(var i=0;i<6;i++){
				$(this).parent().children('dl').eq(i).show();
					}
	            $(this).html(m_html)
				}
			
			})
		
		})

//作品主页
$('.pl_zt_dl:last').css('border','none');
$('.s_dl:last-child').css('border','none');

//搜索页
$('.search_tab li').click(function(){
	$(this).addClass('s_current').siblings('li').removeClass('s_current');
	var index=$(this).index();
	$(this).parent().siblings('dl').hide().eq(index).show();
	$('.s_cont').eq(index).show().siblings('.s_cont').hide();
	});

	$("#shares").on("click",function(){
		$(".zhezhao").show();
		$(".share").show();
		return false;
	});
	
	/*$(document).on('click',function(e){
		var e = e || window.event;
		var elem = e.target || e.srcElement;
		while (elem) {
			if (elem.id && (elem.id == "nativeShare" || elem.id == "baiduShare")) {
				return;
			}
			elem = elem.parentNode;
		}
		$('.share').hide();
	});*/
});

function shareHide(){
	$(".zhezhao").hide();
	$(".share").hide();
}




