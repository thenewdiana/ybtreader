;
(function() {
	define(['jquery', 'common'], function($, com) {
		function Pagination(usersetting) {
			this.defaultSetting = {};
			this.userSetting = usersetting;
			this.settings = $.extend(this.defaultSetting, this.userSetting);
			this.settings.box = $('#' + this.settings.box);
			this.settings.pageBox = $('#' + this.settings.pageBox);
			this.flag = true;
			this.start = this.settings.firstPageStart;
			this.size = this.settings.pageSize;
			this.totalPage = Math.ceil(parseInt(this.settings.totalRecords - this.start) / this.size);
		}
		Pagination.prototype = {
			init: function() {
				this.pageBtnClick();
				if (this.flag) {
					this.getData(this.start, this.size); //首页加载
				}
				if (this.totalPage < 2) {
					this.settings.pageBox.hide();
				}
			},
			pageBtnClick: function() {
				var self = this;
				var rel, start, size, totalRecords, totalPage;
				this.settings.pageBox.on('click', 'a', function() {
					if (self.flag) {
						self.flag = false;
						rel = parseInt($(this).siblings('#cur').attr('rel'));
						start = self.start;
						size = self.size;
						totalRecords = self.settings.totalRecords;;
						totalPage = self.totalPage;
						if ($(this).hasClass('next')) {
							rel++;
							if (rel > totalPage) {
								rel = 1;
							}
							start = start + (rel - 1) * size;
							self.getData(start, size)
						}
						if ($(this).hasClass('prev')) {
							rel--;
							if (rel <= 0) {
								rel = totalPage;
							}
							start = start + (rel - 1) * size;
							self.getData(start, size)
						}
					}
				});
			},
			getData: function(start, size) {
				var self = this;
				$.ajax({
					url: '/activity/zj/rank_json',
					type: 'POST',
					data: {
						start: start,
						size: size
					},
					success: function(json) {
						self.pageSize = size; //每页显示条数
						var str = '';
						var rank, rater, cur, total, pageStart;
						$.each(json.body, function(index, item) { //遍历json数据列
							rank = parseInt(start) + index + 1;
							if (com.Com.isMobile()) {
								str += '<tr class="item"><td class="text rank">' + rank + '</td><td class = "text name" ><a class="link" target="_blank" href="/m/book/' + item.bookId + '">' + item.bookName + '</a></td><td class="text heat" >' + item.hot + '</td> <td class="text"><input type="hidden" value="' + item.bookId + '" name="bookId" class="book-id"><button class="gold" type="button"></button></td></tr>';
							} else {
								str += '<tr class="item"><td><p class="num">' + rank + '</p></td><td><a class="name" target="_blank" href="/book/' + item.bookId + '">' + item.bookName + '</a></td><td><p class="heat">' + item.hot + '</p></td><td><p class="type">' + item.categoryName + '</p></td><td class="update">';
								if (item.userRewardResBean !== '') {
									str += '<p class="tip text"><span class="type">粉丝</span><span class="name">' + item.userRewardResBean.fromUserNick + '</span>打赏<span class="icon sprite "></span>' + '火把X' + '<span class="num">' + item.userRewardResBean.rewardCount + '</span></p>';
								} else {
									str += '<p class="tip text"></p>';
								}
								if (item.hdZhuJianScoreDetail !== '') {
									if (item.hdZhuJianScoreDetail.scoreType === 1) {
										rater = '编辑';
									} else if (item.hdZhuJianScoreDetail.scoreType === 2) {
										rater = '评委';
									}
									str += '<p class="gold text"><span class="type">' + rater + '</span><span class="name">' + item.hdZhuJianScoreDetail.username + '</span>投票+<span class="num">' + item.hdZhuJianScoreDetail.score + '</span> HOT值</p>';
								} else {
									str += '<p class="gold text"></p>';
								}
								str += '</td><td><p class="vote"><input type="hidden" value="' + item.bookId + '" name="bookId" class="book-id"><button class="gold sprite" type="button"></button><button class="tip sprite" type="button"></button></p></td></tr>';
							}
						});
						total = self.settings.totalRecords;
						pageStart = self.settings.firstPageStart;
						cur = Math.floor((parseInt(start) - parseInt(pageStart)) / size) + 1;
						self.settings.box.find('tbody').html(str);
						self.settings.pageBox.find('#cur').attr('rel', cur);
						self.flag = true;
					},
					error: function(xhr, status) {
						if (xhr.status !== 200) {
							console.log('无法完成请求');
						}
					}
				});
			}
		}
		return {
			Pagination: Pagination
		}
	});
})();