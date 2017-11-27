<%@ page contentType="text/html; charset=UTF-8" %>

                <div class="header">
                    <h3 class="title">漫画库</h3>
                </div>
                <div class="content">
                    <ul class="shift">
                        <li class="item on">漫画</li>
                        <li class="item">四格</li>
                        <li class="item">Flash</li>
                        <li class="item">表情</li>
                    </ul>
                    <div class="wrapper">
                        <div class="column">
                            <ul class="list">
                            	<c:forEach items="${subjectMap['manhua_base']}" var="item" varStatus="status">
	                            	<li class="item"><a href="${contextPath }/book/${item.bookId}" class="link">${item.bookName }</a>
	                                	<span class="new">NEW</span><p class="author">${item.bookAuthorNick }</p><p class="desc">${item.bookInfo}</p>
	                                </li>
				           		</c:forEach>
                            </ul>
                        </div>
                    </div>
                    <div class="wrapper">
                        <div class="column">
                            <ul class="list">
                            	<c:forEach items="${subjectMap['strips_base']}" var="item" varStatus="status">
	                            	<li class="item"><a href="${contextPath }/flash/strips_detail/${item.bookId}" class="link">${item.bookName }</a>
	                                	<span class="new">NEW</span><p class="author">${item.bookAuthorNick }</p><p class="desc">${item.bookInfo}</p>
	                                </li>
				           		</c:forEach>
                            </ul>
                        </div>
                    </div>
                    <div class="wrapper">
                        <div class="column">
                            <ul class="list">
                            	<c:forEach items="${flashList}" var="item" varStatus="status">
	                            	<li class="item"><a href="${contextPath }/flash/play_new/${item.id}" class="link">${item.name }</a>
	                                	<span class="new">NEW</span><p class="author"><!-- 作者名称 --></p><p class="desc"><!-- 一句话简介 --></p>
	                                </li>
				           		</c:forEach>
                            </ul>
                        </div>
                    </div>
                    <div class="wrapper">
                        <div class="column">
                            <ul class="list">
                            	<c:forEach items="${subjectMap['emote_base']}" var="item" varStatus="status">
	                            	<li class="item"><a href="${contextPath }/flash/expression/${item.bookId}" class="link">${item.bookName }</a>
	                                	<span class="new">NEW</span><p class="author">${item.bookAuthorNick }</p><p class="desc">${item.bookInfo}</p>
	                                </li>
				           		</c:forEach>
				           	</ul>
                        </div>
                    </div>
                </div>
            