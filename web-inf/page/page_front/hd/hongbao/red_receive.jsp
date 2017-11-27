<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><spring:message code="front.global.title"></spring:message>-奖励计划</title>
<meta name="keywords" content="红包"></meta>
<meta name="description" content="红包都在这里。"></meta>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/images/hd/hongbao/css/style.css"/>
</head>

<body>  
 <div class="f-body">
 	<div><img src="${sessionScope.baseUrl}pc/images/hd/hongbao/img/img1.jpg" width="1053" height="198" alt="" /></div>
    <div><img src="${sessionScope.baseUrl}pc/images/hd/hongbao/img/img4.jpg" alt="" width="1053" height="440" usemap="#Map" border="0" />
      <map name="Map" id="Map">
        <area shape="rect" coords="261,43,817,406" href="<%=contextPath %>/index" />
      </map>
    </div>
    <div><img src="${sessionScope.baseUrl}pc/images/hd/hongbao/img/img3.jpg" width="1053" height="268" alt="" /></div>
 </div>
</body>
</html>