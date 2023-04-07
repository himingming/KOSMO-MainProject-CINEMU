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
   
   /* 결제완료 booked 변화
   @RequestMapping(value = "/seatBooked", produces = "application/json;charset=utf-8")
   public String getSeatBooked(@ModelAttribute SeatDTO seatvo) {
          int booked = seatDAOInter.updateBooked(seatvo);
           if (booked == 1) {
               return "좌석 예약이 완료되었습니다.";
           } else {
               return "이미 예약된 좌석입니다.";
           }
       }
    */
   
}