package movie.pak.controller.movie;

//3/8 ���緹��Ʈ��Ʈ�ѷ� ����
import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import movie.pak.dao.movie.MovieBuyDAOInter;
import movie.pak.dto.MovieUpDTO;

@RestController
@RequestMapping(value = "/moviebooking")
public class MovieBuyDayRestController {

   @Autowired
   public MovieBuyDAOInter movieBuyDAOInter;

   /*
    * @RequestMapping(value = "/sample", produces =
    * "application/json;charset=utf-8") public String test(String msg) {
    * 
    * return "hi"; }
    */

//http://localhost/projectRv/moviebooking/pickdaymovie?mendday=2023
   @RequestMapping(value = "/pickdaymovie", produces = "application/json;charset=utf-8")
   public List<MovieUpDTO> Daymovie(String mendday) {
      
      List<MovieUpDTO> md = movieBuyDAOInter.dayMovie(mendday);
      
      return md;
   }   
   
   //http://localhost/projectRv/moviebooking/pickdaymovie?mendday=2023
      @RequestMapping(value = "/movieday", produces = "application/json;charset=utf-8")
      public List<MovieUpDTO> movieDay(String mendday) {
         
         List<MovieUpDTO> md = movieBuyDAOInter.dayMovie(mendday);
         
         return md;
      }

 
   
   // ***�󿵽ð�ǥ, ����+��¥�� �󿵽ð� ����Ʈ
   @RequestMapping(value = "/moviedaya", produces = "application/json;charset=utf-8")
   public List<MovieUpDTO> timeList1(String mendday,String theater_name) {
      System.out.println("mendday => "+mendday+":"+"theater_id=>"+theater_name);
       List<MovieUpDTO> md = movieBuyDAOInter.sScrList(mendday, theater_name);
          return md;
      }
}