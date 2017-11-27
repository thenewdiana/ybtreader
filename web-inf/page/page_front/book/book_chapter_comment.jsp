<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common.jsp" %>		
		<div class="discus2" id="${bookChapterId }" totalcomment="${totalComment }">
	    	<div class="discuss">
	    		<form action="" method="post">
	    		<input type="hidden" name="bookId" value="${bookId }"/>
                <input type="hidden" name="bookChapterId" value="${bookChapterId }"/>
				<textarea class="punt-wd mt10" name="content" cols="" rows=""></textarea>
				<span class="red"></span>
				<ul class="over mt10">
	                <li id="fr"><a href="javascript:void(0);" name="btn_comment" id="${bookChapterId }" class="plun ac">发表评论</a></li>
	            </ul>
				</form>
	        </div>
	        <div class="reviews mt20 offic1">
	            <div class="ce-c">
	                <ul class="new-list">
	                	<c:forEach items="${chapterCommentList }" var="item">
	                	<li>
	                		<div class="offic2 pos_a">
<!--                        		<commauth:commauth operType="hot" bookAuthorId="${book.authorId }"> -->
<!--                             <a href="javascript:void(0);" name="btn_comment_hot" nick="${bookChapterId }" id="${item.id }"><img src="${sessionScope.baseUrl}pc/images/pic/o-img1.png" width="17" height="18" alt="" /></a> -->
<!--                             </commauth:commauth> -->
<!--                             <commauth:commauth operType="top" bookAuthorId="${book.authorId }"> -->
<!--                             <a href="javascript:void(0);" name="btn_comment_top" nick="${bookChapterId }" id="${item.id }"><img src="${sessionScope.baseUrl}pc/images/pic/o-img2.png" width="17" height="18" alt="" /></a> -->
<!--                             </commauth:commauth>		                             -->
                            <commauth:commauth operType="del" bookAuthorId="${book.authorId }" commentUserId="${item.userId }">
                            <a href="javascript:void(0);" name="btn_comment_del" nick="${bookChapterId }" id="${item.id }" class="a2"><img src="${sessionScope.baseUrl}pc/images/pic/o-img4.png" width="17" height="18" alt="" /></a>
                            </commauth:commauth>
		                    </div>
		                    
		                    <div class="lf-wd fl">
		                    	<a href="${pageContext.request.contextPath }/book/listbyauthor/${item.userId }"><img src="${item.userPic }" width="53" height="55" alt="" /></a>
                                <p class="col99"><a href="${pageContext.request.contextPath }/book/listbyauthor/${item.userId }">${item.userNick }</a></p>
                                <c:if test="${item.userId==book.authorId }"><img src="${sessionScope.baseUrl}pc/images/zp-img3.jpg" alt="" /></c:if>
                                <c:if test="${item.userId!=book.authorId}"><img src="${sessionScope.baseUrl}pc/images/${item.fansValues.image}" width="36" height="19" alt="" /></c:if>
                                <c:if test="${item.vipValues.id > 0}"><p class="mat12 v${item.vipValues.id }">&nbsp;</p></c:if>
                            </div>
                            
                            <div class="rg-wd fr">
                            	<h2>${item.title }</h2>
                                <p>${item.content }</p>
                                <div class="controls over">
                                	<span class="col99 fl">${item.createTimeFormat }</span>
                                </div>
                                <div class="replay">
                                	<dl>
                                		<c:forEach items="${item.replyCommentList }" var="replyItem">
                                    	<dd>
                                    		<div class="summey"><a href="${pageContext.request.contextPath }/book/listbyauthor/${replyItem.userId }" >${replyItem.userNick }</a>
                                    		<c:if test="${replyItem.vipValues.id > 0}"><span class="v${replyItem.vipValues.id } ml5">&nbsp;</span></c:if>
                                           	<img src="${sessionScope.baseUrl}pc/images/${replyItem.fansValues.image}" alt="" />
                                           	：${replyItem.content }
                                    		</div>   
                                        	
                                             <div class="controls over">
                                                <span class="col99 fl">${replyItem.createTimeFormat }</span>
                                                
                                                <commauth:commauth operType="del" bookAuthorId="${book.authorId }" commentUserId="${replyItem.userId }">
                                                <a href="javascript:void(0);" name="btn_comment_del" nick="${bookChapterId }" id="${replyItem.id }" class="col66 fr ml5">删除</a>
                                                </commauth:commauth>
                                            </div>
                                            
                                        </dd>
                                        </c:forEach>           
                                        <commauth:commauth operType="reply" bookAuthorId="${item.userId }" >                                 
                                        <dt><a href="javascript:void(0);" name="btn_comment_reply" nick="${bookChapterId }">我要回复</a></dt>
                                        </commauth:commauth>
                                    </dl>
                                    <div class="over" style="display:none;">
                                    	<form action="">                                        	
                                    	<input type="hidden" name="bookId" value="${bookId }"/>
                                    	<input type="hidden" name="bookChapterId" value="${item.bookChapterId }"/>
                                    	<input type="hidden" name="replyContent" value="${item.content }"/>
                                    	<input type="text" class="ne-input" name="content" value="回复@${item.userNick }："/>
                                    	<input type="button" class="ne-buttom" name="btn_sumbit_comment_reply" style="cursor:pointer;" nick="${bookChapterId }"/>
                                    	<br/>
                                    	<span class="red"></span>                                     
                                    	</form>
                                    </div>
                                </div>
                            </div>
                        </li>     
	                	</c:forEach>
	                </ul>
	            </div>
	        </div>
	    </div>  