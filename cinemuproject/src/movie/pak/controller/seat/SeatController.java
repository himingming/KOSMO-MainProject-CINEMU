package movie.pak.controller.seat;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import movie.pak.dao.movie.SeatDAOInter;
import movie.pak.dto.SeatAddDTO;


@Controller
@RequestMapping(value = "/seat")
public class SeatController {

   @Autowired
   private SeatDAOInter seatDAOInter;

   @GetMapping(value = "/SeatForm")
   public String seatForm() {
      return "seat/selectSeat";
   }

   // 예매창에서 좌석 페이지 넘어갈 때 가지고 갈 데이터
   @RequestMapping(value = "/seatclick")
   public ModelAndView seatList(SeatAddDTO saddvo) {
     
      ModelAndView mav = new ModelAndView("seat/selectSeat");
      // 예매 -> 좌석으로 넘어갈 때 가지고 갈 데이터 값
      mav.addObject("svokey", saddvo);
      return mav;
   }
   /*
   @RequestMapping(value = "/seatBooked")
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