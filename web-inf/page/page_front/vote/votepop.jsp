<%@ page contentType="text/html; charset=UTF-8" %>
<script type="text/javascript">
	$(function() {
		$("#lkvote2015").hide();
	});
</script>
<c:if test="${vote == 1}">
<style>
.votepop {
	background-image:url(${sessionScope.baseUrl}pc/images/vote/votepop.jpg);
	margin:0 auto;
	width:991px;height:451px;
	position: absolute;
	top:354px;
  	z-index: 99999;
}
.closepop {  padding-top: 17px;
  z-index: 1000000;
  position: absolute;
  padding-left: 928px;}
.entervote{float:left;display:none}
</style>
<script type="text/javascript">
	$(function() {
		$("#lkvote2015").show();
		var obj = $("#votepop");
		var parentLeft = $("#votepop").parent().width();
		var width = $("#votepop").width();
		var left = (parentLeft-width)/2;
		var div = $(obj).next().children(0).offset().left;
		//alert(div);
		$(obj).css({'left':div+"px"});
	});
	function closeVotePop() {
		$("#votepop").hide();
	}
</script>
	<div class="votepop" id="votepop">
		<div class="closepop"><a href="javascript:void();" title="关闭" onclick="javascript:closeVotePop()"><img id="voteImg" src="${sessionScope.baseUrl}pc/images/vote/close.png"></a></div>
		<a href="/vote/pk2015"><img src="${sessionScope.baseUrl}pc/images/vote/votepop.jpg"></a>
		<div class="entervote"><a href="/vote/pk2015"><img src="${sessionScope.baseUrl}pc/images/vote/entervote.png"></a></div>
		<div class="clear"></div>
	</div>
</c:if>
