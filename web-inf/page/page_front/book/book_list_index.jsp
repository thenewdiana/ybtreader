<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="雁北堂，书库，列表 "></meta>
<meta name="description" content="雁北堂作者书库列表展示。"></meta>
<title><spring:message code="front.global.title"></spring:message>-书库</title>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/js/slideBox.css"/>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/style.css"/>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/main.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/time.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/statistics_bd.js"></script>
</head>


<body>
<!--header begin-->
<%@ include file="../header.jsp"%>
<!--header end-->
<%@ include file="../header_recomm.jsp"%>
<!--导航-->
<jsp:include page="../banner.jsp">
	 <jsp:param name="menu" value="bookroom"/>   
</jsp:include>
<!--中间-->
<!--中间-->
<div class="body-bg">
    <!--模块二-->
    <div class="w1000 s-sec over">
    	<!--left begin-->
        <div class="wd-lf mt25 gray fl">
            <div class="ce-t pos_r clearFix">
                <div class="wd-1 fl"></div>
                <div class="wd-3"></div>
                <strong class="fl">书 库</strong>
                <div class="wd-2 fr"></div>
            </div>
            <div class="bord">
            	<form action="" method="get" id="bookForm">
            	<input type="hidden" id="page" name="page" value="${pagination.currPage }"/>
            	<input type="hidden" id="rows" name="rows" value="${pagination.pageSize }"/>
            	<input type="hidden" id="bookRoomCategoryType" name="bookRoomCategoryType" value="${bookReqForm.bookRoomCategoryType }"/>
            	<input type="hidden" id="bookRoomWordType" name="bookRoomWordType" value="${bookReqForm.bookRoomWordType }"/>
            	<input type="hidden" id="bookRoomUpdateType" name="bookRoomUpdateType" value="${bookReqForm.bookRoomUpdateType }"/>
            	<input type="hidden" id="bookRoomVipType" name="bookRoomVipType" value="${bookReqForm.bookRoomVipType }"/>
            	<input type="hidden" id="bookRoomFinishType" name="bookRoomFinishType" value="${bookReqForm.bookRoomFinishType }"/>
            	<input type="hidden" id="bookRoomOrderByType" name="bookRoomOrderByType" value="${bookReqForm.bookRoomOrderByType }"/>
           		<div class="inner">
                	<dl>
                    	<dt>分 类：</dt>
                        <dd>                        	
                        	<a href="javascript:void(0);" <c:if test="${bookReqForm.bookRoomCategoryType == -1 }">class="on"</c:if> onclick="doBookRoomCategoryType(-1)">全部</a>                       	
                        	<c:forEach items="${categoryList }" var="item">
                        	<c:choose>
                        		<c:when test="${bookReqForm.bookRoomCategoryType == item.id }">
                        			<a href="javascript:void(0);" class="on" onclick="doBookRoomCategoryType('${item.id}');">${item.name }</a>                        			
                        		</c:when>
                        		<c:otherwise>
                        			<a href="javascript:void(0);" onclick="doBookRoomCategoryType('${item.id}');">${item.name }</a>
                        		</c:otherwise>
                        	</c:choose>                        	
                        	</c:forEach>                        	
                        </dd>
                    </dl>
                    <dl>
                    	<dt>作品字数：</dt>
                        <dd>                        	                        
                        	<a href="javascript:void(0);" <c:if test="${bookReqForm.bookRoomWordType == -1}">class="on"</c:if> onclick="doBookRoomWordType(-1)">全部</a>
                        	<a href="javascript:void(0);" <c:if test="${bookReqForm.bookRoomWordType == 1}">class="on"</c:if> onclick="doBookRoomWordType(1)">30万以下</a>
                        	<a href="javascript:void(0);" <c:if test="${bookReqForm.bookRoomWordType == 2}">class="on"</c:if> onclick="doBookRoomWordType(2)">30-50万</a>
                        	<a href="javascript:void(0);" <c:if test="${bookReqForm.bookRoomWordType == 3}">class="on"</c:if> onclick="doBookRoomWordType(3)">50-100万</a>
                        	<a href="javascript:void(0);" <c:if test="${bookReqForm.bookRoomWordType == 4}">class="on"</c:if> onclick="doBookRoomWordType(4)">100万以上</a>
                        </dd>
                    </dl>
                    <dl>
                    	<dt>排序方式：</dt>
                        <dd>
                        	<a href="javascript:void(0);" <c:if test="${bookReqForm.bookRoomOrderByType == -1}">class="on"</c:if> onclick="doBookRoomOrderByType(-1)">全部</a>
                        	<a href="javascript:void(0);" <c:if test="${bookReqForm.bookRoomOrderByType == 1}">class="on"</c:if> onclick="doBookRoomOrderByType(1)">点击次数</a>
                        	<a href="javascript:void(0);" <c:if test="${bookReqForm.bookRoomOrderByType == 2}">class="on"</c:if> onclick="doBookRoomOrderByType(2)">订阅次数</a>
                        	<a href="javascript:void(0);" <c:if test="${bookReqForm.bookRoomOrderByType == 3}">class="on"</c:if> onclick="doBookRoomOrderByType(3)">收藏次数</a>
                        	<a href="javascript:void(0);" <c:if test="${bookReqForm.bookRoomOrderByType == 4}">class="on"</c:if> onclick="doBookRoomOrderByType(4)">金票次数</a>
                        	<a href="javascript:void(0);" <c:if test="${bookReqForm.bookRoomOrderByType == 5}">class="on"</c:if> onclick="doBookRoomOrderByType(5)">字数</a>
                        </dd>
                    </dl>
                    <dl>
                    	<dt>更新时间：</dt>
                        <dd>
                        	<a href="javascript:void(0);" <c:if test="${bookReqForm.bookRoomUpdateType == -1}">class="on"</c:if> onclick="doBookRoomUpdateType(-1)">全部</a>
                        	<a href="javascript:void(0);" <c:if test="${bookReqForm.bookRoomUpdateType == 1}">class="on"</c:if> onclick="doBookRoomUpdateType(1)">3三日内</a>
                        	<a href="javascript:void(0);" <c:if test="${bookReqForm.bookRoomUpdateType == 2}">class="on"</c:if> onclick="doBookRoomUpdateType(2)">七日内</a>
                        	<a href="javascript:void(0);" <c:if test="${bookReqForm.bookRoomUpdateType == 3}">class="on"</c:if> onclick="doBookRoomUpdateType(3)">半月内</a>
                        	<a href="javascript:void(0);" <c:if test="${bookReqForm.bookRoomUpdateType == 4}">class="on"</c:if> onclick="doBookRoomUpdateType(4)">一月内</a>
                        </dd>
                    </dl>
                    <dl>
                    	<dt>是否免费：</dt>
                        <dd>
                        	<a href="javascript:void(0);" <c:if test="${bookReqForm.bookRoomVipType == -1}">class="on"</c:if> onclick="doBookRoomVipType(-1)">全部</a>
                        	<a href="javascript:void(0);" <c:if test="${bookReqForm.bookRoomVipType == 0}">class="on"</c:if> onclick="doBookRoomVipType(0)">免费作品</a>
                        	<a href="javascript:void(0);" <c:if test="${bookReqForm.bookRoomVipType == 1}">class="on"</c:if> onclick="doBookRoomVipType(1)">收费作品</a>
                        </dd>
                    </dl>
                    <dl>
                    	<dt>是否完结：</dt>
                        <dd>
                        	<a href="javascript:void(0);" <c:if test="${bookReqForm.bookRoomFinishType == -1}">class="on"</c:if> onclick="doBookRoomFinishType(-1)">全部</a>
                        	<a href="javascript:void(0);" <c:if test="${bookReqForm.bookRoomFinishType == 1}">class="on"</c:if> onclick="doBookRoomFinishType(1)">已完结</a>
                        	<a href="javascript:void(0);" <c:if test="${bookReqForm.bookRoomFinishType == 0}">class="on"</c:if> onclick="doBookRoomFinishType(0)">未完结</a>
                        </dd>
                    </dl>
                </div>
                </form>
                <div class="result">
                    <ul class="tit f14">
                        <li class="tit1">序号</li>
                        <li class="tit2">书名</li>
                        <li class="tit3">作者</li>
                        <li class="tit3">字数</li>
                        <li class="tit3">总点击</li>
                        <li class="tit3">收藏数 </li>
                        <li class="tit4">更新时间</li>
                    </ul>
                    <c:forEach items="${bookList }" var="item" varStatus="status">
                    <ul class="Arial">
                        <li class="tit1 co4e strong">${status.count }</li>
                        <li class="tit2 sisong"><a href="${pageContext.request.contextPath }/book/${item.id}"  title="" class="co4e">${item.name }</a></li>
                        <li class="tit3 sisong">${item.authorNick }</li>
                        <li class="tit3">${item.words }</li>
                        <li class="tit3">${item.clickValue }</li>
                        <li class="tit3">${item.collValue }</li>
                        <li class="tit4 ca6">${item.lastModifyTimeFormat}</li>
                    </ul>
                    </c:forEach>                    
                </div>
            </div>
            
	        <!--page-->
	       <page:pagination pageAttr="pagination"></page:pagination>
         </div>
         
         <!--rgith-->   
        <div class="wd-244 fr mt25 dots">
            <div class="bords">
                <div class="ce-t over new-tab1">
                    <span class="fl">点击榜</span>
                    <ul>
                        <li>周</li>
                        <li>月</li>
                        <li class="on">总</li>
                    </ul>
                    <jsp:include page="../rank/rank_more.jsp">
						 <jsp:param name="action" value="click"/>   
					</jsp:include>
                </div>
                <div class="ce-c">
                    <ul class="new-list hide">
                        <c:forEach items="${clickRankByWeekList }" var="item" varStatus="status">
                    		<%@ include file="../rank/sub_rank_click.jsp"%>
                        </c:forEach> 
                    </ul>
                    <ul class="new-list hide">
                        <c:forEach items="${clickRankByMonthList }" var="item" varStatus="status">
                    		<%@ include file="../rank/sub_rank_click.jsp"%>
                        </c:forEach> 
                    </ul>
                    <ul class="new-list show">
                    	<c:forEach items="${clickRankByAllList }" var="item" varStatus="status">
                    		<%@ include file="../rank/sub_rank_click.jsp"%>
                        </c:forEach>                        
                    </ul>
                </div>
            </div>
            <!--第二块-->
            <div class="bords mt15">
                <div class="ce-t over new-tab2">
                    <span class="fl">打赏榜</span>
                    <ul>
                        <li>周</li>
                        <li>月</li>
                        <li class="on">总</li>
                    </ul>
                    <jsp:include page="../rank/rank_more.jsp">
						 <jsp:param name="action" value="reward"/>   
					</jsp:include>
                </div>
                <div class="ce-c">
                  <ul class="new-list1 hide">
                        <c:forEach items="${rewardRankByWeekList }" var="item" varStatus="status">
                    		<%@ include file="../rank/sub_rank_reward.jsp"%>
                        </c:forEach>
                    </ul>
                  <ul class="new-list1 hide">
                        <c:forEach items="${rewardRankByMonthList }" var="item" varStatus="status">
                    		<%@ include file="../rank/sub_rank_reward.jsp"%>
                        </c:forEach>
                  </ul>
                  <ul class="new-list1 show">
                  		<c:forEach items="${rewardRankByAllList }" var="item" varStatus="status">
                    		<%@ include file="../rank/sub_rank_reward.jsp"%>
                        </c:forEach>      
                  </ul>
                </div>
            </div>
            <!--第二块-->
            <div class="bords mt15">
                <div class="ce-t over new-tab8">
                    <span class="fl">新人榜</span>
                    <ul>
                        
                    </ul>
                    <jsp:include page="../rank/rank_more.jsp">
					 <jsp:param name="action" value="newUser"/>   
				</jsp:include>
                </div>
                <div class="ce-c">
                    <ul class="new-list7 show">
                    	<c:forEach items="${newUserRankList }" var="item" varStatus="status">
                    		<%@ include file="../rank/sub_rank_newuser.jsp"%>
                        </c:forEach>                                                
                    </ul>                    
                </div>
            </div>
            <!--第三块-->
            <div class="bords mt15">
                <div class="ce-t over new-tab9">
                    <span class="fl">免费榜</span>
                    <ul>
                        <li>周</li>
                        <li>月</li>
                        <li class="on">总</li>
                    </ul>
                    <jsp:include page="../rank/rank_more.jsp">
						 <jsp:param name="action" value="freeBook"/>   
					</jsp:include>
                </div>
                <div class="ce-c">
                    <ul class="new-list8 hide">
                        <c:forEach items="${freeBookRankByWeekList }" var="item" varStatus="status">
                    		<%@ include file="../rank/sub_rank_click.jsp"%>
                        </c:forEach>
                    </ul>
                    <ul class="new-list8 hide">
                        <c:forEach items="${freeBookRankByMonthList }" var="item" varStatus="status">
                    		<%@ include file="../rank/sub_rank_click.jsp"%>
                        </c:forEach>
                    </ul>
                    <ul class="new-list8 show">
                        <c:forEach items="${freeBookRankByAllList }" var="item" varStatus="status">
                    		<%@ include file="../rank/sub_rank_click.jsp"%>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <!--第四块-->
        </div>
        <!--rgith-->
    </div>
    <!--模块二-->    
