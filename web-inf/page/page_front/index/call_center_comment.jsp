<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common.jsp" %>	
					<!--评论-->					
					<div class="ac">
						<form action="" id="bookCommentForm">
						<textarea name="content" cols="" rows="" class="textt"></textarea>
						<span class="red"></span>
						</form>
					</div>
					
			        <div class="reviews mt20 offic1">
			            <div class="ct-t over">
			                <a href="javascript:void(0);" name="btn_comment" class="fb-ft mat10" id="red-bg">发起话题</a>
			                <span class="f16 "><i class="Arial">${totalComment }</i>条留言</span>
			                <ul>
			                    <li id="latest" <c:if test="${tabNick == 'latest' }">class="on"</c:if> >最新留言</li>
	                            <li id="hot" <c:if test="${tabNick == 'hot' }">class="on"</c:if> >精华留言</li>
			                </ul>
			            </div>
			            <div class="ce-c pos_r">
			                <ul class="new-list <c:if test="${tabNick != 'latest' }">hide</c:if>">
			                	<c:forEach items="${lastestCommentList }" var="item">
			                    <li>
			                    	<div class="offic2 pos_a">
			                    	<commauth:commauth operType="hot" authorAssistIdList="${authorAssistIdList }">
		                            <a href="javascript:void(0);" name="btn_comment_hot" id="${item.id }"><img src="${sessionScope.baseUrl}pc/images/pic/o-img1.png" width="17" height="18" alt="" /></a>
		                            </commauth:commauth>
		                            <commauth:commauth operType="top" authorAssistIdList="${authorAssistIdList }">
		                            <a href="javascript:void(0);" name="btn_comment_top" id="${item.id }"><img src="${sessionScope.baseUrl}pc/images/pic/o-img2.png" width="17" height="18" alt="" /></a>
		                            </commauth:commauth>		                            
		                            <commauth:commauth operType="del" authorAssistIdList="${authorAssistIdList }" commentUserId="${item.userId }">
		                            <a href="javascript:void(0);" name="btn_comment_del" id="${item.id }" class="a2"><img src="${sessionScope.baseUrl}pc/images/pic/o-img4.png" width="17" height="18" alt="" /></a>
		                            </commauth:commauth>
		                            </div>
		                            
			                        <div class="lf-wd fl">
	                                	<a href="${pageContext.request.contextPath }/book/listbyauthor/${item.userId }"><img src="${item.userPic }" width="53" height="55" alt="" /></a>
	                                	<p class="col99"><a href="${pageContext.request.contextPath }/book/listbyauthor/${item.userId }">${item.userNick }</a></p>
		                                <img src="${sessionScope.baseUrl}pc/images/${item.fansValues.image}" width="36" height="19" alt="" />
		                                <p class="mat12 v${item.vipValues.id }">&nbsp;</p>
	                                </div>
			                        <div class="rg-wd fr">
	                                	<h2>
	                                		${item.title }	                                			                                	
	                                	</h2>
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
		                                           	<img src="${sessionScope.baseUrl}pc/images/${replyItem.fansValues.image}" width="36" height="19" alt="" />
		                                           	：${replyItem.content }
                                    				</div>                             		
	                                            	  	
	                                                 <div class="controls over">
	                                                    <span class="col99 fl">${replyItem.createTimeFormat }</span>                                                    
	                                                    <commauth:commauth operType="del" authorAssistIdList="${authorAssistIdList }" commentUserId="${replyItem.userId }">
	                                                    <a href="javascript:void(0);" name="btn_comment_del" id="${replyItem.id }" class="col66 fr ml5">删除</a>
	                                                    </commauth:commauth>
	                                                </div>                                                
	                                            </dd>
	                                            </c:forEach>                                            
	                                            <dt><a href="javascript:void(0);" name="btn_comment_reply">我要回复</a></dt>
	                                        </dl>
	                                        <div class="over" id="template_comment_reply">
	                                        	<form action="">                                        	
	                                        	<input type="hidden" name="bookId" value="-1"/>
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
			                <ul class="new-list <c:if test="${tabNick != 'hot' }">hide</c:if>">
			                	<c:forEach items="${hotCommentList }" var="item">
			                    <li>
			                    	<div class="offic2 pos_a">
			                    	<commauth:commauth operType="hot" authorAssistIdList="${authorAssistIdList }">
		                            <a href="javascript:void(0);" name="btn_comment_hot" id="${item.id }"><img src="${sessionScope.baseUrl}pc/images/pic/o-img1.png" width="17" height="18" alt="" /></a>
		                            </commauth:commauth>
		                            <commauth:commauth operType="top" authorAssistIdList="${authorAssistIdList }">
		                            <a href="javascript:void(0);" name="btn_comment_top" id="${item.id }"><img src="${sessionScope.baseUrl}pc/images/pic/o-img2.png" width="17" height="18" alt="" /></a>
		                            </commauth:commauth>		                            
		                            <commauth:commauth operType="del" authorAssistIdList="${authorAssistIdList }" commentUserId="${item.userId }">
		                            <a href="javascript:void(0);" name="btn_comment_del" id="${item.id }" class="a2"><img src="${sessionScope.baseUrl}pc/images/pic/o-img4.png" width="17" height="18" alt="" /></a>
		                            </commauth:commauth>
		                            </div>
		                            
			                        <div class="lf-wd fl">
	                                	<a href="${pageContext.request.contextPath }/book/listbyauthor/${item.userId }"><img src="${item.userPic }" width="53" height="55" alt="" /></a>
	                                    <p class="col99"><a href="${pageContext.request.contextPath }/book/listbyauthor/${item.userId }">${item.userNick }</a></p>
		                                <img src="${sessionScope.baseUrl}pc/images/${item.fansValues.image}" width="36" height="19" alt="" />
		                                <p class="mat12 v${item.vipValues.id }">&nbsp;</p>
	                                </div>
			                        <div class="rg-wd fr">
	                                	<h2>
	                                	<c:if test="${item.isTop == 1 }">
	                                		<span style="color:#393">[置顶]</span>
	                                	</c:if>
	                                	<i style="color:#c63">[精华]</i>${item.title }</h2>
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
		                                           	<img src="${sessionScope.baseUrl}pc/images/${replyItem.fansValues.image}" width="36" height="19" alt="" />
		                                           	：${replyItem.content }
                                    				</div>          
	                                                <div class="controls over">
	                                                    <span class="col99 fl">${replyItem.createTimeFormat }</span>                                                    
	                                                    <commauth:commauth operType="del" authorAssistIdList="${authorAssistIdList }" commentUserId="${replyItem.userId }">
	                                                    <a href="javascript:void(0);" name="btn_comment_del" id="${replyItem.id }" class="col66 fr ml5">删除</a>
	                                                    </commauth:commauth>
	                                                </div>
	                                            </dd>
	                                            </c:forEach>                                            
	                                            <dt><a href="javascript:void(0);" name="btn_comment_reply">我要回复</a></dt>
	                                        </dl>
	                                        <div class="over">
	                                        	<form action="">                                        	
	                                        	<input type="hidden" name="bookId" value="-1"/>
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
        
	                <page:pagination pageAttr="pagination"></page:pagination>
	                
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
	            			}
	            		});	
			        </script>