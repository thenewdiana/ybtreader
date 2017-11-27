<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common.jsp" %>
<form action="" id="bookChapterForm" class="book-upload">
<input type="hidden" class="wd1" name="bookId" value="${bookId }"/>
<ul>
   	<li>
       <label>章节名称</label>
       <div class="w300 fl">
           <input type="text" class="wd1" name="title" id="chapterName_add"/>
           <p><span class="red">*</span>此处输入<em class="red">章节号</em>与<em class="red">章节名</em>，示例：第10章 章节名称</p>
       </div>
   	</li>
   	<li>
    	<label>作品分卷</label>
        <div class="wd7 fl">
        	<select class="se_sea01 ac" name="bookSectionId">
            	<c:forEach items="${bookSectionList }" var="item" varStatus="stat">
            	<option value="${item.id }" <c:if test="${stat.last}">selected="selected"</c:if>>${item.sectionName }</option>
                </c:forEach>                                           
            </select>
        </div>
        <div class="clear"></div>
    </li>
    <li class="auto-ht">
    	<div class="over">
        	<p class="fl strong">正 文</p>
        	<!--<a href="javascript:;" id="format" class="red-bg fr white">自动排版</a>-->

        </div>
        <textarea class="text-ft" name="content" id="content"></textarea>
        <input type="hidden" id="words" name="words" value="0"/>
        <p id="countwords" class="fl strong">当前字数:0</p>
    </li>
    <li class="auto-ht mt10">
    	<p class="strong">作者的话</p>
        <textarea id="authorWords" class="text-ft text-ft1" name="remark"></textarea>
       	<p class="fl"><span class="red"></span>此段不计入字数</p>
    </li>
    <li>
    	<p class="strong">发布时间</p>   
    	<input type="hidden" name="publishStatus" value="0" id="publishStatus"/>
        <input type="text" name="publishTimeFormat" class="wd1" id="publishTimeFormat"/>
    </li> 
    <li>
    	<p class="fl"><span class="red" id="error" ></span></p>
    	<br/>
    	<input type="button" class="del-bg del-bg3 strong whiter" value="保存草稿箱" name="btn_draft"/>
    	<input type="button" class="del-bg del-bg2 strong whiter" value="发布" name="btn_online"/>
        <input type="button" class="del-bg del-bg1 strong whiter" value="定时发布" name="btn_quartz"/>        
    </li>
</ul>
</form>
<script type="text/javascript">
var formObj = $("#bookChapterForm");
$(formObj).find("input[name='publishTimeFormat']").unbind("click");
$(formObj).find("input[name='publishTimeFormat']").bind("click", function() {
	WdatePicker({dateFmt:'yyyy-MM-dd HH',alwaysUseStartDate:true});	
});

$(formObj).find("input[name='btn_draft']").unbind("click");
$(formObj).find("input[name='btn_draft']").bind("click", function() {
    if(validateDate(false)){
        $(formObj).find("input[name='publishStatus']").attr("value", 0);
        $(this).attr('disabled',true);
        doBookChapterAdd();
    }
});

$(formObj).find("input[name='btn_online']").unbind("click");
$(formObj).find("input[name='btn_online']").bind("click", function() {
    if(validateDate(false)){
        $(formObj).find("input[name='publishStatus']").attr("value", 1);
        $(this).attr('disabled',true);
        doBookChapterAdd();
    }

});

$(formObj).find("input[name='btn_quartz']").unbind("click");
$(formObj).find("input[name='btn_quartz']").bind("click", function() {
    if(validateDate(true)){
        $(formObj).find("input[name='publishStatus']").attr("value", 2);
        $(this).attr('disabled',true);
        doBookChapterAdd();
    }
});

$(formObj).find("textarea[name='content']").unbind("propertychange input");
$(formObj).find("textarea[name='content']").bind('propertychange input', function () { 
	var counter = getCleanText($(this).val()).length;
	$('#words').attr("value", counter);
    $('#countwords').text("当前字数：" + counter);
});

$("#format").unbind("click");
$("#format").bind("click", function() {
	$("#content").val(r($("#content").val()));
});

function doBookChapterAdd() {
	var formData = $(formObj).serialize();
	var formAction = "${pageContext.request.contextPath }/author/bookchapter/add";
	$.ajax({
		type : "POST",
		dataType : "json",
		data : formData,
		async:true,
		url : formAction,
		success : function(json) {
			if (json.resBean.code == 0) {
				openBookChapter('${treeType }');
			} else {
				$(formObj).find("span[id='error']").text(json.resBean.msg);
			}
		}
	});
}

function getCleanText(str) { //添加getCleanText函数，删除文本内的空格换行符
    var resultStr = str.replace(/[\r\n　 ]/g, "");
    return resultStr;
}

function validateDate(timeRelease){
    if(!validText($('#chapterName_add').val(),true,-1)){
        $.MsgBox.Alert("提示", "章节名称不能为空！");
        return false;
    }
    var contentLength = getCleanText($("#content").val()).length;
    if(contentLength<500||contentLength>10000){
        $.MsgBox.Alert("提示", "章节长度字数范围(500-10000)字符");
        return false;
    }
    if(timeRelease){
        var time = $('#publishTimeFormat').val();
        if(time==null||time==""){
            $.MsgBox.Alert("提示", "发布时间不能为空！");
            return false;
        }
    }
    return true;
}

var formObj = $("#bookChapterForm");
var chapterContent = $('#content');
var authorWords = $('#authorWords');
var keywords = ['毛泽东', '习近平', '江泽民', '胡锦涛', '法轮功', '爆菊花', '李洪志', '六四学潮', '支持台独', '朱镕基'];
var submitBtnActive = true;
autoOperater(chapterContent, 'blur', formObj);
autoOperater(authorWords, 'blur', formObj);
</script>