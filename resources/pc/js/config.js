requirejs.config({
	baseUrl: 'http://www.ebtang.com/resources/pc/js',
	shim: {
		'lazy': {
			deps: ['jquery'],
			exports: 'lazy'
		}
	},
	paths: {
		jquery: 'http://www.ebtang.com/resources/pc/js/jquery-1.9.1.min',
		lazy: 'http://www.ebtang.com/resources/pc/js/jquery.lazyload',
		main: 'common',
		expressions: 'expressions',
		collect: 'collect'
	}
});
requirejs(['lazy', 'main', 'expressions', 'collect'], function(lazy, main, expressions, collect) {
	var collect = new collect.Collect({
		ele: 'jsCollect',
		pageItemNum: 14,
		boxAlign: 'vertical',
		columnHeight: 224
	});
	collect.init();
	
	$("img").lazyload({
		failurelimit: 10,
		effect: 'fadeIn',
		placeholder: "http://www.ebtang.com/resources/pc/images/comic/grey.gif",
		threshold: 600
	});
});