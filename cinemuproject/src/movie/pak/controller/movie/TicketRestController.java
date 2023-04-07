package movie.pak.controller.movie;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import movie.pak.dao.movie.TicketDAOInter;
import movie.pak.dto.LoginDTO;

@RestController
@RequestMapping(value = "/Mileage")
public class TicketRestController {

   @Autowired
   private TicketDAOInter ticketDAOInter;
   
   // ���� ���ϸ��� ���� 
   @RequestMapping(value = "/MileageDed", produces = "application/json;charset=utf-8")
   public Map<String, Object> updateMileage(@RequestParam String lid, @RequestParam int subtractAmount ){
      Map<String, Object> resultMap = new HashMap<>();
      try {
      Map<String, Object> paramMap = new HashMap<>();
      paramMap.put("lid", lid);
      paramMap.put("subtractAmount", subtractAmount);
      ticketDAOInter.updateMileage(paramMap);
      resultMap.put("success", true);
      resultMap.put("message", "���ϸ����� ���������� �����Ǿ����ϴ�.");
      } catch (Exception e) {
      resultMap.put("success", false);
      resultMap.put("message", "���ϸ��� ���� �� ������ �߻��Ͽ����ϴ�. �ٽ� �õ����ּ���.");
      e.printStackTrace();
      }
      return resultMap;
      }
}