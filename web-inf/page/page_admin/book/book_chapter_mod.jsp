<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title><spring:message code="admin.global.title"></spring:message></title>
    <link type="text/css" rel="stylesheet" href="${sessionScope.baseUrl}pc/css/default.css" />
    <link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}plugin/jquery-easyui-1.4/themes/default/easyui.css"/>
    <link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}plugin/jquery-easyui-1.4/themes/icon.css"/>    
    <link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}plugin/jquery-easyui-1.4/themes/color.css"/>
    <script type="text/javascript" src="${sessionScope.baseUrl}plugin/jquery-easyui-1.4/jquery.min.js"></script>
    <script type="text/javascript" src="${sessionScope.baseUrl}plugin/jquery-easyui-1.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${sessionScope.baseUrl}plugin/jquery-easyui-1.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="${sessionScope.baseUrl}pc/js/chapter_format.js"></script>
</head>

<body class="easyui-layout" fit="true">
	<div region="center" id="center" style="padding:10px;" border="false">		
		<div class="easyui-panel" title="章节编辑" style="width:850px;height:auto">			
			<form id="addForm" name="addForm" method="post" action=""  enctype="multipart/form-data">
			<input type="hidden" name="id" value="${bookChapter.id }"/>
			<input type="hidden" name="bookId" value="${bookChapter.bookId }"/>
			<input type="hidden" name="publishStatus" value="${bookChapter.publishStatus }"/>
			<input type="hidden" name="words" id="words"/>
			<table class="promodify" cellspacing="1">
				<tr>
					<td class="info">章节名称：</td>
					<td>
						<input type="text" id="title" name="title" value="${bookChapter.title }" class="input-text easyui-textbox" data-options="required:true"/>
					</td>
				</tr>
				<tr>
					<td class="info">推荐语：</td>
					<td>
						<input type="text" id="remark" name="remark" value="${bookChapter.remark }" class="input-text easyui-textbox" data-options="required:true"/>
					</td>
				</tr>	
				<tr>
					<td class="info">展示方式：</td>
					<td>
						<select id="chapterShow" name="chapterShow">
							<option value="1" <c:if test="${bookChapter.chapterShow==1 }">selected</c:if>>文本图书</option>
							<option value="2" <c:if test="${bookChapter.chapterShow==2 }">selected</c:if>>图片漫画</option>
							<option value="3" <c:if test="${bookChapter.chapterShow==3 }">selected</c:if>>动态表情</option>
						</select>
					</td>
				</tr>			
				<tr>
					<td class="info">章节内容：</td>
					<td>
						<div id="divContent">
							<a href="javascript:;" id="format">自动排版</a>
							<br/>
							<p id="countwords">当前字数:${bookChapter.words }</p>
							<textarea rows="50" cols="100" name="content" id="content" data-options="required:true">${bookChapter.content }</textarea>
						</div>
						<div id="divImage">
							<img src=""/>
							<br/>
							<input type="file" id="cartoonImageFile" name="cartoonImageFile"/>
						</div>
						<div id="divEmote">
							<input type="button" value="+ 添加表情" class="addimage"/>
						</div>
					</td>
				</tr>				 
			</table>
			</form>		
			<div style="text-align:center;padding:5px">
				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="submitForm();">修改</a>
				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-back',plain:true" onclick="goback();">返回</a>
			</div>
		</div>
	</div>	
    <script type="text/javascript">
    	function loadEmotePics() {
    		<c:if test="${bookChapter.chapterShow==3 }">
    		var arr = "${bookChapter.content}".split(",");
    		for(var i = 0; i < arr.length; i ++) {
    			//$("#divEmote").append("<div><span class='imagenum'>1</span>&nbsp;<img src='${sessionScope.baseUrl}" + arr[i] + "'/><input type='file' name='cartoonImageFile' id='cartoonImageFile'/><input type='button' value='- 删除表情' class='delimage' onclick='delImage()'/></div>");
    			addEmotePic(arr[i]);
    		}
    		</c:if>
    		<c:if test="${bookChapter.chapterShow==2 }">
    			$("#divImage").find("img").attr("src", "${sessionScope.baseUrl}${bookChapter.content}");
    		</c:if>
    	}
    	    
    	$(function() {
    		$("#format").unbind("click");
    		$("#format").bind("click", function() {
    			$("#content").val(r($("#content").val()));
    			var counter = getCleanText($("#content").val()).length;
    			$('#words').attr("value", counter);
    			$('#countwords').text("当前字数：" + counter);
    		});
    		
    		$("textarea[name='content']").unbind("propertychange input");
    		$("textarea[name='content']").bind('propertychange input', function () { 
    			var counter = getCleanText($(this).val()).length;
    			$('#words').attr("value", counter);
    		    $('#countwords').text("当前字数：" + counter);
    		});
    		
    		$("#divImage").hide();
    		$("#divEmote").hide();
    		
    		loadEmotePics();
    		
    		$("#chapterShow").unbind("change");
    		$("#chapterShow").bind("change",function() {
    			var v = $("#chapterShow").val();
    			if(v=="1") {
    				$("#divContent").show();
    				$("#divImage").hide();
    				$("#divEmote").hide();
    			}
    			else if(v=="2") {
    				$("#divContent").hide();
    				$("#divImage").show();
    				$("#divEmote").hide();
    			}
    			else {
    				$("#divContent").hide();
    				$("#divImage").hide();
    				$("#divEmote").show();
    			}
    		});
    		$("#chapterShow").change();
    		
    		$(".delimage").unbind("click");
    		$(".delimage").bind("click", function() {
    			$(this).parent().remove();
    			resetImageNum();
    		});
    		$(".addimage").unbind("click");
    		$(".addimage").bind("click",function() {
    			addEmotePic('');
    			$(".delimage").unbind("click");
	    		$(".delimage").bind("click", function() {
	    			$(this).parent().remove();
	    		});
	    		resetImageNum();
    		});
    		
    		resetImageNum();
    	});

        function getCleanText(str) { //添加getCleanText函数，删除文本内的空格换行符
            var resultStr = str.replace(/[\r\n　 ]/g, "");
            return resultStr;
        }
    	
    	function addEmotePic(url) {
    		$("#divEmote").append("<div><span class='imagenum'>1</span>&nbsp;<img src='${sessionScope.baseUrl}" + url + "'/><input type='file' name='cartoonImageFile' id='cartoonImageFile'/><input type='button' value='- 删除表情' class='delimage' onclick='delImage()'/><input type='hidden' name='oldCartoonImageFile' value='" + url + "'></div>");
    		resetImageNum();
    	}
    	
    	function resetImageNum() {
    		$("#divEmote").find("div").each(function(i) {
    			$(this).find("span").html(i+1);
    		});
    	}
    	
		function submitForm(){			
	    	if (!$('#addForm').form('validate')) {
	    		return;
	    	}
	    	
	    	var v = $("#chapterShow").val();
	    	if(v == "1") {
	    		$("#divImage").remove();
	    		$("#divEmote").remove();
	    	}
	    	else if(v == "2") {
	    		$("#divEmote").remove();
	    	}
	    	else if(v == "3") {
	    		$("#divImage").remove();
	    	}
	    	
	    	$("#addForm").attr("action","<%=contextPath %>/admin/book/chapter_mod");	    	
	    	$('#addForm').submit();
	    }
		
		function goback(){
			window.location = "<%=contextPath %>/admin/book/chapter_list?bookId=${bookChapter.bookId}";	
		}
	</script>			
</body>
</html>