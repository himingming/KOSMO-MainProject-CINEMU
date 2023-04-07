package movie.pak.dao.movie;

import java.util.List;
import java.util.Map;

import movie.pak.dto.SeatDTO;

public interface SeatDAOInter {

   // 좌석 상영관, 상영시간에 따라 만들기
   public List<SeatDTO> getSeatClick(Map<String, Object> map);
    
   /* 결제완료 후 좌석완료 booked 변화
   public int updateBooked(SeatDTO svo);
   */
   public int updateBookedBatch(List<String> seatnoList, SeatDTO svo);
}