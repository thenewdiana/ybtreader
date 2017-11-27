<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common.jsp" %>	
					<!--评论-->
	                <div id="template_comment">
						<form action="" id="bookCommentForm">
						<input type="hidden" name="bookId" value="${book.id }"/>
						<input type="hidden" name="randomCode" value="8888"/>
						<input type="text" name = "title" class="replay01 grays"/>
		                <div class="pos_r replay02">
		                    <textarea class="replay01 replay04 mt10 grays" name="content"></textarea>
		                    <div class="pos_a">
								<%--<a href="javascript:void(0);"><img src="${sessionScope.baseUrl}pc/images/zp-img15.jpg" width="19" height="19"  /></a>--%>
		                        <a href="javascript:void(0);" name="btn_submit" class="input01">提交</a>
		                    </div>
						</div>
						<span class="red"></span>
						</form>
					</div>
	                
	                <div class="reviews mt20">
	                	<div class="ct-t over">
	                    	<a href="javascript:void(0);" class="fb-ft mat10" name="btn_comment">发表评论</a>
	                        <span class="f16 "><i class="Arial">${totalComment }</i>条评论</span>
	                        <ul>	                        	
	                        	<li id="latest" <c:if test="${tabNick == 'latest' }">class="on"</c:if> >最新评论</li>
	                            <li id="hot" <c:if test="${tabNick == 'hot' }">class="on"</c:if> >精华评论</li>
	                            <li id="chapter" <c:if test="${tabNick == 'chapter' }">class="on"</c:if> >章节评论</li>
	                        </ul>
	                    </div>
	                    <div class="ce-c pos_r">
	                    	<ul class="new-list <c:if test="${tabNick != 'latest' }">hide</c:if>">
	                    		<c:forEach items="${lastestCommentList }" var="item" varStatus="status">
	                        	<li> 
	                        		<div class="offic2 pos_a">
	                        		<commauth:commauth operType="hot" bookAuthorId="${book.authorId }" authorAssistIdList="${authorAssistIdList }">
	                        		<c:choose>
	                        			<c:when test="${item.isHot == 1 }">
	                        				<a href="javascript:void(0);" name="btn_comment_cancelhot" id="${item.id }"><img src="${sessionScope.baseUrl}pc/images/pic/o-img1.png" width="17" height="18" alt="" /></a>
	                        			</c:when>
	                        			<c:otherwise>
	                        				<a href="javascript:void(0);" name="btn_comment_hot" id="${item.id }"><img src="${sessionScope.baseUrl}pc/images/pic/o-img1.png" width="17" height="18" alt="" /></a>	
	                        			</c:otherwise>
	                        		</c:choose>
		                            </commauth:commauth>
		                            <commauth:commauth operType="top" bookAuthorId="${book.authorId }" authorAssistIdList="${authorAssistIdList }">
		                            <c:choose>
	                        			<c:when test="${item.isTop == 1 }">
	                        				<a href="javascript:void(0);" name="btn_comment_canceltop" id="${item.id }"><img src="${sessionScope.baseUrl}pc/images/pic/o-img2.png" width="17" height="18" alt="" /></a>
	                        			</c:when>
	                        			<c:otherwise>
	                        				<a href="javascript:void(0);" name="btn_comment_top" id="${item.id }"><img src="${sessionScope.baseUrl}pc/images/pic/o-img2.png" width="17" height="18" alt="" /></a>	
	                        			</c:otherwise>
	                        		</c:choose>
		                            </commauth:commauth>		      
		                            <commauth:commauth operType="del" bookAuthorId="${book.authorId }" commentUserId="${item.userId }" authorAssistIdList="${authorAssistIdList }">
		                            <a href="javascript:void(0);" name="btn_comment_del" id="${item.id }" class="a2"><img src="${sessionScope.baseUrl}pc/images/pic/o-img4.png" width="17" height="18" alt="" /></a>
		                            </commauth:commauth>
				                    </div>        
	                            	<div class="lf-wd fl">
	                                	<a href="${pageContext.request.contextPath }/book/listbyauthor/${item.userId }"><img src="${item.userPic }" width="53" height="55" alt="" /></a>
	                                    <p class="col99"><a href="${pageContext.request.contextPath }/book/listbyauthor/${item.userId }">${item.userNick }</a></p>
	                                    <c:if test="${item.userId==book.authorId }"><img src="${sessionScope.baseUrl}pc/images/zp-img3.jpg" alt="" /></c:if>
	                                    <c:if test="${item.userId!=book.authorId}"><img src="${sessionScope.baseUrl}pc/images/${item.fansValues.image}" width="36" height="19" alt="" /></c:if>
	                                    <c:forEach var="assistId" items="${authorAssistIdList }">
	                                    	<c:if test="${item.userId == assistId }"><img src="${sessionScope.baseUrl}pc/images/zp-img13.png" alt="" /></c:if>
	                                    </c:forEach>
	                                    <c:if test="${item.vipValues.id > 0}"><p class="mat12 v${item.vipValues.id }">&nbsp;</p></c:if>
	                                </div>
	                                <div class="rg-wd fr">
	                                	<h2>
	                                	<c:if test="${item.isTop == 1}">
	                                		<span style="color:#393">[置顶]</span>
	                                	</c:if>
	                                	<c:if test="${item.isHot == 1}">
	                                		<i style="color:#c63">[精华]</i>
	                                	</c:if>
	                                	<a href="${pageContext.request.contextPath }/comment/${item.id }">${item.title }</a></h2>
	                                    <p id="shortContent${item.id }">${item.shortContent }
	                                    <c:if test="${item.range }"><a href="javascript:void(0);" onclick="showContent(${item.id });" style="color:#09c;" >[展开全文]</a></c:if>
	                                    </p>
	                                    <pre id="content${item.id }" class="note" style="display:none"><p>${item.content }</p><c:if test="${item.range }"><a href="javascript:void(0);" onclick="hideContent(${item.id });" style="color:#09c;" >[收起]</a></c:if>
	                                    </pre>                               
	                                    <div class="controls over">
	                                    	<span class="col99 fl">${item.createTimeFormat }</span>
	                                    	<a id="shouqiAllReplay${item.id }" href="javascript:;" title="" onclick="hideReplayContent(${item.id })" class="reply retract col66 fr">收起回复（<i>${fn:length(item.replyCommentList)}</i>）</a>
	                                    	<a id="zhankaiAllReplay${item.id }" href="javascript:;" title="" onclick="showReplayContent(${item.id })" class="reply retract col66 fr" style="display:none;">展开回复（<i>${fn:length(item.replyCommentList)}</i>）</a>
	                                    </div>	                                   
	                                    <div id="replayContent${item.id }" class="replay">
	                                    	<dl>
	                                    		<c:forEach items="${item.replyCommentList }" var="replyItem">
		                                    		<dd>
		                                            	<div class="summey"><a href="${pageContext.request.contextPath }/book/listbyauthor/${replyItem.userId }" >${replyItem.userNick }</a>
		                                            	<c:if test="${replyItem.vipValues.id > 0}"><span class="v${replyItem.vipValues.id } ml5">&nbsp;</span></c:if>
		                                            	<c:if test="${replyItem.userId==book.authorId }"><img src="${sessionScope.baseUrl}pc/images/zp-img3.jpg" alt="" /></c:if>
		                                            	<c:if test="${replyItem.userId!=book.authorId}"><img src="${sessionScope.baseUrl}pc/images/${replyItem.fansValues.image}" width="36" height="19" alt="" /></c:if>
		                                            	：${replyItem.content }
		                                            	</div>                                            	
		                                                <div class="controls over">
		                                                    <span class="col99 fl">${replyItem.createTimeFormat }</span> 
		                                                    <commauth:commauth operType="del" bookAuthorId="${book.authorId }" commentUserId="${replyItem.userId }" authorAssistIdList="${authorAssistIdList }">
		                                                    <a href="javascript:void(0);" name="btn_comment_del" id="${replyItem.id }" class="col66 fr ml5">删除</a>
		                                                    </commauth:commauth>
		                                                    <commauth:commauth operType="reply" bookAuthorId="${replyItem.userId }">
		                                                    <span><a href="javascript:void(0);" class="col66 fr ml5" name="btn_comment_reply">回复</a></span>
		                                                    </commauth:commauth>
		                                                </div> 
		                                                <div class="over" style="display:none;">
				                                        	<form action="">                                        	
				                                        	<input type="hidden" name="bookId" value="${book.id }"/>
				                                        	<input type="hidden" name="replyId" value="${item.id }"/>
				                                        	<input type="hidden" name="title" value="${item.title }"/>
				                                        	<input type="hidden" name="replyContent" value="${replyItem.content }"/>
				                                        	<input type="hidden" name="replyUserId" value="${replyItem.userId }"/>
				                                        	<input type="text" class="ne-input" name="content" value="回复@${replyItem.userNick }："/>
				                                        	<input type="button" class="ne-buttom" name="btn_sumbit_comment_reply" style="cursor:pointer;"/>
				                                        	<br/>
				                                        	<span class="red"></span>                                     
				                                        	</form>
				                                        </div>                                               
		                                            </dd>
	                                            </c:forEach> 
	                                            <c:if test="${item.replyCommentList.size() > 6 }">      		  
									      			<span class="pl_more">剩余<em class="pl_num"></em>条评论&nbsp;&nbsp;<a href="javascript:void(0);">点击显示</a></span>
									      		</c:if>       
	                                            <dt><a href="javascript:void(0);" name="btn_comment_reply">我要回复</a></dt>
	                                        </dl>
	                                        
	                                        <div class="over" id="template_comment_reply">
	                                        	<form action="">                                        	
	                                        	<input type="hidden" name="bookId" value="${book.id }"/>
	                                        	<input type="hidden" name="replyId" value="${item.id }"/>
												<input type="hidden" name="title" value="${item.title }"/>
												<input type="hidden" name="replyContent" value="${item.content }"/>
												<input type="hidden" name="replyUserId" value="${item.userId }"/>
	                                        	<%--<input type="text" class="ne-input" name="content" value="回复@${item.userNick }："/>--%>
												<input type="text" class="ne-input" name="content" value=""/>
	                                        	<input type="button" class="ne-buttom" name="btn_sumbit_comment_reply" style="cursor:pointer;"/>
	                                        	<br/>
	                                        	<span class="red"></span>                                     
	                                        	</form>
	                                        </div>
	                                    </div>
	                                </div>
	                            </li>
	                            </c:forEach>                            
	                        </ul>
	                        <ul class="new-list <c:if test="${tabNick != 'hot' }">hide</c:if>">
	                            <c:forEach items="${hotCommentList }" var="item">
	                        	<li>
	                        		<div class="offic2 pos_a">
	                        		<commauth:commauth operType="hot" bookAuthorId="${book.authorId }" authorAssistIdList="${authorAssistIdList }">
	                        		<c:choose>
	                        			<c:when test="${item.isHot == 1 }">
	                        				<a href="javascript:void(0);" name="btn_comment_cancelhot" id="${item.id }"><img src="${sessionScope.baseUrl}pc/images/pic/o-img1.png" width="17" height="18" alt="" /></a>
	                        			</c:when>
	                        			<c:otherwise>
	                        				<a href="javascript:void(0);" name="btn_comment_hot" id="${item.id }"><img src="${sessionScope.baseUrl}pc/images/pic/o-img1.png" width="17" height="18" alt="" /></a>	
	                        			</c:otherwise>
	                        		</c:choose>
		                            
		                            </commauth:commauth>
		                            <commauth:commauth operType="top" bookAuthorId="${book.authorId }" authorAssistIdList="${authorAssistIdList }">
		                            <c:choose>
	                        			<c:when test="${item.isTop == 1 }">
	                        				<a href="javascript:void(0);" name="btn_comment_canceltop" id="${item.id }"><img src="${sessionScope.baseUrl}pc/images/pic/o-img2.png" width="17" height="18" alt="" /></a>
	                        			</c:when>
	                        			<c:otherwise>
	                        				<a href="javascript:void(0);" name="btn_comment_top" id="${item.id }"><img src="${sessionScope.baseUrl}pc/images/pic/o-img2.png" width="17" height="18" alt="" /></a>	
	                        			</c:otherwise>
	                        		</c:choose>
		                            </commauth:commauth>		                            
		                            <commauth:commauth operType="del" bookAuthorId="${book.authorId }" commentUserId="${item.userId }" authorAssistIdList="${authorAssistIdList }">
		                            <a href="javascript:void(0);" name="btn_comment_del" id="${item.id }" class="a2"><img src="${sessionScope.baseUrl}pc/images/pic/o-img4.png" width="17" height="18" alt="" /></a>
		                            </commauth:commauth>
				                    </div> 
	                            	<div class="lf-wd fl">
	                                	<a href="${pageContext.request.contextPath }/book/listbyauthor/${item.userId }"><img src="${item.userPic }" width="53" height="55" alt="" /></a>
	                                    <p class="col99"><a href="${pageContext.request.contextPath }/book/listbyauthor/${item.userId }">${item.userNick }</a></p>
	                                    <c:if test="${item.userId==book.authorId }"><img src="${sessionScope.baseUrl}pc/images/zp-img3.jpg" alt="" /></c:if>
	                                    <c:if test="${item.userId!=book.authorId}"><img src="${sessionScope.baseUrl}pc/images/${item.fansValues.image}" width="36" height="19" alt="" /></c:if>
	                                    <c:forEach var="assistId" items="${authorAssistIdList }">
	                                    	<c:if test="${item.userId == assistId }"><img src="${sessionScope.baseUrl}pc/images/zp-img13.png" alt="" /></c:if>
	                                    </c:forEach>
	                                    <c:if test="${item.vipValues.id > 0}"><p class="mat12 v${item.vipValues.id }">&nbsp;</p></c:if>                                   
	                                </div>
	                                <div class="rg-wd fr">
	                                	<h2>
	                                	<c:if test="${item.isTop == 1 }">
	                                		<span style="color:#393">[置顶]</span>
	                                	</c:if>
	                                	<c:if test="${item.isHot == 1 }">
	                                		<i style="color:#c63">[精华]</i>
	                                	</c:if>
	                                	${item.title }</h2>
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
	                                            	<c:if test="${replyItem.userId==book.authorId }"><img src="${sessionScope.baseUrl}pc/images/zp-img3.jpg" alt="" /></c:if>
	                                            	<c:if test="${replyItem.userId!=book.authorId}"><img src="${sessionScope.baseUrl}pc/images/${replyItem.fansValues.image}" width="36" height="19" alt="" /></c:if>
	                                            	：${replyItem.content }
	                                            	</div>        
	                                                <div class="controls over">
	                                                    <span class="col99 fl">${replyItem.createTimeFormat }</span>                                                    
	                                                    <commauth:commauth operType="del" bookAuthorId="${book.authorId }" commentUserId="${replyItem.userId }" authorAssistIdList="${authorAssistIdList }">
	                                                    <a href="javascript:void(0);" name="btn_comment_del" id="${replyItem.id }" class="col66 fr ml5">删除</a>
	                                                    </commauth:commauth>
	                                                    <commauth:commauth operType="reply" bookAuthorId="${replyItem.userId }">
	                                                    <span><a href="javascript:void(0);" class="col66 fr ml5" name="btn_comment_reply">回复</a></span>
	                                                    </commauth:commauth>
	                                                </div>
	                                                <div class="over" style="display:none;">
			                                        	<form action="">                                        	
			                                        	<input type="hidden" name="bookId" value="${book.id }"/>
			                                        	<input type="hidden" name="replyId" value="${item.id }"/>
			                                        	<input type="hidden" name="title" value="${item.title }"/>
			                                        	<input type="hidden" name="replyContent" value="${replyItem.content }"/>
			                                        	<input type="hidden" name="replyUserId" value="${replyItem.userId }"/>
			                                        	<input type="text" class="ne-input" name="content" value="回复@${replyItem.userNick }："/>
			                                        	<input type="button" class="ne-buttom" name="btn_sumbit_comment_reply" style="cursor:pointer;"/>
			                                        	<br/>
			                                        	<span class="red"></span>                                     
			                                        	</form>
			                                        </div>                     
	                                            </dd>
	                                            </c:forEach>
	                                            <c:if test="${item.replyCommentList.size() > 6 }">      		  
									      			<span class="pl_more">剩余<em class="pl_num"></em>条评论&nbsp;&nbsp;<a href="javascript:void(0);">点击显示</a></span>
									      		</c:if>                                             
	                                            <dt><a href="javascript:void(0);" name="btn_comment_reply">我要回复</a></dt>
	                                        </dl>
	                                        <div class="over">
	                                        	<form action="">                                        	
	                                        	<input type="hidden" name="bookId" value="${book.id }"/>
	                                        	<input type="hidden" name="replyId" value="${item.id }"/>
	                                        	<input type="text" class="ne-input" name="content"/>
	                                        	<input type="button" class="ne-buttom" name="btn_sumbit_comment_reply" style="cursor:pointer;"/>
	                                        	<br/>
	                                        	<span class="red"></span>                                     
	                                        	</form>
	                                        </div>
	                                    </div>
	                                </div>
	                            </li>
	                            </c:forEach>
	                        </ul>
	                        
	                        <ul class="new-list <c:if test="${tabNick != 'chapter' }">hide</c:if>">
	                        	<c:forEach items="${chapterCommentList }" var="item">
	                        	<li>
	                        		<div class="offic2 pos_a">
	                        		<commauth:commauth operType="hot" bookAuthorId="${book.authorId }" authorAssistIdList="${authorAssistIdList }">
		                            <a href="javascript:void(0);" name="btn_comment_hot" id="${item.id }"><img src="${sessionScope.baseUrl}pc/images/pic/o-img1.png" width="17" height="18" alt="" /></a>
		                            </commauth:commauth>
		                            <commauth:commauth operType="top" bookAuthorId="${book.authorId }" authorAssistIdList="${authorAssistIdList }">
		                            <a href="javascript:void(0);" name="btn_comment_top" id="${item.id }"><img src="${sessionScope.baseUrl}pc/images/pic/o-img2.png" width="17" height="18" alt="" /></a>
		                            </commauth:commauth>		                            
		                            <commauth:commauth operType="del" bookAuthorId="${book.authorId }" commentUserId="${item.userId }" authorAssistIdList="${authorAssistIdList }">
		                            <a href="javascript:void(0);" name="btn_comment_del" id="${item.id }" class="a2"><img src="${sessionScope.baseUrl}pc/images/pic/o-img4.png" width="17" height="18" alt="" /></a>
		                            </commauth:commauth>
				                    </div> 
	                            	<div class="lf-wd fl">
	                                	<a href="${pageContext.request.contextPath }/book/listbyauthor/${item.userId }"><img src="${item.userPic }" width="53" height="55" alt="" /></a>
	                                    <p class="col99"><a href="${pageContext.request.contextPath }/book/listbyauthor/${item.userId }">${item.userNick }</a></p>
	                                    <c:if test="${item.userId==book.authorId }"><img src="${sessionScope.baseUrl}pc/images/zp-img3.jpg" alt="" /></c:if>
	                                    <c:if test="${item.userId!=book.authorId}"><img src="${sessionScope.baseUrl}pc/images/${item.fansValues.image}" width="36" height="19" alt="" /></c:if>
	                                    <c:forEach var="assistId" items="${authorAssistIdList }">
	                                    	<c:if test="${item.userId == assistId }"><img src="${sessionScope.baseUrl}pc/images/zp-img13.png" alt="" /></c:if>
	                                    </c:forEach>
	                                    <c:if test="${item.vipValues.id > 0}"><p class="mat12 v${item.vipValues.id }">&nbsp;</p></c:if>                                 
	                                </div>
	                                <div class="rg-wd fr">
	                                	<h2>${item.title } (对<a href="${pageContext.request.contextPath }/book/${item.bookId}/${item.bookChapterId}"><b>${item.bookChapterName }</b></a>的评论)</h2>
	                                    <p>${item.content }</p>
	                                    <div class="replay">
	                                    	<dl>
	                                    		<c:forEach items="${item.replyCommentList }" var="replyItem">
	                                        	<dd>
	                                            	<div class="summey"><a href="${pageContext.request.contextPath }/book/listbyauthor/${replyItem.userId }" >${replyItem.userNick }</a>
	                                            	<c:if test="${replyItem.vipValues.id > 0}"><span class="v${replyItem.vipValues.id } ml5">&nbsp;</span></c:if>
	                                            	<c:if test="${replyItem.userId==book.authorId }"><img src="${sessionScope.baseUrl}pc/images/zp-img3.jpg" alt="" /></c:if>
	                                            	<c:if test="${replyItem.userId!=book.authorId}"><img src="${sessionScope.baseUrl}pc/images/${replyItem.fansValues.image}" width="36" height="19" alt="" /></c:if>
	                                            	：${replyItem.content }
	                                            	</div>        
	                                                 <div class="controls over">
	                                                    <span class="col99 fl">${replyItem.createTimeFormat }</span>
	                                                    <commauth:commauth operType="del" bookAuthorId="${book.authorId }" commentUserId="${replyItem.userId }" authorAssistIdList="${authorAssistIdList }">
	                                                    <a href="javascript:void(0);" name="btn_comment_del" id="${replyItem.id }" class="col66 fr ml5">删除</a>
	                                                    </commauth:commauth>
	                                                    <commauth:commauth operType="reply" bookAuthorId="${replyItem.userId }">
	                                                    <span><a href="javascript:void(0);" class="col66 fr ml5" name="btn_comment_reply">回复</a></span>
	                                                    </commauth:commauth>
	                                                </div>
	                                                <div class="over" style="display:none;">
			                                        	<form action="">                                        	
			                                        	<input type="hidden" name="bookId" value="${book.id }"/>
			                                        	<input type="hidden" name="replyId" value="${item.id }"/>
			                                        	<input type="hidden" name="title" value="${item.title }"/>
			                                        	<input type="hidden" name="replyContent" value="${replyItem.content }"/>
			                                        	<input type="hidden" name="replyUserId" value="${replyItem.userId }"/>
			                                        	<input type="text" class="ne-input" name="content" value="回复@${replyItem.userNick }："/>
			                                        	<input type="button" class="ne-buttom" name="btn_sumbit_comment_reply" style="cursor:pointer;"/>
			                                        	<br/>
			                                        	<span class="red"></span>                                     
			                                        	</form>
			                                        </div>                     
	                                            </dd>
	                                            </c:forEach>  
	                                            <c:if test="${item.replyCommentList.size() > 6 }">      		  
									      			<span class="pl_more">剩余<em class="pl_num"></em>条评论&nbsp;&nbsp;<a href="javascript:void(0);">点击显示</a></span>
									      		</c:if>                                           
	                                            <dt><a href="javascript:void(0);" name="btn_comment_reply">我要回复</a></dt>
	                                        </dl>
	                                        <div class="over">
	                                        	<form action="">                                        	
	                                        	<input type="hidden" name="bookId" value="${book.id }"/>
	                                        	<input type="hidden" name="replyId" value="${item.id }"/>
	                                        	<input type="text" class="ne-input" name="content"/>
	                                        	<input type="button" class="ne-buttom" name="btn_sumbit_comment_reply" style="cursor:pointer;"/>
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
	                
	                <c:choose>
	                	<c:when test="${isShowPage == false }">
	                		<div class="replay03">
		                    	<p class="strong f14 ar mr10"><a href="${pageContext.request.contextPath }/book/${book.id}/comment/more">查看更多<span class="reds ml5 "> ${totalComment }</span>条评论&gt;&gt;</a></p>
		                    </div>
	                	</c:when>
	                	<c:otherwise>
							<page:pagination pageAttr="pagination"></page:pagination>	                	
	                	</c:otherwise>
	                </c:choose>
	                
	                <script type="text/javascript">
	                	paperTabNick("${tabNick}");
	                	$('.reviews .ct-t li').bind("click", function(){
	            			$(this).addClass('on').siblings('li').removeClass('on');
	            			$('.new-list').hide();
	            			var id = $(this).attr("id");
	            			if (id == "latest") {	            				
	            				loadComment("latest", 1, 10);
	            			} else if (id == "hot") {
	            				loadComment("hot", 1, 10);
	            			} else if (id == "chapter") {
	            				loadComment("chapter", 1, 10);
	            			}
	            		});	
	                	
	                	$('.pl_num').each(function(){
	                		var _num=$(this).parent().siblings('dd').length;
	                		$(this).text(_num-6);
	                		
	                		$(this).parent().siblings('dd').hide();
	                		for(var i=0;i<6;i++){
	                			$(this).parent().siblings('dd').eq(i).show();
	                		}
	                	});
	                	
                		$('.pl_more').each(function(){
                			var m_html=$(this).html();
                			$(this).click(function(){
                				if($(this).html()==m_html){
                					$(this).parent().children('dd').show();
                		            $(this).html('<a href="javascript:void(0);">收起</a>');
                					}
                				else{                					
                					$(this).parent().children('dd').hide();
                					for(var i=0;i<6;i++){
                						$(this).parent().children('dd').eq(i).show();
                					}
                		            $(this).html(m_html);
                				}
                			});
                		});
                		
                		function hideReplayContent(id){
                			$("#replayContent"+id).hide();
                			$("#shouqiAllReplay"+id).hide();
                			$("#zhankaiAllReplay"+id).show();
                		}
                		
                		function showReplayContent(id){
                			$("#replayContent"+id).show();
                			$("#shouqiAllReplay"+id).show();
                			$("#zhankaiAllReplay"+id).hide();
                		}
                		
                		function showContent(id){
                			$("#shortContent"+id).hide();
                			$("#content"+id).show();
                		}
                		
                		function hideContent(id){
                			$("#content"+id).hide();
                			$("#shortContent"+id).show();
                		}
                		
			        </script>