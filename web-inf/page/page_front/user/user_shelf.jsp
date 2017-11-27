<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户管理中心-我的书架</title>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/user.css"/>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/jquery.alert.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/main.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/time.js"></script>
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
					 <jsp:param name="menu" value="shelf"/>   
				</jsp:include>
			</div>
        	<!--left end-->
            <!--right begin-->
            <div class="u-perrg">
            	<div class="ce1 over">
                	<h2 class="f16 fl col71 icp">我的书架</h2>
                    <a href="${pageContext.request.contextPath }/book" title="" class="fr f14">随便转转</a>
                </div>
                <!--第二个-->
                <div class="ce4 over">
                	<c:forEach items="${bookList}" var="item" varStatus="status">
                		<dl>
	                    	<dt><a href="${contextPath }/book/${item.id}" target="_blank" title=""><img src="${sessionScope.customUrl}book/simgs/${item.coverImage}" onerror="this.src='${sessionScope.customUrl}book/simgs/default_book.jpg'" width="54" height="67" alt="" /></a></dt>
	                        <dd class="interceptString" datalength="20">${item.info }</dd>
	                    </dl>
                	</c:forEach>
                    <div class="yells fr white">猜你喜欢</div>
                </div>
                <!--第三个-->
                <div class="visit ac  visits f14">
                	<div class="ce-t bords">
                        <ul class="over">
                            <li class="on">我的书架</li>
                            <li>最近阅读</li>
                            <li>我的评论</li>
                        </ul>
                    </div>
                    <!--第2个-->
                    <div class="house" id="userCollection">
                    </div>
                    <div class="house houses hide" id="userRead">
                    </div>
                    <div class="house house2 pos_r hide" id="userComment">
                    </div>
                </div>
                <!--第四个-->
                
                
            </div>
            <!--right end-->
        </div>
    </div>
</div>

<!--foot begin-->
<%@ include file="./user_foot.jsp"%>
<!--foot end-->
<script type="text/javascript">
	
	$(function() {
		openUserCollection(1, 10);
		openUserRead();
		openUserComment(1,10);
	});

	function openUserCollection(page, rows) {
		var obj = $("#userCollection"); 
		var formData = "page=" + page + "&rows=" + rows;
		var formAction = "${pageContext.request.contextPath }/user/shelf_collection";
		submitForHtml(formData, formAction, obj);	
	}
	
	function openUserRead() {
		var obj = $("#userRead"); 
		var formData = "";
		var formAction = "${pageContext.request.contextPath }/user/shelf_read";
		submitForHtml(formData, formAction, obj);	
	}

	function openUserComment(page, rows) {
		var obj = $("#userComment"); 
		var formData = "page=" + page + "&rows=" + rows;
		var formAction = "${pageContext.request.contextPath }/user/shelf_comment";
		submitForHtml(formData, formAction, obj);	
	}
	
	function submitForHtml(formData, formAction, obj) {
		$.ajax({
			type : "POST",
			dataType : "html",
			data : formData,
			async:true,
			url : formAction,
			success : function(html) {
				$(obj).empty();
				$(obj).append(html);
			}
		});
	}	
</script>
</body>
</html>
