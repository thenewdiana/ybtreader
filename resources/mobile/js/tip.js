(function() {
	$.MsgTip = {
		fail : function(msg) {
			generateHtml("fail", msg);
		},
		
		succ : function (msg) {
			generateHtml("succ", msg);
		}
	};
	
	var generateHtml = function (type, msg) {
		$("#mb_box").remove();
        var _html = "";
     	_html += '<div class="cons_cont01" id="mb_box">';
     	if (type == "fail") {
     		_html += '<div class="succ1">' + msg + '</div>';  
     	}
     	if (type == "succ") {
     		_html += '<div class="succ1 defeated">' + msg + '</div>';     		
     	}
     	_html += '</div>';
        //必须先将_html添加到body，再设置Css样式
        $("#mobile_tips").append(_html); 
        top();
    };
    
    var top = function() {
    	$(document.documentElement).animate({
			scrollTop : 0
		}, 200);
		//支持chrome
		$(document.body).animate({
			scrollTop : 0
		}, 200);
    };
})();