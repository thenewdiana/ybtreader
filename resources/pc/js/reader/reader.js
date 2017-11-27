;
(function() {
	define(['msgBox', 'common'], function(MsgBox, Com) {
		var m_common = {
				modules: [],
				add: function(t) {
					for (var e = !1, o = 0; o < this.modules.length; o++) t === this.modules[o] && (e = !0);
					e || this.modules.push(t)
				},
				remove: function(t) {
					for (var e = 0; e < this.modules.length; e++) this.modules[e] && this.modules.splice(e, 1)
				},
				removeAll: function() {
					this.modules = []
				},
				hide: function() {
					for (var t = 0; t < this.modules.length; t++) this.modules[t].isShow && this.modules[t] != module_buyBox && this.modules[t].hide()
				},
				isLoginRedirect: function(bookChapterId) {
					var userId = m_render.userId;
					if (userId == null || userId == "") {
						var redirectUrl = "/book/" + m_render.bookId + "/" + bookChapterId;
						var path = m_render.path;
						window.location.href = path + '/user/login?redirectUrl=' + redirectUrl;
						return false;
					}
					return true;
				},
				isLogin: function() {
					var userId = m_render.userId;
					if (userId == null || userId == "") {
						return false;
					}
					return true;
				},
				toHtmlStr: function(str, chapterid, isChapterStart) {
					var string, htmlStr, strArr;
					htmlStr = '';
					strArr = str.split('\n');
					if (isChapterStart) {
						strArr.forEach(function(item, index) {
							if (item !== '') {
								htmlStr += '<p class="text p-b p-b-' + (index + 3) + '" data-cn="' + chapterid + '" data-para-index="' + (index + 3) + '">' + item + '</p>';
							}
						});
					} else {
						strArr.forEach(function(item, index) {
							if (item !== '') {
								htmlStr += '<p class="text p-b p-b-' + (index + 2) + '" data-cn="' + chapterid + '" data-para-index="' + (index + 2) + '">' + item + '</p>';
							}
						});
					}
					return htmlStr;
				},
				getEnoughText: function(item, num) {
					var self = this;
					var str = item.text() + '\r\n';
					item.nextAll('.p-b').each(function() {
						var arr = $(this).text().split('');
						for (var i = 0; i < arr.length; i++) {
							str += arr[i];
							if (i == (arr.length - 1)) {
								str += '\r\n';
							}
							if (str.split('').length == num) {
								return false;
							}
						}
						if (str.length == num) {
							return false;
						}
					});
					return str;
				},
				getMarkData: function(obj, num) {
					var self, scrollTop, objArr, markText, data, windowH, pTop, pTopHeight, chapterId;
					self = this;
					scrollTop = $(document).scrollTop();
					objArr = [];
					markText = '';
					data = '';
					$(obj).each(function(index, item) {
						pTopHeight = $(this).offset().top + $(this).outerHeight();
						pTop = $(this).offset().top;
						windowH = $(window).height();
						if (!(scrollTop > pTopHeight || scrollTop < (pTop - windowH))) {
							objArr.push($(item));
						}
					});
					if (objArr.length > 0) {
						if ($(objArr[0]).text().length > num) {
							markText = $(objArr[0]).text().substr(0, num);
						} else {
							markText = self.getEnoughText($(objArr[0]), num);
						}
						if ($(objArr[0]).attr('data-para-index')) {
							chapterId = $(objArr[0]).attr('data-cn');
							chapterTitle = $(objArr[0]).siblings('h2.title').text() !== '' ? $(objArr[0]).siblings('h2.title').text() : $(objArr[0]).text();
						}
						data = "bookId=" + m_render.bookId + "&bookChapterId=" + chapterId + "&bookChapterTitle=" + chapterTitle + "&markContent=" + markText;
					} else {
						data = '';
					}
					return data;
				},
				toCleanText: function(str) {
					return str.replace(/　|\r\n/g, '');
				},
				getParaIndex: function(obj, str) {
					var string, para, paraStr;
					string = str.replace(/　/g, '');
					para = '';
					$(obj).each(function(index, item) {
						paraStr = $(this).text().replace(/　/g, '');
						if (paraStr.indexOf(string) > -1 || string.indexOf(paraStr) > -1) {
							para = obj + '-' + $(this).attr('data-para-index');
							return false;
						}
					});
					if (para !== '') {
						return para;
					} else {
						return 'not found';
					}
				},
				scrollParaIntoView: function(obj, content) {
					if (this.getParaIndex(obj, content) !== 'not found') {
						paraObj = this.getParaIndex(obj, content);
						$(paraObj).get(0).scrollIntoView();
					}
				},
				toMarkedPara: function(cookieVal, obj) {
					var markContent;
					markContent = Com.tools.cookie(cookieVal);
					this.scrollParaIntoView(obj, markContent);
					Com.tools.cookie(cookieVal, null);
					m_render.goFlag = false;
				},
				toAssignedLocation: function(chapterId, randomString) {
					window.location.href = m_render.path + '/book/' + m_render.bookId + '/' + chapterId + '/more' + '?randomString=' + encodeURIComponent(randomString);
				},
				showAutoNote: function(content, timeout) {
					var noteHtml;
					noteHtml = '<div class="popup-note" id="jsReadingNote">' + content + '</div>';
					$('body').append(noteHtml);
					setTimeout(function() {
						$('#jsReadingNote').fadeOut(400);
					}, timeout);
				}
			},
			m_font = {
				init: function() {
					if (Com.tools.checkOs() == 'mac') {
						$('html').addClass('reader-for-mac');
					}
				}
			},
			m_render = {
				readerContainer: '#j_readerWrap',
				markListContainer: '#js_marklist',
				loadingContainer: '#j_comLoading',
				catalogToggleBtn: '#js_toggle_catalog',
				loginPopup: '#jsLoginPopup',
				paraClass: '.reader-c .p-b',
				markListShow: false,
				userId: $('#userId').val(),
				bookId: $('#bookId').val(),
				path: $('#pageUrl').val(),
				isLoading: false,
				goFlag: true,
				init: function() {
					this.initReadingChapter();
					this.renderMarkList();
					this.doCatalog();
				},
				initReadingChapter: function() { //加载开始阅读阅读
					var self, chapterId, url, formData, randomString;
					self = this;
					$('#j_clickNextChapter').hide();
					chapterId = $('#nextId').val();
					url = this.path + '/book/readbook/' + this.bookId + '/' + chapterId + '/more';
					formData = $("#bookChapterForm").serialize();
					randomString = encodeURIComponent($('#randomString').val());
					if ($('.reader-c-' + chapterId).length > 0) {
						return false;
					}
					Com.tools.functionCheck();
					this.ajaxChapterRender(chapterId, url, formData, true);
				},
				renderChapters: function() { //加载章节
					var chapterId, url, formData, buyHtml, randomString;
					$("#j_chapterLoading").show();
					$('#j_clickNextChapter').hide();
					chapterId = $('#nextId').val();
					url = this.path + '/book/readbook/' + this.bookId + '/' + chapterId + '/more';
					formData = $("#bookChapterForm").serialize();
					randomString = encodeURIComponent($('#randomString').val());
					if (chapterId == -1) {
						MsgBox.msgBox.Alert('已经是最后一章');
						$("#j_chapterLoading").hide();
						return false;
					}
					if ($('.reader-c-' + chapterId).length > 0) {
						return false;
					}
					this.ajaxChapterRender(chapterId, url, formData, false);
				},
				ajaxChapterRender: function(chapterId, url, formData, startReading) { //判断请求章节情况
					var self, buyHtml, salePrice;
					self = this;
					buyHtml = '';
					salePrice = 0;
					$.ajax({
						type: "GET",
						data: formData,
						url: url,
						dataType: "json",
						cache: false,
						success: function(json) {
							console.log(json);
							if (json.resBean.code === 0) {
								self.readChapter(chapterId, json, startReading);
							} else if (json.resBean.code === 2) {
								$('#jsVipLogin').show();
							} else if (json.resBean.code === 3 || json.resBean.code === 4) {
								$('#jsVipPay .wrapper').html('');
								$("#j_chapterLoading").hide();
								buyHtml += '<div class="summary"><h2 class="title">订阅VIP章节</h2><p class="text">您的账户余额：<strong class="hl">' + json.userWallet.balanceValue + '</strong>糖豆<a class="btn charge" target="_blank" href="/recharge/index">点击充值</a></p></div><p class="price"><strong class="name">' + json.book.name + '</strong><span class="tips">' + json.priceTip + '</span><strong class="hl now">';
								if ((typeof json.salePrice) !== 'undefined') {
									buyHtml += json.salePrice + '</strong><del class="hl old">(' + json.price + ')</del>糖豆';
									salePrice = json.salePrice;
								} else {
									buyHtml += json.price + '</strong>糖豆';
									salePrice = json.price;
								}
								buyHtml += '</p><div class="option';
								if (json.userWallet.balanceValue >= salePrice && json.isRss === 0) {
									buyHtml += ' three';
								}
								buyHtml += '"><div class="item"><button class="btn buy';
								if (json.userWallet.balanceValue < salePrice) {
									buyHtml += ' disable" disabled="disabled">购买</button></div>';
								} else {
									buyHtml += '">购买</button></div>';
								}
								buyHtml += '<div class="item"><a class="btn" href="' + m_render.path + '/book/' + m_render.bookId + '">返回作品</a></div>';
								if (json.userWallet.balanceValue >= salePrice && json.isRss === 0) {
									buyHtml += '<div class="item"><button class="btn subscribe">自动订阅</button></div>';
								}
								buyHtml += '</div>';
								if ($('#jsVipPay').find('.wrapper').text() === '') {
									$('#jsVipPay').find('.wrapper').html(buyHtml);
								}
								$('#jsVipPay').show();
								m_buy.init();
								m_autoRss.init();
							} else {
								MsgBox.msgBox.Alert(json.resBean.msg);
							}
						}
					});
				},
				readChapter: function(chapterId, json, startReading) { //渲染章节
					var self, container, chapterHtml;
					self = this;
					container = $(self.readerContainer);
					chapterHtml = '<div class="reader-c reader-c-' + chapterId + '" data-block-n="' + chapterId + '"><div class="chapter-wrapper">';
					if (json.sectionName) {
						chapterHtml += '<h1 data-cn="' + chapterId + '" data-para-index="1" class="title p-b p-b-1">' + json.sectionName + '</h1>' + '<h2 data-cn="' + chapterId + '" data-para-index="2" class="title p-b p-b-2">' + json.bookChapter.title + '</h2>' + m_common.toHtmlStr(json.bookChapter.content, chapterId, true) + '</div>';
					} else {
						chapterHtml += '<h2 data-cn="' + chapterId + '" data-para-index="1" class="title p-b p-b-1">' + json.bookChapter.title + '</h2>' + m_common.toHtmlStr(json.bookChapter.content, chapterId, false) + '</div>';
					}
					if (json.bookChapter.remark !== '') {
						chapterHtml += '<div class="author-say pos_r"><div class="says"><p><span class="red">' + json.book.authorNick + '</span> 说：</p><p>' + json.bookChapter.remark + '</p></div><p class="ft-sj"></p></div>';
					}
					chapterHtml += '<div class="column columns"></div><div class="participate" data-cn="' + chapterId + '"><a href="javascript:void(0);" class="btn praise" name="btn_praise">赞（<strong class="red">' + json.praiseCount + '</strong>）</a>';
					chapterHtml += '<a href="javascript:void(0);" class="btn comment" name="btn_open_comment" >评论（<strong class="yellow">' + json.commentCount + '</strong>）</a><a href="javascript:void(0);" class="btn reward" name="btn_reward"></a></div>';
					chapterHtml += '</div>';
					$(container).append(chapterHtml);
					self.toMarkedChapter(self.paraClass);
					self.updateId(chapterId, json.nextId);
					m_praise.init();
					m_comment.init();
					m_reward.init();
					if (startReading) {
						$(self.loadingContainer).hide();
						$('#j_clickNextChapter').show();
						self.clickUpdateChapter();
						self.doWindowScroll();
					} else {
						self.isLoading = false;
						$("#j_chapterLoading").hide();
						$('#j_clickNextChapter').show();
					}
				},
				renderMarkList: function() {
					var self, data, url, listHtml;
					self = this;
					listHtml = '';
					data = 'bookId=' + this.bookId;
					url = this.path + '/book/marklist';
					$.ajax({
						type: "GET",
						data: data,
						url: url,
						dataType: "json",
						cache: false,
						success: function(json) {
							if (json.resBean.code === 1 && json.resBean.msg === '会话过期') {
								listHtml += '<div class="none"><p>登录后才能使用书签功能哦~</p></div>';
							} else if (json.resBean.code === 0) {
								if (json.marklist.length <= 0) {
									listHtml += '<div class="none"><p class="text">您还未添加书签</p></div>';
								} else {
									listHtml += '<ul class="list">';
									json.marklist.forEach(function(item, index) {
										listHtml += '<li class="item" data-id="' + item.id + '"><h3 class="title" >' + item.bookChapterTitle + '<span class="date">' + Com.tools.formatDate(new Date(item.createTime), 'yyyy-MM-dd hh:mm') + '</span></h3><div class="desc"><p class="text" title="点击跳转" data-cn="' + item.bookChapterId + '">' + m_common.toCleanText(item.markContent) + '</p></div><button class="del"></button></li>';
									});
									listHtml += '</ul>';
								}
							}
							$(self.markListContainer).find('.content').html(listHtml);
						}
					});
				},
				toMarkedChapter: function(obj) {
					var params, markContent, paraObj, client, modifyTime, note;
					params = window.location.search;
					if (params != '' && m_render.goFlag) {
						if (Com.tools.getUrlPara(params).fbm == '1' && (typeof Com.tools.cookie('bookmarkContent')) == 'string') {
							m_common.toMarkedPara('bookmarkContent', obj);
						} else if (Com.tools.getUrlPara(params).hr == '1' && (typeof Com.tools.cookie('ybtLastReadContent')) == 'string') {
							m_common.toMarkedPara('ybtLastReadContent', obj);
							if (Com.tools.getUrlPara(params).fr.length > 0) {
								if (Com.tools.getUrlPara(params).fr == 1) {
									client = '<span class="larger"> iPhone</span> 客户端';
								} else if (Com.tools.getUrlPara(params).fr == 2) {
									client = '<span class="larger"> Android</span> 客户端';
								} else if (Com.tools.getUrlPara(params).fr == 0) {
									client = '<span class="larger"> 电脑网页</span> ';
								}
								modifyTime = Com.tools.formatDate(new Date(parseInt(Com.tools.cookie('ybtModifyTime'))), 'MM-dd hh:mm');
								note = '<p class="text">已同步至 <span class="larger">' + modifyTime + '</span>' + client + '的阅读进度</p>';
								m_common.showAutoNote(note, 2500);
							}
						} else {
							return;
						}
					}
				},
				doCatalog: function(id) {
					var self = this;
					//跳转到书籍目录页面
					$(this.catalogToggleBtn).click(function() {
						window.location.href = self.path + '/book/' + self.bookId + "/directory";
					});
				},
				doWindowScroll: function() {
					var self = this;
					$(window).scroll(function() {
						if ($(window).scrollTop() + $(window).height() >= $(document).height()) {
							if (!self.isLoading) {
								self.isLoading = true;
								self.renderChapters();
							}
						}
					});
				},
				clickUpdateChapter: function() {
					var self = this;
					$(document).on('click', '#j_clickNextChapter', function() {
						if (!self.isLoading) {
							self.isLoading = true;
							self.renderChapters();
						}
					});
				},
				updateId: function(curId, nextId) {
					$("#curId").attr("value", curId);
					$("#nextId").attr("value", nextId);
				}
			},
			m_autoRss = {
				init: function() {
					var obj, url, data, chapterId;
					$('#jsVipPay').find('.subscribe').unbind("click");
					$('#jsVipPay').find('.subscribe').on("click", function() {
						obj = $(this);
						chapterId = $('#nextId').val();
						MsgBox.msgBox.Confirm("是否确定打开订阅", function() { //打开订阅
							url = m_render.path + "/book/rss";
							data = 'bookId=' + m_render.bookId;
							$.ajax({
								type: "GET",
								data: data,
								url: url,
								dataType: "json",
								cache: false,
								success: function(json) {
									if (json.resBean.code == 0) {
										$('#jsVipPay').find('.buy').trigger('click');
									} else {
										MsgBox.msgBox.Alert(json.resBean.msg);
									}
								}
							});
						});
					});
				}
			},
			m_buy = {
				init: function() {
					var chapterId, url;
					$('#jsVipPay').find('.buy').unbind("click");
					$('#jsVipPay').find('.buy').on('click', function() {
						chapterId = $('#nextId').val();
						url = m_render.path + '/book/readbook/' + m_render.bookId + '/' + chapterId + '/pay';
						$.ajax({
							type: "GET",
							url: url,
							dataType: "json",
							cache: false,
							success: function(json) {
								if (json.resBean.code === 0) {
									$('#jsVipPay').hide();
									m_render.readChapter(chapterId, json);
								} else {
									MsgBox.msgBox.Alert(json.resBean.msg);
								}
							}
						});
					});
				}
			},
			m_bg = {
				init: function(a) {
					this.toggleBg(a);
				},
				toggleBg: function(a) {
					$(document).on('click', a.btn, function() {
						if ($(a.controlObj).hasClass(a.className)) {
							$(a.controlObj).removeClass(a.className);
						} else {
							$(a.controlObj).addClass(a.className);
						}
					});
				}
			},
			m_addMark = {
				init: function(a) {
					this.doAddMark(a);
				},
				doAddMark: function(a) {
					var url, formData;
					$(document).on('click', a.btn, function(e) {
						if (!m_common.isLogin()) {
							$(m_render.loginPopup).fadeIn();
						} else {
							MsgBox.msgBox.Confirm("是否确定进行打书签", function() {
								url = m_render.path + '/book/bookmark';
								formData = m_common.getMarkData(a.controlObj, 100);
								if (formData == '') {
									MsgBox.msgBox.Alert("请重试");
								}
								$.ajax({
									type: "POST",
									data: formData,
									url: url,
									dataType: "json",
									cache: false,
									success: function(json) {
										if (json.resBean.code == 0) {
											m_render.renderMarkList();
											MsgBox.msgBox.Alert("添加成功");
										} else {
											if (json.resBean.msg === '会话过期') {
												MsgBox.msgBox.Alert('请先登录再刷新页面');
											}
										}
									}
								});
							});
						}
					});
				}
			},
			m_delMark = {
				init: function(a) {
					this.doDelMark(a);
				},
				doDelMark: function(a) {
					var url, formData, self;
					$(document).on('click', a.btn, function(e) {
						self = $(this);
						url = m_render.path + '/book/delmark';
						formData = 'markId=' + $(e.target).parent().attr('data-id');
						$.ajax({
							type: "GET",
							data: formData,
							url: url,
							dataType: "json",
							cache: false,
							success: function(json) {
								if (json.resBean.code == 0) {
									$(self).parent().slideUp(400, function() {
										$(this).remove();
										if ($('#js_marklist').find('.list .item').length == 0) {
											$('#js_marklist').find('.content').html('<div class="none"><p class="text">您还未添加书签</p></div>');
										}
									});
								} else {
									MsgBox.msgBox.Alert(json.resBean.msg);
								}
							}
						});
					});
				}
			},
			m_goToBookMark = {
				init: function(a) {
					this.clickToChapterMark(a);
				},
				clickToChapterMark: function(a) {
					var self, obj, chapterId, url, paraObj;
					obj = a;
					$(document).on('click', a.btn, function(e) {
						chapterId = $(e.target).attr('data-cn');
						markContent = $(e.target).text();
						if ($('.reader-c-' + chapterId).length > 0) {
							if ($('#js_marklist').is(':visible')) {
								$('#js_marklist').fadeOut(300);
							}
							m_common.scrollParaIntoView('.reader-c-' + chapterId + ' .p-b', markContent);
						} else {
							Com.tools.cookie('bookmarkContent', markContent);
							url = m_render.path + '/book/' + m_render.bookId + '/' + chapterId + '?fbm=1';
							window.location.href = url;
						}
					});
				}
			},
			m_saveTempMark = {
				save: function(obj) {
					var data, url;
					if (m_common.isLogin()) {
						if (Com.tools.isIE()) {
							window.onbeforeunload = function() {
								data = m_common.getMarkData(obj, 100);
								data += '&chapterSort=0';
								url = m_render.path + "/book/booktemmark";
								$.ajax({
									type: "POST",
									data: data,
									url: url,
									dataType: "json",
									cache: false,
									success: function(json) {
										if (json.resBean.code == 0) {
											return;
										}
									}
								});
							}
						} else {
							$(window).on('unload', function() {
								data = m_common.getMarkData(obj, 100);
								data += '&chapterSort=0';
								url = m_render.path + "/book/booktemmark";
								$.ajax({
									type: "POST",
									data: data,
									url: url,
									dataType: "json",
									cache: false,
									success: function(json) {
										if (json.resBean.code == 0) {
											return;
										}
									}
								});
							});
						}
					}
				}
			},
			m_markList = {
				init: function(a) {
					this.toggleMarklist(a);
					this.closeMarklist(a);
				},
				toggleMarklist: function(a) {
					var self = this;
					$(document).on('click', function() {
						if (!$(a.controlObj).is(':hidden')) {
							$(a.controlObj).fadeOut(400);
						}
					});
					$(document).on('click', a.controlObj, function(e) {
						e.stopPropagation();
					});
					$(document).on('click', a.open, function(e) {
						e.stopPropagation();
						if ($(a.controlObj).is(':hidden')) {
							$(a.controlObj).fadeIn(400);
						} else {
							$(a.controlObj).fadeOut(400);
						}
					});
				},
				closeMarklist: function(a) {
					$(document).on('click', a.close, function() {
						$(a.controlObj).fadeOut(400);
					});
				}
			},
			m_backToTop = {
				init: function(a) {
					this.toTop(a);
				},
				toTop: function(a) {
					$(window).scroll(function() {
						if ($(window).scrollTop() > 500) {
							$(a.btn).fadeIn();
						} else {
							$(a.btn).hide();
						}
					});
					$(a.btn).click(function(e) {
						$('html,body').animate({
							scrollTop: 0
						}, 200);
					});
				}
			},
			m_vote = {
				init: function(a) {
					this.doVote(a);
				},
				doVote: function(a) {
					var chapterId, formData, url;
					$(document).on('click', a.btn, function(e) {
						chapterId = $('#nextId');
						if (!m_common.isLoginRedirect(chapterId)) {
							return;
						}
						formData = "bookId=" + m_render.bookId;
						url = m_render.path + '/book/golden';
						MsgBox.msgBox.Confirm("是否确定进行投票", function() {
							$.ajax({
								type: "GET",
								data: formData,
								url: url,
								dataType: "json",
								cache: false,
								success: function(json) {
									if (json.resBean.code == 0) {
										MsgBox.msgBox.Alert("金票打赏成功");
									} else {
										MsgBox.msgBox.Alert(json.resBean.msg);
									}
								}
							});
						});
					});
				}
			},
			m_praise = {
				init: function() {
					this.doPraise();
				},
				doPraise: function() {
					$('.participate .praise').off('click');
					$('.participate .praise').on("click", function() {
						var obj, chapterId, formData, url;
						obj = $(this);
						chapterId = $(this).parent().attr('data-cn');
						if (!m_common.isLoginRedirect(chapterId)) {
							return;
						}
						formData = "bookId=" + m_render.bookId + "&bookChapterId=" + chapterId;
						url = m_render.path + '/book/praise';
						$.ajax({
							type: "GET",
							data: formData,
							url: url,
							dataType: "json",
							cache: false,
							success: function(json) {
								if (json.resBean.code != 0) {
									MsgBox.msgBox.Alert(json.resBean.msg);
								} else {
									$(obj).find(".red").text(json.praiseCount);
								}
							}
						});
					});
				}
			},
			m_comment = {
				init: function() {
					this.toggleComment();
				},
				toggleComment: function() {
					var self = this;
					$('.participate .comment').unbind("click");
					$('.participate .comment').bind("click", function() {
						var chapterId = $(this).parent().attr('data-cn');
						var loadedComment = self.getDivComment(chapterId);
						if (loadedComment == null) {
							self.loadComment(chapterId);
						} else {
							if ($(loadedComment).is(":visible") == false) {
								$(loadedComment).show();
							} else {
								$(loadedComment).hide();
							}
						}
					});
				},
				getDivComment: function(chapterId) {
					var commentObj = null;
					$(".discus2").each(function() {
						var obj = $(this);
						var objId = $(obj).attr("id");
						if (objId == chapterId) {
							commentObj = obj;
						}
					});
					return commentObj;
				},
				startComment: function() {
					var self = this;
					$("a[name='btn_comment']").unbind("click");
					$("a[name='btn_comment']").bind("click", function() {
						var obj, commentForm, chapterId, error, formData;
						obj = $(this);
						commentForm = obj.parent().parent().parent();
						chapterId = $(obj).attr("id");
						formData = commentForm.serialize();
						url = m_render.path + '/comment/add_chapter_comment';
						if (!m_common.isLoginRedirect(chapterId)) {
							return;
						}
						if ($.trim(commentForm.find('.punt-wd').val()) === '') {
							commentForm.find('.punt-wd').val('');
							return;
						} else {
							$.ajax({
								type: "POST",
								data: formData,
								url: url,
								dataType: "json",
								cache: false,
								success: function(json) {
									error = $(commentForm).find(".red");
									if (json.resBean.code != 0) {
										$(error).text(json.resBean.msg);
									} else {
										self.loadComment(chapterId);
									}
								}
							});
						}
					});
				},
				loadComment: function(chapterId) {
					var self, formData, url, commentCount;
					self = this;
					formData = "bookId=" + m_render.bookId + "&bookChapterId=" + chapterId;
					url = m_render.path + "/comment/listbychapter";
					$.ajax({
						type: "GET",
						data: formData,
						url: url,
						dataType: "text",
						cache: false,
						success: function(html) {
							$('.reader-c-' + chapterId).find(".discus2").remove();
							$('.reader-c-' + chapterId).append(html);
							self.replyComment();
							self.delComment();
							self.stickComment();
							self.enlightenComment();
							commentCount = $('.reader-c-' + chapterId + ' .discus2').attr('totalcomment');
							$('.reader-c-' + chapterId).find('.comment .yellow').text(commentCount);
							self.startComment();
						}
					});
				},
				replyComment: function() {
					var self, replyDiv, hidden, replyForm, chapterId, formData, url;
					self = this;
					$("a[name='btn_comment_reply']").each(function() {
						replyDiv = $(this).parent().parent().next("div");
						$(replyDiv).hide();
					});
					//我要回复
					$("a[name='btn_comment_reply']").unbind("click");
					$("a[name='btn_comment_reply']").bind("click", function() {
						replyDiv = $(this).parent().parent().next("div");
						hidden = $(replyDiv).is(":hidden");
						if (hidden) {
							$(replyDiv).show();
						} else {
							$(replyDiv).hide();
						}
					});
					//提交回复
					$("input[name='btn_sumbit_comment_reply']").unbind("click");
					$("input[name='btn_sumbit_comment_reply']").bind("click", function() {
						replyForm = $(this).parent();
						chapterId = $(this).attr("nick");
						formData = $(replyForm).serialize();
						url = m_render.path + '/comment/add_chapter_comment';
						$.ajax({
							type: "POST",
							data: formData,
							url: url,
							dataType: "json",
							cache: false,
							success: function(json) {
								if (json.resBean.code != 0) {
									$(replyForm).find(".red").text(json.resBean.msg);
								} else {
									self.loadComment(chapterId);
								}
							}
						});
					});
				},
				delComment: function() {
					var self, commentId, chapterId, formData, url;
					self = this;
					$("a[name='btn_comment_del']").unbind("click");
					$("a[name='btn_comment_del']").bind("click", function() {
						commentId = $(this).attr("id");
						chapterId = $(this).attr("nick");
						formData = 'bookId=' + m_render.bookId + '&commentId=' + commentId;
						url = m_render.path + '/comment/del';
						MsgBox.msgBox.Confirm("是否确定删除", function() {
							$.ajax({
								type: "GET",
								data: formData,
								url: url,
								dataType: "json",
								cache: false,
								success: function(json) {
									if (json.resBean.code != 0) {
										MsgBox.msgBox.Alert(json.resBean.msg);
									} else {
										self.loadComment(chapterId);
									}
								}
							});
						});
					});
				},
				stickComment: function() {
					var commentId, formData, url;
					$("a[name='btn_comment_top']").unbind("click");
					$("a[name='btn_comment_top']").bind("click", function() {
						commentId = $(this).attr("id");
						formData = "bookId=-1&commentId=" + commentId;
						url = m_render.path + '/comment/top';
						$.ajax({
							type: "GET",
							data: formData,
							url: url,
							dataType: "json",
							cache: false,
							success: function(json) {
								if (json.resBean.code != 0) {
									MsgBox.msgBox.Alert(json.resBean.msg);
								} else {
									MsgBox.msgBox.Alert("设置置顶成功");
								}
							}
						});
					});
				},
				enlightenComment: function() {
					var commentId, formData, url;
					$("a[name='btn_comment_hot']").unbind("click");
					$("a[name='btn_comment_hot']").bind("click", function() {
						commentId = $(this).attr("id");
						formData = "bookId=-1&commentId=" + commentId;
						url = m_render.path + '/comment/hot';
						$.ajax({
							type: "GET",
							data: formData,
							url: url,
							dataType: "json",
							cache: false,
							success: function(json) {
								if (json.resBean.code != 0) {
									MsgBox.msgBox.Alert(json.resBean.msg);
								} else {
									MsgBox.msgBox.Alert("设置精华成功");
								}
							}
						});
					});
				}
			},
			m_reward = {
				init: function() {
					this.openReward();
				},
				openReward: function() {
					var self, obj, chapterId, data, url;
					self = this;
					$("a[name='btn_reward']").off("click");
					$("a[name='btn_reward']").on("click", function() {
						obj = $(this);
						chapterId = $('#nextId').val();
						if (!m_common.isLoginRedirect(chapterId)) {
							return;
						}
						//打赏层
						$(this).parent().prev(".column").empty();
						data = "bookId=" + m_render.bookId;
						url = m_render.path + '/book/chapter/reward_template';
						$.ajax({
							type: "GET",
							data: data,
							url: url,
							dataType: "text",
							cache: false,
							success: function(html) {
								$(obj).parent().prev(".column").append(html).show();
								self.closeReward();
								self.chooseReward();
								self.submitReward();
							}
						});
					});
				},
				closeReward: function() {
					//关闭				
					$('a[name="btn_close"]').off("click");
					$('a[name="btn_close"]').on("click", function() {
						$(this).parent().parent().empty().hide();
					});
				},
				chooseReward: function() {
					var id;
					//选择奖励
					$('.column .col66 dd').off("click");
					$('.column .col66 dd').on("click", function() {
						id = $(this).find('a').attr("id");
						$(this).find('img').addClass('css_img_reward_type_on');
						$(this).siblings().find('img').removeClass('css_img_reward_type_on');
						$(this).parent().parent().find('input[name="rewardType"]').attr("value", id);
					});
				},
				submitReward: function() {
					var obj, layer, id, formData, url, rewardCount, rewardType;
					//提交
					$('a[name="btn_submit"]').unbind("click");
					$('a[name="btn_submit"]').bind("click", function() {
						chapterId = $('#nextId').val();
						if (!m_common.isLoginRedirect(chapterId)) {
							return;
						}
						obj = $(this);
						MsgBox.msgBox.Confirm("是否确定打赏?", function() {
							layer = $(obj).parent().parent().parent();
							id = $(layer).find('input[name="rewardType"]').val();
							formData = $(layer).serialize();
							url = m_render.path + '/book/reward';
							$.ajax({
								type: "GET",
								data: formData,
								url: url,
								dataType: "json",
								cache: false,
								success: function(json) {
									if (json.resBean.code == 0) {
										rewardCount = json.userReward.rewardTypeCount;
										rewardType = json.userReward.rewardType;
										$(layer).find('.red').filter('#' + rewardType).text(rewardCount);
									} else if (json.resBean.code == 2) {
										MsgBox.msgBox.ConfirmBtn(json.resBean.msg, "我要充值", null, function() {
											window.location.href = m_render.path + '/recharge/index';
										});
									} else {
										MsgBox.msgBox.Alert(json.resBean.msg);
									}
								}
							});
						});
					});
				}
			};
		return {
			m_font: m_font,
			m_render: m_render,
			m_bg: m_bg,
			m_vote: m_vote,
			m_addMark: m_addMark,
			m_markList: m_markList,
			m_goToBookMark: m_goToBookMark,
			m_saveTempMark: m_saveTempMark,
			m_delMark: m_delMark,
			m_backToTop: m_backToTop
		}
	});
})();