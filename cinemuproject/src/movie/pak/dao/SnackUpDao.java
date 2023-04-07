package movie.pak.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import movie.pak.dto.SnackUpDTO;

@Repository
public class SnackUpDao implements SnackUpDaoInter{

	@Autowired
	private SqlSessionTemplate ss;
	
	@Override
	public void addSnack(SnackUpDTO vo) {
		ss.insert("snack.add",vo);
		
	}

	@Override
	public int getCnt() {
		return ss.selectOne("snack.totalCount");
	}

	@Override
	public List<SnackUpDTO> getList(Map<String, Integer> map) {
		return ss.selectList("snack.listpage", map);
	}

	@Override
	public SnackUpDTO getDetail(int num) {
		return ss.selectOne("snack.detail",num);
	}

	@Override
	public void snackUpdate(SnackUpDTO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void snackDelete(int popno) {
		ss.delete("snack.snackdelete",popno);
		
	}

	

	

}
