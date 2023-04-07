package movie.pak.dao.movie;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import movie.pak.dto.MovieBuyDTO;
import movie.pak.dto.MovieUpDTO;
import movie.pak.dto.ScreeningDTO;
import movie.pak.dto.SeatDTO;
import movie.pak.dto.TheaterDTO;

@Repository
public class MovieBuyDAO implements MovieBuyDAOInter {

   @Autowired
   private SqlSessionTemplate ss;
      
       // 영화 이름 뽑기
      @Override
      public List<MovieUpDTO> movieName() {
         List<MovieUpDTO> list = ss.selectList("moviebuy.moviename");
         return list;
      }
   // 영화 예매
         @Override
         public List<String> movieDir(int mno) {
            return ss.selectList("moviebuy.moviedir", mno);
         }

         @Override
         public List<String> movieTime(MovieUpDTO vo) {
            return ss.selectList("moviebuy.mtime", vo);
         }

         @Override
         public List<MovieUpDTO> dayMovie(String mendday) {
            System.out.println("dayMovie mendday=>"+mendday);
            List<MovieUpDTO> daylist = ss.selectList("moviebuy.daysmovie",mendday);
            return daylist;
         }
          // 상영관 이름 뽑기
         @Override
         public List<TheaterDTO> theaterName() {
            List<TheaterDTO> tname = ss.selectList("moviebuy.theatername");
            return tname;
         }
         // 상영시간표, 영화관 리스트
         @Override
         public List<TheaterDTO> sPlaceList() {
            return ss.selectList("moviebuy.tmplace");
         }
         // 상영시간표, 영화관+날짜
         @Override
         public List<MovieUpDTO> sScrList(String mendday, String theater_name) {
                Map<String, String> map = new HashMap<>();
                 map.put("mendday", mendday);
                 map.put("theater_name",theater_name);
                 return ss.selectList("moviebuy.daysmlist",map);
         }
   
         // 상영관 theater_no 리스트 뽑기 ex) 가산점 : 1관
  		@Override
  		public List<TheaterDTO> theaterNo(String theater_name) {
  			List<TheaterDTO> thno = ss.selectList("moviebuy.theaterNo", theater_name);
  			return thno;
  		}
 		
  	// 상영관의 상영 시간 리스트 뽑기 
  		@Override
  		public List<ScreeningDTO> ScreeningTime(Map<String, Object> parammap) {
  		    List<ScreeningDTO> timeno = ss.selectList("moviebuy.ScreeningTime", parammap);
  		    return timeno;
  		}
  		
  	// 남은 좌석/ 총 좌석 
 		@Override
 		public SeatDTO getSeatInfoByTheaterId(Map<String, Object> paramMap) {
 			SeatDTO getSeat = ss.selectOne("moviebuy.getSeatInfo", paramMap);
 			return getSeat;
 		}
}