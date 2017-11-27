$("<div class=\"datagrid-mask\" style=\"display:block\"></div>").appendTo($(document.body));
var msg=$("<div class=\"datagrid-mask-msg\" style=\"display:block;left:50%\"></div>").html("正在加载，请等待....").appendTo($(document.body));


window.onload = function(){	
	$(document.body).children("div.datagrid-mask-msg").remove();
	$(document.body).children("div.datagrid-mask").remove();
}