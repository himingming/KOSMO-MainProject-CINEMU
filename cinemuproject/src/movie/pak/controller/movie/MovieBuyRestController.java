package movie.pak.controller.movie;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import movie.pak.dao.movie.MovieBuyDAOInter;
import movie.pak.dto.ScreeningDTO;
import movie.pak.dto.SeatDTO;
import movie.pak.dto.TheaterDTO;

@RestController
@RequestMapping(value = "/theaterBooking")
public class MovieBuyRestController {

    @Autowired
      public MovieBuyDAOInter movieBuyDAOInter;
    
   // 상영관 theater_no 리스트 뽑기 ex) 가산점 : 1관
    @RequestMapping(value = "/theaterNo", produces = "application/json;charset=utf-8")
    public List<TheaterDTO> theaterNo(@RequestParam String theater_name) {
       System.out.println("theater_name=>"+theater_name);
        List<TheaterDTO> theaterNum = movieBuyDAOInter.theaterNo(theater_name);
        return theaterNum;
    }

   // 상영관의 상영 시간 리스트 뽑기
    @RequestMapping(value = "/screening-times", produces = "application/json;charset=utf-8")
    public List<ScreeningDTO> getScreeningTimesByTheaterId(@RequestParam int theater_id, @RequestParam int mno) {
        System.out.println("===============================");
        System.out.println("theater_id=>" + theater_id);
        System.out.println("mno=>" + mno);
       
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("theater_id", theater_id);
        paramMap.put("mno", mno);
     
        List<ScreeningDTO> timeno = movieBuyDAOInter.ScreeningTime(paramMap);
        return timeno;
    }
    
    // 남은 좌석/ 총 좌석 
    @RequestMapping( value = "/seatInfo", produces = "application/json;charset=utf-8")
       public SeatDTO getSeatInfoByTheaterId(@RequestParam("theater_id") int theater_id, @RequestParam("screening_id") int screening_id) {
        Map<String, Object> paramMap = new HashMap<>();  
        paramMap.put("theater_id", theater_id);
           paramMap.put("screening_id", screening_id);
           try {
               SeatDTO seatInfo = movieBuyDAOInter.getSeatInfoByTheaterId(paramMap);
               return seatInfo;
           } catch (Exception e) {
               e.printStackTrace();
               return null;
           }
       }
}