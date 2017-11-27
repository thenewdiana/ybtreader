<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common.jsp" %>
<div class="sub5 over">
 <!--left begin-->
	<div class="sub6 f12 fl">
		<form action="" id="bookChapterTreeForm">
		<input type="hidden" class="wd1" name="bookId" value="${bookId }"/>
		<input type="hidden" class="wd1" name="treeType" value="${treeType}"/>
		<input type="hidden" class="wd1" name="bookChapterId"/>
		<c:choose>
			<c:when test="${treeType == 'online' }">
				<h3 class="ac white">公众章节列表</h3>
		        <ul class="bords">
		        	<c:forEach items="${bookSectionList }" var="item">
		            <li>
		                <span id="${item.id }">${item.shortSectionName }</span>                
		                <dl class="hide">
		                	<c:forEach items="${item.chapterList }" var="child">
		                    <dd id="${child.id }" style="cursor:pointer">--${child.title }</dd>
		                    </c:forEach>
		                </dl>
		            </li>
		            </c:forEach>            
		        </ul>
			</c:when>
			<c:when test="${treeType == 'draft' }">
				<h3 class="ac white">公众章节列表</h3>
		        <ul class="bords">
		        	<c:forEach items="${bookSectionList }" var="item">
		            <li>
		                <span id="${item.id }">${item.shortSectionName }</span>                
		                <dl class="hide">
		                	<c:forEach items="${item.chapterList }" var="child">
		                	<dd id="${child.id }" style="cursor:pointer"><em>${child.title }</em><label>${child.publishTimeFormatDDHH }</label></dd>
		                    </c:forEach>
		                </dl>
		            </li>
		            </c:forEach>            
		        </ul>
			</c:when>
			<c:otherwise></c:otherwise>
		</c:choose>
		
        
        </form>
	</div>
    <!--righg begin-->
    <div class="ce3 wd12 sub7 fl f12" id="template_bookchapter">
        
    </div>
    <!--righg begin-->
</div>
<script type="text/javascript">
	var treeType = '${treeType}';
	if (treeType == 'default') {
		addBookChapter();
	}
	
	$(".sub6 li span").unbind("click");
	$(".sub6 li span").bind("click", function() {
		var section = $(this);
		var chapterlist = $(section).next("dl");
		
		var isOpen = $(section).hasClass("jian");	
		
		$(".sub6 li span").removeClass("jian");
		$(".sub6 li dl").hide();	

		if (!isOpen) {
			$(section).addClass("jian");
			$(chapterlist).show();
		} 
		/* else {
			$("#template_bookchapter").empty();
		} */					
	});
	
	$(".sub6 li dd").unbind("click");
	$(".sub6 li dd").bind("click", function() {
		var chapter = $(this);
		var chapterId = $(chapter).attr("id");
		$("#bookChapterTreeForm").find("input[name='bookChapterId']").attr("value", chapterId);
		modBookChapter();
	});
	
	function addBookChapter() {
		var formData = $("#bookChapterTreeForm").serialize();
		var formAction = "${pageContext.request.contextPath }/author/bookchapter/addinit";
		$.ajax({
			type : "POST",
			dataType : "html",
			data : formData,
			async:true,
			url : formAction,
			success : function(html) {
				$("#template_bookchapter").empty();
				$("#template_bookchapter").append(html);
			}
		});
	}
	
	function modBookChapter() {
		var formData = $("#bookChapterTreeForm").serialize();
		var formAction = "${pageContext.request.contextPath }/author/bookchapter/modinit";
		$.ajax({
			type : "POST",
			dataType : "html",
			data : formData,
			async:true,
			url : formAction,
			success : function(html) {
				$("#template_bookchapter").empty();
				$("#template_bookchapter").append(html);
			}
		});
	}
</script>