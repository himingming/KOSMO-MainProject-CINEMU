<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet"
   href="<%=request.getContextPath()%>/resources/css/mypage-bt.css">



<div class="container">
   <div id="content">
      <div class="page-tit">
         <h2>
            <strong>My Cinemu</strong>
         </h2>
         <p class="desc">Today's special moments are tomorrow's memories.</p>
      </div>
      <div id="mypage">

         <div class="page-body">
            <div class="user">
               <div class="info">
                  <div class="profile_img">
                     <button id="btn" type="button">
                        <img id="imgx"
                           src="${pageContext.request.contextPath}/resources/imgfiles/${v.limg}">
                     </button>

                     <form id="imgbox" method="post"
                        action="${pageContext.request.contextPath}/member/photoup"
                        enctype="multipart/form-data">

                        <input type="submit" value="저장" id="btn1"> <input
                           type="hidden" name="lid" value="${v.lid }"> <input
                           type="hidden" name="lpwd" value="${v.lpwd }"> <input
                           type="hidden" name="lphone" value="${v.lphone }"> <input
                           type="hidden" name="laddr" value="${v.laddr }"> <input
                           type="hidden" name="lemail" value="${v.lemail }">


                        <div>
                           <input type="file" name="mfile" id="mfile">
                        </div>


                     </form>
                  </div>
                  <dl>
                     <dt>
                        <strong><b>${v.lname }</b></strong>님 오늘도 <strong>cinemu</strong>와
                        함께 행복한 하루 되세요&nbsp;<i class="fa-solid fa-heart fa-beat"></i>
                     </dt>
                     <div>
                        <dd>
                           <label><b>I &nbsp;&nbsp;&nbsp; D </b></label>
                           &nbsp;&nbsp;&nbsp;&nbsp;${v.lid }
                        </dd>
                        <dd>
                           <label><b>Name</b> </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${v.lname }
                        </dd>
                        <dd>
                           <label><b>Phone</b> </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${v.lphone }
                        </dd>

                        <dd>
                           <label><b>e&nbsp;-&nbsp;mail</b></label>
                           &nbsp;&nbsp;&nbsp;&nbsp;${v.lemail }
                        </dd>
                        <dd>
                           <label><b>Address</b> </label> &nbsp; &nbsp;&nbsp;${v.laddr }
                        </dd>
                     </div>
                     <div class="grp">
                        <img
                           src="${pageContext.request.contextPath}/resources/img/membership/${v.lclass }.png">
                        <p>
                           ${v.lname}님은 <span> [${v.lclass }]</span>&nbsp;회원입니다.
                        </p>
                        <a href="${pageContext.request.contextPath}/vip">
                           ${v.lname}님의 혜택 보러가기 </a>
                     </div>
                  </dl>

                  <div class="column memgroup">
                     <dl class="groupimg"></dl>
                  </div>

               </div>
               <div class="user_set">
                  <div class="column">
                     <dl>
                        <dt class="tot">스낵 금액 합계</dt>
                        <dd class="tot">
                           <i class="fa-solid fa-ticket"></i><strong>${poppay }</strong>원
                        </dd>
                     </dl>
                  </div>
                  <div class="column">
                     <dl>
                        <dt class="tot">영화 금액 합계</dt>
                        <dd class="tot">

                           <i class="fa-solid fa-basket-shopping"></i><strong>${mbpay}</strong>원
                        </dd>
                     </dl>
                  </div>
                  <div class="column">
                     <dl>
                        <dt class="tot">마일리지</dt>
                        <dd class="tot">
                           <i class="fa-solid fa-hand-holding-dollar"></i><strong>${v.lmileage }</strong>원
                        </dd>
                     </dl>
                  </div>
                  <div class="column">
                     <dl>
                        <dt class="tot">총 주문금액</dt>
                        <dd class="tot">
                           <i class="fa-solid fa-won-sign"></i><strong>${mbpay+poppay }</strong>원
                        </dd>
                     </dl>
                  </div>




               </div>
            </div>
            <p class="modify btn_set">
               <a class="abtn fill small"
                  href="${pageContext.request.contextPath}/member/upform">회원정보
                  수정</a>
            </p>
            <div class="hd">
               <h3>영화 예매 내역</h3>

            </div>
            <div class="tbl">
               <table summary="번호, 이미지, 영화 제목, 예매 날짜, 영화 일자, 영화 시간">
                  <colgroup>
                     <col width="150">
                     <col width="*">
                     <col width="140">
                     <col width="140">
                  </colgroup>
                  <thead>
                     <tr>
                        <th><div class="tb-center">번호</div></th>
                        <th><div class="tb-center">이미지</div></th>
                        <th><div class="tb-center">영화 제목</div></th>
                        <th>
                           <div class="tb-center">예매 날짜</div>
                        </th>
                        <th>
                           <div class="tb-center">영화 일자</div>
                        </th>
                        <th>
                           <div class="tb-center">상영 시간</div>
                        </th>
                     </tr>
                  </thead>
                  <tbody id="mvtable">


                  </tbody>
               </table>
            </div>
            <div class="mypage-paging">
               <nav>
                  <ul class="mvpagination pagination">

                  </ul>
               </nav>
               <input type="hidden" id="mvPage" value="1">
            </div>
            <div class="hd">
               <h3>스낵 구매 내역</h3>

            </div>
            <div class="tbl">
               <table summary="번호, 이미지, 상품 이름, 구매 날짜, 구매 수량, 구매 금액">

                  <colgroup>
                     <col width="150">
                     <col width="*">
                     <col width="200">
                  </colgroup>
                  <thead>
                     <tr>
                        <th><div class="tb-center">번호</div></th>
                        <th><div class="tb-center">이미지</div></th>
                        <th><div class="tb-center">상품명</div></th>
                        <th><div class="tb-center">상품 정보</div></th>
                        <th><div class="tb-center">수량</div></th>
                        <th><div class="tb-center">금액</div></th>
                     </tr>
                  </thead>
                  <tbody id="snacktable">

                  </tbody>
               </table>
            </div>

            <div class="mypage-paging">
               <nav>
                  <ul class="spagination pagination">

                  </ul>
               </nav>
               <input type="hidden" id="scPage" value="1">
            </div>

            <div class="hd">
               <h3>내가 작성한 감상평</h3>

            </div>
            <div class="tbl">
               <table summary="등록일자, 제목, 게시판">

                  <colgroup>
                     <col width="150">
                     <col width="*">
                     <col width="200">
                  </colgroup>
                  <thead>
                     <tr>
                        <th><div class="tb-center">번호</div></th>
                        <th><div class="tb-center">영화</div></th>
                        <th><div class="tb-center">제목</div></th>
                        <th>
                           <div class="tb-center">평점</div>
                        </th>
                        <th>
                           <div class="tb-center">감상평</div>
                        </th>
                        <th>
                           <div class="tb-center">등록 날짜</div>
                        </th>
                     </tr>
                  </thead>
                  <tbody id="mvcommtable">
                     <!-- 영화 후기 평점 ajax -->
                  </tbody>
               </table>
            </div>
            <div class="mypage-paging">
               <nav>
                  <ul class="mvcommpagination pagination">

                  </ul>
               </nav>
               <input type="hidden" id="mcPage" value="1">
            </div>
            <div class="hd">
               <h3>내가 작성한 QnA</h3>

            </div>
            <div class="tbl">
               <table summary="번호, 제목, 내용, 날짜">

                  <colgroup>
                     <col width="150">
                     <col width="*">
                     <col width="200">
                  </colgroup>
                  <thead>
                     <tr>
                        <th><div class="tb-center">번호</div></th>
                        <th><div class="tb-center">제목</div></th>
                        <th><div class="tb-center">내용</div></th>
                        <th><div class="tb-center">날짜</div></th>
                     </tr>
                  </thead>
                  <tbody id="qapagetable">

                  </tbody>

               </table>
            </div>
            <div class="mypage-paging">
               <nav>
                  <ul class="qpagination pagination">

                  </ul>
               </nav>
               <input type="hidden" id="qcPage" value="1">
            </div>
            <div class="hd">
               <h3>
                  나의&nbsp; <i class="fa-solid fa-heart"></i>&nbsp; 영화 장르
               </h3>

            </div>
            <div class="tbl">
               <table summary="등록일자, 제목, 게시판">

                  <colgroup>
                     <col width="150">
                     <col width="*">
                     <col width="200">
                  </colgroup>
                  <thead>
                     <tr>
                        <th><div class="tb-center">번호</div></th>
                        <th><div class="tb-center">이미지</div></th>
                        <th><div class="tb-center">영화 제목</div></th>
                        <th><div class="tb-center">장르</div></th>
                     </tr>
                  </thead>
                  <tbody id="mvltable">

                  </tbody>
               </table>
            </div>
            <div class="mypage-paging">
               <nav>
                  <ul class="mvlpagination pagination">

                  </ul>
               </nav>
               <input type="hidden" id="mvlcPage" value="1">
            </div>
            <table id="usergenre">
               <tr>
                  <td style="width: 80%;">
                     <p id="pie"></p>
                     <button id="toggle-chart">
                        <i class="fa-solid fa-chevron-down"></i>&nbsp;&nbsp;&nbsp;<b>Cinemu</b>의
                        다른 회원들과 비교해보세요!&nbsp;&nbsp;&nbsp;<i
                           class="fa-solid fa-chevron-down"></i>
                     </button>
                  </td>
                  <td>
                     <div id="myTable" style="width: 100px; border-left-style: solid;"></div>
                  </td>
               </tr>
            </table>
            <table id="totalgenre">

               <tr>
                  <td style="width: 80%;">
                     <p id="totallike"></p>
                  </td>
                  <td>
                     <div id="alltable" style="width: 100px; border-left-style: solid;"></div>
                  </td>
               </tr>
            </table>
         </div>
      </div>
      <!-- .page-body -->
   </div>
   <!-- #mypage -->
