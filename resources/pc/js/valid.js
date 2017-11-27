/**
 * 验证特殊字符
 * @param obj
 * @param pattrn
 * @returns {Boolean}包含特殊字符返回 false
 */
function checkErrorCharObj(obj, pattrn) {
	var p = pattrn;
	if (pattrn == null || pattrn == "") {
		p = "!@#$%^&*()'~_";
	}
	for (var i = 0; i < p.length; i++) {
		var c = p.charAt(i);
		if (obj && obj.value.indexOf(c) != -1) {
			return false;
		}
	}
	return true;
}

/**
 * 验证特殊字符
 * @param objValue 需要验证的值
 * @param pattrn 需要禁止的特殊字符串 如（"!@#$%"）
 * @returns {Boolean} 包含特殊字符返回 false
 */
function checkErrorChar(objValue, pattrn) {
	var p = pattrn;
	if (pattrn == null || pattrn == "") {
		p = "!@#$%^&*()'~_";
	}
	for (var i = 0; i < p.length; i++) {
		var c = p.charAt(i);
		if (objValue.indexOf(c) != -1) {
			return false;
		}
	}
	return true;
}

/**
 * 验证文本对象(正确返回true 错误返回false)
 * @param obj
 * @param isRequred true必须 false不必须
 * @param maxLength -1不需要验证长度 
 */
function validTextObj(obj, isRequred, maxLength) {
	if (isRequred) {
		var isEmpty = isEmptyObj(obj);
		if (isEmpty) {
			return false;
		}
	}

	if (maxLength != -1) {
		var l = getLengthObj(obj);
		if (l > maxLength) {
			return false;
		}
	}
	return true;
}

/**
 * 验证文本值（正确返回true，错误返回false）
 * @param objValue
 * @param isRequred true必须 false不必须
 * @param maxLength -1不需要验证长度 
 * @returns {Boolean}
 */
function validText(objValue, isRequred, maxLength) {
	if (isRequred) {
		var b = isEmpty(objValue);
		if (b) {
			return false;
		}
	}

	if (maxLength != -1) {
		var l = getLength(objValue);
		if (l > maxLength) {
			return false;
		}
	}
	return true;
}

/**
 * 验证radio是否输入(正确返回true,错误返回false)
 * @param obj
 * @param isRequired true必须，false 不必须
 * @returns {Boolean}
 */
function validRadio(obj, isRequred) {
	if (isRequred) {
		for (i = 0; i < obj.length; i++) {
			if (obj[i].checked == true) {
				return true;
			}

		}
		return false;
	}

	return true;
}

/**
 * 验证checkbox是否选中(正确返回true,错误返回false)
 * @param obj
 * @param isRequired true必须，false 不必须
 * @param isUnion true唯一选中
 * @returns {Boolean}
 */
function validCheckbox(obj, isRequred, isUnion) {
	if (isRequred) {

		var num = 0;
		for (var i = 0; i < obj.length; i++) {
			if (obj[i].checked == true) {
				//return true;
				num++;
			}
		}
		//是否唯一选中
		if (isUnion) {
			if (num == 1) {
				return true;
			}
		} else {
			if (num > 0) {
				return true;
			}
		}

		return false;
	}
	return true;
}

function validCheckboxCheckNum(obj) {
	var num = 0;
	for (var i = 0; i < obj.length; i++) {
		if (obj[i].checked == true) {
			//return true;
			num++;
		}
	}
	return num;
}



/**
 * 验证整数或小数
 * @param objValue
 * @param isRequred true必须 false不必须
 */
function validIntOrDecimal(objValue, isRequred) {
	var b = isEmpty(objValue);
	if (isRequred) {
		if (b) {
			return false;
		}
	}
	var reg = /^[1-9][0-9]*\.?[0-9]{0,9}$/;
	if (!reg.test(objValue)) {
		return false;
	}
	return true;
}

/**
 * 验证整数或小数
 * @param objValue
 * @param isRequred true必须 false不必须
 */
