<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
	
</script>

<style>
</style>
<h3>총 ${rescnt }개의 게시물이 검색되었습니다.</h3>
<ul class="nav nav-tabs">
	<li class="nav-item"><a class="nav-link active"
		aria-current="page" href="#">통합검색</a></li>
	<li class="nav-item"><a class="nav-link" href="#">영화</a></li>
	<li class="nav-item"><a class="nav-link" href="#">영화감상평</a></li>
	<li class="nav-item"><a class="nav-link" href="#">QnA</a></li>
</ul>

<!-- Content영역 -->
<div>
	<label>영화정보</label>
	<c:forEach var="e" items="${mlist }">
		<div>${e.mno}: ${e.mimg } : ${e.mname }</div>
	</c:forEach>
</div>
<br>
<div>
	<label>영화댓글</label>
	<c:forEach var="f" items="${clist }">
		<div>${f.mcode }: ${f.mcontent }</div>
	</c:forEach>
</div>
<br>
<div>
	<label>QnA</label>
	<c:forEach var="g" items="${qlist }">
		<div>${g.subject }: ${g.content }</div>
	</c:forEach>
</div>
<!-- Content영역 -->


