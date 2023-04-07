package movie.pak.controller.movie;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import movie.pak.dao.SearchQueryDaoInter;
import movie.pak.dto.MovieCommDTO;
import movie.pak.dto.MovieUpDTO;
import movie.pak.dto.PageSearchDTO;
import movie.pak.dto.QnABoardDTO;

@RestController
public class SchQRestController {

   @Autowired
   private SearchQueryDaoInter searchQueryInter;

   // -----------------------------------------------
   // Page처리를 위한 속성
   private int nowPage = 1; // 현재 페이지 값 -> 메뉴 페이지와 연동되는 변수
   private int numPerPage = 10; // 한 페이지당 보여질 게시물 수
   private int beginPerPage; // 각 페이지별 시작 게시물의 index값
   private int endPerPage; // 각 페이지별 마지막 게시물의 index값
   // --------------------------------------------------
   
   //../searchAjax?code=QnA&searchValue=스&cPage=1
   @RequestMapping(value = "/searchAjax", produces = "application/json;charset=utf-8")
   public String searchAjax(String code, String searchValue, String cPage) {

      PageSearchDTO psvo = new PageSearchDTO();
      psvo.setSearchValue(searchValue);
      
      // --------------Page 처리하기
      String s_page = cPage;
      if (s_page != null) {
         nowPage = Integer.parseInt(s_page);
      }
      beginPerPage = nowPage;
      endPerPage = beginPerPage+numPerPage-1;
      psvo.setBegin(beginPerPage);
      psvo.setEnd(endPerPage);
      //-----------------------------
      String res = "";
      ObjectMapper mapper = new ObjectMapper();
      
      //-----------------------------
      if(code.contains("QnA")) {
         List<QnABoardDTO> qlist = searchQueryInter.getQnaP(psvo);
         try {
            res = mapper.writeValueAsString(qlist);
         } catch (JsonProcessingException e) {
            e.printStackTrace();
         }
         
      }else if (code.contains("Review")) {
         List<MovieCommDTO> mclist = searchQueryInter.getMCommP(psvo);
        
         try {
            res = mapper.writeValueAsString(mclist);
         } catch (JsonProcessingException e) {
            e.printStackTrace();
         }
      }else if (code.contains("Mov")) {
         List<MovieUpDTO> movlist = searchQueryInter.getMovP(psvo);
        
         try {
            res = mapper.writeValueAsString(movlist);
         } catch (JsonProcessingException e) {
            e.printStackTrace();
         }
      }
      
      return res;
   }
}