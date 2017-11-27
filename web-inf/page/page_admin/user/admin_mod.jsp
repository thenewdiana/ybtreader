<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../common.jsp" %>
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
    <script type="text/javascript" src="${sessionScope.baseUrl}pc/js/valid.js"></script>
    <script type="text/javascript" src="${sessionScope.baseUrl}pc/js/arrayExt.js"></script>
    <script type="text/javascript" src="${sessionScope.baseUrl}pc/js/easyuiExt.js"></script>
</head>

<body>
	<div class="easyui-layout" data-options="fit:true" >
		<div id="center" data-options="region:'center',border:false"
			style="padding:5px;">
			<div id="planPanel" title="修改会员" class="easyui-panel"
				data-options="border:true" style="padding:5px;">
				
				<form id="modForm" name="modForm" method="post"
					action="<%=contextPath%>/admin/user/admin_mod">
					<div id="planPanel-base" title="基本信息" class="easyui-panel"
						data-options="border:true" style="padding:5px;">
						<input type="hidden" name="id" id="id" value="${user.id}" />
						<input type="hidden" name="roleIds"  id="roleIds"/>
						<table class="promodify" cellspacing="1">
						    <tr>
								<td class="info">用户名：</td>
								<td>${user.name}</td>
							</tr>
							<tr>
								<td class="info">密码：</td>
								<td><input type="password" id="password" name="password" class="easyui-textbox" data-options="validType:['length[5,30]']" />
									<span class="notice"></span>
								</td>
							</tr>
							<tr>
								<td class="info">确认密码：</td>;
								<td><input type="password" id="password_v" name="password_v" class="easyui-textbox"  validType="same['password']" />
								</td>
							</tr>
							<tr>
								<td class="info">姓名：</td>
								<td><input type="text" id="realName" name="realName" value="${user.realName}" class="easyui-textbox" data-options="required:true,validType:['length[2,15]']"/>
									<span class="notice"></span>
								</td>
							</tr>
							<tr>
								<td class="info">邮箱：</td>
								<td><input type="text" id="email" name="email" value="${user.email}" class="easyui-textbox" data-options="required:true,validType:['email','length[0,50]']" />
								</td>
							</tr>
							<tr>
								<td class="info">备注：</td>
								<td>
									<textarea rows="5" cols="50" name="intro" id="intro"><c:out value="${user.intro }" escapeXml="true"/></textarea>
								</td>
							</tr>
							<tr>
								<td class="info">角色：</td>
								<td>
									<c:forEach items="${sysRoleList }" var="role"><input type="checkbox" name="roleId" <c:forEach items="${userRoleList }" var="userRoleLink"><c:if test="${role.id == userRoleLink.roleId  }">checked</c:if></c:forEach> value="${role.id }" />${role.name }</c:forEach><span id="notice" class="notice"></span>
								</td>
							</tr>
						</table>
					</div>
					<div align="center">
						<a id="submitBtn" onclick="mod()" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true">修改</a> 
						<a id="goback" onclick="goback();" class="easyui-linkbutton" data-options="iconCls:'icon-back',plain:true">返回</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var errorList = new Array();
		
		function validateUser(name,id,errorInfo){
			var obj = {};
			if(!isEmpty($('#'+name).val())){
				obj[name] = $('#'+name).val();
				if(null!=id){
					obj[id] = $('#'+id).val();
				}
			  	var ajaxUrl = "<%=contextPath%>/admin/user/validate";
				$.post(ajaxUrl,obj,function(data){
					if(data){
				   		$('#'+name).next(".notice").text(errorInfo).show();
				   		if(!errorList.contains(name)){
				   			errorList.push(name);
				   		}  
				   	}else{
				     	$('#'+name).next(".notice").text("").hide();
				     	if(errorList.contains(name)){
				   			errorList.remove(name);
				   		}  
				   	}
				}, 'json');
			}
		}
		
		function validatCheckbox(){
           var roleIdArray = $('input[name="roleId"]');
           var roleIds = '';
           for(var i = 0; i < roleIdArray.length; i ++){
              if(roleIdArray[i].checked){
                 roleIds += roleIdArray[i].value + ",";
              }
           }
           return roleIds;
        }
		
		function mod(){
			if (!$('#modForm').form('validate')) {
	    		return;
	    	}
	    	if(errorList.length>0){
	    		return;
	    	}
	    	var roleIds = validatCheckbox();
			if(roleIds.length==0){
				$("#notice").text("角色不能为空！").show();
				return;
			}else{
				$("#roleIds").val(roleIds);
				$("#notice").text("").show();
			}
			var params = $("#modForm").serializeArray();
			$.ajax({
				type: "POST",
				url:$("#modForm").attr("action"),
				dataType: "json",
				data:params,
				success:function(data){
					if(data.result){
						$.messager.alert('提示',data.msg,'info',function(){
							location.href = '<%=contextPath%>/admin/user/adminList';
						});
						$(".panel-tool-close").hide();
					}else{
						$.messager.alert('提示',data.msg,'error');
					}
				}
			});
		}
		
		function goback(){
			window.location.href='<%=contextPath%>/admin/user/adminList';
		}	
		
	</script>

</body>
</html>
