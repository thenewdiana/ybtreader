<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>四格漫画-雁北堂中文网</title>
        <meta name="keywords" content="长江之战,长江之战书评,长江之战预售,长江之战名家推荐,蛇从革访谈">
        <meta name="description" content="蛇从革宜昌鬼事系列最新力作《大宗师：长江之战》专题，为你提供《长江之战》的各种精彩书评、名家推荐、以及预售、购买渠道">
        <link rel="icon" href="${sessionScope.baseUrl}pc/images/comic/favicon.ico" mce_href="${sessionScope.baseUrl}pc/images/comic/favicon.ico" type="image/x-icon">
        <link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/comic/reset.css">
        <link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/comic/style.css">
        <link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/dialog.css"/>
        <script type="text/javascript" src="${sessionScope.baseUrl}pc/js/jquery-1.9.1.min.js"></script>
        <script type="text/javascript" src="${sessionScope.baseUrl}pc/js/require.min.js" data-main="${sessionScope.baseUrl}pc/js/config.js"></script>
        <script type="text/javascript" src="${sessionScope.baseUrl}pc/js/jquery.alert.js"></script>
        <script type="text/javascript" src="${sessionScope.baseUrl}pc/js/main.js"></script>
		<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/statistics_bd.js"></script>
    </head>
    <body>
        <%@ include file="./header.jsp" %>

        <!--content begin-->
        <div class="main w1000">
            <!--ad左右侧广告 begin-->
            <%@ include file="./ad.jsp" %>
            <!--ad左右侧广告 end-->

            <!--漫画信息 begin-->
            <div class="strip-info">
                <div class="left">
                    <img src="${book.bigCoverImage }" alt="" class="pic">
                </div>
                <div class="right">
                    <h3 class="title">${book.name}</h3>
                    <h4 class="author">${book.authorNick}</h4>
                    <div class="wrapper">
                        <h4 class="desc-title">作品简介：</h4>
                        <p class="desc">${book.info}</p>
                    </div>
                </div>
            </div>
            <!--漫画信息 end-->

            <!--漫画阅读 begin-->
            <div class="reading block">
                 <div class="content" style="text-align:center;margin:0 auto">
                     <img class="pic" src="${sessionScope.baseUrl}${chapter.content}">
                 </div>
                 <div class="back">
                     <a href="../strips" class="link">返回</a>
                 </div>
            </div>
            <!--漫画阅读 end-->

            <!--漫画评论 end-->
            <div class="comment block">
                <div class="release">
                	<form id="formReply" name="formReply">
                    	<textarea class="text" rows="4" cols="20" name="content"></textarea>
                    	<h3 class="send"> 发表<br>评论</h3>
                    	<input type="hidden" name="replyContent" id="replyContent"/>
                    	<input type="hidden" name="userId" value="${sessionScope.sessionFrontBean.userId}"/>
                    	<input type="hidden" name="bookId" value="${book.id }"/>
                    	<input type="hidden" name="bookChapterId" value="${chapter.id }"/>
                    </form>
                </div>
                <div class="details" id="idRecomm" data-collect="0">
                	<div class="details">
                		<p class="result" style="float: left;font-size: 18px;color: red;"></p>
                    	<p class="desc">共<span class="num" id="commentNum">${comment_count}</span>条评论</p>
                    </div>
                    <div id="comments">
                    	<div>
	                    </div>
                    </div>
                </div>
            </div>
            <!--漫画评论 end-->

            <!--漫画库 begin-->
            <div class="block collect"  id="jsCollect" data-collect="1">
                <%@ include file="./comic_base.jsp" %>
            </div>
            <!--漫画库 end-->
            
        </div>
        <!--content end-->

        <!--footer begin-->
        <%@ include file="./footer.jsp" %>
        <!--footer end-->
    </body>
    <script type="text/javascript">
    var userId = "${sessionScope.sessionFrontBean.userId}";
    var bookId = ${book.id};
    var chapterId = ${chapter.id};
    
    $(function() {
    	//$(".comment").hide();
    	loadComment();
    	//initComment();
    });
    
    function isLogin() {
		if (userId == null || userId == "") {
			var redirectUrl = "/flash/strips_detail/${book.id}";
			window.location.href="${pageContext.request.contextPath }/user/login?redirectUrl=" + redirectUrl;	
			return false;
		}
		
		return true;
    }
    
    function loadComment() {
		var formData = "bookId=" + bookId + "&bookChapterId=" + chapterId;			
		var formAction = "${pageContext.request.contextPath }/flash/listcomment";
		
		$.ajax({
			type : "POST",
			dataType : "json",
			data : formData,
			async:false,
			url : formAction,
			success : function(map) {
				$("#commentNum").text(map.totalComment);
				$("#comments").empty();
				for(var i = 0; i < map.chapterCommentList.length; i ++) {
					var comment = map.chapterCommentList[i];
					var s = '<div class="box item">' +
		                        '<div class="left">' +
		                            '<img src="' + comment.userPic + '" alt="" class="pic">' +
		                            '<h4 class="user">' + comment.userNick + '</h4>' + 
		                        '</div>' +
		                        '<div class="right">' + 
		                            '<p class="text">' + comment.content + '</p>' + 
		                            '<p class="time">' + comment.createTimeFormat + '</p>' +
		                        '</div>' + 
		                        (userId == comment.userId ? '<div class="del" title="删除评论" id="' + comment.id + '"></div>' : '') + 
		                    '</div>' +
		                    '';
		          	$("#comments").append(s);
				}
				initComment();
			}
		});
	}
		
    function submitComment() {
    	$("#replyContent").val($("#content").val());
    	
    	var replyForm = $("#formReply");
		var formData = $(replyForm).serialize();
		$.ajax({
			type : "POST",
			dataType : "json",
			data : formData,
			async:false,
			url : "${pageContext.request.contextPath }/comment/add_chapter_comment",
			success : function(json) {
				if (json.resBean.code != 0) {
					$(".result").text("* "+json.resBean.msg).css("color","red");						
				} else {
					$("#content").val("");
					$(".result").text("评论成功!").css("color","black");
					loadComment();
				};
			}
		});
    }
    
    function initComment() {
    	$(".send").unbind("click");
    	$(".send").bind("click", function() {
    		if (!isLogin()) {
				return;
			}
			
			submitComment();
    	});
    	
    	$(".del").unbind("click");
    	$(".del").bind("click", function() {
    		if (!isLogin()) return;
    		var commentId = $(this).attr("id");
			var formData = "bookId=${book.id}&commentId=" + commentId;
			
			$.ajax({
				type : "POST",
				dataType : "json",
				data : formData,
				async:false,
				url : "${pageContext.request.contextPath }/comment/del",
				success : function(json) {
					if (json.resBean.code != 0) {
						$(".result").text("* "+json.resBean.msg).css("color","red");	
					} else {
						$(".result").text("删除成功!").css("color","black");
						loadComment();
					}
				}
			});
    	});
    }
    </script>
</html>