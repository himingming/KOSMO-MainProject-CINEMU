package movie.pak.dao;

import java.util.List;
import java.util.Map;

import movie.pak.dto.SnackUpDTO;

public interface SnackUpDaoInter {

	public void addSnack(SnackUpDTO vo);
	public int getCnt();
	public List<SnackUpDTO> getList(Map<String, Integer> map);
	public SnackUpDTO getDetail(int num);
	public void snackUpdate(SnackUpDTO vo);
	public void snackDelete(int popno);
}
