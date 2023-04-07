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

   // ����â���� �¼� ������ �Ѿ �� ������ �� ������
   @RequestMapping(value = "/seatclick")
   public ModelAndView seatList(SeatAddDTO saddvo) {
     
      ModelAndView mav = new ModelAndView("seat/selectSeat");
      // ���� -> �¼����� �Ѿ �� ������ �� ������ ��
      mav.addObject("svokey", saddvo);
      return mav;
   }
   /*
   @RequestMapping(value = "/seatBooked")
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