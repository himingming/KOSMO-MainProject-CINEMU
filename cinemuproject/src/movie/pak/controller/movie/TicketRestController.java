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
   
   // 결제 마일리지 차감 
   @RequestMapping(value = "/MileageDed", produces = "application/json;charset=utf-8")
   public Map<String, Object> updateMileage(@RequestParam String lid, @RequestParam int subtractAmount ){
      Map<String, Object> resultMap = new HashMap<>();
      try {
      Map<String, Object> paramMap = new HashMap<>();
      paramMap.put("lid", lid);
      paramMap.put("subtractAmount", subtractAmount);
      ticketDAOInter.updateMileage(paramMap);
      resultMap.put("success", true);
      resultMap.put("message", "마일리지가 성공적으로 차감되었습니다.");
      } catch (Exception e) {
      resultMap.put("success", false);
      resultMap.put("message", "마일리지 차감 중 오류가 발생하였습니다. 다시 시도해주세요.");
      e.printStackTrace();
      }
      return resultMap;
      }
}