function validNum(objValue, isRequred) {
	var b = isEmpty(objValue);
	if (isRequred) {
		if (b) {
			return false;
		}
	}
	var reg = /^[0-9]*\.?[0-9]{0,9}$/;
	if (!reg.test(objValue)) {
		return false;
	}
	return true;
}

/**
 * 验证手机手机或数字对象
 * @param obj
 * @param isRequred true必须 false不必须
 * @param maxLength -1不需要验证长度 
 */
function validMobilObj(obj, isRequred, maxLength) {
	var isEmpty = isEmptyObj(obj);
	if (isRequred) {
		if (isEmpty) {
			return false;
		}
	}

	if (!isEmpty) {
		var patrn = /^([0-9])*$/;
		if (!patrn.exec(obj.value)) {
			return false;
		}
	}

	if (maxLength != -1) {
		var l = getLengthObj(obj);
		if (l > maxLength) {
			return false;
		}
	}
	return true;
}

/**
 * 验证中心编码
 * @param obj
 * @param isRequred true必须 false不必须
 * @param maxLength -1不需要验证长度
 * @return
 */
function validCenterCodeObj(obj, isRequred, maxLength) {
	var isEmpty = isEmptyObj(obj);
	if (isRequred) {
		if (isEmpty) {
			return false;
		}
	}

	if (!isEmpty) {
		var patrn = /^([0-9])*$/;
		if (!patrn.exec(obj.value)) {
			return false;
		}
	}

	if (maxLength != -1) {
		var l = getLengthObj(obj);
		if (l != maxLength) {
			return false;
		}
	}
	return true;
}

/**
 * 验证手机号
 * @param objValue
 * @param isRequred true必须 false不必须
 */
function validMobil(objValue, isRequred) {
	var b = isEmpty(objValue);
	if (isRequred) {
		if (b) {
			return false;
		}
	}

	if (!b) {
		var patrn = /^\d{11}$/;
		if (!patrn.exec(objValue)) {
			return false;
		}
	}
	return true;
}

/**
 * 验证日期格式对象  yyyy-MM-dd
 * @param obj 
 * @param isRequred true必须 false不必须
 */
function validDateObj(obj, isRequred) {
	var isEmpty = isEmptyObj(obj);
	if (isRequred) {
		if (isEmpty) {
			return false;
		}
	}

	if (!isEmpty) {
		var patrn = /^\d{4}[-][0-1]?[0-9]{1}[-][0-3]?[0-9]{1}$/;
		if (!patrn.exec(obj.value)) {
			return false;
		}
	}
	return true;
}

/**
 * 验证日期格式值  yyyy-MM-dd
 * @param obj 
 * @param isRequred true必须 false不必须
 */
function validDate(objValue, isRequred) {
	var isEmpty = isEmpty(objValue);
	if (isRequred) {
		if (isEmpty) {
			return false;
		}
	}

	if (!isEmpty) {
		var patrn = /^\d{4}[-][0-1]?[0-9]{1}[-][0-3]?[0-9]{1}$/;
		if (!patrn.exec(objValue)) {
			return false;
		}
	}
	return true;
}

/**
 * 验证固定电话对象
 * @param obj
 * @param isRequred true必须 false不必须
 * @param maxLength -1不需要验证长度 
 */
function validTelphoneObj(obj, isRequred, maxLength) {
	var isEmpty = isEmptyObj(obj);
	if (isRequred) {
		if (isEmpty) {
			return false;
		}
	}

	if (!isEmpty) {
		var patrn = /^([0-9]|[-])*$/;
		if (!patrn.exec(obj.value)) {
			return false;
		}
	}

	if (maxLength != -1) {
		var l = getLengthObj(obj);
		if (l > maxLength) {
			return false;
		}
	}
	return true;
}

/**
 * 验证固定电话值
 * @param objValue
 * @param isRequred true必须 false不必须
 * @param maxLength -1不需要验证长度 
 */
