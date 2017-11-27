(function () {
    $.MsgBox = {
        Alert: function (title, msg) {
            GenerateHtml("alert", title, null, null, msg);
            btnOk();  //alert只是弹出消息，因此没必要用到回调函数callback
            btnNo();
        },
        AlertBtn: function (title, msg, btnOkName, btnNoName) {
            GenerateHtml("alert", title, btnOkName, btnNoName, msg);
            btnOk();  //alert只是弹出消息，因此没必要用到回调函数callback
            btnNo();
        },
        Confirm: function (title, msg, callback) {
            GenerateHtml("confirm", title, null, null, msg);
            btnOk(callback);
            btnNo();
        },
        ConfirmBtn: function (title, msg, btnOkName, btnNoName, callback) {
            GenerateHtml("confirm", title, btnOkName, btnNoName, msg);
            btnOk(callback);
            btnNo();
        }
    };

    //生成Html
    var GenerateHtml = function (type, title, btnOkName, btnNoName, msg) {
    	if (btnOkName == null) {
    		btnOkName = "确定";
    	}
    	if (btnNoName == null) {
    		btnNoName = "取消";
    	}
    	
        var _html = "";
     	_html += '<div id="mb_box"></div><div id="mb_con">';
     	_html += '<p id = "mb_msg">' + msg + '</p>';
     	_html += '<div id="mb_btnbox">';
     	if (type == "alert") {
     		_html += '<span><input id="mb_btn_ok" style="cursor:pointer" type="button" value="' + btnOkName + '" /></span>';
     	}
     	if (type == "confirm") {
     		_html += '<span><input id="mb_btn_ok" style="cursor:pointer" type="button" value="' + btnOkName + '" /></span>';
     		_html += '<span><input id="mb_btn_no" style="cursor:pointer" type="button" value="' + btnNoName + '" /></span>';
     	}
     	_html += '</div>';
     	_html += '</div>';
        //必须先将_html添加到body，再设置Css样式
        $("body").append(_html); GenerateMyCss();
//        _html += '<div id="mb_box"></div><div id="mb_con"><span id="mb_tit">' + title + '</span>';
//        _html += '<a id="mb_ico">x</a><div id="mb_msg">' + msg + '</div><div id="mb_btnbox">';
//
//        if (type == "alert") {
//            _html += '<input id="mb_btn_ok" style="cursor:pointer" type="button" value="' + btnOkName + '" />';
//        }
//        if (type == "confirm") {
//            _html += '<input id="mb_btn_ok" style="cursor:pointer" type="button" value="' + btnOkName + '" />';
//            _html += '<input id="mb_btn_no" style="cursor:pointer" type="button" value="' + btnNoName + '" />';
//        }
//        _html += '</div></div>';
        //必须先将_html添加到body，再设置Css样式
//        $("body").append(_html); GenerateCss();
    };
    
    var getDialogWidth = function() {
    	var ww = 495;
        if($(window).width() < 495) return "80%";
        else return "495px";
    };
    
    var GenerateMyCss = function () {
        $("#mb_box").css({ width: '100%', height: '100%', zIndex: '99999', position: 'fixed',
            filter: 'Alpha(opacity=60)', backgroundColor: '#F1F1F3', top: '0', left: '0', opacity: '0.6'
        });

        
        $("#mb_con").css({ zIndex: '999999', width: getDialogWidth(), height:'140px',border:'1px solid #CACACA',
        	color:'#545555',fontSize:'14px',
        	boxShadow:'0 0 16px #ccc',
        	boxShadow:'0 0 18px #666',
        	mozOpacity:'0.7',
        	opacity:'0.7',
        	filter:'alpha(opacity=70)',
        	background:'#000',
        	color:'#fff', borderRadius:'8px',border:'7px solid #dfdfe0',boxShadow:'0 0 18px #000',
        	position: 'fixed'
        });

        $("#mb_msg").css({ padding: '20px 0', lineHeight: '50px',textAlign:'center'});

        $("#mb_btnbox").css({ overflow:'hidden', zoom:'1', textAlign: 'center' });
        $("#mb_btn_ok,#mb_btn_no").css({ 
        	color:'#564d36',        
        	lineHeight:'24px',        	
        	padding:'3px 35px',
        	background:'#D1CBBF',
        	border:'1px solid #A79C7E',
        	borderRadius:'6px',
        	margin:'0 10px',cursor:'pointer' });


        var _widht = document.documentElement.clientWidth;  //屏幕宽
        var _height = document.documentElement.clientHeight; //屏幕高

        var boxWidth = $("#mb_con").width();
        var boxHeight = $("#mb_con").height();
        //让提示框居中
        $("#mb_con").css({ top: (_height - boxHeight) / 2 + "px", left: (_widht - boxWidth) / 2 + "px" });
    };
    //生成Css
//    var GenerateCss = function () {
//
//        $("#mb_box").css({ width: '100%', height: '100%', zIndex: '99999', position: 'fixed',
//            filter: 'Alpha(opacity=60)', backgroundColor: 'black', top: '0', left: '0', opacity: '0.6'
//        });
//
//        $("#mb_con").css({ zIndex: '999999', width: '400px', position: 'fixed',
//            backgroundColor: 'White', borderRadius: '15px'
//        });
//
//        $("#mb_tit").css({ display: 'block', fontSize: '14px', color: '#444', padding: '10px 15px',
//            backgroundColor: '#DDD', borderRadius: '15px 15px 0 0',
//            borderBottom: '3px solid #009BFE', fontWeight: 'bold'
//        });
//
//        $("#mb_msg").css({ padding: '20px', lineHeight: '20px',
//            borderBottom: '1px dashed #DDD', fontSize: '13px'
//        });
//
//        $("#mb_ico").css({ display: 'block', position: 'absolute', right: '10px', top: '9px',
//            border: '1px solid Gray', width: '18px', height: '18px', textAlign: 'center',
//            lineHeight: '16px', cursor: 'pointer', borderRadius: '12px', fontFamily: '微软雅黑'
//        });
//
//        $("#mb_btnbox").css({ margin: '15px 0 10px 0', textAlign: 'center' });
//        $("#mb_btn_ok,#mb_btn_no").css({ width: '85px', height: '30px', color: 'white', border: 'none' });
//        $("#mb_btn_ok").css({ backgroundColor: '#168bbb' });
//        $("#mb_btn_no").css({ backgroundColor: 'gray', marginLeft: '20px' });
//
//
//        //右上角关闭按钮hover样式
//        $("#mb_ico").hover(function () {
//            $(this).css({ backgroundColor: 'Red', color: 'White' });
//        }, function () {
//            $(this).css({ backgroundColor: '#DDD', color: 'black' });
//        });
//
//        var _widht = document.documentElement.clientWidth;  //屏幕宽
//        var _height = document.documentElement.clientHeight; //屏幕高
//
//        var boxWidth = $("#mb_con").width();
//        var boxHeight = $("#mb_con").height();
//        alert(_height + ":" + boxHeight + "," + _widht + ":" + boxWidth);
//        //让提示框居中
//        $("#mb_con").css({ top: (_height - boxHeight) / 2 + "px", left: (_widht - boxWidth) / 2 + "px" });
//    };


    //确定按钮事件
    var btnOk = function (callback) {
        $("#mb_btn_ok").click(function () {
            $("#mb_box,#mb_con").remove();
            if (typeof (callback) == 'function') {
                callback();
            }
        });
    };

    //取消按钮事件
    var btnNo = function () {
        $("#mb_btn_no,#mb_ico").click(function () {
            $("#mb_box,#mb_con").remove();
        });
    };
})();