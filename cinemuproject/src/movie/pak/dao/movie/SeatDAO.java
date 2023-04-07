package movie.pak.dao.movie;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import movie.pak.dto.SeatDTO;
@Repository
public class SeatDAO implements SeatDAOInter {

   @Autowired
   private SqlSessionTemplate ss;

   // �¼� �������� �����
@Override
public List<SeatDTO> getSeatClick(Map<String, Object> map) {
   List<SeatDTO> seat = ss.selectList("seat.getSeatClick", map);
   return seat;
}

/* �����Ϸ� �� booked ��ȭ
@Override
public int updateBooked(SeatDTO svo) {
int booked = ss.update("seat.updateBooked", svo);
return booked;

}
*/
@Override
public int updateBookedBatch(List<String> seatnoList, SeatDTO svo) {
    Map<String, Object> paramMap = new HashMap<>();
    paramMap.put("list", seatnoList);
    paramMap.put("theater_id", svo.getTheater_id());
    paramMap.put("screening_id", svo.getScreening_id());
    return ss.update("seat.updateBooked", paramMap);
}
}