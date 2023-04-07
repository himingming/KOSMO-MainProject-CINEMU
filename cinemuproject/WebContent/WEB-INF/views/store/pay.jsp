<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<body>
	<div class="container mt-5">
		<div class="row">
			<div id="sub1">
				<fieldset>
					<legend>결제</legend>


					<br>
					<!--예매할 영화 포스터/ 현재 업로드된 영화 포스터는 예시임-->
					<img src="resources/img/toyh.jpg" width="250" height="350"
						onerror="errorImage(this)" />


					<!--결제할 영화 정보-->
					<p>
					<div class="row mb-3">
						<label class="col-sm-2 col-form-laberl">예매번호</label>
						<div class="col-sm-10"></div>
					</div>
					</p>

					<p>
					<div class="row mb-3">
						<label class="col-sm-2 col-form-laberl">영화제목</label>
						<div class="col-sm-10"></div>
					</div>
					</p>

					<p>
					<div class="row mb-3">
						<label class="col-sm-2 col-form-laberl">관람일</label>
						<div class="col-sm-10"></div>
					</div>
					</p>

					<p>
					<div class="row mb-3">
						<label class="col-sm-2 col-form-laberl">인원수</label>
						<div class="col-sm-10"></div>
					</div>
					</p>
					<p>
					<div class="row mb-3">
						<label class="col-sm-2 col-form-laberl">상영관</label>
						<div class="col-sm-10"></div>
					</div>
					</p>

					<p>
					<div class="row mb-3">
						<label class="col-sm-2 col-form-laberl">선택좌석</label>
						<div class="col-sm-10"></div>
					</div>
					</p>

					<p>
					<div class="row mb-3">
						<label class="col-sm-2 col-form-laberl">예매금액</label>
						<div class="col-sm-10"></div>
					</div>
					<br>
					</p>

					<p>
					<div class="row mb-3">
						<label class="col-sm-2 col-form-laberl">스낵</label>
						<div class="col-sm-10"></div>
					</div>
					<br>
					</p>

					<p>
					<div class="row mb-3">
						<label class="col-sm-2 col-form-laberl">스낵 수량</label>
						<div class="col-sm-10"></div>
					</div>
					<br>
					</p>

					<p>
					<div class="row mb-3">
						<label class="col-sm-2 col-form-laberl">금액</label>
						<div class="col-sm-10"></div>
					</div>
					<br>
					</p>


					<p>
					<div class="row mb-3">
						<label class="col-sm-2 col-form-laberl">총 금액</label>
						<div class="col-sm-10"></div>
					</div>
					<br>
					</p>


					<form action="#">
						<fieldset>
							<legend>결제수단</legend>
							<input type="radio" id="카드"> <label for="radio">카드</label>
						</fieldset>
					</form>



					<br>
					<div class="row mb-3">
						<div class="col-sm-10">
							<input type="button" value="결제" class="button-r" />
						</div>
					</div>
				</fieldset>
			</div>
		</div>
	</div>