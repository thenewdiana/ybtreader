/**
 * 获取form中序列化的参数
 * @param form
 * @returns {Array}
 */
function getParams(formName){
	var params = new Array(); //先取得 datagrid 的查询参数  
  	var fields = $('#'+formName).serializeArray(); //自动序列化表单元素为JSON对象  
    $.each( fields, function(i, field){  
        params[field.name] = field.value; //设置查询参数
    });
    return params;
}

function getFormToJson(formName){
	var obj = {};
	var fields = $('#'+formName).serializeArray();
	 $.each( fields, function(){  
        if(obj[this.name] != undefined){
    		obj[this.name].push(this.value);
        }else{
        	obj[this.name] = [this.value]||[];
        }
    });  
    return obj;
}

function getFormToJsonString(formName){
	var obj = {};
	var fields = $('#'+formName).serializeArray();
	 $.each( fields, function(i, field){ 
		if(obj[field.name]){
			if(!obj[field.name].push){
				obj[field.name] = [obj[field.name]];
			}
			obj[field.name].push(field.value||'');
		}else{
			obj[field.name] = field.value||'';
		}
    });  
    return obj;
}

/**
 * 获取当前页面属性值并转换成int行
 * @param propertyName
 * @returns
 */
function getIntValue(propertyName){
	return parseInt($('#'+propertyName).val());
}