<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Content영역 -->


<div class="inner-container">
	<div class="box">
		<form id="rnumCheckForm" action="${pageContext.request.contextPath}/memberR/chkRnum" method="post">
			<input type="hidden" name="rnum" value="${rnum }">
			<h1>인증번호 확인</h1>
			<p>입력하신 id : ${lid }</p>
			<p>인증번호 발송 이메일 : ${lemail }</p>
			<input type="text" placeholder="숫자 6자리" name="inputrnum" /> 
			<input type="submit" value="확인">
		</form>



		<div>
			<form action="upPwdForm" method="post">
				<div class="inner-container">
					<div class="box" style="height:100px;">
							<p id="result"></p>
						
						<div id="moveUpPwd">
							<input type="hidden" name="lid" value="${lid}"> <input
								type="submit" value="비밀번호변경">
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<script>
	$('#moveUpPwd').hide();
	$('#rnumCheckForm').submit(function(event) {
		event.preventDefault();
		var form = $('#rnumCheckForm');
		var data = $('#rnumCheckForm').serialize();
		$.ajax({
			url : form.attr('action'),
			data : data,
			dataType : "json",
			error : function(e) {
				console.log("비번찾기 에러 :" + e);
			},
			success : function(jsondata) {
				console.log("비번찾기 에이잭스 " + jsondata);
				if (jsondata == 1) {
					$('#result').html('인증번호가 일치합니다');
					$('#moveUpPwd').show();
				} else {
					$('#result').html('인증번호가 일치하지 않습니다');
				}
			}
		});

	});
</script>
