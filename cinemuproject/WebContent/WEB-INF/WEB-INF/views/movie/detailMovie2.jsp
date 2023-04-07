<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/detailmv-bt.css">

<!-- Content영역 -->
<div class="movie-detail-page">
	<img
		src="${pageContext.request.contextPath}/resources/img/semi_movie/9.suite main.jpg">
		<div class="movie-detail-cont"></div>
</div>
<div class="container">


	<!-- 영화 정보 -->
	<fieldset>
		<!-- 영화 정보 -->
		<!-- <legend>${vo.mname}</legend> -->



		<!-- 테이블 시작 -->
		<table class="table" border="1">

			<!--  부트스트랩 클래스 table-->
			<tbody>

				<tr>
					<th rowspan="3" width="300px" style="text-align: center">
						<!-- 영화 포스터 - 한쪽으로 기울어있어요.조정필요 --> <span> <img
							src="${pageContext.request.contextPath}/resources/img/semi_movie/${vo.mimg}"
							style="width: 200px; height: 300px; margin-bottom: 20px;">
							<!-- 링크설정 수정 -->
					</span>


					</th>
					<!-- 좋아요 영역 시작 -->
					<td>
						<!--  부트스트랩 현재상영중 박스처리 --> <strong>${vo.mname}</strong> 
						<button id="likebtn" class="badge text-bg-success">좋아요</button>
						<a id="heart"></a><a id="likecnt"></a>

					</td>
					<!-- 좋아요 영역 끝 -->
				</tr>
				<tr>
					<td>
						<!-- 영화 상세정보 , 폰트조정 plz--> <!-- 포스터랑 정보텍스트랑 너무 붙어요 간격 부탁드려요~~ -->
						<dl>
							<dt>감독 :&nbsp;${vo.mdirec }</dt>
							<dt>
								배우 :&nbsp;${vo.mactor }
								<!-- 포문 돌리면 위쪽의 $mactor는 삭제해주세요 
                                    <c:forEach var="e" items="">$mactor &nbsp;</c:forEach>
                                    -->
							</dt>
							<dt>
								장르 :&nbsp;${vo.mtype }
								<!-- 포문 돌리면 위쪽의 $genre는 삭제해주세요 
                                    <c:forEach var="e" items="">$genre &nbsp; </c:forEach>
                                    -->
							</dt>
							<dt>상영시간 :&nbsp;${vo.mtime}</dt>
							<dt>개봉일 :&nbsp; ${vo.mstartday}</dt>
						</dl> <!-- 영화 상세정보 -->
					</td>
				</tr>
				<tr>
					<td><p>


							<a href="pro.movie?cmd=demo&scmd=oneMovieBooking"><input
								type="button" value="예매하기" id="resBtn" class="button-l" /></a></td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td>
						<p>성별 예매 분포도</p>
						<p id="genDonut"></p>
					</td>
					<td>
						<p>연령별 예매 분포도</p>
						<p id="agelist"></p>
					</td>
				</tr>
				<tr>
					<td colspan='2'>
						<!-- 영화 줄거리  --> <strong>${vo.mstory}</strong> <!--줄거리 끝-->
					</td>
				</tr>
			</tfoot>
		</table>
		<!-- 테이블 끝 -->
		<!-- 영화 정보 끝-->
	</fieldset>


	<!-- 해당 영화 댓글달기   -->
	<!-- fk mgrno -->
	<div class="row mb-3">
		<form action="moviecomminsert" method="post">
			<input type="hidden" name="mno" value=${vo.mno } /> <input
				type="hidden" name="lid" value="${sessionScope.sessionID}" />


			<!-- 작성자 이름을 따로 받을것인지, 아니면 id와 연동해서 자동으로 설정할 것인지 결정  
                  -->
			<!-- 작성자, 평점, 코멘트칸 등록버튼 스타일 수정 필수 -->

			<table style="float: left;">
				<tr>
					<td>별점 : <span id="mgoodAvg"></span></td>
				</tr>




			</table>
			<div class="reviews-counter rate">
				<input type="radio" id="star5" name="mgood" value="5" checked /> <label
					for="star5" title="text">5 stars</label> <input type="radio"
					id="star4" name="mgood" value="4" checked /> <label for="star4"
					title="text">4 stars</label> <input type="radio" id="star3"
					name="mgood" value="3" checked /> <label for="star3" title="text">3
					stars</label> <input type="radio" id="star2" name="mgood" value="2" /> <label
					for="star2" title="text">2 stars</label> <input type="radio"
					id="star1" name="mgood" value="1" /> <label for="star1"
					title="text">1 star</label>
			</div>




			<!--    <div class="mb-3" id="myform1">

               <input type="radio" name="mgood" value=1 id="mgood"> 
               <label for="rate1">★</label> 
               <input type="radio" name="mgood" value=2
                  id="mgood"> <label for="rate2">★★</label> 
                  <input
                  type="radio" name="mgood" value=3 id="mgood"> <label
                  for="rate3">★★★</label> 
                  <input type="radio" name="mgood" value=4
                  id="mgood"> <label for="rate4">★★★★</label> 
                  <input
                  type="radio" name="mgood" value=5 id="mgood"> <label
                  for="rate5">★★★★★</label>
            </div> -->
			<textarea name="comm" class="form-control" id="comm" rows="3"></textarea>
			<input type="submit" value="등록" id="wbtn" class="button-l" />

		</form>
	</div>

	<!-- 해당 영화 댓글달기 끝  -->
	<!-- 해당 영화 댓글 리스트 -->
	<div class="col-sm-10">
		<!--  부트스트랩  table-->
		<table class="table">
			<thead>
				<tr>
					<td>번호</td>
					<td>아이디</td>
					<td>영화평점</td>
					<td>후기</td>
					<td>날짜</td>
					<td>수정/삭제</td>
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
								<button onclick="update(this)">수정</button>
								<div>
									<form method="post" action="upmoviecomm">
										<input type="hidden" name="commno" value=${e.commno }>
										<input type="hidden" name="mno" value=${vo.mno }>
										<textarea name=mgood>${e.mgood }</textarea>
										<textarea name="comm">${e.comm }</textarea>
										<input type="submit" value="저장" id="eBtn1" />
									</form>
								</div>
								<a href="delmoviecomm?no=${e.commno }"> <input id="delbtn1"
									name="delbtn" type="button" value="삭제"></a>
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
           console.log("평상시 에이잭스 error:" + e);
        },
        success : function(jsondata){
          console.log('무준아 에이잭스해봐');
          console.log("jsondata=> "+jsondata);
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
                  console.log("=======uid======"+uid);
                  console.log(typeof(uid));
                  console.log(isNaN(uid));
                  const modalc = $('#modal-wrapper').attr('class');
                  console.log('modalc===>'+modalc)
                  
                  /*
                  if(isNaN(uid) !== true){
                     console.log("======성공======="+uid);
                        $('.modal-wrapper').toggleClass('open');
                         $('.page-wrapper').toggleClass('blur-it');
                          return false;
                  }
                  */
             
                  
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
               console.log("성공")
               console.log(jsondata);
               console.log(jsondata[0]);
               console.log("---------------------");
               console.log(jsondata[1]);
               console.log("---------------------");
               console.log((Object.keys(jsondata[1]))[0]);
               console.log("---------------------"); 
               var chart = c3.generate({
                  bindto : '#genDonut',
                  data : {
                     json : [jsondata[1]],
                     keys : {
                        value : Object.keys(jsondata[1]),
                     },
                     type : 'donut',
                     colors: {
                                '여자' : '#C60B05',
                                '남자' : '#c9b459'
                             }            

                  },
                  donut : {
                     title : jsondata[0].movieTitle,
                  },
               });
               //----------------------
            },
            error : function(e) {
               console.log("실패")
            }
         });
      
      $.ajax({
            url : "../ageBar?mno=${vo.mno}",
            success : function(jdata) {
               console.log("jdata=>"+jdata);
               console.log("jdata[0]=>"+jdata[0]);
               console.log("---------------------");
               console.log("jdata[1]=>"+jdata[1]);
               console.log("---------------------");
               console.log("(Object.keys(jdata[1]))[0]=>"+(Object.keys(jdata[1]))[0]);
               console.log("---------------------");
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
                                    '10대이상':'#C60B05',
                                    '20대':'#c9b459',
                                    '30대':'#C60B05',
                                    '40대':'#c9b459',
                                    '50대':'#C60B05',
                                    '60대이상':'#c9b459'
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
               console.log("error:" + e);
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
              console.log("평점 에이잭스 실패");
          },
         success: function(json){
                   console.log("평점:"+json);
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