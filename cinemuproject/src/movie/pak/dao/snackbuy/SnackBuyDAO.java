package movie.pak.dao.snackbuy;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import movie.pak.dto.SnackBuyDTO;

@Repository
public class SnackBuyDAO implements SnackBuyDAOInter {
   @Autowired
   private SqlSessionTemplate ss;
   
   @Override
   public void snackBuy(List<SnackBuyDTO> svo) {
   ss.insert("snackbuy.addbuy",svo);   
   }

}