function validTelphone(objValue, isRequred, maxLength) {
	var b = isEmpty(objValue);
	if (isRequred) {
		if (b) {
			return false;
		}
	}

	if (!b) {
		var patrn = /^([0-9]|[-])*$/;
		if (!patrn.exec(objValue)) {
			return false;
		}
	}

	if (maxLength != -1) {
		var l = getLength(objValue);
		if (l > maxLength) {
			return false;
		}
	}
	return true;
}

/**
 * 验证邮件对象
 */
function validEmailObj(obj, isRequred, maxLength) {
	var isEmpty = isEmptyObj(obj);
	if (isRequred) {
		if (isEmpty) {
			return false;
		}
	}

	if (!isEmpty) {
		var patrn = /^([0-9a-zA-Z]|[._-])+@([0-9a-zA-Z_-])+(\.[0-9a-zA-Z_-])+/;
		if (!patrn.exec(obj.value)) {
			return false;
		}
	}

	if (maxLength != -1) {
		var l = getLengthObj(obj);
		if (l > maxLength) {
			return false;
		}
	}
	return true;
}
/**
 * 验证邮件值
 * @param objValue
 * @param isRequred true必须 false不必须
 * @param maxLength -1不需要验证长度 
 */
function validEmail(objValue, isRequred, maxLength) {
	var b = isEmpty(objValue);
	if (isRequred) {
		if (b) {
			return false;
		}
	}

	if (!b) {
		var patrn = /^([0-9a-zA-Z]|[._-])+@([0-9a-zA-Z_-])+(\.[0-9a-zA-Z_-])+/;
		if (!patrn.exec(objValue)) {
			return false;
		}
	}

	if (maxLength != -1) {
		var l = getLength(objValue);
		if (l > maxLength) {
			return false;
		}
	}
	return true;
}
/**
 * 验证文件类型
 * @param obj
 * @param allowType
 * @returns {Boolean}
 */
function validFileTypeObj(obj, isRequred, allowType) {
	if (allowType == null) {
		allowType = "jpg|gif|jpeg|png|bmp|swf";
	}

	var a = isEmptyObj(obj);

	if (isRequred) {
		if (a) {
			return false;
		}
	}

	if (!a) {
		var i = obj.value.lastIndexOf(".");
		if (i != -1) {
			var fy = obj.value.substring(i + 1);
			if (allowType.indexOf(fy) != -1) {
				return true;
			} else {
				return false;
			}
		}

	}

	return true;
}

/**
 * 验证文件类型
 * @param obj
 * @param allowType
 * @returns {Boolean}
 */
function validFileType(objvalue, isRequred, allowType) {
	if (allowType == null) {
		allowType = "jpg|gif|jpeg|png|bmp|swf";
	}

	var a = isEmpty(objvalue);

	if (isRequred) {
		if (a) {
			return false;
		}
	}

	if (!a) {
		var i = objvalue.lastIndexOf(".");
		if (i != -1) {
			var fy = objvalue.substring(i + 1);
			if (allowType.indexOf(fy) != -1) {
				return true;
			} else {
				return false;
			}
		}
	}

	return true;
}
/**
 * 验证对象是否为空
 * @param obj
 * @returns {Boolean} 为空返回true 不为空返回 false
 */
function isEmptyObj(obj) {
	var value = obj.value;
	if (value == null) return true;
	for (var i = 0; i < value.length; i++) {
		if (value.charAt(i) != ' ' && value.charAt(i) != '\t' && value.charAt(i) != '\r' && value.charAt(i) != '\n') {
			return false;
		}
	}
	return true;
}

/**
 * 验证值是否为空
 * @param obj
 * @returns {Boolean} 为空返回true 不为空返回 false
 */
function isEmpty(objValue) {
	var value = objValue;
	if (value == null) return true;
	for (var i = 0; i < value.length; i++) {
		if (value.charAt(i) != ' ' && value.charAt(i) != '\t' && value.charAt(i) != '\r' && value.charAt(i) != '\n') {
			return false;
		}
	}
	return true;
}

/**
 * 获得对象值的 长度
 * @param obj
 * @returns {Number}
 */
