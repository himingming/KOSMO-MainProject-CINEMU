<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/qna-bt.css">
<!-- Content영역 -->
<div class="container">
	<div id="content">
		<div class="qnaform">
			<div class="row">
				<div id="sub1">
					<form action="qainsert" method="post">
						<input type="hidden" name="mgrno" value="1"> <input
							type="hidden" name="writer" value="${sessionID }">
						<fieldset>
							<div class="page-tit">
								<h2>QnA</h2>
								<p class="desc">Today's special moments are tomorrow's
									memories.</p>
							</div>
							<div class="qnaform-box">
								<div class="row">
									<label class="col-sm-2 col-form-label">Writer</label>
									<div class="col-sm-10" id="writerbox">${sessionScope.sessionID }</div>
								</div>

								<div class="row">
									<label class="col-sm-2 col-form-label"
										style="padding-top: 17px;">Subject</label>
									<div class="col-sm-10" id="subjectbox">
										<input type="text" name="subject" id="subject"
								value="${vo.subject }" />
									</div>
								</div>

								<div class="row">
									<label class="col-sm-2 col-form-label">Content</label>
									<div class="col-sm-10">
										<textarea rows="10" cols="50" name="content" id="content">
										${vo.content }</textarea>
									</div>
								</div>

								<div class="row">
									<div class="col-sm-10" id="submitid">
										<input type="submit" value="수정하기" id="wbtn" class="button-l" />
										<a class="lista" href="qalist"><input type="button"
											value="list" id="listBtn" class="button-l" /></a>
									</div>
								</div>
							</div>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

