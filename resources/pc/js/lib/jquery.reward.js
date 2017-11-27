;
(function(factory) {
  if (typeof define === 'function' && define.amd) {
    define(factory);
  } else {
    window.customReward = factory();
  }
})(function() {
  var reward = {
    init: function(data, callback) {
      this.RewardHtml(data);
      this.btnMinus(data);
      this.btnAdd(data);
      this.inputKeyup(data);
      this.initReward(data);
      this.btnCancel();
    },
    Alert: function(msg) {
      this.GenerateHtml("alert", msg, null, null);
      this.btnOk();
      this.btnNo();
    },
    AlertBtn: function(msg, btnOkName, btnNoName) {
      this.GenerateHtml("alert", msg, btnOkName, btnNoName);
      this.btnOk();
      this.btnNo();
    },
    Confirm: function(msg, callback) {
      this.GenerateHtml("confirm", null, null, msg);
      this.btnOk(callback);
      this.btnNo();
    },
    ConfirmBtn: function(msg, btnOkName, btnNoName, callback) {
      this.GenerateHtml("confirm", msg, null, null);
      this.btnOk(callback);
      this.btnNo();
    },
    GenerateHtml: function(type, msg, btnOkName, btnNoName) {
      this.controlModal();
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
    },
    RewardHtml: function(data) {
      this.controlModal();
      var _html = "";
      _html += '<div class="popup-ebt popup-reward" id="jsRewardPopup"><div class="wrapper">';
      _html += '<div class="head">打赏</div>';
      _html += '<div class="body"><div class="outer"><p id="app" class="calculate"><img class="reward-icon" src="' + data.iconUrl + '"/><button type="button" class="minus operate"></button><input type="text" maxlength="4" class="input" id="rewardCount" value="' + data.defaultNum + '"><button type="button" class="add operate"></button><span class="num">' + data.defaultNum * data.value + '</span>糖豆</p>';
      _html += '<p class="note"></p>';
      _html += '</div></div>';
      _html += '<div class="foot"><button type="button" class="btn-reward btn-confirm">确定</button><button type="button" class="btn-reward btn-cancel">取消</button></div></div></div>';
      $("body").append(_html);
    },
    btnCancel: function() {
      var self = this;
      $("#jsRewardPopup .btn-cancel").click(function() {
        self.closeModal("#jsRewardPopup");
      });
    },
    btnOk: function(callback) {
      var self = this;
      $("#mb_btn_ok").click(function() {
        $("#mb_box,#mb_con").remove();
        self.controlModal(true);
        if (typeof(callback) == 'function') {
          callback();
        }
      });
    },
    btnNo: function() {
      var self = this;
      $("#mb_btn_no,#mb_ico").click(function() {
        $("#mb_box,#mb_con").remove();
        controlModal(true);
      });
    },
    btnAdd: function(data) {
      var self = this;
      $("#jsRewardPopup .add").unbind("click");
      $("#jsRewardPopup .add").on('click', function() {
        var value = parseInt($(this).siblings('.input').val());
        if (value >= 999) {
          return false;
        } else {
          value++;
          self.setVal($(this).siblings('.input'), $(this).siblings('.num'), value, data.value);
        }
      });
    },
    btnMinus: function(data) {
      var self = this;
      $("#jsRewardPopup .minus").unbind("click");
      $("#jsRewardPopup .minus").on('click', function() {
        var value = parseInt($(this).siblings('.input').val());
        if (value <= 1) {
          return false;
        } else {
          value--;
          self.setVal($(this).siblings('.input'), $(this).siblings('.num'), value, data.value);
        }
      });
    },
    inputKeyup: function(data) {
      var self = this;
      $("#jsRewardPopup").unbind("click");
      $("#jsRewardPopup").on('keyup', '.input', function() {
        var that = $(this);
        setTimeout(function() {
          var value = isNaN($(that).val()) || $(that).val() < 1 ? 1 : parseInt($(that).val());
          if (value < 1) {
            value = 1;
            self.setVal($(that), $(that).siblings('.num'), value, data.value);
            return false;
          } else if (value > 999) {
            value = 999;
            self.setVal($(that), $(that).siblings('.num'), value, data.value);
            return false;
          } else {
            self.setVal($(that), $(that).siblings('.num'), value, data.value);
          }
        }, 500);
      });
    },
    initReward: function(data) {
      var self = this;
      //提交
      $('#jsRewardPopup .btn-confirm').unbind("click");
      $('#jsRewardPopup .btn-confirm').on("click", function() {
        var formData = 'bookId=' + data.bookId + '&rewardType=' + data.type + '&rewardCount=' + $('#rewardCount').val();
        $.ajax({
          type: "POST",
          data: formData,
          async: true,
          url: "/book/reward_turkey",
          success: function(json) {
            if (typeof json == 'object') {
              if (json.resBean.code == 0) {
                self.closeModal("#jsRewardPopup");
                self.Alert('打赏成功');
              } else if (json.resBean.code == 2) {
                $('#jsRewardPopup').find('.note').html('您的余额已不足，请充值<a href="/recharge/index" target="_blank" class="charge">充值</a>');
              } else {
                if (json.resBean.msg.length > 0) {
                  self.Alert(json.json.resBean.msg);
                }
              }
            }
          }
        });
      });
    },
    setVal: function(obj1, obj2, num, value) {
      $(obj1).val(num);
      $(obj2).text(num * value);
    },
    controlModal: function(isClose) {
      $('html').addClass('modal-open').addClass('modal-overflow');
      if (isClose) {
        $('html').removeClass('modal-open').removeClass('modal-overflow');
      }
    },
    closeModal: function(obj) {
      $(obj).remove();
      this.controlModal(true);
    }
  };
  return {
    reward: reward
  }
});