<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/qna-bt.css">
<!-- Content영역 -->
<div class="container">
	<div id="content">
		<div class="qnadetail">
			<div class="row">
				<div id="sub1">
					<fieldset>
						<div class="page-tit">
							<h2>
								<strong>QnA</strong>
							</h2>
							<p class="desc">Today's special moments are tomorrow's
								memories.</p>
						</div>


						<div class="qnadetail-box">
							<div class="subject">
								<label class="col-sm-2 col-form-label"
									style="width: 60px; margin-left: 20px;">no. ${vo.no }</label> <label
									class="col-sm-2 col-form-label">${vo.subject }</label>
								<div class="qnadetail-box-info">
									<label class="col-sm-2 col-form-label" style="width: 130px;"><i
										class="fa-sharp fa-regular fa-user"></i>&nbsp;${vo.writer }</label> <label
										class="col-sm-2 col-form-label"><i
										class="fa-sharp fa-regular fa-clock"></i>&nbsp;${vo.mdate }</label>
								</div>
							</div>
							<div class="content">
								<label class="col-sm-2 col-form-label">${vo.content }</label>
							</div>
						</div>
						<div class="row mb-3 ">
							<div class="col-sm-10" style="padding-left: 913px; width: 100%;">

								<c:choose>
									<c:when test="${sessionScope.sessionID == vo.writer }">
										<a href="qaupform?no=${vo.no }" class="update-btn"> <input
											type="button" value="수정" id="wbtn" class="button-l" />
										</a>
										<a href="qadelete?no=${vo.no }"> <input type="button"
											value="삭제" id="delBtn" class="button-l" /></a>
									</c:when>
								</c:choose>

								<a href="qalist"> <input type="button" value="리스트"
									id="listBtn" class="button-l" /></a>

							</div>
						</div>



						<form method="post" action="qcomminsert"
							style="margin-top: 130px;">
							<div class="row mb-3">
								<div class="col-sm-10 detail-comm">
									<input type="hidden" name="mcode" value=${vo.no }> <label
										class="col-sm-2 col-form-label"
										style="width: 30px; margin-left: 10px;"> <i
										class="fa-sharp fa-regular fa-user"></i>&nbsp;
									</label> ${sessionScope.sessionID} <input type="hidden" name="mwriter"
										id="mwriter" value="${sessionScope.sessionID}" />
									<textarea name="mcontent" class="form-control" id="mcontent"
										rows="3"></textarea>
									<input type="submit" value="등록" id="btn2" class="button-l" />
								</div>
							</div>
						</form>
						<div class="col-sm-10" style="margin-top: 50px; width: 100%;">
							<table class="table">
								<thead>
									<tr>
										<td>no</td>
										<td>writer</td>
										<td>content</td>
										<td>date</td>
										<td></td>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="e" items="${listcomm }">
										<tr>
											<td>${e.commno }</td>
											<td>${e.mwriter }</td>
											<td>${e.mcontent }</td>
											<td>${e.mregdate }</td>
											<td><c:if test="${sessionScope.sessionID == e.mwriter}">
													<button onclick="update(this)">수정</button>
													<div>
														<form method="post" action="upcomm">
															<input type="hidden" name="commno" value=${e.commno }> <input
																type="hidden" name="mcode" value=${vo.no }>
															<textarea name="mcontent">${e.mcontent }</textarea>
															<input type="submit" value="수정" id="eBtn" />
														</form>
													</div>
													<a href="delcomm?no=${e.commno }"> <input id="delbtn"
														name="delbtn" type="button" value="삭제"></a>
												</c:if></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</fieldset>
				</div>
			</div>
		</div>

	</div>
</div>
<script>
	$('td>div').hide();

	function update(obj) {
		$(obj).next('div').show();
		$(obj).hide();
		$('#delbtn').hide();
	}
	$('#eBtn').click(function() {
		//$('#upbtn').show();
		$('#delbtn').show();
	});
</script>
