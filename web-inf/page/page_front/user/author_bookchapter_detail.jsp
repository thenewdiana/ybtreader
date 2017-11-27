<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common.jsp" %>
<form action="" id="bookChapterForm">
<input type="hidden" class="wd1" name="bookId" value="${bookChapter.bookId }"/>
<input type="hidden" class="wd1" name="id" value="${bookChapter.id }"/>
<ul>
   	<li>
       <p class="strong">章节名称</p>
       <div class="w300 fl">
           &nbsp;&nbsp;&nbsp;&nbsp;${bookChapter.title }
       </div>
   	</li>
    <li class="auto-ht">
    	<div class="over">
        	<p class="fl strong">正 文</p>
        	<!--  
            <a href="#" title="" class="red-bg fr white">计算字数</a>
            -->
        </div>
        <textarea class="text-ft" name="content">${bookChapter.content }</textarea>
    </li>
    <li class="auto-ht mt10">
    	<p class="strong">作者的话</p>
        <textarea class="text-ft text-ft1" name="remark">${bookChapter.remark }</textarea>
    </li>
    <li>
    	<p class="strong">发布状态</p> 
    	&nbsp;&nbsp;&nbsp;&nbsp;已发布      	
    </li>
    <li>
    	<p class="strong">发布时间</p> 
    	&nbsp;&nbsp;&nbsp;&nbsp;${bookChapter.publishTimeFormatHour }      	
    </li> 
</ul>
</form>