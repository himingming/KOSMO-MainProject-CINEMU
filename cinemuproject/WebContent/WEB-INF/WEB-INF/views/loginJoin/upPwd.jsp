<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Content영역 -->

<form action="upPwd" method="post">
	<div class="inner-container">

		<div class="box">
			<h1>비밀번호 재설정</h1>
			<input type="hidden" name="lid" value="${lid}"> <input
				type="password" class="input" name="lpwd" placeholder="비밀번호 "
				id="pw1" onmousemove="javascript:pwdChk(this);"> <input
				type="password" class="input" id="pw2"
				placeholder=" 입력하신 비밀번호와 정확히 일치하여야 합니다"
				onmousemove="javascript:pwdChk(this);">
			<p id="pwchk"></p>
			<input type="submit" value="비밀번호변경">


		</div>
	</div>
</form>
<script>
	function pwdChk() {

		//alert("Test");
		// 자바스크립트 변수 idv에 입력값을 저장
		var pw1 = $('#pw1').val();
		var pw2 = $('#pw2').val();
		console.log("pw1 : " + pw1);
		console.log("pw2 : " + pw2);

		if (pw1 === pw2) {
			//$('#pwchk').html('일치');
			$('#pwchk').css('color', 'green').html('일치합니다');
			console.log("일치  : " + pw1);

			//   alert("중복" + data);
		} else { // 0
			$('#pwchk').css('color', 'red').html('일치하지 않습니다');
			console.log("불일치  : " + pw1);
			//  alert("사용가능" + data);
		}

	};
</script>