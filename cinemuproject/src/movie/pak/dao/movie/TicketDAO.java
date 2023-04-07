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
   
   // 결제 마일리지 사용
   @Override
   public int getMileage(String id) {
      int lmileage = ss.selectOne("ticketMap.getMileage", id);
      return lmileage;
   }

   // 결제완료 insert문
   @Override
   public void insertTicket(MovieBuyDTO mbvo) {
      ss.insert("ticketMap.insertTicket", mbvo);
      
   }
   
   // 결제 마일리지 차감 update문
    @Override
       public void updateMileage( Map<String, Object> map) {
           ss.update("ticketMap.MileageDed", map);
       }

}