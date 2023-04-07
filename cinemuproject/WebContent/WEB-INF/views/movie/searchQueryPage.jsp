<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
   
</script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/search-bt.css">
<script
	src="${pageContext.request.contextPath}/resources/js/pagination-More.js"></script>

<div class="container" id="searchPage">
	<div class="row">
		<header class="page-tit" id="scheaderid">
			<h2>SEARCH</h2>
			<h5>
				<span><b>'${searchValue }'</b></span>&nbsp;에 대한 총 &nbsp;<span><b>${rescnt }</b></span>&nbsp;개의
				게시물이 검색되었습니다.
			</h5>
		</header>
		<section>
			<ul class="nav nav-tabs" id="myTab" role="tablist">

				<li class="nav-item" role="presentation">
					<button class="nav-link active" id="totalSearch-tab"
						data-bs-toggle="tab" data-bs-target="#totalSearch-tab-pane"
						type="button" role="tab" aria-controls="totalSearch-tab-pane"
						aria-selected="true">
						<a>All</a>
					</button>
				</li>

				<li class="nav-item" role="presentation">
					<button class="nav-link" id="movlist-tab" data-bs-toggle="tab"
						data-bs-target="#movlist-tab-pane" type="button" role="tab"
						aria-controls="movlist-tab-pane" aria-selected="false">
						<a>All Movie (${mcnt })</a>
					</button>
				</li>

				<li class="nav-item" role="presentation">
					<button class="nav-link" id="movcomm-tab" data-bs-toggle="tab"
						data-bs-target="#movcomm-tab-pane" type="button" role="tab"
						aria-controls="movcomm-tab-pane" aria-selected="false">
						<a>Ratings and Reviews(${ccnt })</a>
					</button>
				</li>

				<li class="nav-item" role="presentation">
					<button class="nav-link" id="qnaboard-tab" data-bs-toggle="tab"
						data-bs-target="#qnaboard-tab-pane" type="button" role="tab"
						aria-controls="qnaboard-tab-pane" aria-selected="false">
						<a>QnA(${qcnt })</a>
					</button>
				</li>
			</ul>

			<!-- tab content -->
			<div class="tab-content" id="myTabContent">

				<!-- totalSearch -->
				<div class="tab-pane fade show active" id="totalSearch-tab-pane"
					role="tabpanel" aria-labelledby="totalSearch" tabindex="0">
					<div>

						<ol>
							<c:forEach var="e" items="${mlist}" begin="0" end="3">
								<li>
									<div>

										<div>

											<img
												src="${pageContext.request.contextPath}/resources/img/semi_movie/${e.mimg}">
										</div>
										<a
											href="${pageContext.request.contextPath}/movies/moviedetail?no=${e.mno }"><b>${e.mname}</b>
										</a>
									</div>
								</li>
							</c:forEach>
							<div id="moremovid">
								<hr>
								<button type="button" id="moremov" class="morebtn">검색결과
									더보기</button>

							</div>
						</ol>
					</div>

					<table class="table">
						<tr>
							<td colspan="4"><span class="tablesub" colspan="4">Ratings and Reviews</span>
							</td>
						</tr>
						<tr>
							<th>no</th>
							<th>리뷰</th>
							<th>평점</th>
							<th>날짜</th>
						</tr>
						<c:forEach var="f" items="${clist }" begin="0" end="2">
							<tr id="commid">
								<td>${f.commno }</td>
								<td><a
									href="${pageContext.request.contextPath}/movies/moviedetail?no=${f.mno}">${f.comm }</a></td>
								<td>${f.mgood }</td>
								<td>${f.commdate }</td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan="4">작성된 게시글이 없습니다.</td>
						</tr>
					</table>
					<button type="button" id="morecomm" class="morebtn">더보기</button>


					<table class="table" id="qnatable">
						<tr>
							<td colspan="4"><span class="tablesub" colspan="4">QnA</span>
							</td>
						</tr>
						<tr>
							<th>no</th>
							<th colspan="2">제목</th>
							<th>날짜</th>
						</tr>
						<c:forEach var="g" items="${qlist }" begin="0" end="2">
							<tr id="qnaid">
								<td>${g.no }</td>
								<td colspan="2"><a
									href="${pageContext.request.contextPath}/qaboard/qadetail?no=${g.no}">
										${g.subject }</a></td>
								<td>${g.mdate }</td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan="4">작성된 게시글이 없습니다.</td>
						</tr>
					</table>
					
					<button type="button" id="moreqna" class="morebtn">더보기</button>
				</div>

				<!-- Mov list -->
				<div class="tab-pane fade" id="movlist-tab-pane" role="tabpanel"
					aria-labelledby="movlist-tab" tabindex="0">
					<table class="table">
						<thead>

						</thead>
						<tbody id="mvbody">
							<!-- clist  -->
						</tbody>
						<tfoot>
							<tr>
								<td>
									<button id="mvbtn" class="btn" class="morebtn">더 보기</button>
								</td>
							</tr>
						</tfoot>
					</table>
				</div>

				<!-- MovComm list -->
				<div class="tab-pane fade" id="movcomm-tab-pane" role="tabpanel"
					aria-labelledby="movcomm-tab" tabindex="0">
					<table class="table">
						<thead>
							<tr>
								<td>번호</td>
								<td>리뷰</td>
								<td>평점</td>
								<td>날짜</td>
							</tr>
						</thead>
						<tbody id="mcbody">
							<!-- movcommlist  -->
						</tbody>
						<tfoot>
							<tr>
								<td>
									<button id="mcbtn" class="morebtn">더 보기</button>
								</td>
							</tr>
						</tfoot>

					</table>
				</div>

				<!-- QnA List -->
				<div class="tab-pane fade" id="qnaboard-tab-pane" role="tabpanel"
					aria-labelledby="qnaboard-tab" tabindex="0">
					<table class="table">
						<thead>
							<tr>
								<td>번호</td>
								<td>제목</td>
								<td>날짜</td>
							</tr>
						</thead>
						<tbody id="qnaBody">
							<!-- QnA List -->
						</tbody>
						<tfoot>
							<tr>
								<td>
									<button id="qnabtn" class="morebtn">더 보기</button>
								</td>
							</tr>
						</tfoot>
					</table>
				</div>
			</div>
		</section>
		<!-- tab content 끝 -->

	</div>
