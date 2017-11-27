<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common_m.jsp" %>
<style>
	.mask-head{height: 3rem;background: rgba(0,0,0,0.5);position: fixed;width: 100%;top:0;z-index:999;}
	.mask-cont{margin: 0 0.3rem;font-size: 0.7rem;color: #ccc;}
	.mask-cont span{display: inline-block;}
	.mask-cont img{width: 2rem;height: 2rem;display: inline-block;margin: 0.5rem 0.2rem;}
	.mask-close{font-size: 2rem;color: #fff;line-height: 4rem;margin: 0 .3rem 0 0;}
	.mask-text{line-height: 3rem;}
	.mask-btn{font-size: 1rem;background: #df0901;text-align: center;font-size: 0.8rem;padding: 0.2rem 0.4rem;;color:#fff;border-radius:5px;margin: 0.8rem 0.5rem 0 0;}
</style>
<input id="url" type="hidden" value="${lastVersion.fullDownloadUrl}"/>
<input id="bId" type="hidden" value="${book.id}"/>
<input id="cId" type="hidden" value="${bookChapter.id}"/>
<div id="normal" class="mask-head hide">
	<div class="mask-cont">
		<span class="mask-close fl"><img class="fl" src="${sessionScope.baseUrl}mobile/images/app_close.png"></span>
		<img class="fl" src="${sessionScope.baseUrl}mobile/images/app_logo.jpg">
		<p class="mask-text fl">登录app天天送糖豆</p>
		<a id="awakenapp" ><span class="mask-btn fr">立即打开</span></a>
	</div>
</div>
<div id="weixin" class="mask-head hide">
	<div class="mask-cont">
		<p class="mask-text fr">点击右上角，选择浏览器免费下载应用  <img src="${sessionScope.baseUrl}mobile/images/arrow-up.png"></p>
	</div>
</div>
<script>
    var androidDownload = $("#url").val();
    var bookId = $("#bId").val();
    var chapterId = $("#cId").val();
    var awakenUrl = "ybt://target=launch";

    $(function(){
        if(browser.versions.weixin) {
            $("#weixin").show();
        }else{
            $("#normal").show();
		}
        if(bookId){
            awakenUrl = awakenUrl + "&bookId=" + bookId;
        }
        if(chapterId){
            awakenUrl = awakenUrl + "&chapterId=" + chapterId;
        }
        $('.mask-close').off().on('click',function(){
            $('.mask-head').hide();
        });
    })

    //判断访问终端
    var browser={
        versions:function(){
            var u = navigator.userAgent, app = navigator.appVersion;
            return {
                trident: u.indexOf('Trident') > -1, //IE内核
                presto: u.indexOf('Presto') > -1, //opera内核
                webKit: u.indexOf('AppleWebKit') > -1, //苹果、谷歌内核
                gecko: u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1,//火狐内核
                mobile: !!u.match(/AppleWebKit.*Mobile.*/), //是否为移动终端
                ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/), //ios终端
                android: u.indexOf('Android') > -1 || u.indexOf('Adr') > -1, //android终端
                iPhone: u.indexOf('iPhone') > -1 , //是否为iPhone或者QQHD浏览器
                iPad: u.indexOf('iPad') > -1, //是否iPad
                webApp: u.indexOf('Safari') == -1, //是否web应该程序，没有头部与底部
                weixin: u.indexOf('MicroMessenger') > -1, //是否微信 （2015-01-22新增）
                qq: u.match(/\sQQ/i) == " qq" //是否QQ
            };
        }(),
        language:(navigator.browserLanguage || navigator.language).toLowerCase()
    }

    function openApp(openUrl, appUrl, action, callback) {
        //检查app是否打开
        function checkOpen(cb) {
            var _clickTime = +(new Date());
            function check(elsTime) {
                if (elsTime > 3000 || document.hidden || document.webkitHidden) {
                    cb(1);
                } else {
                    cb(0);
                }
            }

            //启动间隔20ms运行的定时器，并检测累计消耗时间是否超过3000ms，超过则结束
            var _count = 0, intHandle;
            intHandle = setInterval(function () {
                _count++;
                var elsTime = +(new Date()) - _clickTime;
                if (_count >= 200 || elsTime > 3000) {
                    clearInterval(intHandle);
                    check(elsTime);
                }
            }, 10);
        }

        //在iframe 中打开APP
        var ifr = document.createElement('iframe');
        ifr.src = openUrl;
        ifr.style.display = 'none';
        if (callback) {
            checkOpen(function (opened) {
                callback && callback(opened);
            });
        }
        document.body.appendChild(ifr);
        setTimeout(function () {
            document.body.removeChild(ifr);
        }, 2000);
    }

    function downloadapk(open){
        if(open==0){
            location.href = androidDownload;
		}
	}

    $("#awakenapp").click(function() {
        if (/(iPhone|iPad|iPod|iOS)/i.test(navigator.userAgent)) {
			location.href = awakenUrl;
			setTimeout(function() {
				location.href = 'https://itunes.apple.com/cn/app/id1153945957?mt=8';
			}, 250);
			setTimeout(function() {
				location.reload();
			}, 1000);
        } else if (/(Android)/i.test(navigator.userAgent)) {
            openApp(awakenUrl,'','',downloadapk);
//            var ifr = document.createElement('iframe');
//            ifr.src = 'ybt://target=launch&bookId=54';
//            ifr.style.display = 'none';
//            document.body.appendChild(ifr);
//            var openTime = +new Date();
//            window.setTimeout(function(){
//                document.body.removeChild(ifr);
//                var xxTime = (+new Date()) - openTime;
//                if( xxTime > 100 ){
//                    alert(xxTime);
//                    window.location = 'http://www.ebtang.com/resources/yanbeitang_debug_test_v1.0.0_3.apk';
//                }
//            },2000)
        } else {
            alert("请使用手机查看！");
        };
    });
</script>