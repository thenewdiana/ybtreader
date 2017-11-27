	var ghosts = [{
		type: 'WiFi鬼',
		desc: ['靠WiFi续命，一旦连不上', '就焦虑、多动、四肢无力']
	}, {
		type: '搬砖鬼',
		desc: ['十八岁时梦想在北京有套房子', '八十岁时在八宝山完成了目标']
	}, {
		type: '背锅鬼',
		desc: ['小白创立厨具公司月入百万', '采访时称“飞来横锅接多了']
	}, {
		type: '小气鬼',
		desc: ['讨价还价要对方便宜一毛钱，', '没等要到气死了…']
	}, {
		type: '胆小鬼',
		desc: ['这还用解释么', '当然是吓死的']
	}, {
		type: '烂赌鬼',
		desc: ['一直赌一直赌最后肉体腐烂', '成了历史上最著名的烂赌鬼']
	}, {
		type: '屙屎鬼',
		desc: ['习惯蹲在马桶上思考问题', '成了有名的英年早逝的科学家', '（便秘而亡）']
	}, {
		type: '搞笑鬼',
		desc: ['男友说今天客户来银行取钱，', '一句话说的我石化了：', '“你好，我死期到了。”']
	}, {
		type: '害羞鬼',
		desc: ['被人夸的太多', ' “你是个好人”']
	}, {
		type: '小酒鬼',
		desc: ['爸爸问二锅头在哪', '“不知道啊”', '并打了一套醉拳']
	}, {
		type: '可爱鬼',
		desc: ['认为自己天下第一可爱', '直到养了猫…']
	}, {
		type: '吝啬鬼',
		desc: ['据说一生中唯一', '给出去的只有屎尿屁', '连痰都会咽下']
	}, {
		type: '冒失鬼',
		desc: ['眼睛自带纠错系统', '永远看不到错误']
	}, {
		type: '没有名字的鬼',
		desc: ['一个没有名字的鬼', '可别鬼都尊称“汪旺旺”']
	}, {
		type: '萌萌鬼',
		desc: ['专属特长：毛特长']
	}, {
		type: '晒得像黑鬼',
		desc: ['信誓旦旦地说自己不会晒黑', '经过一个夏天', '再也没有抽到N级以上的卡']
	}, {
		type: '贪吃鬼',
		desc: ['生为吃的人', '死为吃的鬼']
	}, {
		type: '淘气鬼',
		desc: ['这么多人来看你', '你感不感动？', '“不…不敢动，疼…”']
	}, {
		type: '吸血鬼',
		desc: ['“主，我想变成', '守护真爱的吸血鬼骑士”', '“满足你”（变成了姨妈巾）']
	}, {
		type: '戏精鬼',
		desc: ['他微微一笑的四十五秒后', '我连和他孩子的名字都想好了']
	}, {
		type: '信用卡还不起鬼',
		desc: ['办信用卡之前是月光族', '办信用卡后是提前月光族']
	}, {
		type: '长发美女鬼',
		desc: ['男朋友向自己提分手的原因', '是焗油膏太贵了']
	}, {
		type: '百事通鬼',
		desc: ['自诩上知天文下知地理', '答不出女朋友口红的色号']
	}, {
		type: '锥子脸鬼',
		desc: ['向人发誓自己从没', '做过整容手术', '一低头下巴插进了胸里']
	}, {
		type: '讨厌鬼',
		desc: ['讨厌得了重症离世', '讨厌妈哭着喊', '“讨厌死了……讨厌死了……”']
	}, {
		type: '开心鬼',
		desc: ['哈哈哈哈哈哈哈哈哈哈', '哈哈哈哈哈哈哈哈哈嗝']
	}, {
		type: '机灵鬼',
		desc: ['对外宣称是机灵鬼', '实际只是飞机失灵掉下来的…']
	}, {
		type: '闷骚鬼',
		desc: ['苍井优是谁？', '不知道，我只知道苍井空']
	}, {
		type: '赖皮鬼',
		desc: ['常聚地为澡堂', '因为搓澡巾就能退散……']
	}, {
		type: '小懒鬼',
		desc: ['所以变成了“闪电”']
	}, {
		type: '小色鬼',
		desc: ['自从投胎成了泰迪', '就再也没想过做人']
	}, {
		type: '老司机鬼',
		desc: ['秋名山翻车后', '不甘心，苦练车技', '最终成为了秋名山老司机']
	}, {
		type: 'Freestyle鬼',
		desc: ['女友:不知不觉时间已匆匆', '你:人生往往活在后悔中', '被打飞！']
	}, {
		type: '黑怕鬼',
		desc: ['每个爱抖腿的人', '心里都有一台缝纫机']
	}, {
		type: '大保健鬼',
		desc: ['“你追我,如果你追到我', '我就让你嘿~嘿~嘿~”', '双腿复健成功']
	}, {
		type: '广告鬼',
		desc: ['对孟婆说', '“我不断地寻找有你的世界”', '被孟婆打飞过三途川']
	}, {
		type: '精神分裂鬼',
		desc: ['盛夏的午后独自在家', '和谁对聊了一个下午']
	}, {
		type: '肥宅鬼',
		desc: ['“我要开始减肥啦！”', '挑了一天跑步鞋', '最后买了小姐姐泳装手办']
	}, {
		type: '甩锅鬼',
		desc: ['失业后摆摊卖飞饼', '面团出手的刹那，', '忘记了自己曾是回力标运动员']
	}, {
		type: '丧萌鬼',
		desc: ['即使把这条转发朋友圈', '也不会有人点赞', '这就是你人生的写照']
	}, {
		type: '原谅鬼',
		desc: ['老婆的锁屏密码是', '隔壁老王的生日', '“当然是选择原谅她啊！”']
	}, {
		type: 'Gay里Gay气鬼',
		desc: ['愚人节假装GAY,', '问舍友喜不喜欢自己', '被舍友真心实意地表白了']
	}, {
		type: '霸道总裁鬼',
		desc: ['“女人，你成功的吸…”', '“闭嘴！出套表情包再说话”']
	}];
	$(function() {
		var userInput, userSumbit, randomGhostIndex, username, picIndex, src, sharetitle, sharelink, shareimgUrl, descStr, descHtml = '';
		// index表单处理
		if (isWeixin()) {
			$('.wx-share').show();
		}
		userInput = $('#js_userInput');
		userSumbit = $('#js_userSubmit');
		userInput.focus(function() {
			$(this).attr('placeholder', '');
			$(this).prop('value', '');
		});
		userInput.blur(function() {
			if ($.trim($(this).val()) === '') {
				$(this).attr('placeholder', '输入名字');
			}
		});
		userSumbit.click(function() {
			if ($.trim(userInput.val()) === '') {
				return;
			} else {
				inputVal = encodeURIComponent($.trim(userInput.val()));
				randomGhostIndex = getRandomNum(0, ghosts.length);
				descStr = ghosts[randomGhostIndex].desc.join('-');
				showContent(userInput.val(), randomGhostIndex, descStr);
				$.cookie('username', inputVal, {
					path: '/'
				});
				$.cookie('ghostIndex', randomGhostIndex, {
					path: '/'
				});
				$.cookie('step', 'two', {
					path: '/'
				});
				$.cookie('desc', descStr, {
					path: '/'
				});
				$('.ybt-one').hide();
				$('.ybt-two').show();
			}
		});
		if ($.cookie('username') != null) {
			username = decodeURIComponent($.cookie('username'));
			picIndex = $.cookie('ghostIndex');
			descStr = decodeURIComponent($.cookie('desc'));
			showContent(username, picIndex, descStr);
		} else {
			weixinShare($('head title').text(), 'http://www.ebtang.com/m/activity/gj', $('#js_wx_thumb').attr('src'));
		}
		if ($.cookie('step') === 'two') {
			$('.ybt-one').hide();
			$('.ybt-two').show();
		} else if ($.cookie('step') === 'one') {
			$('.ybt-one').show();
			$('.ybt-two').hide();
		}
		$('#js_onemore').click(function() {
			$.cookie('step', 'one', {
				path: '/'
			});
			$('head title').text('来测测你是什么鬼吧？');
			$('#js_wx_thumb').attr('src', 'http://www.ebtang.com/resources/hd/gj_m/img/ghost-10.jpg');
			$('.ybt-one').show();
			$('.ybt-two').hide();
		});

		var winHeight = $(window).height(); //获取当前页面高度  
		$(window).resize(function() {
			var thisHeight = $(this).height();
			if (winHeight - thisHeight > 50) {
				//当软键盘弹出，在这里面操作  
				$('body').css('height', winHeight + 'px');
				$(document).scrollTop(40);
			} else {
				//当软键盘收起，在此处操作  
				$('body').css('height', '100%');
			}
		});

		function weixinShare(title, link, url) {
			var id, nonce, stamp, sign;
			id = $('#appId').val();
			nonce = $('#nonceStr').val();
			stamp = $('#timestamp').val();
			sign = $('#signature').val();
			wx.config({
				debug: false, //值为true时进入debug模式，可以打出状态值
				appId: id,
				timestamp: stamp,
				nonceStr: nonce,
				signature: sign,
				jsApiList: ['onMenuShareTimeline', 'onMenuShareAppMessage'
					// 所有要调用的 API 都要加到这个列表中
				]
			});
			wx.ready(function() {
				wx.checkJsApi({
					jsApiList: ['onMenuShareTimeline', 'onMenuShareAppMessage'], // 需要检测的JS接口列表，所有JS接口列表见附录2,
					success: function(res) {
						// 以键值对的形式返回，可用的api值true，不可用为false
					}
				});
				wx.error(function(res) {});
				//获取“分享到朋友圈”按钮点击状态及自定义分享内容接口
				wx.onMenuShareTimeline({
					title: title, // 分享标题
					link: link, // 分享链接
					imgUrl: url, // 分享图标
					success: function() {
						// 用户确认分享后执行的回调函数
					},
					cancel: function() {
						// 用户取消分享后执行的回调函数
					}
				});
				//获取“分享给朋友”按钮点击状态及自定义分享内容接口
				wx.onMenuShareAppMessage({
					title: title, // 分享标题
					link: link, // 分享链接
					imgUrl: url, // 分享图标
					type: 'link', // 分享类型,music、video或link，不填默认为link
					dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
					success: function() {
						// 用户确认分享后执行的回调函数
					},
					cancel: function() {
						// 用户取消分享后执行的回调函数
					}
				});
			});
		}

		function ghostHeight(obj, length) {
			var height = obj.parent().height() - 20 * parseInt(length) - 10;
			obj.height(height);
		}

		function showContent(name, index, str) {
			var arr = str.split('-');
			$('#js_ghost_pic').removeClass('fadeIn');
			descHtml = '';
			$('#js_user').text(name);
			//显示加载动画
			$('#js_loading .img').show();
			//加载图片
			src = 'http://www.ebtang.com/resources/hd/gj_m/img/ghost-' + index + '.jpg';
			$('#js_ghost_pic,#js_wx_thumb').attr('src', src);
			ghostHeight($('#js_ghost_pic'), arr.length);
			$('#js_ghost_pic').load(function() {
				if ($(this).get(0).complete) {
					$('#js_loading .icon').hide(); //隐藏加载动画
					$(this).addClass('fadeIn');
				}
			});
			//加载文本
			$('#js_ghost_type').text(ghosts[index].type);
			$.each(arr, function(index, item, arr) {
				descHtml += '<p class="text">' + item + '</p>';
			});
			$('#js_ghost_desc').html(descHtml);
			$('head title').text('我是 ' + ghosts[index].type + ', 来测测你是什么鬼吧？');
			weixinShare($('head title').text(), 'http://www.ebtang.com/m/activity/gj', $('#js_wx_thumb').attr('src'));
		}

		function getRandomNum(min, max) {
			var range = max - min;
			var rand = Math.random();
			var num = min + Math.floor(rand * range);
			return num
		}

		function isWeixin() {
			var agent = navigator.userAgent.toLowerCase();
			if (agent.indexOf('micromessenger') != -1) {
				return true;
			} else {
				return false;
			}
		}

		function imgLoad(img, callback) {
			var timer = setInterval(function() {
				if (img.complete) {
					callback(img);
					clearInterval(timer);
				}
			}, 50)
		}

	});