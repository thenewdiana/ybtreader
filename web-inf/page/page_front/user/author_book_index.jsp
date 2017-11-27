<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><spring:message code="front.global.title"></spring:message>-用户管理中心-作品管理</title>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/user.css"/>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/jquery.alert.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}plugin/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/valid.js"></script>
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
        	<div class="u-per fl">            	
                <%@ include file="./user_left_up.jsp"%>                
                <jsp:include page="./user_left_down.jsp">
					 <jsp:param name="menu" value="authorbooklistbytable"/>   
				</jsp:include>
            </div>
            <!--right begin-->
            <div class="u-perrg draft">
            	<div class="ce1 over">
                	<h2 class="f16 fl col71">作品管理</h2>
                </div>
              <!--第二个-->
                <div class="visit  f14">
                	<div class="ce-t bords ac">
                        <ul class="over">
                            <li id="bookdetail">作品信息</li>
                            <li id="booksection">分卷管理</li>
                            <li id="bookchapteradd">新增章节</li>                            
                            <li id="bookchapteronline">章节管理</li>
                            <li id="bookchapterdraft">草稿箱</li>                            
                            <li id="bookcomment">书评管理</li>
                        </ul>
                    </div>
                    <!--第2个-->
                    <!--作品信息-->
                    <div class="house">
                        <div class="ce3 ce10 wd12 pos_r sub11" id="bookdetail">
                            <ul>
                                <li>
                                    <label>作品书名</label>
                                    <p class="red fl">${book.name }</p>
                                </li>
                                <li>
                                    <label>书号</label>
                                    <p class="fl">${book.id }</p>
                                </li>
                                <li>
                                    <label>作品主角</label>
                                    <p class="fl">${book.hero }</p>
                                </li>
                                <li class="wd5">
                                    <label>作品简介</label>
                                    <div class="fl new-auto1">
                                         <pre class="note">${fn:escapeXml(book.info)}</pre>
                                    </div>
                                </li>
                                <li class="h2l">
                                    <label>作品类别</label>
                                    <p class="fl">${book.channelName } - ${book.categoryName }</p>
                                </li>
                                <li class="h2l">
                                    <label>作品标签</label>
                                    <p class="fl">
                                    	<c:forEach items="${tagsList }" var="item">
                                    	${item.name },
                                    	</c:forEach>
                                    </p>
                                </li>
                                <li class="h2l">
                                    <label>授权类别</label>
                                    <p class="fl">${book.permissionTypeCN }</p>
                                </li>
                                <li class="h2l">
                                    <label>销售意向</label>
                                    <p class="fl">${book.saleTypeCN }</p>
                                </li>
                                <li class="h2l">
                                    <label>作品状态</label>
                                    <p class="fl green">${book.statusCN }</p>
                                </li>
                            </ul>
                            <div class="picture ac">
                                <img src="${book.bigCoverImage }" width="220" height="289" class="bords"/>
                            </div>
                        </div>
                    </div>
                    <!--作品信息-->
                    <!--分类管理-->
                    <div class="house hide">
                    	<div class="sub4 over bgno" id="booksection">
                        	<p class="fl"><strong class="f12">当前作品：</strong><span class="red f14">${book.name }</span></p>                      	
                            <p class="fr"><span class="red f14"><a href="javascript:void(0);" name="btn_addsection">新增分卷</a></span></p>                            
                        </div>
                        <!-- booksection -->
                        <div class="sub8 f12">
                        	<p><span class="red">*</span>友情提示：</p>
                        	<p>1、请注意章节号尽量使用阿拉伯数字并顺序发布，例如：第1章 雁北堂，序号使用英文或中文导致乱码乱序等情况将直接影响销售成绩。</p>
                        	<p>2、拉票、请假、PS等信息请在“作者的话”内输入，会在醒目位置单独显示，如在正文发布大量多余信息，讲直接影响稿酬发放。</p>
                        </div>
                    </div>
                    <!--分类管理-->
                    <!--章节管理-->
                    <div class="house hide">
                    	<div class="sub4 over" id="bookchapter">
                        	<p class="fl"><strong class="f12">当前作品：</strong><span class="red">${book.name }</span></p>
                        	<!--  
                            <p class="fr"><strong>共计</strong><strong class="red mg">1</strong>卷<strong class="red mg">0</strong>章</p>
                            -->
                        </div>
                        
                        <div class="sub8 f12">
                        	<p><span class="red">*</span>友情提示：</p>
                        	<p>1、请注意章节号尽量使用阿拉伯数字并顺序发布，例如：第1章 雁北堂，序号使用英文或中文导致乱码乱序等情况将直接影响销售成绩。</p>
                        	<p>2、拉票、请假、PS等信息请在“作者的话”内输入，会在醒目位置单独显示，如在正文发布大量多余信息，讲直接影响稿酬发放。</p>
                        </div>
                    </div>
                    <!--章节管理-->                   
                    <!--书评管理-->
                    <div class="house hide">
                    	<div class="sub4 over bgno" id="bookcomment">
                        	<p class="fl"><strong class="f12">当前作品：</strong><span class="red f14">${book.name }</span></p>
                        	<p class="fr"><span class="red f14"><a href="${pageContext.request.contextPath }/author/assist/index?bookId=${book.id}">管家管理</a></span></p>
                        </div>
                        
                    </div>
                    <!--书评管理-->
                </div>
            </div>
            <!--right end-->
        </div>
    </div>
