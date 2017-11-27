<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title><spring:message code="admin.global.title"></spring:message></title>
	<link type="text/css" rel="stylesheet" href="${sessionScope.baseUrl}pc/css/default.css" />
    <link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}plugin/jquery-easyui-1.4/themes/default/easyui.css"/>
    <link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}plugin/jquery-easyui-1.4/themes/icon.css"/>    
    <link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}plugin/jquery-easyui-1.4/themes/color.css"/>
    <script type="text/javascript" src="${sessionScope.baseUrl}plugin/jquery-easyui-1.4/jquery.min.js"></script>
    <script type="text/javascript" src="${sessionScope.baseUrl}plugin/jquery-easyui-1.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${sessionScope.baseUrl}plugin/jquery-easyui-1.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="${sessionScope.baseUrl}pc/js/paginationUtil.js"></script>
</head>

<body>
	<div class="easyui-layout" data-options="fit:true">
        <div id="center" data-options="region:'center',border:false" width="90%">
			<form id="editForm" name="editForm" action="" method="post">
				<input type="hidden" id="id" name="id" value="${zhuJianBook.id}"/>
				<input type="hidden" id="bookId" name="bookId" value="${zhuJianBook.bookId}"/>
				<table>
					<tr>
						<th>作品名称：</th>
						<td>${zhuJianBook.bookName}</td>
					</tr>
					<tr>
						<th>真实hot：</th>
						<td id="realHot">${zhuJianBook.realHot}</td>
					</tr>
					<tr>
						<th>线上hot：</th>
						<td id="frontHot">${zhuJianBook.frontHot}</td>
					</tr>
					<tr>
						<th>点击：</th>
						<td>${zhuJianBook.clickValue}+</td>
						<td><input type="text" id="fictitiousClickValue" name="fictitiousClickValue" style="width:123px;" value="${zhuJianBook.fictitiousClickValue}"/></td>
					</tr>
					<tr>
						<th>订阅：</th>
						<td>${zhuJianBook.rssValue}+</td>
						<td><input type="text" id="fictitiousRssValue" name="fictitiousRssValue" style="width:123px;" value="${zhuJianBook.fictitiousRssValue}"/></td>
					</tr>
					<tr>
						<th>金票：</th>
						<td>${zhuJianBook.goldenValue}+</td>
						<td><input type="text" id="fictitiousGoldenValue" name="fictitiousGoldenValue" style="width:123px;" value="${zhuJianBook.fictitiousGoldenValue}"/></td>
					</tr>
					<tr>
						<th>打赏：</th>
						<td>${zhuJianBook.rewardValue}+</td>
						<td><input type="text" id="fictitiousRewardValue" name="fictitiousRewardValue" style="width:123px;" value="${zhuJianBook.fictitiousRewardValue}"/></td>
					</tr>
				</table>
			</form>
			<div style="text-align:center;padding:5px">
				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-reload',plain:true" onclick="referBook();">刷新</a>
				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="editBook();">修改</a>
				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-back',plain:true" onclick="closeWindow();">返回</a>
			</div>
        </div>

    </div>
    <script type="text/javascript">
		function editBook() {
            var data = getFormToJsonString('editForm');
		    var ajaxUrl = "<%=contextPath%>/admin/zj/book/edit";
            $.ajax({
                type:"POST",
                url:ajaxUrl,
                data:data,
                dataType : "json",
                success : function(data) {
                    if(data.result){
                        $.messager.alert('提示',data.msg,'info',function(){
                            $("#list").datagrid("reload");
                            closeWindow();
                        });
                    }else{
                        $.messager.alert('提示',data.msg,'error');
                    }
                },
                error : function(msg) {
                    $.messager.alert("提示", msg, "error");
                }
            });
		}
		
		function referBook() {
            var data = getFormToJsonString('editForm');
		    var ajaxUrl = "<%=contextPath%>/admin/zj/book/refer";
            $.ajax({
                type:"POST",
                url:ajaxUrl,
                data:data,
                dataType : "json",
                success : function(data) {
                    if(data.result){
                        $("#frontHot").text(data.obj.frontHot);
                        $("#realHot").text(data.obj.realHot);
                    }else{
                        $.messager.alert('提示',data.msg,'error');
                    }
                },
                error : function(msg) {
                    $.messager.alert("提示", msg, "error");
                }
            });
		}
		

	</script>
</body>
</html>