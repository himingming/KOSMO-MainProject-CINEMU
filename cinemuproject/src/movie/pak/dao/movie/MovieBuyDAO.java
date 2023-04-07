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
      
       // ��ȭ �̸� �̱�
      @Override
      public List<MovieUpDTO> movieName() {
         List<MovieUpDTO> list = ss.selectList("moviebuy.moviename");
         return list;
      }
   // ��ȭ ����
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
          // �󿵰� �̸� �̱�
         @Override
         public List<TheaterDTO> theaterName() {
            List<TheaterDTO> tname = ss.selectList("moviebuy.theatername");
            return tname;
         }
         // �󿵽ð�ǥ, ��ȭ�� ����Ʈ
         @Override
         public List<TheaterDTO> sPlaceList() {
            return ss.selectList("moviebuy.tmplace");
         }
         // �󿵽ð�ǥ, ��ȭ��+��¥
         @Override
         public List<MovieUpDTO> sScrList(String mendday, String theater_name) {
                Map<String, String> map = new HashMap<>();
                 map.put("mendday", mendday);
                 map.put("theater_name",theater_name);
                 return ss.selectList("moviebuy.daysmlist",map);
         }
   
         // �󿵰� theater_no ����Ʈ �̱� ex) ������ : 1��
  		@Override
  		public List<TheaterDTO> theaterNo(String theater_name) {
  			List<TheaterDTO> thno = ss.selectList("moviebuy.theaterNo", theater_name);
  			return thno;
  		}
 		
  	// �󿵰��� �� �ð� ����Ʈ �̱� 
  		@Override
  		public List<ScreeningDTO> ScreeningTime(Map<String, Object> parammap) {
  		    List<ScreeningDTO> timeno = ss.selectList("moviebuy.ScreeningTime", parammap);
  		    return timeno;
  		}
  		
  	// ���� �¼�/ �� �¼� 
 		@Override
 		public SeatDTO getSeatInfoByTheaterId(Map<String, Object> paramMap) {
 			SeatDTO getSeat = ss.selectOne("moviebuy.getSeatInfo", paramMap);
 			return getSeat;
 		}
}