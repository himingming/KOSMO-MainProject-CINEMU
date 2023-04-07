package movie.pak.dao.movie;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import movie.pak.dto.MovieBuyDTO;

@Repository
public class TicketDAO implements TicketDAOInter {

   @Autowired
   private SqlSessionTemplate ss;
   
   // ���� ���ϸ��� ���
   @Override
   public int getMileage(String id) {
      int lmileage = ss.selectOne("ticketMap.getMileage", id);
      return lmileage;
   }

   // �����Ϸ� insert��
   @Override
   public void insertTicket(MovieBuyDTO mbvo) {
      ss.insert("ticketMap.insertTicket", mbvo);
      
   }
   
   // ���� ���ϸ��� ���� update��
    @Override
       public void updateMileage( Map<String, Object> map) {
           ss.update("ticketMap.MileageDed", map);
       }

}