<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<article>
   <header>
      <h1>Contact</h1>
   </header>
   <ul class="list-unstyled">
      <li class="border-top my-3"></li>
   </ul>
<div class="container">
  <label for="movie-name">영화 제목:</label>
  <input type="text" name="mname" id="movie-name">
  <button id="submit-btn">추천 받기</button>
  <div id="recommendation-list"></div>
</div>
   
</article>
<script>
$(document).ready(function() {
    $('#submit-btn').click(function() {
   let mname = $('input[name="mname"]').val()   
    console.log('mname=>'+ mname);  
      $.ajax({
        type: 'GET',
        url: 'http://192.168.0.177:9000/mvrd/list',
        data: {
            'mname': $('input[name="mname"]').val(),         
        },
        dataType: 'jsonp',     
        crossDomain: true,
        success: function(data) {
            console.log('JSONP');
            let recommendations = data.result;
            let resultList = $('#recommendation-list');
            resultList.empty();
            if (recommendations.length == 0) {
              resultList.empty().append($('<p>').text('추천 결과가 없습니다.'));
            } else {
              resultList.append($('<table>').addClass('table'));
              let thead = $('<thead>').appendTo($('#recommendation-list > table'));
              let tr = $('<tr>').appendTo(thead);
              $('<th>').text('영화 제목').appendTo(tr);
              $('<th>').text('상관 계수').appendTo(tr);
              $('<th>').text('장르').appendTo(tr);              
              let tbody = $('<tbody>').appendTo($('#recommendation-list > table'));
              $.each(recommendations, function(i, recommendation) {
                let title = recommendation.Title;
                let correlation = recommendation.Correlation;
                let genre = recommendation.Genre.join(', ');
                let tr = $('<tr>').appendTo(tbody);
                $('<td>').text(title).appendTo(tr);
                $('<td>').text(correlation).appendTo(tr);
                $('<td>').text(genre).appendTo(tr);
              });
            }
          },
          error: function() {
            let resultList = $('#recommendation-list');
            resultList.empty().append($('<p>').text('추천 결과가 없습니다.'));
          }
        });
      });
    });

</script>