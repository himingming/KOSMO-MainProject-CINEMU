<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/qna-bt.css">
<%-- Start! --%>

<c:set var="pageurl" value="?searchType=${searchType}&searchValue=${searchValue}&cPage" />
<nav aria-label="Page navigation example" id="page">
	<ul class="pagination justify-content-center">
		<c:choose>
			<c:when test="${startPage <= pagePerBlock }">
				<li class="page-item disabled"><a class="page-link" href="#"
					tabindex="-1" aria-disabled="true">Previous</a></li>
			</c:when>
			<c:otherwise>
				<li class="page-item active"><a class="page-link"
					href="${pageurl }=${startPage -1 }" tabindex="-1">Previous</a></li>
			</c:otherwise>
		</c:choose>
		<c:forEach varStatus="i" begin="${startPage }" end="${endPage }"
			step="1">
			<c:choose>
				<c:when test="${i.index == nowPage }">
					<li class="page-item active"><a id="page-link" class="page-link" href="#">${i.index}</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item "><a class="page-link"
						href="${pageurl }=${i.index }">${i.index}</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<%-- NextPage --%>
		<c:choose>
			<c:when test="${endPage >= totalPage }">
				<li class="page-item"><a href="" class="page-link"
					aria-disabled="true">Next</a></li>
			</c:when>
			<c:otherwise>
				<li class="page-item active"><a class="page-link"
					href="${pageurl }=${endPage + 1 }">Next</a></li>
			</c:otherwise>
		</c:choose>

	</ul>
</nav>
<%-- End ! --%>