<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Content영역 -->


<form action="${pageContext.request.contextPath}/member/login"
	method="post">
	<div class="inner-container">
		<div class="box">
			<h1>Login</h1>
			<input type="text" placeholder="ID" name="lid" value="id1" /> <input
				type="password" placeholder="Password" name="lpwd" value="1" />
			<button>Login</button>
			<p>
				<b>아직 멤버가 아닌가요?</b> <span><a
					href="${pageContext.request.contextPath}/member/joinForm"> 지금
						멤버되러가기</a> </span> <br>
				<a class="findid"
					href="${pageContext.request.contextPath}/member/findId">아이디 찾기</a>
				<a class="findpw"
					href="${pageContext.request.contextPath}/member/findPwd">비밀번호
					찾기</a>
			</p>
		</div>
	</div>
</form>