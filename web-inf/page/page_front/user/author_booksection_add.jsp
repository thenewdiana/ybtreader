<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common.jsp" %>
<div class="ce3 ce10 wd12 pos_r sub11">
	<form action="" id="booksectionForm">
	<input type="hidden" class="wd1" name="bookId" value="${bookId }">
    <ul>
        <li>
            <label>分卷名称</label>
            <div class="w300 fl">
                <input type="text" class="wd1" name="sectionName">
                <p><span class="red">*</span>请不要超过<i class="red">15</i>字</p>
            </div>
        </li>
        <li class="wd5">
            <label>分卷介绍</label>
            <div class="fl">
                <textarea class="wd4" name="sectionInfo"></textarea>
                <div class="over wd6">
                    <p class="fl"><i class="red">*</i> 请不要超过<i class="red">200</i>字</p> 
                </div>
            </div>
        </li>        
        <li>
        	<label>&nbsp;</label>
        	<p class="fl"><span class="red" id="error" ></span></p>
        </li>               
        <li>
            <label>&nbsp;</label>
            <input type="button" class="wd2 f14 strong" value="保存" name="btn_submit"/>
            <input type="button" class="wd2 f14 strong" value="返回" name="btn_back"/>
        </li>
    </ul>
    </form>
</div>
<script type="text/javascript">
var formObj = $("#booksectionForm");
$(formObj).find("input[name='btn_submit']").bind("click", function() {
	var formData = $(formObj).serialize();
	var formAction = "${pageContext.request.contextPath }/author/booksection/add";
	$.ajax({
		type : "POST",
		dataType : "json",
		data : formData,
		async:true,
		url : formAction,
		success : function(json) {
			if (json.resBean.code == 0) {
				openBookSection();
			} else {
				$(formObj).find("span[id='error']").text(json.resBean.msg);
			}
		}
	});
});
$("#booksectionForm").find("input[name='btn_back']").bind("click", openBookSection);
</script>