</div>

<!--footer-->
<%@ include file="../footer.jsp"%>
<!--footer-->
<script type="text/javascript">
    jQuery(function($) {
		//滑动门
        //$(".tabs").selfTabs();
    });
    
    function paper(pageNoValue, pageSizeValue) {
    	$("#page").attr("value", pageNoValue);
    	$("#rows").attr("value", pageSizeValue);
    	doSubmit();
    }
    
    function doBookRoomCategoryType(categoryId) {
    	$("#bookRoomCategoryType").attr("value", categoryId);
    	$("#page").attr("value", 1);    	
    	doSubmit();
    }
    
    function doBookRoomWordType(bookRoomWordType) {
    	$("#bookRoomWordType").attr("value", bookRoomWordType);
    	$("#page").attr("value", 1);  
    	doSubmit();
    }
    
    function doBookRoomOrderByType(bookRoomOrderByType) {
    	$("#bookRoomOrderByType").attr("value", bookRoomOrderByType);
    	$("#page").attr("value", 1);  
    	doSubmit();
    }
    
    function doBookRoomUpdateType(bookRoomUpdateType) {
    	$("#bookRoomUpdateType").attr("value", bookRoomUpdateType);
    	$("#page").attr("value", 1);  
    	doSubmit();
    }
    
    function doBookRoomVipType(bookRoomVipType) {
    	$("#bookRoomVipType").attr("value", bookRoomVipType);
    	$("#page").attr("value", 1);  
    	doSubmit();
    }
    
    function doBookRoomFinishType(bookRoomFinishType) {
    	$("#bookRoomFinishType").attr("value", bookRoomFinishType);
    	$("#page").attr("value", 1);  
    	doSubmit();
    }
    function submitForm(url, data)
    {
     	var eleForm = document.body.appendChild(document.createElement('form'));
    	eleForm.action = url;
    	for (var property in data)
    	{
    		var hiddenInput = document.createElement('input');
    		hiddenInput.type = 'hidden';
    		hiddenInput.name = property;
    		hiddenInput.value = data[property];
    		eleForm.appendChild(hiddenInput);
    	}
    	this.eleForm = eleForm;
    	if (!submitForm._initialized)
    	{
  			submitForm.prototype.post = function ()
			{
	    		this.eleForm.method = 'post';
	   			this.eleForm.submit();
	   		};
   		submitForm._initialized = true;
    	}
    }
    function url2json(e) {
        var t, n, r, i = e, s = {};
        t = i.split("&"),
        r = null,
        n = null;
        for (var o in t) {
            var u = t[o].indexOf("=");
            u !== -1 && (r = t[o].substr(0, u),
            n = t[o].substr(u + 1),
            s[r] = n)
        }
        return s
    }
    function doSubmit() {
    	var formData = $('#bookForm').serialize();
    	//console.log(url2json(formData));
    	//window.location.href = "${pageContext.request.contextPath }/book?" + formData; 
    	new submitForm('${pageContext.request.contextPath }/book', url2json(formData)).post(); // Url中的参数被隐藏
    }
</script> 
</body>
</html>