</div>
<!-- #content -->

<!-- #contentWrap -->

</body>
<script>
 $(function() {
      mvcomm();
      qna();
      snack();
      movie();
      mvlike();
      
      function mvlike() {

            let uid ='<%=(String) session.getAttribute("sessionID")%>';
            let perPage = 3;
            let totalCount = 0;
            let totalPage = 0;
            let totalBlock; // 전체 블럭수
            let beginPerPage; // 각 페이지별 시작 게시물의 index값
            let endPerPage; // 각 페이지별 마지막 게시물의 index값
            let pagePerBlock = 3; // 한 블럭당 보여질 페이지 수
            let nowBlock = 1; // 현재 블럭 -> [][][][][] -> 1block당 5개  배열 생성
             // 처음 페이지 로딩 시 1페이지를 보여줌
             getmvl(1);
             // 첫 블록일 때 이전 버튼 안보이게
             if (beginPerPage == 1) {
                 $("#mvlprevBtn").hide();
             }

             // 마지막 블록일 때 다음 버튼 안보이게
             if (endPerPage == totalPage) {
                 $("#mvlnextBtn").hide();
             }
             // 이전 블럭으로 이동하는 버튼 클릭 시 이벤트 처리
             $(".mvlpagination").on("click", "#mvlprevBtn", function(e) {
                 e.preventDefault(); // 기본 동작 방지
                 let cPage = parseInt($("#mvlcPage").val());
                 if (beginPerPage > 3) {
                    getmvl(beginPerPage - 1);
                 }
             });


         // 다음 페이지로 이동하는 버튼 클릭 시 이벤트 처리
         $(".mvlpagination").on("click", "#mvlnextBtn", function(e) {
             e.preventDefault(); // 기본 동작 방지
             let cPage = parseInt($("#mvlcPage").val());
             if (cPage < totalPage) {
                getmvl(endPerPage + 1);
             }
         });
         


         // 페이지 버튼 클릭 시 이벤트 처리
         $(".mvlpagination").on("click", ".mvlpage-link", function(e) {
             e.preventDefault(); // 기본 동작 방지
             let cPage = parseInt($(this).text());
             getmvl(cPage);
         });
          
          
             // Ajax로 데이터를 가져와서 테이블에 출력하는 함수
         function getmvl(cPage) {
             $.ajax({
                 url: "${pageContext.request.contextPath}/memberR/mvlpage?cPage="+cPage,
                 success: function(data) {
                    let table = $("#mvltable");
                     table.empty();
                     for (let i = 0; i < data.list.length; i++) {
                         let tr = $("<tr>");
                         tr.append($("<td>").text(data.list[i].rnum));
                         tr.append($("<img>").attr("src", "${pageContext.request.contextPath}/resources/img/semi_movie/" + data.list[i].mimg).css("width", "100px").css("height", "100px"));
                         tr.append($("<td>").text(data.list[i].mname));
                         tr.append($("<td>").text(data.list[i].mtype));
                         table.append(tr);
                     }
                     
                 

                     // 페이징 처리
                      totalPage = data.totalPage; // totalPage 변수 초기화
                     totalBlock = Math.ceil(totalPage / pagePerBlock); // 전체 블록 수 계산
                     nowBlock = Math.ceil(cPage / pagePerBlock); // 현재 블록 계산
                     beginPerPage = (nowBlock - 1) * pagePerBlock + 1; // 현재 페이지 범위 내에서 보여질 시작 페이지 번호 계산
                     endPerPage = nowBlock * pagePerBlock; // 현재 페이지 범위 내에서 보여질 끝 페이지 번호 계산
                     endPerPage = (endPerPage > totalPage) ? totalPage : endPerPage; // 현재 페이지 범위 내에서 보여질 끝 페이지 번호 조정

                     var pagination = $(".mvlpagination");
                     pagination.empty();


                  // 이전 블럭 버튼 생성
                    pagination.append("<li class='page-item' id='mvlprevBtn'><a class='mvlpage-link page-link' href='#'>이전</a></li>");


                     // 페이지 버튼 생성
                     for (var i = beginPerPage; i <= endPerPage; i++) {
                         var active = "";
                         if (i == cPage) {
                             active = "active";
                         }
                         var page = "<li class='page-item " + active + "'><a class='mvlpage-link page-link' href='#' onclick='getmvl(" + i + ");'>" + i + "</a></li>";
                         pagination.append(page);
                     }

                     pagination.append("<li class='page-item' id='mvlnextBtn'><a class='mvlpage-link page-link' href='#'>다음</a></li>");
                 },
             });
             
           
         }

            }
      
      function movie() {

            let uid ='<%=(String) session.getAttribute("sessionID")%>';
            let perPage = 3;
            let totalCount = 0;
            let totalPage = 0;
            let totalBlock; // 전체 블럭수
            let beginPerPage; // 각 페이지별 시작 게시물의 index값
            let endPerPage; // 각 페이지별 마지막 게시물의 index값
            let pagePerBlock = 3; // 한 블럭당 보여질 페이지 수
            let nowBlock = 1; // 현재 블럭 -> [][][][][] -> 1block당 5개  배열 생성
             // 처음 페이지 로딩 시 1페이지를 보여줌
             getmv(1);
             
             // 이전 블럭으로 이동하는 버튼 클릭 시 이벤트 처리
             $(".mvpagination").on("click", "#mvprevBtn", function(e) {
                 e.preventDefault(); // 기본 동작 방지
                 let cPage = parseInt($("#mvPage").val());
                 if (beginPerPage > 3) {
                    getmv(beginPerPage - 1);
                 }
             });


         // 다음 페이지로 이동하는 버튼 클릭 시 이벤트 처리
         $(".mvpagination").on("click", "#mvnextBtn", function(e) {
             e.preventDefault(); // 기본 동작 방지
             let cPage = parseInt($("#mvPage").val());
             if (cPage < totalPage) {
                getmv(endPerPage + 1);
             }
         });

         // 페이지 버튼 클릭 시 이벤트 처리
         $(".mvpagination").on("click", ".mvpage-link", function(e) {
             e.preventDefault(); // 기본 동작 방지
             let cPage = parseInt($(this).text());
             getmv(cPage);
         });
          
          
             // Ajax로 데이터를 가져와서 테이블에 출력하는 함수
         function getmv(cPage) {
             $.ajax({
                 url: "${pageContext.request.contextPath}/memberR/mvpage?cPage="+cPage,
                 success: function(data) {
                    let table = $("#mvtable");
                     table.empty();
                     for (let i = 0; i < data.list.length; i++) {
                         let tr = $("<tr>"); 
                         tr.append($("<td>").text(data.list[i].rnum));
                         tr.append($("<img>").attr("src", "${pageContext.request.contextPath}/resources/img/semi_movie/" + data.list[i].mimg).css("width", "100px").css("height", "100px"));
                         tr.append($("<td>").text(data.list[i].mname)); 
                         tr.append($("<td>").text(data.list[i].buy_time));
                         tr.append($("<td>").html("예매하신 <strong> " + data.list[i].mname + " </strong> 는(은) <br><strong>" + data.list[i].mbdate + "</strong> 에 <br><strong>" + data.list[i].theater_name + data.list[i].theater_no + " 관 </strong> 에서 상영합니다. 좌석번호는 <strong> "+data.list[i].seatno+"</strong>입니다."));
                         tr.append($("<td><strong>").html(data.list[i].mname + " </strong>는(은)<br> <strong>" + data.list[i].start_time + "</strong>&nbsp;에 시작하고,<br> <strong>" + data.list[i].end_time + "</strong>&nbsp;에 종료됩니다."));
                         table.append(tr);
                     }
                     
                     
                     
                     

                     // 페이징 처리
                      totalPage = data.totalPage; // totalPage 변수 초기화
                     totalBlock = Math.ceil(totalPage / pagePerBlock); // 전체 블록 수 계산
                     nowBlock = Math.ceil(cPage / pagePerBlock); // 현재 블록 계산
                     beginPerPage = (nowBlock - 1) * pagePerBlock + 1; // 현재 페이지 범위 내에서 보여질 시작 페이지 번호 계산
                     endPerPage = nowBlock * pagePerBlock; // 현재 페이지 범위 내에서 보여질 끝 페이지 번호 계산
                     endPerPage = (endPerPage > totalPage) ? totalPage : endPerPage; // 현재 페이지 범위 내에서 보여질 끝 페이지 번호 조정

                     var pagination = $(".mvpagination");
                     pagination.empty();


                  // 이전 블럭 버튼 생성
                    pagination.append("<li class='page-item' id='mvprevBtn'><a class='mvpage-link page-link' href='#'>이전</a></li>");


                     // 페이지 버튼 생성
                     for (var i = beginPerPage; i <= endPerPage; i++) {
                         var active = "";
                         if (i == cPage) {
                             active = "active";
                         }
                         var page = "<li class='page-item " + active + "'><a class='mvpage-link page-link' href='#' onclick='getmv(" + i + ");'>" + i + "</a></li>";
                         pagination.append(page);
                     }

                     pagination.append("<li class='page-item' id='mvnextBtn'><a class='mvpage-link page-link' href='#'>다음</a></li>");
                 },
             });
             
           
         }

            }
      
      function mvcomm() {

         let uid ='<%=(String) session.getAttribute("sessionID")%>';
         let perPage = 3;
         let totalCount = 0;
         let totalPage = 0;
         let totalBlock; // 전체 블럭수
         let beginPerPage; // 각 페이지별 시작 게시물의 index값
         let endPerPage; // 각 페이지별 마지막 게시물의 index값
         let pagePerBlock = 3; // 한 블럭당 보여질 페이지 수
         let nowBlock = 1; // 현재 블럭 -> [][][][][] -> 1block당 5개  배열 생성
          // 처음 페이지 로딩 시 1페이지를 보여줌
          getmvcomm(1);
          
          // 이전 블럭으로 이동하는 버튼 클릭 시 이벤트 처리
          $(".mvcommpagination").on("click", "#prevBtn", function(e) {
              e.preventDefault(); // 기본 동작 방지
              let cPage = parseInt($("#mcPage").val());
              if (beginPerPage > 3) {
                 getmvcomm(beginPerPage - 1);
              }
          });


      // 다음 페이지로 이동하는 버튼 클릭 시 이벤트 처리
      $(".mvcommpagination").on("click", "#nextBtn", function(e) {
          e.preventDefault(); // 기본 동작 방지
          let cPage = parseInt($("#mcPage").val());
          if (cPage < totalPage) {
             getmvcomm(endPerPage + 1);
          }
      });

      // 페이지 버튼 클릭 시 이벤트 처리
      $(".mvcommpagination").on("click", ".mvcommpage-link", function(e) {
          e.preventDefault(); // 기본 동작 방지
          let cPage = parseInt($(this).text());
          getmvcomm(cPage);
      });
       
       
          // Ajax로 데이터를 가져와서 테이블에 출력하는 함수
      function getmvcomm(cPage) {
          $.ajax({
              url: "${pageContext.request.contextPath}/memberR/mcpage?cPage="+cPage,
              type: "get",
              dataType: "json",
              success: function(data) {
                  let table = $("#mvcommtable");
                  table.empty();
                  for (let i = 0; i < data.list.length; i++) {
                      let tr = $("<tr>");
                      tr.append($("<td>").text(data.list[i].rnum));
                      tr.append($("<img>").attr("src", "${pageContext.request.contextPath}/resources/img/semi_movie/" + data.list[i].mimg).css("width", "100px").css("height", "100px"));
                      tr.append($("<td>").text(data.list[i].mname));
                      tr.append($("<td>").text(data.list[i].mgood));
                      tr.append($("<td>").text(data.list[i].comm));
                      tr.append($("<td>").text(data.list[i].commdate));
                      table.append(tr);
                  }
                  

                  // 페이징 처리
                totalPage = data.totalPage; // totalPage 변수 초기화
                  totalBlock = Math.ceil(totalPage / pagePerBlock); // 전체 블록 수 계산
                  nowBlock = Math.ceil(cPage / pagePerBlock); // 현재 블록 계산
                  beginPerPage = (nowBlock - 1) * pagePerBlock + 1; // 현재 페이지 범위 내에서 보여질 시작 페이지 번호 계산
                  endPerPage = nowBlock * pagePerBlock; // 현재 페이지 범위 내에서 보여질 끝 페이지 번호 계산
                  endPerPage = (endPerPage > totalPage) ? totalPage : endPerPage; // 현재 페이지 범위 내에서 보여질 끝 페이지 번호 조정

                  var pagination = $(".mvcommpagination");
                  pagination.empty();


               // 이전 블럭 버튼 생성
                 pagination.append("<li class='page-item' id='prevBtn'><a class='mvcommpage-link page-link' href='#'>Previous</a></li>");


                  // 페이지 버튼 생성
                  for (var i = beginPerPage; i <= endPerPage; i++) {
                      var active = "";
                      if (i == cPage) {
                          active = "active";
                      }
                      var page = "<li class='page-item " + active + "'><a class='mvcommpage-link page-link' href='#' onclick='getmvcomm(" + i + ");'>" + i + "</a></li>";
                      pagination.append(page);
                  }

                  pagination.append("<li class='page-item' id='nextBtn'><a class='mvcommpage-link page-link' href='#'>Next</a></li>");
              },
          });
          
        
      }

         }
      
      
      function qna() {

         let uid ='<%=(String) session.getAttribute("sessionID")%>';
         let perPage = 3;
         let totalCount = 0;
         let totalPage = 0;
         let totalBlock; // 전체 블럭수
         let beginPerPage; // 각 페이지별 시작 게시물의 index값
         let endPerPage; // 각 페이지별 마지막 게시물의 index값
         let pagePerBlock = 3; // 한 블럭당 보여질 페이지 수
         let nowBlock = 1; // 현재 블럭 -> [][][][][] -> 1block당 5개  배열 생성
          // 처음 페이지 로딩 시 1페이지를 보여줌
          getqna(1);
          
          // 이전 블럭으로 이동하는 버튼 클릭 시 이벤트 처리
          $(".qpagination").on("click", "#qprevBtn", function(e) {
              e.preventDefault(); // 기본 동작 방지
              var cPage = parseInt($("#qcPage").val());
              if (beginPerPage > 3) {
                 getqna(beginPerPage - 1);
              }
          });


      // 다음 페이지로 이동하는 버튼 클릭 시 이벤트 처리
      $(".qpagination").on("click", "#qnextBtn", function(e) {
          e.preventDefault(); // 기본 동작 방지
          var cPage = parseInt($("#qcPage").val());
          if (cPage < totalPage) {
             getqna(endPerPage + 1);
          }
      });

      // 페이지 버튼 클릭 시 이벤트 처리
      $(".qpagination").on("click", ".qpage-link", function(e) {
          e.preventDefault(); // 기본 동작 방지
          var cPage = parseInt($(this).text());
          getqna(cPage);
      });
       
       
          // Ajax로 데이터를 가져와서 테이블에 출력하는 함수
      function getqna(cPage) {
          $.ajax({
              url: "${pageContext.request.contextPath}/memberR/qnapage?cPage="+cPage,
              type: "get",
              dataType: "json",
              success: function(data) {
                 
                  let table = $("#qapagetable");
                  table.empty();
                  for (let i = 0; i < data.list.length; i++) {
                      let tr = $("<tr>");
                      tr.append($("<td>").text(data.list[i].rnum));
                      tr.append($("<td>").text(data.list[i].subject));
                      tr.append($("<td>").text(data.list[i].content));
                      tr.append($("<td>").text(data.list[i].mdate));
                      table.append(tr);
                  }
                  

                  // 페이징 처리
                totalPage = data.totalPage; // totalPage 변수 초기화
                  totalBlock = Math.ceil(totalPage / pagePerBlock); // 전체 블록 수 계산
                  nowBlock = Math.ceil(cPage / pagePerBlock); // 현재 블록 계산
                  beginPerPage = (nowBlock - 1) * pagePerBlock + 1; // 현재 페이지 범위 내에서 보여질 시작 페이지 번호 계산
                  endPerPage = nowBlock * pagePerBlock; // 현재 페이지 범위 내에서 보여질 끝 페이지 번호 계산
                  endPerPage = (endPerPage > totalPage) ? totalPage : endPerPage; // 현재 페이지 범위 내에서 보여질 끝 페이지 번호 조정

                  var pagination = $(".qpagination");
                  pagination.empty();


               // 이전 블럭 버튼 생성
                 pagination.append("<li class='page-item' id='qprevBtn'><a class='page-link qpage-link' href='#'>이전</a></li>");


                  // 페이지 버튼 생성
                  for (var i = beginPerPage; i <= endPerPage; i++) {
                      var active = "";
                      if (i == cPage) {
                          active = "active";
                      }
                      var page = "<li class='page-item " + active + "'><a class='page-link qpage-link' href='#' onclick='getqna(" + i + ");'>" + i + "</a></li>";
                      pagination.append(page);
                  }

                  pagination.append("<li class='page-item' id='qnextBtn'><a class='page-link qpage-link' href='#'>다음</a></li>");
              },
          });
          
        
      }

         }
      
      function snack() {

         let uid ='<%=(String) session.getAttribute("sessionID")%>';
         let perPage = 3;
         let totalCount = 0;
         let totalPage = 0;
         let totalBlock; // 전체 블럭수
         let beginPerPage; // 각 페이지별 시작 게시물의 index값
         let endPerPage; // 각 페이지별 마지막 게시물의 index값
         let pagePerBlock = 3; // 한 블럭당 보여질 페이지 수
         let nowBlock = 1; // 현재 블럭 -> [][][][][] -> 1block당 5개  배열 생성
          // 처음 페이지 로딩 시 1페이지를 보여줌
          getsnack(1);
          
          // 이전 블럭으로 이동하는 버튼 클릭 시 이벤트 처리
          $(".spagination").on("click", "#sprevBtn", function(e) {
              e.preventDefault(); // 기본 동작 방지
              var cPage = parseInt($("#scPage").val());
              if (beginPerPage > 3) {
                 getsnack(beginPerPage - 1);
              }
          });


      // 다음 페이지로 이동하는 버튼 클릭 시 이벤트 처리
      $(".spagination").on("click", "#snextBtn", function(e) {
          e.preventDefault(); // 기본 동작 방지
          var cPage = parseInt($("#scPage").val());
          if (cPage < totalPage) {
             getsnack(endPerPage + 1);
          }
      });

      // 페이지 버튼 클릭 시 이벤트 처리
      $(".spagination").on("click", ".spage-link", function(e) {
          e.preventDefault(); // 기본 동작 방지
          var cPage = parseInt($(this).text());
          getsnack(cPage);
      });
       
       
          // Ajax로 데이터를 가져와서 테이블에 출력하는 함수
      function getsnack(cPage) {
          $.ajax({
              url: "${pageContext.request.contextPath}/memberR/snpage?cPage="+cPage,
              type: "get",
              dataType: "json",
              success: function(data) {
                  let table = $("#snacktable");
                  table.empty();
                  for (let i = 0; i < data.list.length; i++) {
                      let tr = $("<tr>");
                      tr.append($("<td>").text(data.list[i].rnum));
                      tr.append($("<img>").attr("src", "${pageContext.request.contextPath}/resources/img/" + data.list[i].popimg).css("width", "100px").css("height", "100px"));
                      tr.append($("<td>").text(data.list[i].popname));
                      tr.append($("<td>").text(data.list[i].snackdetail));
                      tr.append($("<td>").text(data.list[i].snacksaram));
                      tr.append($("<td>").text(data.list[i].poppay));
                      table.append(tr);
                  }
                  

                  // 페이징 처리
                totalPage = data.totalPage; // totalPage 변수 초기화
                  totalBlock = Math.ceil(totalPage / pagePerBlock); // 전체 블록 수 계산
                  nowBlock = Math.ceil(cPage / pagePerBlock); // 현재 블록 계산
                  beginPerPage = (nowBlock - 1) * pagePerBlock + 1; // 현재 페이지 범위 내에서 보여질 시작 페이지 번호 계산
                  endPerPage = nowBlock * pagePerBlock; // 현재 페이지 범위 내에서 보여질 끝 페이지 번호 계산
                  endPerPage = (endPerPage > totalPage) ? totalPage : endPerPage; // 현재 페이지 범위 내에서 보여질 끝 페이지 번호 조정

                  var pagination = $(".spagination");
                  pagination.empty();


               // 이전 블럭 버튼 생성
                 pagination.append("<li class='page-item' id='sprevBtn'><a class='page-link spage-link' href='#'>이전</a></li>");


                  // 페이지 버튼 생성
                  for (var i = beginPerPage; i <= endPerPage; i++) {
                      var active = "";
                      if (i == cPage) {
                          active = "active";
                      }
                      var page = "<li class='page-item " + active + "'><a class='page-link spage-link' href='#' onclick='getsnack(" + i + ");'>" + i + "</a></li>";
                      pagination.append(page);
                  }

                  pagination.append("<li class='page-item' id='snextBtn'><a class='page-link spage-link' href='#'>다음</a></li>");
              },
          });
          
        
      }

         }
      
   });

   
   $(function () {
   
       let uid = '<%=(String) session.getAttribute("sessionID")%>';
       var contextPath = '${pageContext.request.contextPath}';
       $('#usergenre .c3-chart-arc').click(function() {
            
             let genre = $(this).attr('class').split(' ');
             let genrelist = genre[2].substr(10)
             console.log('genrelist=>'+genrelist);
             
             $.ajax({
                url: contextPath+'/mtname?lid='+uid+'&genrelist='+genrelist,
                type: 'GET',
                cache:false,
                async:false,
                dataType: "json",
                success: function(data) {
                    console.log(data);
                    //data = JSON.parse(data); // 추가된 부분
                    let str = '';
                    for(const item of data) {
                      str += '<tr><td>' + item + '</td></tr>';
                    }
                    $('#myTable').html(str);
                },
                error: function(xhr, status, error) {
                    console.error(error);
                }
            });
         });
       
       // 전체 선호영화 장르 영화 이름들
         $('#totalgenre .c3-arc').click(function() {
             let togenre = $(this).attr('class').split(' ');
             console.log('togenre=>'+togenre[4]);
             let togenrelist = togenre[4].substr(7)
             console.log('togenrelist=>'+togenrelist);
             
             $.ajax({
                url: contextPath+'/tomtname?togenrelist='+togenrelist,
                type: 'GET',
                cache:false,
                dataType: "json",
                success: function(data) {
                    console.log(data);                 
                    let str = '';
                    for(const item of data) {
                   str += '<tr><td>' + item + '</td></tr>';
                   console.log("item"+item)
                    }
                    $('#alltable').html(str);
                },
                error: function(xhr, status, error) {
                    console.error(error);
                }
            });
         });
      
   });
   
   $(function() {
      $('#mfile').hide();
      
      $('#btn').click(function() {
         $('#mfile').click();   
      })
      
      $('#toggle-chart').click(function() {
         $('#totalgenre').toggle();
       });
      
   });
   
   function readURL(input) {
         // input type= "file"의 주소를 가져온다.
         if (input.files && input.files[0]) {
            // 자바스크립트 I/O
            var reader = new FileReader();
            // 감지자
            reader.onload = function(e) {
               $('#imgx').attr('src', e.target.result); // setter 넣겠다.
            }
            reader.readAsDataURL(input.files[0]);
         }
         
      }
      //jQuery문법
      $(function() {
         //jQuery 선택자
         //대상선택자에서 변화를 감지하는 이벤트: change()
         $('#mfile').change(function() {
            if ($(this).val().length > 0) {
               readURL(this);
            } else {
               console.log("이미지 없다.");
            }
         });
      });
      
      let uid = '<%=(String) session.getAttribute("sessionID")%>';
      console.log("uid====>"+uid);
      $.ajax({
          url : "../likemtype?lid="+uid,
          contentType : "application/json; charset:UTF-8",
          cache:false,
          async:false,
          success : function(jsondata) {
         console.log(jsondata)
             var chart = c3.generate({
                bindto : '#pie',
                size: {
                    width: 800,
                    height: 600
                },   
                data : {
                   json : [jsondata[1]],
                   keys : {
                      value : Object.keys(jsondata[1]),
                   },
                   type : 'donut', 
                   colors: {
                      '드라마': '#FF9AA2',
                      '멜로': '#c6e2ff',
                      '로맨스': '#FDDBC7',
                      '미스터리': '#D6EFFF',
                      '판타지': '#A0C4FF',
                      '다큐멘터리': '#B5EAD7',
                      '스릴러': '#E2F0CB',
                      'SF': '#FFF1C1',
                      '코미디': '#FFB7B2',
                      '애니메이션': '#F9D5E5',
                      '액션': '#CAE4DB',
                      '서사': '#EDB183',
                      '공포': '#C5DCA0',
                      '느와르': '#B2B2B2',
                      '가족': '#E4F9F5',
                      '범죄': '#FFE5D9',
                      '서스펜스': '#B7B7A4',
                      '전쟁': '#F6E7C1',
                      '모험': '#FFC2E2'
                      }
                            },
                donut : {
                    title : uid+'님의 선호영화장르',
                    
                },
             });
             //----------------------
          },
          error : function(e) {
             console.log("실패")
          }
       });
      // 전체 좋아요 차트
       $.ajax({
          url : "../totallikemtype",
          contentType : "application/json; charset:UTF-8",
          cache:false,
          async:false,
          success : function(jsondata) {
         console.log(jsondata)
             var chart = c3.generate({
                bindto : '#totallike',
                size: {
                    width: 800,
                    height: 600
                },   
                data : {
                   json : [jsondata[1]],
                   keys : {
                      value : Object.keys(jsondata[1]),
                   },
                   type : 'donut', 
                   colors: {
                      '드라마': '#FF9AA2',
                      '멜로': '#c6e2ff',
                      '로맨스': '#FDDBC7',
                      '미스터리': '#D6EFFF',
                      '판타지': '#A0C4FF',
                      '다큐멘터리': '#B5EAD7',
                      '스릴러': '#E2F0CB',
                      'SF': '#FFF1C1',
                      '코미디': '#FFB7B2',
                      '애니메이션': '#F9D5E5',
                      '액션': '#CAE4DB',
                      '서사': '#EDB183',
                      '공포': '#C5DCA0',
                      '느와르': '#B2B2B2',
                      '가족': '#E4F9F5',
                      '범죄': '#FFE5D9',
                      '서스펜스': '#B7B7A4',
                      '전쟁': '#F6E7C1',
                      '모험': '#FFC2E2'
                      }
                            },
                donut : {
                    title : '최근 Cinemu 회원들의 선호영화장르',
                    
                },
             });
             //----------------------
          },
          error : function(e) {
             console.log("실패")
          }
       });
      
      $(function() {   

      });
      
      
   </script>
  