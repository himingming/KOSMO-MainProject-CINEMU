package movie.pak.dao.movie;

import java.util.Map;

import movie.pak.dto.LoginDTO;
import movie.pak.dto.MovieBuyDTO;

public interface TicketDAOInter {

	 // ���� ���ϸ��� ���
    public int getMileage(String id);
    
    //�����Ϸ� insert
    public void insertTicket(MovieBuyDTO mbvo);
    
    // ���� ���ϸ��� ���� update
    public void updateMileage(Map<String, Object> map);
 

}
