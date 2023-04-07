<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Content영역 -->

<div class="inner-container">
	<div class="search-box">
		<div class="box">
			<form action="searchId" method="post">
				<h1>ID 찾기</h1>
				<input type="text" placeholder="이름" name="lname" /> <input
					type="text" placeholder="생년월일 YYMMDD ex) 850101 " name="lbirth" />
				<input type="text" placeholder="전화번호  ex) 010-0000-0000"
					name="lphone" /> 
					<input type="submit" value="Search" class="submit" />
				<p>
					<c:choose>
						<c:when test="${fid == 1 }">
			찾으시는 id : ${id }			
			</c:when>
						<c:when test="${fid == 0 }">
			정보가 없습니다		
			</c:when>
						<c:otherwise>
							<p>정확한 정보를 입력해주세요</p>
						</c:otherwise>
					</c:choose>
				</p>


			</form>
			<div class="subsearch-box">
				<a href="${pageContext.request.contextPath}/member/loginForm">로그인하기</a>&nbsp;&nbsp; 
				<a href="${pageContext.request.contextPath}/member/findPwd">비밀번호 찾기</a>
			</div>
		</div>
	</div>
</div>
