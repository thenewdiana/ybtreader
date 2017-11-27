<%@ page contentType="text/html; charset=UTF-8" %>
<link rel="stylesheet" type="text/css" href="${sessionScope.baseUrl}hd/zj/css/entrance.css">
<!-- 铸剑活动页面首页入口 start-->
<!-- 铸剑活动页面首页入口 -->
<div class="entrance" id="jsEntrance" style="display: none">
    <div class="wrapper clearfix">
        <div class="close" id="jsCloseBtn" title="关闭">
            <div class="horizon"></div>
            <div class="vertical"></div>
        </div>
        <div class="left">
            <div class="img sprite">
            </div>
        </div>
        <div class="right">
            <div class="total sprite box">
            </div>
            <div class="assign clearfix">
                <div class="left">
                    <div class="star sprite box">
                    </div>
                    <div class="contract sprite box">
                    </div>
                    <div class="book sprite box">
                    </div>
                </div>
                <div class="right">
                    <div class="reward sprite box">
                    </div>
                    <div class="entertainment sprite" id="jsDetailBtn">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="sm-popup" id='jsPopup' style="display: block">
    <img src="${sessionScope.baseUrl}hd/zj/images/small-popup.png">
    <div class="close sm-close" id="jsSmCloseBtn" title="关闭">
        <div class="horizon"></div>
        <div class="vertical"></div>
    </div>
</div>


<script type="text/javascript">
    //入口图片事件
    $('#jsEntrance').click(function(){
        <%--window.location.href='${pageContext.request.contextPath }/activity/zj';--%>
        window.open('${pageContext.request.contextPath }/activity/zj/zhitong');
    })
    $('#jsCloseBtn').click(function(event){
        event.stopPropagation();
        $('#jsEntrance').fadeOut();
        $('#jsPopup').delay(500).fadeIn(800);
    });
    //入口图片关闭后右下角小弹窗
    $('#jsSmCloseBtn').click(function(event){
        event.stopPropagation();
        $(this).parent().fadeOut(500);
    });
    $('#jsPopup').click(function(){
        <%--window.location.href='${pageContext.request.contextPath }/activity/zj';--%>
        window.open('${pageContext.request.contextPath }/activity/zj/zhitong');
    });
    //
</script>
<!-- 铸剑活动页面首页入口  end-->