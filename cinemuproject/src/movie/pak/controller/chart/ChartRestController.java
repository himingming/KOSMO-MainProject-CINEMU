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
   
      @Autowired // ���ܿͶ�
      public ChartDAOInter chartDAOInter;
      
      @Autowired
      private MyPageDAOInter myPageDaoInter;

      // produces = "text/html;charset=euc-kr") => content-Type�� �����ϴ� �Ӽ�
      @RequestMapping(value = "/genDonut", produces = "application/json;charset=utf-8")
      public String genChart(int mno) {

         String mvTitle = chartDAOInter.movTitle(mno); //��ȭ ����
        

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
         
         String mvTitle = chartDAOInter.movTitle(mno); //��ȭ ���� ��������
         
         List<Map<String, Integer>> list = chartDAOInter.ageBarlist(mno); //�ʿ� ��Ƽ� ����Ʈ�� ��������
         Map<Object, Object> map = new LinkedHashMap<Object, Object>(); //HashMap�� ���� ������� ����ȵ�. �Ǵ°� ��
               //HashedMap(); // Map<String, Integer> �ȵ�.......����???
       
         for (int i = 0; i < list.size(); i++) { //����Ʈ ������ ���ؼ�
            map.put(list.get(i).get("AGES"), list.get(i).get("CNT")); // k��,v�� �����ؼ�map�ֱ� 
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
      
   // ���� ���ƿ� ���� ��ȭ�� �帣 ��Ʈ
      @RequestMapping(value = "/likemtype", produces = "application/json;charset=utf-8")
      public String test(String lid) {
          List<String> mtype = myPageDaoInter.liketype(lid);
          Map<String, Integer> map = new HashMap<>();
          
          for (String type : mtype) {
              List<String> mtypeList = Arrays.asList(type.split("/")); // Arrays.asList() ����Ͽ� /�� ���е� ���ڿ��� ������ ����Ʈ�� ��ȯ
              for (String genre : mtypeList) { 
                  Integer count = map.getOrDefault(genre, 0);
                  Integer allcount = count + 1; 
                  map.put(genre, allcount);   //����Ʈ�� ���� map�� �帣�� �׿� �ش��ϴ� ī��Ʈ ���� ����
              }
          }
          
          Map<String, Integer> sortedMap = map.entrySet().stream()
                  .sorted(Map.Entry.comparingByValue(Comparator.reverseOrder())) //��������
                  .limit(5) //������ 5�������� ������
                  .collect(Collectors.toMap( // Collectors Ŭ������ toMap �޼ҵ带 �̿��Ͽ� key�� �״�� �����ϰ�, value�� �״�� �����ϸ�, ������ key�� �ִ� ��� ���� ���Ͽ� �����ϰ�, 
                        // ���� ����� LinkedHashMap���� ��ȯ
                          Map.Entry::getKey, Map.Entry::getValue, (e1, e2) -> e1, LinkedHashMap::new)); // LinkedHashMap�� �Էµ� ������ ���� -> �Ʒ��� �ּ� �ڵ�� ����
                      /*
                       * Map<String, Integer> map = new LinkedHashMap<>();
                        for (Map.Entry<String, Integer> entry : entries) {
                         map.put(entry.getKey(), entry.getValue());
                        }
                       * */
          
          String ref = null;
          ObjectMapper mapper = new ObjectMapper(); // ObjectMapper�� ����Ͽ� Map��ü�� JSON ���·� ��ȯ
          try {
               ref = mapper.writeValueAsString(sortedMap); //��ȯ�� ��, ref ���ڿ��� ����
               ref = "[{},"+ ref +"]"; //"[{},{"�׼�":27,"���":13,"������":11,"�θǽ�":10,"�ڹ̵�":8}]" -> �̷������� ����
               System.out.println(ref);
            } catch (JsonProcessingException e) {
               e.printStackTrace();
            }
          return ref;
      }
      // ���� ���ƿ� ���� ��ȭ�� �帣 �� �̸���
      @RequestMapping(value = "/mtname",  produces = "application/json;charset=utf-8")
      public List<String> getMtname(String lid, String genrelist){         
         System.out.println(genrelist);
         System.out.println(lid);
         return myPageDaoInter.mtname(lid, genrelist);
      }
      // ��ü ȸ���� ���� ���ƿ� ��ȭ�� �帣
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
      // ��ü ȸ���� ���� ���ƿ� ��ȭ�� �帣 �� ��ȭ �̸�
      @RequestMapping(value = "/tomtname", produces = "application/json;charset=utf-8")
      public List<String> gettoMtname(String togenrelist){         
         System.out.println(togenrelist);
         return myPageDaoInter.tomtname(togenrelist);
      }

}