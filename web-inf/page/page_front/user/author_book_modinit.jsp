<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><spring:message code="front.global.title"></spring:message>-用户管理中心-修改作品</title>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}pc/css/user.css"/>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/jquery.alert.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}plugin/uploadPreview/uploadPreview.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/statistics_bd.js"></script>
<script type="text/javascript" src="${sessionScope.baseUrl}pc/js/valid.js"></script>
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
					 <jsp:param name="menu" value="authorbookaddinit"/>   
				</jsp:include>
            </div>
            <!--right begin-->
            <div class="u-perrg">
            	<div class="ce1 over ce13">
                	<h2 class="f16 fl col71">新建作品</h2>
                </div>

                <div class="ce3 ce10 wd12 pos_r">
                	<form action="" enctype="multipart/form-data" method="post" id="bookForm">
                	<input type="hidden" class="wd1" name="id" value="${id }"/>
                	<ul>
                    	<li>
                        	<label>作品书名</label>
                            <div class="w300 fl">
                            	<input type="text" class="wd1" id="bookName" name="bookName" value="${bookForm.bookName }"/>
                                <p><span class="red">*</span>15字以内，请不要在书名里加任何标点符号</p>
                            </div>
                        </li>
                           
                        <li>
                        	<label>主角</label>
                            <div class="w300 fl">
                            	<input type="text" class="wd1" id="bookHero" name="bookHero" value="${bookForm.bookHero }"/>
                                <p><span class="red">*</span>15字以内</p>
                            </div>
                        </li> 
                                              
                        <li class="wd5">
                        	<label>作品简介</label>
                            <div class="fl">
                            	<textarea class="wd4" id="bookInfo" name="bookInfo">${bookForm.bookInfo }</textarea>
                                <div class="over wd6">
                                	<p class="fl"><i class="red">*</i> 请不要超过<i class="red">200</i>字</p>
                                	<!--   
                                    <p class="fr">当前字数：<strong class="red">200</strong></p>
                                    -->
                                </div>
                            </div>
                        </li>
                        <li>
                        	<label>作品类别</label>
                            <div class="wd7 fl">
                            	<select class="se_sea01 ac" name="bookChannelId">
                                	<c:forEach items="${channelList }" var="item">
                                	<c:choose>
                                		<c:when test="${bookForm.bookChannelId == item.id }">
                                			<option value="${item.id }" selected="selected">${item.name }</option>
                                		</c:when>
                                		<c:otherwise>
                                			<option value="${item.id }">${item.name }</option>
                                		</c:otherwise>
                                	</c:choose>                                    
                                    </c:forEach>                                           
                                </select>                               
                            </div>
                            <div class="clear"></div>
                        </li>
                        <li>
                        	<label>二级分类</label>
                            <div class="wd7 fl">
                            	<select class="se_sea01 ac" name="bookCategoryId">
                            		<c:forEach items="${categoryList }" var="item">
                                	<c:choose>
                                		<c:when test="${bookForm.bookCategoryId == item.id }">
                                			<option value="${item.id }" selected="selected">${item.name }</option>
                                		</c:when>
                                		<c:otherwise>
                                			<option value="${item.id }">${item.name }</option>
                                		</c:otherwise>
                                	</c:choose>                                    
                                    </c:forEach>                                                                              
                                </select>                                
                            </div>
                            <div class="clear"></div>
                        </li>
                        <li class="mgwd">
                        	<label>关键词</label>
                        	<div class="fl" style="width:580px;">
                            <c:forEach items="${tagsBeanList }" var="item">                              	                             	                         
                           		<input name="bookTagsId" type="checkbox" value="${item.id }" <c:if test="${item.isChecked == 1 }">checked="checked"</c:if> /><span>${item.name }</span>
                           	</c:forEach>
                           	<input type="hidden" name="bookTagsId"></input>
                           	</div>
                        </li>
                        <li class="mgwd">
                        	<label>是否申请签约</label>                        	
                            <input name="isPermission" type="radio" value="0" <c:if test="${bookForm.isPermission == 0 }">checked="checked"</c:if> />
                            <span>否</span>
                            <input name="isPermission" type="radio" value="1" <c:if test="${bookForm.isPermission == 1 }">checked="checked"</c:if> />
                            <span>是</span>
                            <p class="fl"><span class="red">*</span></p>                            
                        </li>
                        <li class="mgwd">
                        	<label>销售意向</label>
                            <input name="bookSaleType" type="radio" value="0" checked="checked"/>
                            <span>单订</span>
                            <p class="fl"><span class="red">*</span>必选项</p>
                        </li>
                        <c:if test="${resBean != null && resBean.code != 0}">
                        <li>
                        	<label>&nbsp;</label>
                        	<p class="fl"><span class="red"><spring:message code="${resBean.msgKey }"></spring:message></span></p>
                        </li>
                        </c:if>
                        <li>
                        	<label>&nbsp;</label>
                            <input type="button" class="wd2 f14 strong" value="完 成" name="btn_submit"/>
                        </li>
                    </ul>
                    <div id="imgdiv" class="picture ac">
                    	<img id="imgShow" src="${coverimage }" width="220" height="289" alt=""  class="bords"/>
                        <p class="mt5"><span class="red">*</span>JPG格式，尺寸为220*289像素，大小为3M以内</p>
                        <div class="over mt10">                        	
                        	<a href="javascript:void(0);" name="btn_choice_coverimg" class="lfbg bords">选择封面...</a>
                        </div>
                    </div>
                    <div id="template_file">
                    	<input id="coverImageFile" type="file" name="coverImageFile"/>
                    </div>
                    </form>
                </div>                
            </div>
            <!--right end-->
        </div>
    </div>
</div>

<%@ include file="./user_foot.jsp"%>
<script type="text/javascript">
	window.onload = function () { 
        new uploadPreview({ UpBtn: "coverImageFile", DivShow: "imgdiv", ImgShow: "imgShow" });
    };
	$(function(){
		$("#template_file").hide();
		$("a[name='btn_choice_coverimg']").bind("click", function(){
			$("#coverImageFile").trigger("click");
		});
		
		$("input[name='btn_submit']").bind("click", function() {
            if(validateDate()){
                $("#bookForm").attr("action", "${pageContext.request.contextPath }/author/book/mod");
                $("#bookForm").submit();
            }

		});
	});

    function validateDate(){
        if(!validText($('#bookName').val(),true,-1)){
            $.MsgBox.Alert("提示", "作品名称不能为空！");
            return false;
        }
        var bookNameLength = $("#bookName").val().length;
        if(bookNameLength>15){
            $.MsgBox.Alert("提示", "作品名称不能超过15个字！");
            return false;
        }
        if(!validText($('#bookHero').val(),true,-1)){
            $.MsgBox.Alert("提示", "作品主角不能为空！");
            return false;
        }
        var bookHeroLength = $("#bookHero").val().length;
        if(bookHeroLength>15){
            $.MsgBox.Alert("提示", "作品主角不能超过15个字！");
            return false;
        }
        if(!validText($('#bookInfo').val(),true,-1)){
            $.MsgBox.Alert("提示", "作品简介不能为空！");
            return false;
        }
        var bookInfoLength = $("#bookInfo").val().length;
        if(bookInfoLength>200){
            $.MsgBox.Alert("提示", "作品简介不能超过200个字！");
            return false;
        }
        if(!validCheckbox($("[name='bookTagsId']"),true,false)){
            $.MsgBox.Alert("提示", "关键词必须选！");
            return false;
        }
        return true;
    }
</script>
</body>
</html>
