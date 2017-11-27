<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户管理中心-我的消息</title>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/user.css"/>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/jquery.alert.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/statistics_bd.js"></script>

</head>


<body>
<!--header begin-->
<%@ include file="./user_header.jsp"%>
<!--header end-->
<div class="body-bg">
 	<div class="w1000">
    	<img src="${sessionScope.baseUrl}pc/images/user/nav-2.jpg" width="954" height="8" alt="" />
        <div class="over u-ct">
        	<!--left begin-->
        	<div class="u-per fl">
        		<%@ include file="./user_left_up.jsp"%>
	        	<jsp:include page="./user_left_down.jsp">
					 <jsp:param name="menu" value="notice"/>   
				</jsp:include>
			</div>
        	<!--left end-->
            <!--right begin-->
            <div class="u-perrg">
            	<div class="ce1 over">
                	<h2 class="f16 fl col71 icp2">我的消息</h2>
<%--                    <a href="${pageContext.request.contextPath }/user/notice/clear?tabNick=${tabNick}" class="fr f14">清空已读</a>--%>
                </div>
                
                <!--第三个-->
                <div class="visit ac pos_r xiaox mt20">
                    <div class="ce-t f14 bords">
                        <ul class="over">
                            <li id="messageList" class="on">消息</li>
                            <li id="letterList" >站短</li>
                        </ul>
                    </div>
                    <!--第2个-->
                    <div id="message_template">                                                            
                    </div>                                                                           
                </div>
            </div>
            <!--right end-->
        </div>
    </div>
</div>

<!--foot begin-->
<%@ include file="./user_foot.jsp"%>
<!--foot end-->
<script type="text/javascript">
	$(function(){
		//游客角度
		$('.visit .ce-t li').bind("click", function(){
			$(this).addClass('on').siblings('li').removeClass('on');			
			var id = $(this).attr("id");
			if (id == "messageList") {
				$('#message_template').empty();
				openMessageList(1,10);
			} else if (id == "letterList") {
				$('#message_template').empty();
				openLetterList(1,10);
			}
		});	
		$(".visit .ce-t li[id='${tabNick}']").trigger("click");				
	});
	
	function openMessageList(page, rows) {
		var formData = "page=" + page + "&rows=" + rows;
		submitForHtml(formData, "${pageContext.request.contextPath }/user/notice/message");
	}
	
	function openLetterList(page, rows) {
		var formData = "page=" + page + "&rows=" + rows;
		submitForHtml(formData, "${pageContext.request.contextPath }/user/notice/letter");
	}
	
	function submitForHtml(formData, formAction) {
		$.ajax({
			type : "POST",
			dataType : "html",
			data : formData,
			async:true,
			url : formAction,
			success : function(html) {
				$('#message_template').empty();
				$('#message_template').append(html);
			}
		});
	}	
</script>            
</body>
</html>
