package movie.pak.dao.movie;

import java.util.List;
import java.util.Map;

import movie.pak.dto.LoginDTO;

public interface ChartDAOInter {

	public String movTitle(int mno); //��ȭ�� ������ ������ 
	public List<LoginDTO> genDonut(int mno); // ��ȭ�� ������ ������ ���� ���
	public List<Map<String, Integer>> ageBarlist(int mno); //��ȭ�� ������ ������ ���� ���
	
}
