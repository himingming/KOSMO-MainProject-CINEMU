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
   // Pageó���� ���� �Ӽ�
   private int nowPage = 1; // ���� ������ �� -> �޴� �������� �����Ǵ� ����
   private int numPerPage = 10; // �� �������� ������ �Խù� ��
   private int beginPerPage; // �� �������� ���� �Խù��� index��
   private int endPerPage; // �� �������� ������ �Խù��� index��
   // --------------------------------------------------
   
   //../searchAjax?code=QnA&searchValue=��&cPage=1
   @RequestMapping(value = "/searchAjax", produces = "application/json;charset=utf-8")
   public String searchAjax(String code, String searchValue, String cPage) {

      PageSearchDTO psvo = new PageSearchDTO();
      psvo.setSearchValue(searchValue);
      
      // --------------Page ó���ϱ�
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