package movie.pak.controller.movie;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import movie.pak.dao.movie.SeatDAOInter;
import movie.pak.dao.movie.TicketDAOInter;
import movie.pak.dto.LoginDTO;
import movie.pak.dto.MovieBuyDTO;
import movie.pak.dto.SeatAddDTO;
import movie.pak.dto.SeatDTO;
import movie.pak.dto.TicketaddDTO;

@Controller
@RequestMapping("/successticket")
public class TicketController {
   
   @Autowired
   private TicketDAOInter ticketDAOInter;
   
   @Autowired
   private SeatDAOInter seatDAOInter;
   
    // ����â���� �Ѿ �� ������ �� ������ �� 
      @RequestMapping(value = "/addTicket")
      public ModelAndView TicketList(TicketaddDTO ttvo, SeatAddDTO saddvo, HttpServletRequest request, LoginDTO mvo, SeatDTO seatvo ) {
         System.out.println("submit �׽�Ʈ");
         ModelAndView mav = new ModelAndView("movie/ticketPay");
         mav.addObject("ticket", ttvo);
         mav.addObject("svokey", saddvo);
       
           HttpSession session = request.getSession(false);
         String id = (String) session.getAttribute("sessionID");
         int lmileage = ticketDAOInter.getMileage(id);
         mvo.setLmileage(lmileage); // LoginDTO ��ü�� lmileage ����
           mav.addObject("mvo", mvo);
           
           List<String> seatnoList = Arrays.asList(ttvo.getSeatno().split(","));
             SeatDTO svo = new SeatDTO();
             svo.setTheater_id(saddvo.getTheater_id());
             svo.setScreening_id(saddvo.getScreening_id());

             int updatedRows = seatDAOInter.updateBookedBatch(seatnoList, svo);
             if (updatedRows == seatnoList.size()) {
                 System.out.println("�¼� ������ �Ϸ�Ǿ����ϴ�.");
             } else {
                 System.out.println("�Ϻ� �¼� ���࿡ �����Ͽ����ϴ�.");
             }
         return mav;
      }
      
   //�����Ϸ� insert��
      @RequestMapping(value = "/ticketComplate")
      public ModelAndView insertTicket(MovieBuyDTO mbvo, TicketaddDTO ttvo, SeatAddDTO saddvo, LoginDTO mvo, MovieBuyDTO mbbvo) {
      ticketDAOInter.insertTicket(mbvo);
       ModelAndView mav = new ModelAndView("movie/paySuccess");
        mav.addObject("ticket", ttvo);
         mav.addObject("svokey", saddvo);
         mav.addObject("mvo", mvo);
         mav.addObject("mbbvo", mbbvo);   
      return mav;
   }

}