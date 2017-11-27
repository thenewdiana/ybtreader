<%@ page contentType="text/html; charset=UTF-8" %>
<div class="index_search">
<form action="${pageContext.request.contextPath }/m/book/search" method="get" id="bookSearchForm">
  <dl class="clearfix">
    <dt>
      	<input type="hidden" name="searchType" value="0"/>
      	<input class="text-border vm" type="text" value="" placeholder="输入关键字..." name="searchName" id="searchName" value="${bookReqForm.searchName}">      
      <em class="search_close"></em></dt>
    <dd>
      <input class="btn btn-auto btn-blue vm" type="button" onclick="doSearch();" value="">
    </dd>
  </dl>
  </form>
  <p>
  <c:forEach items="${sessionScope.hotwordsList}" var="item" varStatus="status">
      <c:if test="${item.bannerUrl==null or item.bannerUrl==''}">
          <a href="javascript:void(0);" onclick="doHotWords('${item.bookRecommTitle}')">${item.bookRecommTitle}</a>
      </c:if>
      <c:if test="${item.bannerUrl!=null and item.bannerUrl!=''}">
          <a href="${item.bannerUrl}" target="_blank">${item.bookRecommTitle}</a>
      </c:if>
  </c:forEach>
  </p>
</div>
<script type="text/javascript">
function doSearch() {
	var formData = $('#searchName').serialize();
	window.location.href = "${pageContext.request.contextPath }/m/book/search?" + formData;    	
}

function doHotWords(word) {
	$("#searchName").attr("value", word);
	doSearch();
}
</script>