</div>
<script>
   $(function() {  
	      if (${mcnt } === 0)  {
	          $("#movlist-tab").attr("disabled", true);
	          $("#moremov").attr("disabled", true);
	       } 
	       if(${ccnt } === 0) {
	          $("#movcomm-tab").attr("disabled", true);
	          $("#morecomm").attr("disabled", true);
	       } 
	       if(${qcnt } === 0) {
	          $("#qnaboard-tab").attr("disabled", true);
	          $("#moreqna").attr("disabled", true);
	       };
	   
	       
	       $('#moremov').click(function() {
	           $("#movlist-tab").trigger("click");
	        });
	        $('#morecomm').click(function() {
	           $("#movcomm-tab").trigger("click");
	        });
	        $('#moreqna').click(function() {
	           $("#qnaboard-tab").trigger("click");
	        });
	        // table --------------- 
	        
	        
	        let moviecnt = $("#totalSearch-tab-pane").children('div').children('ol').children('li').length
	        console.log("moviecnt=>"+moviecnt);
	        
	        
	        if(${mcnt }<=4) {
	        	$('#moremovid').css('display','none');	
	        }
	        
	     
	        let commidlen = $('#commid').length;
	        if(commidlen === 0 ) {
	        	$('#nonrev').css("display", "block")
	        	console.log("출력 확인")
	        	
	        }
	        
	        
	        let qnaidlen = $('#qnaid').length;
	        if(qnaidlen === 0){
	        	$('#nonqna').css("display","block")
	        }
	        
   });
      


   let sv = '${searchValue }';
   //-----------------------------------------Movie----
   // movcomm-tab-pane
   $('#movlist-tab').click(function() {
      let ajaxUrl = "../searchAjax?code=Mov&searchValue=" + sv + "&cPage=";
      let numPerPage = $('#mvbody  a').length;
      let obj = $(this).attr('aria-controls');
      //Ajax 시작
      ajaxList(ajaxUrl, numPerPage, obj, function(data) {
      console.log("data.length==>"+ data.length);
      let html = '';
      for (let i = 0; i < data.length; i++) {
         html += '<tr><td rowspan="3">';
         html += "<a href='${pageContext.request.contextPath}/movies/moviedetail?no="+data[i].mno+"'>";
         html += "<img src='../resources/img/semi_movie/"+data[i].mimg+"' style='width: 200px; height: 300px;' >";
         html += "</a></td>";
         html += "<th>" + data[i].mname + "</th></tr>";
         html += "<tr><td> 제작 : " + data[i].mstartday + "</td></tr>";
         html += "<tr><td> 장르 : " + data[i].mtype + "</td></tr>";         
         }
      $('#mvbody').append(html);
      });         
   });

   $('#mvbtn').click(function() {
      $("#movlist-tab").trigger("click");
   });

   //-----------------------------------------MovieComm----
   // movcomm-tab-pane
   $('#movcomm-tab').click(function() {
      let ajaxUrl = "../searchAjax?code=Review&searchValue=" + sv + "&cPage=";
      let numPerPage = $('#mcbody > tr').length;
      let obj = $(this).attr('aria-controls');
      //Ajax 시작
      ajaxList(ajaxUrl, numPerPage, obj, function(data) {
         console.log("data.length==>"+ data.length);
      let html = '';
      for (let i = 0; i < data.length; i++) {
         html += '<tr><td>' + data[i].commno + '</td>';
         html += '<td><a href="${pageContext.request.contextPath}/movies/moviedetail?no='+data[i].mno+'">';
         html += data[i].comm + '</a></td>'
         html += '<td>' + data[i].mgood + '</td>';
         html += '<td>' + data[i].commdate + '</td></tr>';
         }
      $('#mcbody').append(html);
      });         
   });

   $('#mcbtn').click(function() {
      $("#movcomm-tab").trigger("click");
   });
   
   //-----------------------------------------QnATab----
   $('#qnaboard-tab').click(function() {
      let ajaxUrl = "../searchAjax?code=QnA&searchValue=" + sv + "&cPage=";
      let numPerPage = $('#qnaBody > tr').length;
      let obj = $(this).attr('aria-controls');
      //Ajax 시작
      ajaxList(ajaxUrl, numPerPage, obj, function(data) {
         console.log("data.length==>"+ data.length);
      let html = '';
      for (let i = 0; i < data.length; i++) {
         html += '<tr><td>' + data[i].no + '</td>';
         html += '<td><a href="${pageContext.request.contextPath}/qaboard/qadetail?no='+data[i].no+'">'
         html += data[i].subject + '</a></td>';
         html += '<td>' + data[i].mdate + '</td></tr>';
         }
      $('#qnaBody').append(html);
      });         
   });

   $('#qnabtn').click(function() {
      $("#qnaboard-tab").trigger("click");
   });
   //-----------------------------------------QnATab----
   
  
   
</script>