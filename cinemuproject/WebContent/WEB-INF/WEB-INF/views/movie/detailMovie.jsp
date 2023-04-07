<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/detailmv-bt.css">

<!-- Content영역 -->
<div class="detailMoviePage">
	<div class="movie-detail-page">
		<img class="bg-img"
			src="${pageContext.request.contextPath}/resources/img/semi_movie/${vo.mmain}">
		<div class="bg-pattern"></div>
		<div class="bg-mask"></div>
		<div class="movie-detail-cont">
			<p class="contents-type">#현재상영중</p>

			<button id="likebtn" class="btn-like">
				<a id="heart"></a><a id="likecnt"></a>

			</button>
			<p class="title">
				<strong>${vo.mname}</strong>
			</p>

			<!-- info -->



			<div class="info">
				<div class="score">
					<p class="tit">평점</p>
					<div class="number gt" id="mainMegaScore">
						<p title="실관람 평점" class="before">
							<em id="mgoodAvg"></em>
						</p>
					</div>
				</div>

				<div class="rate">
					<p class="tit">예매율</p>

					<p class="cont">
						<span>${ratio}%</span>
					</p>

				</div>

			</div>
			<!--// info -->
			<!--poster-->
			<div class="poster">
				<div class="wrap">


					<img
						src="${pageContext.request.contextPath}/resources/img/semi_movie/${vo.mimg}">
				</div>
			</div>
			<div class="reserve screen-type col-2">
				<div class="reserve">
					<div class="btn-util">


						<p class="btn">
							<a href="${pageContext.request.contextPath}/movies/movielist">예매하기</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--// poster-->
	<div class="container">
		<fieldset class="detail-info">
			<!-- 영화 정보 -->
			<!-- 테이블 시작 -->
			<div class="movie-summary infoContent" id="info">
				<div class="txt">
					<!-- 영화 줄거리  -->
					<strong>${vo.mstory}</strong>
					<!--줄거리 끝-->
				</div>
				<!--  부트스트랩 클래스 table-->
				<div class="movie-info infoContent">
					<p>상영시간 :&nbsp;${vo.mtime}</p>
					<div class="line">
						<p>감독 :&nbsp;${vo.mdirec }</p>
						<p>장르 :&nbsp;${vo.mtype }</p>
						<p>개봉일 :&nbsp; ${vo.mstartday}</p>
					</div>
					<p>배우 :&nbsp;${vo.mactor }</p>

				</div>
				<div class="movie-graph infoContent">
					<div class="col">
						<dl>
							<dd>성별 예매 분포도</dd>
						</dl>
						<div class="graph">
							<p id="genDonut"></p>
						</div>
					</div>
					<div class="col" id="subMegaScore">
						<dl>
							<dd>연령별 예매 분포도</dd>
						</dl>
						<p id="agelist"></p>
					</div>
				</div>
			</div>
			</fieldset>
			<!-- 테이블 끝 -->
			<!-- 영화 정보 끝-->

			<!-- 영화 정보 -->



			<!-- 해당 영화 댓글달기   -->

			<div class="tit-util mt70 mb15 oneContent">
				<span class="tit small"> <strong>${vo.mname}!</strong> 어떠셨나요?
				</span>
			</div>
								<form action="moviecomminsert" method="post">
			<div class="movie-idv-story oneContent">
							<div class="story-cont">
								<div class="reviews-counter rate">

									<input type="hidden" name="mno" value=${vo.mno } /> <input
										type="hidden" name="lid" value="${sessionScope.sessionID}" />

									<input type="radio" id="star5" name="mgood" value="5" checked />
									<label for="star5" title="text"> ★ ★ ★ ★ ★</label> <input
										type="radio" id="star4" name="mgood" value="4" checked /> <label
										for="star4" title="text"> ★ ★ ★ ★</label> <input type="radio"
										id="star3" name="mgood" value="3" checked /> <label
										for="star3" title="text"> ★ ★ ★</label> <input type="radio"
										id="star2" name="mgood" value="2" /> <label for="star2"
										title="text"> ★ ★</label> <input type="radio" id="star1"
										name="mgood" value="1" /> <label for="star1" title="text">
										★</label>
								</div>


									<div class="wrt" >
										<textarea name="comm" class="form-control" id="comm" rows="3"
											placeholder="재미있게 보셨나요? ${vo.mname}의 어떤 점이 좋았는지 이야기해주세요."></textarea>
										<input type="submit" value="관람평쓰기" id="wbtn" class="button-l" />
									</div>
							</div>
						</div>
								</form>
					</div>
					<!-- 내용 -->
				</div>

			<!-- 해당 영화 댓글달기 끝  -->



			<!-- 해당 영화 댓글 리스트 -->
			<div class="col-sm-10">
				<!--  부트스트랩  table-->
				<table class="table">
					<thead>
						<tr>
							<td>no</td>
							<td>ID</td>
							<td>영화평점</td>
							<td>후기</td>
							<td>날짜</td>
							<td></td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="e" items="${listmoviecomm}">
							<tr>
								<td>${e.commno}</td>
								<td>${e.lid}</td>
								<td>${e.mgood}</td>
								<td>${e.comm}</td>
								<td>${e.commdate}</td>
								<td><c:if test="${sessionScope.sessionID == e.lid}">
										<button class="updatebtn" onclick="update(this)">수정</button>
										<div>
											<form method="post" action="upmoviecomm">
												<input type="hidden" name="commno" value=${e.commno }>
												<input type="hidden" name="mno" value=${vo.mno }>
												<textarea name=mgood>${e.mgood }</textarea>
												<textarea name="comm">${e.comm }</textarea>
												<input type="submit" value="저장" id="eBtn1" />
											</form>
										</div>
										<a href="delmoviecomm?no=${e.commno }"> <input
											id="delbtn1" name="delbtn" type="button" value="삭제"></a>
									</c:if></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<!-- 해당 영화 리스트 끝 -->
		

		<!-- Modal -->
		<div class="modal-wrapper" id="modal-wrapper">
			<div class="modal">
				<div class="head"></div>
				<div class="content">
					<div class="good-job">
						<i class="fa fa-thumbs-o-up" aria-hidden="true"></i>
						<h1>
							로그인 후 <br> 이용 가능합니다!
						</h1>
						<button id="loginbtn">
							<strong>login 하기>></strong>
						</button>
						<button id="closebtn">
							<strong>닫기</strong>
						</button>
					</div>
				</div>
			</div>
		</div>

