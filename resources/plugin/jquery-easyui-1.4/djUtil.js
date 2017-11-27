/**
 * 包含easyui的扩展和常用的方法
 * 
 * @author 鸵鸟
 * 
 * @version 20120806
 */

var dj = $.extend({}, dj);/* 定义全局对象，类似于命名空间或包的作用 */


dj.dialog = function(options) {
	var opts = $.extend({
		modal : true,
		onClose : function() {
			$(this).dialog('destroy');
		}
	}, options);
	return $('<div/>').dialog(opts);
};

/**
 * @author 鸵鸟
 * 
 * @requires jQuery,EasyUI
 * 
 * @param title
 *            标题
 * 
 * @param msg
 *            提示信息
 * 
 * @param fun
 *            回调方法
 */
dj.messagerConfirm = function(title, msg, fn) {
	return $.messager.confirm(title, msg, fn);
};

/**
 * @author 鸵鸟
 * 
 * @requires jQuery,EasyUI
 */
dj.messagerShow = function(options) {
	return $.messager.show(options);
};

/**
 * @author 鸵鸟
 * 
 * @requires jQuery,EasyUI
 */
dj.messagerAlert = function(title, msg, icon, fn) {
	return $.messager.alert(title, msg, icon, fn);
};

/**
 * @author 鸵鸟
 * 
 * @requires jQuery,EasyUI,jQuery cookie plugin
 * 
 * 更换EasyUI主题的方法
 * 
 * @param themeName
 *            主题名称
 */
dj.changeTheme = function(themeName) {
	var $easyuiTheme = $('#easyuiTheme');
	var url = $easyuiTheme.attr('href');
	var href = url.substring(0, url.indexOf('themes')) + 'themes/' + themeName + '/easyui.css';
	$easyuiTheme.attr('href', href);

	var $iframe = $('iframe');
	if ($iframe.length > 0) {
		for ( var i = 0; i < $iframe.length; i++) {
			var ifr = $iframe[i];
			$(ifr).contents().find('#easyuiTheme').attr('href', href);
		}
	}

	$.cookie('easyuiThemeName', themeName, {
		expires : 7
	});
};

/**
 * @author 鸵鸟
 * 
 * 获得项目根路径
 * 
 * 使用方法：dj.bp();
 * 
 * @returns 项目根路径
 */
dj.bp = function() {
	var curWwwPath = window.document.location.href;
	var pathName = window.document.location.pathname;
	var pos = curWwwPath.indexOf(pathName);
	var localhostPaht = curWwwPath.substring(0, pos);
	var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
	return (localhostPaht + projectName);
};

/**
 * @author 鸵鸟
 * 
 * 使用方法:dj.pn();
 * 
 * @returns 项目名称(/sshe)
 */
dj.pn = function() {
	return window.document.location.pathname.substring(0, window.document.location.pathname.indexOf('\/', 1));
};

/**
 * @author 鸵鸟
 * 
 * 增加formatString功能
 * 
 * 使用方法：dj.fs('字符串{0}字符串{1}字符串','第一个变量','第二个变量');
 * 
 * @returns 格式化后的字符串
 */
dj.fs = function(str) {
	for ( var i = 0; i < arguments.length - 1; i++) {
		str = str.replace("{" + i + "}", arguments[i + 1]);
	}
	return str;
};

/**
 * @author 鸵鸟
 * 
 * 增加命名空间功能
 * 
 * 使用方法：dj.ns('jQuery.bbb.ccc','jQuery.eee.fff');
 */
dj.ns = function() {
	var o = {}, d;
	for ( var i = 0; i < arguments.length; i++) {
		d = arguments[i].split(".");
		o = window[d[0]] = window[d[0]] || {};
		for ( var k = 0; k < d.slice(1).length; k++) {
			o = o[d[k + 1]] = o[d[k + 1]] || {};
		}
	}
	return o;
};

/**
 * @author 鸵鸟
 * 
 * 生成UUID
 * 
 * @returns UUID字符串
 */
dj.random4 = function() {
	return (((1 + Math.random()) * 0x10000) | 0).toString(16).substring(1);
};
dj.UUID = function() {
	return (dj.random4() + dj.random4() + "-" + dj.random4() + "-" + dj.random4() + "-" + dj.random4() + "-" + dj.random4() + dj.random4() + dj.random4());
};

/**
 * @author 鸵鸟
 * 
 * 获得URL参数
 * 
 * @returns 对应名称的值
 */
dj.getUrlParam = function(name) {
	var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
	var r = window.location.search.substr(1).match(reg);
	if (r != null)
		return unescape(r[2]);
	return null;
};

/**
 * @author 鸵鸟
 * 
 * 接收一个以逗号分割的字符串，返回List，list里每一项都是一个字符串
 * 
 * @returns list
 */
dj.getList = function(value) {
	if (value != undefined && value != '') {
		var values = [];
		var t = value.split(',');
		for ( var i = 0; i < t.length; i++) {
			values.push('' + t[i]);/* 避免他将ID当成数字 */
		}
		return values;
	} else {
		return [];
	}
};

/**
 * @author 鸵鸟
 * 
 * @requires jQuery
 * 
 * 判断浏览器是否是IE并且版本小于8
 * 
 * @returns true/false
 */
dj.isLessThanIe8 = function() {
	return ($.browser.msie && $.browser.version < 8);
};

/**
 * @author 鸵鸟
 * 
 * @requires jQuery
 * 
 * 将form表单元素的值序列化成对象
 * 
 * @returns object
 */
dj.serializeObject = function(form) {
	var o = {};
	$.each(form.serializeArray(), function(index) {
		if (o[this['name']]) {
			o[this['name']] = o[this['name']] + "," + this['value'];
		} else {
			o[this['name']] = this['value'];
		}
	});
	return o;
};

/**
 * 
 * 将JSON对象转换成字符串
 * 
 * @param o
 * @returns string
 */
dj.jsonToString = function(o) {
	var r = [];
	if (typeof o == "string")
		return "\"" + o.replace(/([\'\"\\])/g, "\\$1").replace(/(\n)/g, "\\n").replace(/(\r)/g, "\\r").replace(/(\t)/g, "\\t") + "\"";
	if (typeof o == "object") {
		if (!o.sort) {
			for ( var i in o)
				r.push(i + ":" + obj2str(o[i]));
			if (!!document.all && !/^\n?function\s*toString\(\)\s*\{\n?\s*\[native code\]\n?\s*\}\n?\s*$/.test(o.toString)) {
				r.push("toString:" + o.toString.toString());
			}
			r = "{" + r.join() + "}";
		} else {
			for ( var i = 0; i < o.length; i++)
				r.push(obj2str(o[i]));
			r = "[" + r.join() + "]";
		}
		return r;
	}
	return o.toString();
};

