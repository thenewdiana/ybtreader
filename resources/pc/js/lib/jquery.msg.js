;
(function(factory) {
    if (typeof define === 'function' && define.amd) {
        define(factory);
    } else {
        window.MsgBox = factory();
    }
})(function() {
    var msgBox = {
        Alert: function(msg) {
            GenerateHtml("alert", msg, null, null);
            btnOk();
            btnNo();
        },
        AlertBtn: function(msg, btnOkName, btnNoName) {
            GenerateHtml("alert", msg, btnOkName, btnNoName);
            btnOk();
            btnNo();
        },
        Confirm: function(msg, callback) {
            GenerateHtml("confirm", msg, null, null);
            btnOk(callback);
            btnNo();
        },
        ConfirmBtn: function(msg, btnOkName, btnNoName, callback) {
            GenerateHtml("confirm", msg, btnOkName, btnNoName);
            btnOk(callback);
            btnNo();
        }
    };
    var GenerateHtml = function(type, msg, btnOkName, btnNoName) {
        controlModal();
        if (btnOkName == null) {
            btnOkName = "确定";
        }
        if (btnNoName == null) {
            btnNoName = "取消";
        }
        var _html = "";
        _html += '<div id="mb_box" class="fs-shade"><div class="outer outer-s"><div id="mb_con" class="content">';
        _html += '<p id = "mb_msg" class="text">' + msg + '</p>';
        _html += '<div id="mb_btnbox"  class="box">';
        if (type == "alert") {
            _html += '<span><input id="mb_btn_ok" class="btn" style="cursor:pointer" type="button" value="' + btnOkName + '" /></span>';
        }
        if (type == "confirm") {
            _html += '<span><input id="mb_btn_ok" class="btn" type="button" value="' + btnOkName + '" /></span>';
            _html += '<span><input id="mb_btn_no" class="btn" type="button" value="' + btnNoName + '" /></span>';
        }
        _html += '</div></div></div></div>';
        $("body").append(_html);
    };
    var btnOk = function(callback) {
        $("#mb_btn_ok").click(function() {
            $("#mb_box,#mb_con").remove();
            controlModal(true);
            if (typeof(callback) == 'function') {
                callback();
            }
        });
    };
    var btnNo = function() {
        $("#mb_btn_no,#mb_ico").click(function() {
            $("#mb_box,#mb_con").remove();
            controlModal(true);
        });
    };
    var controlModal = function(isClose) {
        $('html').addClass('modal-open').addClass('modal-overflow');
        if (isClose) {
            $('html').removeClass('modal-open').removeClass('modal-overflow');
        }
    }
    return {
        msgBox: msgBox
    }
});