<script>
var uid = '<%=(String) session.getAttribute("sessionID")%>';
console.log("uid====>"+uid);
   // 페이지 실행 시 처음 하트 모양을 결정하기 위한 ajax
   $(function() {  
      
   $('#loginbtn').click(function() {
   location="${pageContext.request.contextPath}/member/loginForm";
   })
   
   $('#closebtn').click(function() {
      $('#modal-wrapper').removeClass('modal-wrapper')
   
   })

      $.ajax({
       url : "../like/likecnt2?mno=${vo.mno}&lid=${sessionScope.sessionID}",
       error : function(e) {
        },
        success : function(jsondata){
          if(jsondata.cnt===0){
             $('#heart').html('♡');
          }else{
             $('#heart').html('♥');
          }
          $('#likecnt').html(jsondata.likecnt);
       }
      
       
  });
            
      // 좋아요 버튼을 클릭하면 실행 되는 ajax
      $('#likebtn').click(function() {

         $.ajax({
               url : "../like/addlike?mno=${vo.mno}&lid=${sessionScope.sessionID}",
               success : function(jsondata){
                  const modalc = $('#modal-wrapper').attr('class');

                  if(jsondata.cnt2===0){
                     $('#heart').html('♡');
                  }else{
                     $('#heart').html('♥');
                  }
                  $('#likecnt').html(jsondata.likecnt);
                  
               }
              
               
         });
      })       
      
      //wbtn클릭 이벤트

      $('#delbtn')
            .click(
                  function() {
                     //강제이동
                     location = "${pageContext.request.contextPath}/movies/moviedelete?mno=${vo.mno}"
                  
                  });
      $('#updatebtn')
            .click(
                  function() {
                     //강제이동
                     location = "${pageContext.request.contextPath}/movies/movieupForm?mno=${vo.mno}"
                 
                  });
      
      
      //안에 넣은 코드
      $.ajax({
            url : "../genDonut?mno=${vo.mno}",
            success : function(jsondata) {

               var chart = c3.generate({
                  bindto : '#genDonut',
                  data : {
                     json : [jsondata[1]],
                     keys : {
                        value : Object.keys(jsondata[1]),
                     },
                     type : 'donut',
                     colors: {
                                '여자' : '#edcabd',
                                '남자' : '#B9CEC4'
                             }            

                  },
                  donut : {
                     title : jsondata[0].movieTitle,
                  },
               });
               //----------------------
            },
            error : function(e) {
            }
         });
      
      $.ajax({
            url : "../ageBar?mno=${vo.mno}",
            success : function(jdata) {

               var chart = c3.generate({
                  bindto : '#agelist',
                  data : {
                     labels: Object.keys(jdata[1])[0],                
                     json : [jdata[1]],
                     keys : {
                        value : Object.keys(jdata[1])
                     },
                     type : 'bar',
                     colors:{ 
                                    '10대이상':'#e9b9aa',
                                    '20대':'#d98481',
                                    '30대':'#7892b5',
                                    '40대':'#8cb9c0',
                                    '50대':'#91b5a9',
                                    '60대이상':'#edca7f'
                     },
                     
                  },
                  bar : {
                     title : jdata[0].movieTitle,
                     width:{
                        ratio: 0.8
                     },
                     space: 0.2,
                  },
                  axis: {
                       x: {
                           type: 'categories',
                           categories:  ['']
                       },
                       y: {
                           show:false
                       }
                   },
               });
               //----------------------
            },
            error : function(e) {
            }
         });
      
       $('td>div').hide();
         

        
         
         $('#eBtn1').click(function() {
            //$('#upbtn').show();
            $('#delbtn1').show();
         });
         
         $.ajaxSetup({
            cashe : false
         });
        
         $.ajax({
          url:"../movier/getavg?mno="+${vo.mno},
          error: function (xhr, status, error) {
          },
         success: function(json){
                   if(json !== null){
                      $('#mgoodAvg').html(json+"점");
                   }else if(json === null){
                      $('#mgoodAvg').html("별점을 등록해주세요 :)")
                   }
                }
         });
      
      
      
   });
   
   function update(obj) {
       $(obj).next('div').show();
       $(obj).hide();
       $('#delbtn1').hide();
    }
</script>