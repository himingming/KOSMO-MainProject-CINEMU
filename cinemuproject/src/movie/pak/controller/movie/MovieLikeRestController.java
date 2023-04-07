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
	
	
	// 좋아요 클릭 시 실행되는 메서드
	@RequestMapping(value = "/addlike", produces = "application/json;charset=utf-8")
	public Map Like(MovieLikeDTO mlvo, HttpSession session){
		Map map = new HashedMap();
		String id = (String) session.getAttribute("sessionID");
		
		int cnt=movieLikDaoInter.mylikeCnt(mlvo); //insert 전 좋아요 수 반환 좋아요를 하지 않았다면  0반환
		if(id == null) {
		}else if (cnt==0) { // 좋아요 기록이 없다면 insert문이 실행된다. => 좋아요 기록 저장
			movieLikDaoInter.addLike(mlvo);
		}else { // 좋아요 기록이 있다면 delete문이 실행된다. => 좋아요 기록 삭제
		movieLikDaoInter.delLike(mlvo);
		}
		
		int cnt2=movieLikDaoInter.mylikeCnt(mlvo); //insert문 또는 delete문 실행 이후의 좋아요 기록을 뽑기 위하여 mylikeCnt메서드를 한번 더 실행
		int likecnt  = movieLikDaoInter.likeCnt(mlvo); //총 좋아요 수 반환
		map.put("cnt2", cnt2);
		map.put("likecnt", likecnt);
		return map; //insert / delete문 실행 이후 좋아요 수를 반환 한 변수 return
	}
	
	// 페이지 실행 시 실행되는 메서드
	@RequestMapping(value = "/likecnt2", produces = "application/json;charset=utf-8")
	public Map likeCnt(MovieLikeDTO mlvo){
		Map map = new HashedMap();
		// 초기 하트 모양을 결정 => 좋아요 기록이 없다면 "빈 하트" / 좋아요 기록이 있다면 "하트 모양"
		int cnt=movieLikDaoInter.mylikeCnt(mlvo);
		int likecnt  = movieLikDaoInter.likeCnt(mlvo); //총 좋아요 수 반환
		
		map.put("cnt", cnt);
		map.put("likecnt", likecnt);
		return map; //좋아요 기록 결과를 return
	}
	
	//추가 사항
	@RequestMapping(value = "/clikecnt")
	public int CAllLikeCnt() {
		
		
		return 5;
	}
	
	@RequestMapping(value = "/likecnt")
	public int allLikeCnt() {
	
		return 0;
	}
	
}