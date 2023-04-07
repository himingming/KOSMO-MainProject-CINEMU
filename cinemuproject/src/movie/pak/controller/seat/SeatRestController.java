package movie.pak.controller.seat;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import movie.pak.dao.movie.SeatDAOInter;
import movie.pak.dto.SeatDTO;

@RestController
@RequestMapping(value = "/getSeat")
public class SeatRestController {

   @Autowired
   private SeatDAOInter seatDAOInter;
   
   @RequestMapping(value = "/seats" , produces = "application/json;charset=utf-8" )
     public List<SeatDTO> getSeatsByTheaterAndScreening(
         @RequestParam(name = "theater_id") int theater_id,
         @RequestParam(name = "screening_id") int screening_id) {
       Map<String, Object> map = new HashMap<>();
       map.put("theater_id", theater_id);
       map.put("screening_id", screening_id);
       return seatDAOInter.getSeatClick(map);
     }
   
   /* �����Ϸ� booked ��ȭ
   @RequestMapping(value = "/seatBooked", produces = "application/json;charset=utf-8")
   public String getSeatBooked(@ModelAttribute SeatDTO seatvo) {
          int booked = seatDAOInter.updateBooked(seatvo);
           if (booked == 1) {
               return "�¼� ������ �Ϸ�Ǿ����ϴ�.";
           } else {
               return "�̹� ����� �¼��Դϴ�.";
           }
       }
    */
   
}