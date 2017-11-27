;
(function(factory) {
	if (typeof define === 'function' && define.amd) {
		define(factory);
	} else {
		window.utilCommon = factory();
	}
})(function() {
	var tools = {
		isWhatDevice: function() {
			var n = {
				Edge: /Edge/i,
				Wechat: /MicroMessenger/,
				Weibo: /Weibo/,
				QQ: /\sQQ\//,
				Mobile: /Mobile/,
				Android: /Android/,
				iOS: /iPhone|iPad|iPod/,
				isAppleDevice: /iPad|iPhone|iPod|Mac OS X/
					//Zhihu: /Zhihu|osee2unifiedRelease|Futureve//,
					//isBot: /Baiduspider|Sogou\s\w+\sspider|Yisouspider|Googlebot|Bingbot|360Spider/
			};
			var userAgent = navigator.userAgent;
			for (var k in n) {
				if (n[k].test(userAgent)) {
					return k;
				} else {
					return 'PC';
				}
			}
		},
		isMobile: function() {
			var flag = false;
			var sUserAgent = navigator.userAgent.toLowerCase();
			var bIsIpad = sUserAgent.match(/ipad/i) == "ipad";
			var bIsIphoneOs = sUserAgent.match(/iphone os/i) == "iphone os";
			var bIsMidp = sUserAgent.match(/midp/i) == "midp";
			var bIsUc7 = sUserAgent.match(/rv:1.2.3.4/i) == "rv:1.2.3.4";
			var bIsUc = sUserAgent.match(/ucweb/i) == "ucweb";
			var bIsAndroid = sUserAgent.match(/android/i) == "android";
			var bIsCE = sUserAgent.match(/windows ce/i) == "windows ce";
			var bIsWM = sUserAgent.match(/windows mobile/i) == "windows mobile";
			if (bIsIpad || bIsIphoneOs || bIsMidp || bIsUc7 || bIsUc || bIsAndroid || bIsCE || bIsWM) {
				flag = true;
			} else {
				flag = false;
			}
			return flag;
		},
		isMac: function() {
			return /macintosh|mac os x/i.test(navigator.userAgent);
		},
		isWindows: function() {
			return /windows|win32/i.test(navigator.userAgent);
		},
		isPC: function() {
			var userAgentInfo = navigator.userAgent;
			var Agents = ["Android", "iPhone",
				"SymbianOS", "Windows Phone",
				"iPad", "iPod"
			];
			var flag = true;
			for (var v = 0; v < Agents.length; v++) {
				if (userAgentInfo.indexOf(Agents[v]) > 0) {
					flag = false;
					break;
				}
			}
			return flag;
		},
		isIE: function() {
			if (!!window.ActiveXObject || 'ActiveXObject' in window) {
				return true;
			} else {
				return false;
			}
		},
		isWeixin: function() {
			var ua = navigator.userAgent;
			return /micromessenger/i.test(ua) || typeof navigator.wxuserAgent !== 'undefined';
		},
		checkBrowser: function() {
			var n, userAgent;
			n = {
				ie: /MSIE/i,
				firefox: /firefox/i,
				qq: /QQBrowser/i,
				uc: /UBrowser/i,
				edge: /Edge/i,
				chrome: /Chrome/i
			};
			userAgent = navigator.userAgent;
			for (var k in n) {
				if (n[k].test(userAgent)) {
					return k;
				}
			}
		},
		checkOs: function() {
			windows = (navigator.userAgent.indexOf("Windows", 0) != -1) ? 1 : 0;
			mac = (navigator.userAgent.indexOf("mac", 0) != -1) ? 1 : 0;
			linux = (navigator.userAgent.indexOf("Linux", 0) != -1) ? 1 : 0;
			unix = (navigator.userAgent.indexOf("X11", 0) != -1) ? 1 : 0;
			if (windows) os_type = "windows";
			else if (mac) os_type = "mac";
			else if (linux) os_type = "lunix";
			else if (unix) os_type = "unix";
			return os_type;
		},
		functionCheck: function() {
			if (!Array.prototype.forEach) {
				Array.prototype.forEach = function forEach(callback, thisArg) {
					var T, k;
					if (this == null) {
						throw new TypeError("this is null or not defined");
					}
					var O = Object(this);
					var len = O.length >>> 0;
					if (typeof callback !== "function") {
						throw new TypeError(callback + " is not a function");
					}
					if (arguments.length > 1) {
						T = thisArg;
					}
					k = 0;
					while (k < len) {
						var kValue;
						if (k in O) {
							kValue = O[k];
							callback.call(T, kValue, k, O);
						}
						k++;
					}
				};
			}
		},
		formatDate: function(date, fmt) {
			if (/(y+)/.test(fmt)) {
				fmt = fmt.replace(RegExp.$1, (date.getFullYear() + '').substr(4 - RegExp.$1.length));
			}
			var o = {
				'M+': date.getMonth() + 1,
				'd+': date.getDate(),
				'h+': date.getHours(),
				'm+': date.getMinutes(),
				's+': date.getSeconds()
			};
			for (var k in o) {
				if (new RegExp('(' + k + ')').test(fmt)) {
					var str = o[k] + '';
					fmt = fmt.replace(RegExp.$1, (RegExp.$1.length === 1) ? str : this.padLeftZero(str));
				}
			}
			return fmt;
		},
		padLeftZero: function(str) {
			return ('00' + str).substr(str.length);
		},
		getUrlPara: function(params) {
			var strArr, obj;
			obj = {};
			params = params.split('?')[1];
			if (params.indexOf('&') > -1) {
				strArr = params.split('&');
				strArr.forEach(function(item, index) {
					obj[item.split('=')[0]] = decodeURIComponent(item.split('=')[1]);
				});
			} else {
				obj[params.split('=')[0]] = decodeURIComponent(params.split('=')[1]);
			}
			return obj;
		},
		saveToLocal: function(id, key, value) {
			var user = window.localStorage.__user__;
			if (!user) {
				user = {};
				user[id] = {};
			} else {
				user = JSON.parse(user);
				if (!user[id]) {
					user[id] = {};
				}
			}
			user[id][key] = value;
			window.localStorage.__user__ = JSON.stringify(user);
		},
		loadFromLocal: function(id, key, def) {
			var user = window.localStorage.__user__;
			if (!user) {
				return def;
			}
			user = JSON.parse(user)[id];
			if (!user) {
				return def;
			}
			var ret = user[key];
			return ret || def;
		},
		trim: function(str) {
			var whitespace = ' \n\r\t\f\x0b\xa0\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u200b\u2028\u2029\u3000';
			for (var i = 0, len = str.length; i <= len; i++) {　　
				if (whitespace.indexOf(str.charAt(i)) === -1) {　　　　
					str = str.substring(i);
					break;　　
				}
			}

			for (i = str.length - 1; i >= 0; i--) {　　
				if (whitespace.indexOf(str.charAt(i)) === -1) {　　　　
					str = str.substring(0, i + 1);
					break;　　
				}
			}
			return whitespace.indexOf(str.charAt(0)) === -1 ? str : '';
		},
		cookie: function(name, value, options) {
			var self = this;
			if (typeof value != 'undefined') {
				options = options || {};
				if (value === null) {
					value = '';
					options.expires = -1;
				}
				var expires = '';
				if (options.expires && (typeof options.expires == 'number' || options.expires.toUTCString)) {
					var date;
					if (typeof options.expires == 'number') {
						date = new Date();
						date.setTime(date.getTime() + (options.expires * 24 * 60 * 60 * 1000));
					} else {
						date = options.expires;
					}
					expires = '; expires=' + date.toUTCString();
				}
				var path = options.path ? '; path=' + options.path : '';
				var domain = options.domain ? '; domain=' + options.domain : '';
				var secure = options.secure ? '; secure' : '';
				document.cookie = [name, '=', encodeURIComponent(value), expires, path, domain, secure].join('');
			} else {
				//该对象由后面的值由null改为{}
				var cookieValue = {};
				if (document.cookie && document.cookie != '') {
					var cookies = document.cookie.split(';');
					for (var i = 0; i < cookies.length; i++) {
						var cookie = self.trim(cookies[i]);
						//加入以下代码实现遍历所有的cookie值。同时以对象的方式返回。
						//改良以前在没有传入参数的时候返回为null的缺点。
						if (typeof name != 'undefined') {
							//以下代码是原码
							if (cookie.substring(0, name.length + 1) == (name + '=')) {
								cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
								break;
							}
						} else {
							var keyValue = cookie.split("=");
							cookieValue[keyValue[0]] = decodeURIComponent(keyValue[1]);
						}
					}
				}
				return cookieValue;
			}
		},
		isPositiveNum: function(s) { // 是否为正整数
			var re = /^[0-9]*[1-9][0-9]*$/;
			return re.test(s);
		}
	};
	return {
		tools: tools
	};
});