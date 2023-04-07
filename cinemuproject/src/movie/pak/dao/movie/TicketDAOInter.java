package movie.pak.dao.movie;

import java.util.Map;

import movie.pak.dto.LoginDTO;
import movie.pak.dto.MovieBuyDTO;

public interface TicketDAOInter {

	 // 결제 마일리지 사용
    public int getMileage(String id);
    
    //결제완료 insert
    public void insertTicket(MovieBuyDTO mbvo);
    
    // 결제 마일리지 차감 update
    public void updateMileage(Map<String, Object> map);
 

}
