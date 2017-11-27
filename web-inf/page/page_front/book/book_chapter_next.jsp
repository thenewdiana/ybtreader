<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common.jsp" %>		
		<div class="w1000 rd-ct pos_r" id="${bookChapter.id }">
        	<div class="read-font f14">
            	<h1 class="ac">${bookChapter.title }</h1>
                <div class="time ac f12">作者：${book.authorNick } | 发布时间：${bookChapter.publishTimeFormat} | 字数：${bookChapter.words }</div>
                <div class="read-ft" style="line-height:200%;font-size:16px;">
                	<c:if test="${bookChapter.chapterShow == 1 }">
                		<pre>${bookChapter.content }</pre>
                	</c:if>
                	<c:if test="${bookChapter.chapterShow == 2 }">
                		<img src="${sessionScope.baseUrl}${bookChapter.content}" width="800" />
                	</c:if>
				</div>
                <c:if test="${bookChapter.remark != null }">
                <div class="author-say pos_r">
                	<div class="says">
                    	<p><span class="red">${book.authorNick }</span> 说：</p>
						<p>${bookChapter.remark }</p>
                    </div>
                    <p class="ft-sj"></p>
                </div>
                </c:if>
				<div class="column columns" style="display:none">
				</div>
               	<!--赞赏-->
               	<div class="rd-bt pos_r">
                    <a href="javascript:void(0);" class="zan1 zan2 fr" name="btn_open_comment" id="${bookChapter.id }">评论（<strong class="yellow">${commentCount }</strong>）</a>
                    <a href="javascript:void(0);" class="zan1 fr" id="${bookChapter.id }" name="btn_praise">赞（<strong class="red">${praiseCount }</strong>）</a>
                    <a href="javascript:void(0);" class="zan3" name="btn_reward" id="${bookChapter.id }"></a>
                </div>
            </div>    
            <div id="clickNextChapter" class="ac f16 zjz" style="cursor: pointer;"> <a>点击获取下一章</a></div>        
        </div>
        <script type="text/javascript">
        	updateNextId("${nextId}"); 
        	updateCurId("${bookChapter.id}");
        </script>