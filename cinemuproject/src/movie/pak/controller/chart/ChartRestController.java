package movie.pak.controller.chart;

import java.util.Arrays;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import movie.pak.dao.MyPageDAOInter;
import movie.pak.dao.movie.ChartDAOInter;
import movie.pak.dto.LoginDTO;
import movie.pak.dto.TotallikeDTO;

@RestController
public class ChartRestController {
   
      @Autowired // 땡겨와라
      public ChartDAOInter chartDAOInter;
      
      @Autowired
      private MyPageDAOInter myPageDaoInter;

      // produces = "text/html;charset=euc-kr") => content-Type을 지정하는 속성
      @RequestMapping(value = "/genDonut", produces = "application/json;charset=utf-8")
      public String genChart(int mno) {

         String mvTitle = chartDAOInter.movTitle(mno); //영화 제목
        

         List<LoginDTO> list = chartDAOInter.genDonut(mno);
         
         Map<String, Integer> map = new HashedMap();

         for (int i = 0; i < list.size(); i++) {
            map.put(list.get(i).getLgender(), list.get(i).getCnt());
         }
        
         String res = null;
         ObjectMapper mapper = new ObjectMapper();
         try {
            res = mapper.writeValueAsString(map);
            res = "[{\"movieTitle\":\"" + mvTitle + "\"}," + res + "]";
           
         } catch (JsonProcessingException e) {
           
            e.printStackTrace();
         }
         return res;
      }
      
      @RequestMapping(value = "/ageBar", produces = "application/json;charset=utf-8")
      public String ageChart(int mno) {
         
         String mvTitle = chartDAOInter.movTitle(mno); //영화 제목 가져오기
         
         List<Map<String, Integer>> list = chartDAOInter.ageBarlist(mno); //맵에 담아서 리스트로 가져오자
         Map<Object, Object> map = new LinkedHashMap<Object, Object>(); //HashMap은 저장 순서대로 저장안됨. 되는건 얘
               //HashedMap(); // Map<String, Integer> 안됨.......왜지???
       
         for (int i = 0; i < list.size(); i++) { //리스트 사이즈 구해서
            map.put(list.get(i).get("AGES"), list.get(i).get("CNT")); // k값,v값 설정해서map넣기 
         }
         // -----------
         String res = null;
         ObjectMapper mapper = new ObjectMapper();
         try {
            res = mapper.writeValueAsString(map);
            res = "[{\"movieTitle\":\"" + mvTitle + "\"}," + res + "]";
           
         } catch (JsonProcessingException e) {
            e.printStackTrace();
         }
         return res;
         // -----------
      }
      
   // 내가 좋아요 누른 영화의 장르 차트
      @RequestMapping(value = "/likemtype", produces = "application/json;charset=utf-8")
      public String test(String lid) {
          List<String> mtype = myPageDaoInter.liketype(lid);
          Map<String, Integer> map = new HashMap<>();
          
          for (String type : mtype) {
              List<String> mtypeList = Arrays.asList(type.split("/")); // Arrays.asList() 사용하여 /로 구분된 문자열을 나누어 리스트로 변환
              for (String genre : mtypeList) { 
                  Integer count = map.getOrDefault(genre, 0);
                  Integer allcount = count + 1; 
                  map.put(genre, allcount);   //리스트를 돌며 map에 장르와 그에 해당하는 카운트 값을 저장
              }
          }
          
          Map<String, Integer> sortedMap = map.entrySet().stream()
                  .sorted(Map.Entry.comparingByValue(Comparator.reverseOrder())) //역순정렬
                  .limit(5) //갯수를 5개까지로 정해줌
                  .collect(Collectors.toMap( // Collectors 클래스의 toMap 메소드를 이용하여 key를 그대로 유지하고, value를 그대로 유지하며, 동일한 key가 있는 경우 값을 더하여 병합하고, 
                        // 최종 결과를 LinkedHashMap으로 반환
                          Map.Entry::getKey, Map.Entry::getValue, (e1, e2) -> e1, LinkedHashMap::new)); // LinkedHashMap은 입력된 순서를 유지 -> 아래의 주석 코드와 같음
                      /*
                       * Map<String, Integer> map = new LinkedHashMap<>();
                        for (Map.Entry<String, Integer> entry : entries) {
                         map.put(entry.getKey(), entry.getValue());
                        }
                       * */
          
          String ref = null;
          ObjectMapper mapper = new ObjectMapper(); // ObjectMapper를 사용하여 Map객체를 JSON 형태로 변환
          try {
               ref = mapper.writeValueAsString(sortedMap); //변환한 후, ref 문자열에 저장
               ref = "[{},"+ ref +"]"; //"[{},{"액션":27,"드라마":13,"스릴러":11,"로맨스":10,"코미디":8}]" -> 이런식으로 만듬
               System.out.println(ref);
            } catch (JsonProcessingException e) {
               e.printStackTrace();
            }
          return ref;
      }
      // 내가 좋아요 누른 영화의 장르 별 이름들
      @RequestMapping(value = "/mtname",  produces = "application/json;charset=utf-8")
      public List<String> getMtname(String lid, String genrelist){         
         System.out.println(genrelist);
         System.out.println(lid);
         return myPageDaoInter.mtname(lid, genrelist);
      }
      // 전체 회원이 누른 좋아요 영화의 장르
      @RequestMapping(value = "/totallikemtype",  produces = "application/json;charset=utf-8")
      public String totaltype() {
         List<TotallikeDTO> tolist = myPageDaoInter.totalliketype();
         Map<String, Integer> map = new HashMap<>();
         
         for (TotallikeDTO e : tolist) {
              map.put(e.getMtype(), e.getCount());
          }
         
          String res = null;
          ObjectMapper mapper = new ObjectMapper();
          try {
              res = mapper.writeValueAsString(map);
              res = "[{},"+ res +"]";
              System.out.println(res);
           } catch (JsonProcessingException e) {
             
              e.printStackTrace();
           }
           return res;
      }
      // 전체 회원이 누른 좋아요 영화의 장르 별 영화 이름
      @RequestMapping(value = "/tomtname", produces = "application/json;charset=utf-8")
      public List<String> gettoMtname(String togenrelist){         
         System.out.println(togenrelist);
         return myPageDaoInter.tomtname(togenrelist);
      }

}