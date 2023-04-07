package movie.pak.dao.movie;

import java.util.List;
import java.util.Map;

import movie.pak.dto.SeatDTO;

public interface SeatDAOInter {

   // �¼� �󿵰�, �󿵽ð��� ���� �����
   public List<SeatDTO> getSeatClick(Map<String, Object> map);
    
   /* �����Ϸ� �� �¼��Ϸ� booked ��ȭ
   public int updateBooked(SeatDTO svo);
   */
   public int updateBookedBatch(List<String> seatnoList, SeatDTO svo);
}