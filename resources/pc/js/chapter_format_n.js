function r(e) {
    e = '　　' + e.replace(/ {2,}|[\u3000\t]/gi, " ").replace(/[ \u3000\t]+([^a-zA-Z0-9])/ig, '$1').replace(/(　　) {1,}([a-zA-Z0-9])/g, '$1$2').replace(/\./g, '。').replace(/;/g, '；').replace(/:/g, '：').replace(/\?/g, '？').replace(/\(/g, '（').replace(/\)/g, '）').replace(/!/g, '！').replace(/[\^\*\#]/g, '').replace(/(\n\n|\r\r)(\n+)|(\r+)/g, "$1").replace(/(\n|\r)/g, "$1　　");
    return e;
}

function filter(val) {
    var value = val;
    var arr = [];
    for (var i = 0; i < keywords.length; i++) {
        if (value.indexOf(keywords[i]) !== -1) {
            arr.push('“' + keywords[i] + '”');
        }
    }
    if (arr.length > 0) {
        return '文中包含敏感词：' + arr.join(',') + '，请修改';
    } else {
        return 0;
    }
}

function autoOperater(obj, event, effectObj) {
    obj.bind(event, function() {
        obj.val(r(obj.val()));
        var filterResult = filter(obj.val());
        if (filterResult !== 0) {
            if ($(this).siblings('.sensitiveWarn').length === 0) {
                $(this).parent().append('<p class="sensitiveWarn red fr"></p>');
                $(this).siblings('.sensitiveWarn').text(filterResult);
            } else {
                $(this).siblings('.sensitiveWarn').text(filterResult);
            }
            effectObj.find("input[name='btn_draft']").attr('disabled', true);
            effectObj.find("input[name='btn_online']").attr('disabled', true);
            effectObj.find("input[name='btn_quartz']").attr('disabled', true);
        } else {
            if ($(this).siblings('.sensitiveWarn').length > 0) {
                $(this).siblings('.sensitiveWarn').text('');
            }
            if ($(this).siblings('.sensitiveWarn').text() === '') {
                if ($(this).parent().siblings('li').find('.sensitiveWarn').length > 0 && $(this).parent().siblings('li').find('.sensitiveWarn').text() === '') {
                    effectObj.find("input[name='btn_draft']").attr('disabled', false);
                    effectObj.find("input[name='btn_online']").attr('disabled', false);
                    effectObj.find("input[name='btn_quartz']").attr('disabled', false);
                }
                if ($(this).parent().siblings('li').find('.sensitiveWarn').length === 0) {
                    effectObj.find("input[name='btn_draft']").attr('disabled', false);
                    effectObj.find("input[name='btn_online']").attr('disabled', false);
                    effectObj.find("input[name='btn_quartz']").attr('disabled', false);
                }
            }
        }
    });
}