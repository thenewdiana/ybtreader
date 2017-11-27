;
(function() {
	var url = document.getElementById('resourcesUrl').value + 'pc/js';
	requirejs.config({
		baseUrl: url,
		paths: {
			msgBox: 'lib/jquery.msg',
			common: 'util/common',
			md5: 'util/md5.min',
			reader: 'reader/reader',
			sign: 'sign/sign'
		}
	});
	requirejs(['reader', 'sign'], function(Reader, Sign) {
		$(document).ready(function() {
			Reader.m_font.init();
			Reader.m_render.init();
			Reader.m_bg.init({
				btn: '#js_light_control',
				controlObj: '.reader-container',
				className: 'read-dark'
			});
			Reader.m_saveTempMark.save('.reader-c .p-b'); //临时书签
			Reader.m_addMark.init({ //添加书签
				btn: '#js_add_mark',
				controlObj: '.reader-c .p-b'
			});
			Reader.m_markList.init({ //书签列表
				open: '#js_toggle_marklist',
				close: '#js_close_markList',
				controlObj: '#js_marklist'
			});
			Reader.m_goToBookMark.init({ //跳转书签
				btn: '#js_marklist .desc .text',
				controlObj: '.reader-c .p-b'
			});
			Reader.m_delMark.init({ //删除书签
				btn: '#js_marklist button.del'
			});
			Reader.m_backToTop.init({ //回到顶部
				btn: '#js_click_totop',
				speed: 400
			});
			Reader.m_vote.init({ //投金票
				btn: '#js_vote_golden'
			});
			Sign.m_sign.init({
				btn: '#jsLoginSubmit',
				controlObj: '#jsLoginPopup'
			});
		})
	});
})();