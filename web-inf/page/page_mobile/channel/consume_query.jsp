<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common_m.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>消费查询_雁北堂_雁北堂中文网_手机版</title>
<link rel="stylesheet" href="${sessionScope.baseUrl}mobile/css/common.css"/>
<link rel="stylesheet" href="${sessionScope.baseUrl}mobile/css/style.css"/>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/statistics_bd.js"></script>
<script type="text/javascript"  src="${sessionScope.baseUrl}mobile/js/jquery.min.js"></script>
<!--[if lt IE 9]>
<script type="text/javascript"  src="${sessionScope.baseUrl}mobile/js/html5.js"></script>
<![endif]-->
<script type="text/javascript" src="${sessionScope.baseUrl}mobile/js/main.js"></script>
</head>


<body>
<!--header begin-->
<header> 
<jsp:include page="../header_m.jsp">
	 <jsp:param name="menu" value="recharge"/>   
</jsp:include>
</header>
<%@ include file="../header_user_m.jsp"%>
<!--header end-->

<hgroup class="cons_title"><span></span></hgroup>
<hgroup class="cons_jl">您的余额：<span>${resBean.balanceValue}</span> 糖豆</hgroup>
<form id="consumeForm" action="<%=contextPath%>/m/consume/query" method="post">
<input type="hidden" id="page" name="page" value=""/>
<input type="hidden" id="rows" name="rows" value=""/>
<section class="cons_cont">
  <div class="cons_yf">选择月份：
  	<select id="dateStr" name="dateStr">
  		<c:forEach var="item"  items="${dateList}">
  			<option <c:if test="${dateStr==item}">selected="selected"</c:if> value ="${item}">${item}</option>  
  		</c:forEach>
  	</select>
    <button type="submit" class="cons_btu">查询</button>
  </div>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="cons_table">
    <thead>
      <tr>
        <th>	
        	<select id="type" name="type" >
		  		<option value ="1" <c:if test="${type==1}">selected="selected"</c:if>>订阅</option>  
		  		<option value ="2" <c:if test="${type==2}">selected="selected"</c:if>>打赏</option>  
		  	</select>
        </th>
    <th>糖豆</th>
    <th>时间</th>
    </tr>
    </thead>
    
    <c:forEach var="item"  items="${consumptionList}">
  		<tbody>
	      <tr>
	        <td>
	        	<c:choose>
					<c:when test="${item.payType == 1}">订阅</c:when>
					<c:when test="${item.payType == 2}">打赏</c:when>
					<c:otherwise>
						未知
					</c:otherwise>
				</c:choose>
	        </td>
	        <td>${item.payValue}</td>
	        <td class="mdhm">${item.createTime}</td>
	      </tr>
	    </tbody>
  	</c:forEach>
  </table>
</section>
<div class="goback"><a class="homes" href="${pageContext.request.contextPath }/m"><img height="16" width="18" alt="返回首页" src="${sessionScope.baseUrl}mobile/images/home.png"></img></a>&gt;<a href="<%=contextPath%>/m/recharge">返回帐户中心</a></div>
<page:mpagination pageAttr="pagination"></page:mpagination>
</form>

<!--footer-->
<%@ include file="../footer_m.jsp"%>
<!--footer-->
<script type="text/javascript">
	$(function(){
		$("#type").bind("change", function(){
	    	$('#consumeForm').submit();
		});
	});
	
	function paper(pageNoValue, pageSizeValue){
		$('#page').val(pageNoValue);
		$('#rows').val(pageSizeValue);
		$('#consumeForm').submit();
	}
</script>     
</body>
</html>


