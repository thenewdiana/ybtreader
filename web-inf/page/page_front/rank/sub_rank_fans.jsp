<%@ page contentType="text/html; charset=UTF-8" %>
<c:choose>
	<c:when test="${status.count == 1}">
		<li>
	       	<span class="sp1">${status.count }</span>
	       	<a href="javascript:void(0);" title="" class="mja">${item.nick }</a>
	       	<em class="fr"><img src="${sessionScope.baseUrl}pc/images/${item.fansValues.image}" width="36" height="19" alt="" /></em>
	   	</li>
	</c:when>	
	<c:when test="${status.count == 10}">
		<li class="no">
	    	<span class="sp1 sp2">${status.count }</span>
	        <a href="javascript:void(0);" title="" class="mja">${item.nick }</a>
	        <em class="fr"><img src="${sessionScope.baseUrl}pc/images/${item.fansValues.image}" width="36" height="19" alt="" /></em>
	    </li>
	</c:when>												
	<c:otherwise>
		<li>
	    	<span class="sp1 sp2">${status.count }</span>
	        <a href="javascript:void(0);" title="" class="mja">${item.nick }</a>
	        <em class="fr"><img src="${sessionScope.baseUrl}pc/images/${item.fansValues.image}" width="36" height="19" alt="" /></em>
	    </li>
	</c:otherwise>
</c:choose>