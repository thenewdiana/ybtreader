$.fn.extend({
	validCheckedLeafNode:function(){
		var nodes = $(this).getCheckedLeafNode();
		if (nodes.length <= 0) {
			return false;			
		}
		return true;
	},
	setCheckedLeafNodeHtml:function(paramHiddenDivId, paramName){
		var nodes = $(this).getCheckedLeafNode();
		var nodeIdsParam = $("#" + paramHiddenDivId);
		if (nodeIdsParam == null) {
			return;
		}
		nodeIdsParam.empty();
		for (var i = 0;i < nodes.length; i++) {
			nodeIdsParam.append("<input type=\"hidden\" name='" + paramName + "' value = '" + nodes[i].id + "'/>");
		}				
	},
	getCheckedLeafNode:function(){
		var nodes = $(this).tree('getChecked');
		var leafNodes = new Array();
		var leafNodeIndex = 0;
		for (var i = 0;i < nodes.length; i++) {
			var isLeaf = $(this).tree("isLeaf",nodes[i].target);
			if (isLeaf) {
				leafNodes[leafNodeIndex] = nodes[i];
				leafNodeIndex++;
			}
		}
		
		return leafNodes;		
	},
	setCheckedNoLeafNodeHtml:function(paramHiddenDivId, paramName){
		var nodes = $(this).getCheckedNoLeafNode();
		var nodeIdsParam = $("#" + paramHiddenDivId);
		if (nodeIdsParam == null) {
			return;
		}
		nodeIdsParam.empty();
		for (var i = 0;i < nodes.length; i++) {
			nodeIdsParam.append("<input type=\"hidden\" name='" + paramName + "' value = '" + nodes[i].id + "'/>");
		}				
	},
	getCheckedNoLeafNode:function(){
		var nodes = $(this).tree('getChecked');
		var noLeafNodes = new Array();
		var noLeafNodeIndex = 0;
		for (var i = 0;i < nodes.length; i++) {
			var isLeaf = $(this).tree("isLeaf",nodes[i].target);
			if (!isLeaf) {
				noLeafNodes[noLeafNodeIndex] = nodes[i];
				noLeafNodeIndex++;
			}
		}
		
		return noLeafNodes;		
	},
	setCheckedNodeHtmlByNodeType:function(paramHiddenDivId, nodeType, paramName){
		
		var nodeIdsParam = $("#" + paramHiddenDivId);
		if (nodeIdsParam == null) {
			return;
		}
		nodeIdsParam.empty();
		
		var nodes = $(this).tree('getChecked','indeterminate');
		for (var i = 0;i < nodes.length; i++) {
			if (nodes[i].attributes == null) {
				continue;
			}
			
			if (nodes[i].attributes.nodeType == nodeType) {
				nodeIdsParam.append("<input type=\"hidden\" name='" + paramName + "' value = '" + nodes[i].id + "'/>");
			}			
		}
		
		nodes = $(this).tree('getChecked');
		for (var i = 0;i < nodes.length; i++) {
			if (nodes[i].attributes == null) {
				continue;
			}
			
			if (nodes[i].attributes.nodeType == nodeType) {
				nodeIdsParam.append("<input type=\"hidden\" name='" + paramName + "' value = '" + nodes[i].id + "'/>");
			}			
		}
	}
});