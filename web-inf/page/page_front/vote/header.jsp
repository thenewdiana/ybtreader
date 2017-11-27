<%@ page contentType="text/html; charset=UTF-8" %>
<style>
        .topshareicon {
            float: left;
            text-align: center;
            width: 72px;
        }
        .logoninfo {
        	color: white;
			  float: left;
			  padding-left: 180px;
			  padding-top: 70px;
			  font-size: 14px;
        }
        .logoninfo img {
        	border-radius: 15px;
-webkit-border-radius: 15px;
-moz-border-radius: 15px;
        }
        .barbg {
       		background-image: url('${sessionScope.baseUrl}pc/images/vote/barbg.png')
        }
    </style>
<div class="banner">
	<div class="votemenu">
	<c:if test="${is_mob == 0}">
                <div class="votemenulink bgr"><a href="${pageContext.request.contextPath }/"><font color="white">首页</font></a></div>
                <div class="votemenulink"><a href="${pageContext.request.contextPath }/book"><font color="#A63615">书库</font></a></div>
    </c:if>
    <c:if test="${is_mob == 1}">
                <div class="votemenulink bgr"><a href="${pageContext.request.contextPath }/m/"><font color="white">首页</font></a></div>
                <div class="votemenulink"><a href="${pageContext.request.contextPath }/m/allBook"><font color="#A63615">书库</font></a></div>
    </c:if>
                <div class="clear"></div>
    </div>
    <div class="clear"></div>
    <div class="h30"></div>
    <div id="ybtframe" style="float:right;width:328px">
        <div class="">
            <div class="topshareicon" style="width:75px">
                <a href="javascript:void();" class="jiathis_button_cqq"><img class="rule-share-img" style="width:56px" src="${sessionScope.baseUrl}pc/images/vote/shareqq.png" /></a>
            </div>
            <div class="topshareicon" style="width:68px">
                <a href="javascript:void();" class="jiathis_button_tsina"><img class="rule-share-img" style="width:56px" src="${sessionScope.baseUrl}pc/images/vote/shareweibo.png" /></a>
            </div>
            <div class="topshareicon">
                <a href="javascript:void();" class="jiathis_button_weixin"><img class="rule-share-img" style="width:56px" src="${sessionScope.baseUrl}pc/images/vote/shareweixin.png" /></a>
            </div>
            <div class="topshareicon">
                <a href="javascript:void();" class="jiathis_button_qzone"><img class="rule-share-img" style="width:56px" src="${sessionScope.baseUrl}pc/images/vote/shareqqzone.png" /></a>
            </div>
            <div class="clear"></div>
       	</div>
   	</div>
   	<div style="height:320px"></div>
   	<div class="barbg">
   	<c:if test="${logon == 1}">
   		<div class="logoninfo">
   			<img width="30px" src="${userinfo.userpic}"/> <a style="color:white" href="${pageContext.request.contextPath }/user/bank">${userinfo.nick }</a>
   				<span style="color:black;padding-left:10px">今日持票数（<span id="lbMyVoteNum">${myVoteNum }</span>）票 ；共投元宝（<span id="lbMyGoldNum">${goldNum }</span>）个；共投炸弹（<span id="lbMyBombNum">${bombNum}</span>）个 </span>
   		</div>
   	</c:if>
   		<div style="float:right;padding-right:90px"><a href="javascript:void();" id="lkGetFreeGold"><img src="${sessionScope.baseUrl}pc/images/vote/hongbao.png" style="height:128px"></a></div>
   		<div class="clear"></div>
   	</div>
   	<script type="text/javascript">
   	$(document).ready(function() {
   		$("#lkGetFreeGold").bind("click", function() {
	   		if (!isLogin()) {
				return;
			}
			$.ajax({
				type : "POST",
				dataType : "json",
				async:true,
				url : "${pageContext.request.contextPath }/vote/getfreegold",
				success : function(json) {
					if (json.resBean.code != 0) {
						$.MsgBox.Alert("提示", json.resBean.msg);
					} else {
						$.MsgBox.Alert("提示", "恭喜！获得系统赠送的100糖豆！");
					}
				}
			});
   		});
   	});
   	</script>
</div>