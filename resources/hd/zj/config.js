;
(function() {
    requirejs.config({
        baseUrl: '/resources/hd/zj/js',
        paths: {
            jquery: 'jquery-1.9.1.min',
            vue: 'vue-2.3.0.min'
        }
    });
    requirejs([], function() {
        require(['zhujian']);
    });
})();