function getLengthObj(obj) {
	var sum = 0;
	if (!isEmptyObj(obj)) {
		var temp = obj.value;
		var i = 0;
		for (i = 0; i < temp.length; i++) {
			if ((temp.charCodeAt(i) >= 0) && (temp.charCodeAt(i) <= 255))
				sum = sum + 1;
			else
				sum = sum + 2;
		}
	}
	return sum;
}


/**
 * 获得值的 长度
 * @param obj
 * @returns {Number}
 */
function getLength(objValue) {
	var sum = 0;
	if (!isEmpty(objValue)) {
		var temp = objValue;
		var i = 0;
		for (i = 0; i < temp.length; i++) {
			if ((temp.charCodeAt(i) >= 0) && (temp.charCodeAt(i) <= 255))
				sum = sum + 1;
			else
				sum = sum + 2;
		}
	}
	return sum;
}


/**
 * 验证整数值
 * @param objValue
 * @param isRequred true必须 false不必须
 * @param maxLength -1不需要验证长度 
 */
function validInt(objValue, isRequred, maxLength) {
	var b = isEmpty(objValue);
	if (isRequred) {
		if (b) {
			return false;
		}
	}

	if (!b) {
		var patrn = /^([0-9])*$/;
		if (!patrn.exec(objValue)) {
			return false;
		}
	}

	if (maxLength != -1) {
		var l = getLength(objValue);
		if (l > maxLength) {
			return false;
		}
	}
	return true;
}
/**
 * 验证考试分数值
 * @param objValue
 * @param isRequred true必须 false不必须
 * 
 */
function validExamNum(objValue, isRequred, minNum, maxNum) {
	var b = isEmpty(objValue);
	if (isRequred) {
		if (b) {
			return false;
		}
	}

	if (!b) {
		var reg = /^[0-9]*\.?[0-9]{1}$/;
		if (!reg.test(objValue)) {
			return false;
		}
	}

	if (objValue < minNum) {
		return false;
	}
	if (objValue > maxNum) {
		return false;
	}
	return true;
}
/**
 * 验证数字和字母
 * @param objValue
 * @param isRequred
 * @param maxLength
 * @return
 */
function validNumberAndLetter(objValue, isRequred, maxLength) {
	var b = isEmpty(objValue);
	if (isRequred) {
		if (b) {
			return false;
		}
	}

	if (!b) {
		var patrn = /^([A-Za-z0-9])*$/;
		if (!patrn.exec(objValue)) {
			return false;
		}
	}

	if (maxLength != -1) {
		var l = getLength(objValue);
		if (l > maxLength) {
			return false;
		}
	}
	return true;
}

function removeErrorChar(val) {

	if (undefined == val || '' == val) {
		return '';
	}

	var rs = '';
	var p = "_%'";

	var temp = '';
	for (var ii = 0; ii < val.length; ii++) {
		temp = val.charAt(ii);
		for (var i = 0; i < p.length; i++) {
			var c = p.charAt(i);
			temp = temp.replace(c, '');
		}
		rs += temp;
	}

	return rs;
}

//检查非法字符
function validErrorChar(val) {

	if (undefined == val || '' == val) {
		return false;
	}
	var p = "_%'";

	var temp = '';
	for (var ii = 0; ii < val.length; ii++) {
		temp = val.charAt(ii);
		for (var i = 0; i < p.length; i++) {
			var c = p.charAt(i);
			if (temp == c) {
				return false;
			}
		}
	}

	return true;
}
//检查是否含有空格
function isHaveTrim(val) {
	var patrn = /\s/;
	if (patrn.exec(val) != null) {
		return true;
	}
	return false;
}

function validInteger(objValue, isRequred, minNum, maxNum) {
	var b = isEmpty(objValue);
	if (isRequred) {
		if (b) {
			return false;
		}
	}

	if (!b) {
		var reg = /^[0-9]{1,3}$/;
		if (!reg.test(objValue)) {
			return false;
		}
	}

	if (objValue < minNum) {
		return false;
	}
	if (objValue > maxNum) {
		return false;
	}
	return true;
}