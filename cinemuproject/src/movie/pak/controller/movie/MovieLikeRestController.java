package movie.pak.controller.movie;


import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import movie.pak.dao.movie.MovieLikeDAOInter;
import movie.pak.dto.MovieLikeDTO;

@RestController
@RequestMapping(value = "/like")
public class MovieLikeRestController {

	@Autowired
	private MovieLikeDAOInter movieLikDaoInter;
	
	
	// ���ƿ� Ŭ�� �� ����Ǵ� �޼���
	@RequestMapping(value = "/addlike", produces = "application/json;charset=utf-8")
	public Map Like(MovieLikeDTO mlvo, HttpSession session){
		Map map = new HashedMap();
		String id = (String) session.getAttribute("sessionID");
		
		int cnt=movieLikDaoInter.mylikeCnt(mlvo); //insert �� ���ƿ� �� ��ȯ ���ƿ並 ���� �ʾҴٸ�  0��ȯ
		if(id == null) {
		}else if (cnt==0) { // ���ƿ� ����� ���ٸ� insert���� ����ȴ�. => ���ƿ� ��� ����
			movieLikDaoInter.addLike(mlvo);
		}else { // ���ƿ� ����� �ִٸ� delete���� ����ȴ�. => ���ƿ� ��� ����
		movieLikDaoInter.delLike(mlvo);
		}
		
		int cnt2=movieLikDaoInter.mylikeCnt(mlvo); //insert�� �Ǵ� delete�� ���� ������ ���ƿ� ����� �̱� ���Ͽ� mylikeCnt�޼��带 �ѹ� �� ����
		int likecnt  = movieLikDaoInter.likeCnt(mlvo); //�� ���ƿ� �� ��ȯ
		map.put("cnt2", cnt2);
		map.put("likecnt", likecnt);
		return map; //insert / delete�� ���� ���� ���ƿ� ���� ��ȯ �� ���� return
	}
	
	// ������ ���� �� ����Ǵ� �޼���
	@RequestMapping(value = "/likecnt2", produces = "application/json;charset=utf-8")
	public Map likeCnt(MovieLikeDTO mlvo){
		Map map = new HashedMap();
		// �ʱ� ��Ʈ ����� ���� => ���ƿ� ����� ���ٸ� "�� ��Ʈ" / ���ƿ� ����� �ִٸ� "��Ʈ ���"
		int cnt=movieLikDaoInter.mylikeCnt(mlvo);
		int likecnt  = movieLikDaoInter.likeCnt(mlvo); //�� ���ƿ� �� ��ȯ
		
		map.put("cnt", cnt);
		map.put("likecnt", likecnt);
		return map; //���ƿ� ��� ����� return
	}
	
	//�߰� ����
	@RequestMapping(value = "/clikecnt")
	public int CAllLikeCnt() {
		
		
		return 5;
	}
	
	@RequestMapping(value = "/likecnt")
	public int allLikeCnt() {
	
		return 0;
	}
	
}