</div>

<%@ include file="./user_foot.jsp"%>
<script type="text/javascript">
	$(function(){
		var isFinish = '${book.isFinish}';
		//游客角度
		$('.visit .ce-t li').bind("click", function(){
			$(this).addClass('on').siblings('li').removeClass('on');
			$('.house').hide();
			var id = $(this).attr("id");
			if (id == "bookdetail") {
				openBookDetail();
			} else if (id == "booksection") {
				if (isFinish == '1') {
					$.MsgBox.Alert("提示", "作品已经完结不可修改");	
				} else {									
					openBookSection();
				}
			} else if (id == "bookchapteradd") {
				if (isFinish == '1') {
					$.MsgBox.Alert("提示", "作品已经完结不可修改");	
				} else {									
					openBookChapter("default");
				}
			} else if (id == "bookchapteronline") {
				if (isFinish == '1') {
					$.MsgBox.Alert("提示", "作品已经完结不可修改");	
				} else {									
					openBookChapter("online");
				}
			} else if (id == "bookchapterdraft") {
				if (isFinish == '1') {
					$.MsgBox.Alert("提示", "作品已经完结不可修改");	
				} else {									
					openBookChapter("draft");
				}
			} else if (id == "bookcomment") {
				openBookComment(1, 10);
			}
		});	
		
		$('.house').hide();
		$(".visit .ce-t li[id='${tabNick}']").trigger("click");				
	});
	
	function openBookDetail() {
		$("div[id='bookdetail']").parent().show();
	}
	
	function openBookSection() {
		var obj = $("div[id='booksection']"); 
		$(obj).parent().show();
		//新增分卷
		$(obj).find("a[name='btn_addsection']").unbind("click");
		$(obj).find("a[name='btn_addsection']").bind("click", function() {
			var formData = "bookId=${book.id}";
			var formAction = "${pageContext.request.contextPath }/author/booksection/addinit";	
			submitForHtml(formData, formAction, obj);
		});
		
		//分卷管理
		var formData = "bookId=${book.id}";
		var formAction = "${pageContext.request.contextPath }/author/booksection/list";		
		submitForHtml(formData, formAction, obj);		
	}
	
	function modBookSection(bookId, sectionId) {
		var obj = $("div[id='booksection']"); 
		$(obj).parent().show();
		
		var formData = "bookId="+bookId+"&sectionId=" + sectionId;
		var formAction = "${pageContext.request.contextPath }/author/booksection/modinit";		
		submitForHtml(formData, formAction, obj);
	}

	function openBookChapter(treeType) {
		var obj = $("div[id='bookchapter']"); 
		$(obj).parent().show();
		
		//章节管理
		var formData = "bookId=${book.id}&treeType=" + treeType;
		var formAction = "${pageContext.request.contextPath }/author/bookchapter/index";		
		submitForHtml(formData, formAction, obj);	
	}
	
	function openBookComment(page, rows) {
		var obj = $("div[id='bookcomment']"); 
		$(obj).parent().show();
		
		var formData = "bookId=${book.id}&page=" + page + "&rows=" + rows;
		var formAction = "${pageContext.request.contextPath }/author/book/comment";
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
				$(obj).next("div").remove();
				$(obj).after(html);
			}
		});
	}	
</script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/chapter_format_n.js"></script>
</body>
</html>
