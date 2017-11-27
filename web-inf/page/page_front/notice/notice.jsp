<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>公告-${notice.title}</title>
<meta name="keywords" content="公告信息 "></meta>
<meta name="description" content="公告，公告"></meta>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/style.css"/>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/time.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/main.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/ZeroClipboard.min.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/statistics_bd.js"></script>
</head>


<body>
<!--header begin-->
<%@ include file="../header.jsp"%>
<!--header end-->
<%@ include file="../header_recomm.jsp"%>
<!--导航-->
<jsp:include page="../banner.jsp">
	 <jsp:param name="menu" value="wu"/>   
</jsp:include>
<!--中间-->
<div class="body-bg">
    <!--模块二-->
    <div class="w1000 w1030" id="mt20">
    	<!--right begin-->
        <div class="zp-wdlf fl pos_r">
        	<div class="ggao">
            	<div class="tit">
                	<div class="over">
                    	<p class="fl f14"><span class="f24 red">[${notice.noticeTypeName}]</span><a class="f24">${notice.title}</a><a href="javascript:void(0);" id="copy-button" data-clipboard-text="<%=rootPath %>/notice/${notice.id }" title="" class="clc63">[复制链接]</a><a href="javascript:AddFavorite('公告',location.href)" title="" class="cl393">[收藏]</a></p>
                        <p class="fr mt5"><a href="javascript:void(0);" title="" onclick="javascript:window.print();"><img src="${sessionScope.baseUrl}pc/images/gongg-1.jpg" width="18" height="22" alt="" /></a></p>
                    </div>
                	<p class="f14">发布时间:<span class="examTime">${notice.createTime}</span>  浏览：${notice.clickValue}次</p>
                </div>
                <div id="contentEdit" class="ft-gg f14">
                	${notice.content}

                </div>
                <div class="gshare">
                    <div class="over ar">
                        <a href="http://service.weibo.com/share/share.php?url=<%=rootPath %>/notice/${notice.id }&title=${notice.title}&language=zh_cn" class="fr" title="分享到微博" target="_blank">
                        <img src="${sessionScope.baseUrl}pc/images/gongg-5.jpg" width="35" height="34"  />
                        </a>
                        <a href="http://connect.qq.com/widget/shareqq/index.html?url=<%=rootPath %>/notice/${notice.id }&title=${notice.title}" class="fr" title="分享到QQ空间" target="_blank">
                        <img src="${sessionScope.baseUrl}pc/images/gongg-4.jpg" width="35" height="34"  />
                        </a>
                        <span class="red f18 fr mt5">分享</span>
                    </div>
                </div>
                
                
            </div>
        </div>
       <!-- right end-->
       <!--left begin-->
       <div class="zp-wdrg fr">
       		<div class="bords ggrt f12">
            	<div class="over">
                	<img src="${sessionScope.baseUrl}pc/images/gongg-6.jpg" width="64" height="25" class="fl" />
                    <span class="fl f14 strong mt5">公告区</span>
                    <img src="${sessionScope.baseUrl}pc/images/gongg-7.jpg" width="24" height="18" alt="" class="fl mt5"/>
                </div>
                <c:forEach items="${noticeList }" var="item" varStatus="status">
                	<c:if test="${status.first}">
                		<p class="mt10 red f16"><a href="${contextPath }/notice/${item.id }" class="interceptString" datalength="11" >${item.title }</a></p>
                		<p class="mt5 interceptString" datalength="30">${fn:escapeXml(item.text)}</p>
                	</c:if>		
				</c:forEach>
				<dl>
				<c:forEach items="${noticeList }" var="item" varStatus="status">
                	<c:if test="${!status.first}">
                		<dd>
	                        <a href="${contextPath }/notice/${item.id }" class="interceptString" datalength="15">${item.title }</a>
	                        <span class="mdhm">${notice.createTime}</span>
	                    </dd>
                	</c:if>		
				</c:forEach>
                </dl>
            </div>
       </div>
       <!--left end-->
        <!--模块二-->
    </div>
</div>

<!--footer-->
<%@ include file="../footer.jsp"%>
<!--footer-->
<%-- <script src="${sessionScope.baseUrl}plugin/ueditor1_4_3/ueditor.parse.js"></script> --%>
<script src="/ueditor1_4_3/ueditor.parse.js"></script>
<script>
setTimeout(function(){uParse('#contentEdit',
{
 'highlightJsUrl':'/ueditor/third-party/SyntaxHighlighter/shCore.js',
 'highlightCssUrl':'/ueditor/third-party/SyntaxHighlighter/shCoreDefault.css'})
},100);
</script>
<script type="text/javascript">
$(function(){
	ZeroClipboard.setDefaults({
	 	moviePath: "${sessionScope.baseUrl}pc/js/ZeroClipboard.swf"
	});
	
	var clip = new ZeroClipboard($("#copy-button"));

	clip.on("load", function (client) {
	    client.on("complete", function (client, args) {
	    	alert("已复制!");
	    });
	});

	clip.on("noFlash", function (client) {
		$(".copy-button").hide();
	});

	clip.on("wrongFlash", function (client, args) {
		$(".copy-button").hide();
	});
});

function AddFavorite(title, url){
	try{
		window.external.AddFavorite(url, title);
	}catch(e){
		try{
			window.sidebar.addPanel(title, url, "");
		}catch(e){
			alert("抱歉，您所使用的浏览器无法完成此操作。\n\n加入收藏失败，请使用Ctrl+D进行添加");
		}
	}
}
</script>
</body>

</html>
