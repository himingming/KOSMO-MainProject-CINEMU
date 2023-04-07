function ajaxList(ajaxUrl, numPerPage, obj, callback) {
   
 // console.log("ajaxUrl2========>"+ajaxUrl);
  let currentPage = 1;
  const tableId = $('#' + obj).attr('id');
  const tableBody = $('#' + tableId + ' tbody');
  const moreButton = $('#' + tableId + ' button');
  //console.log("numPerPage========>"+numPerPage);
  currentPage +=numPerPage;
  console.log("currentPage========>"+currentPage);
 // console.log("moreButton========>"+tableBody);
  // 데이터를 기다리는 동안 로딩 인디케이터를 추가합니다.
  moreButton.text('Loading...');
  moreButton.attr('disabled', true);
  $.ajaxSetup({ cache: false });

  $.ajax({
    url: ajaxUrl + currentPage,
    success: function (data) {
       
      // 로딩 인디케이터를 제거합니다.
      moreButton.text('More');
      moreButton.attr('disabled', false);
      callback(data);
      

      if (data.length < numPerPage) {
        moreButton.remove();
      }

      // 콜백 함수를 호출하여 로드된 데이터를 전달합니다.
      // 다음 로드를 위해 현재 페이지를 증가합니다.
      //currentPage += 1;
    },
    error: function () {
      // 요청이 실패한 경우 오류 메시지를 표시합니다.
      moreButton.text('Error');
    }
  });
   /*
  // "More" 버튼에 클릭 이벤트 리스너를 추가하여 추가 데이터를 로드합니다.
  moreButton.on('click', function () {
    // 추가 데이터를 로드하기 전에 로딩 인디케이터를 추가합니다.
    moreButton.text('Loading...');
    moreButton.attr('disabled', true);

    $.ajax({
      url: ajaxUrl + currentPage,
      success: function (data) {
        // 로딩 인디케이터를 제거합니다.
        moreButton.text('More');
        moreButton.attr('disabled', false);
        callback(data);

        if (data.length < numPerPage) {
          moreButton.remove();
        }

        // 콜백 함수를 호출하여 로드된 데이터를 전달합니다.

        // 다음 로드를 위해 현재 페이지를 증가합니다.
       //currentPage += 1;
      },
      error: function () {
        // 요청이 실패한 경우 오류 메시지를 표시합니다.
        moreButton.text('Error');
      }
    });
  });*/
}