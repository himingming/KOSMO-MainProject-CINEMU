package movie.pak.controller.member;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import movie.pak.dao.LoginDAOInter;
import movie.pak.dao.MyPageDAOInter;
import movie.pak.dao.movie.MovieUpDAOInter;
import movie.pak.dto.LoginDTO;
import movie.pak.dto.MovieCommDTO;
import movie.pak.dto.MovieUpDTO;
import movie.pak.dto.MyMovieDTO;
import movie.pak.dto.QnABoardDTO;
import movie.pak.dto.SnackUpDTO;



@RestController
@RequestMapping(value = "/memberR")
public class RestControllerMember {
	
	private int perPage=3; // 한 페이지 당 게시물 수
	private int totalCount; //총 게시물 수
	private int totalPage ; // 총 페이지 수


	@Autowired
	private LoginDAOInter loginDaoInter;
	
	@Autowired
	private MyPageDAOInter myPageInter;
	
	
	@RequestMapping(value = "/mvpage", produces = "application/json;charset=utf-8")
	public Map<String, Object> mvpage(HttpServletRequest request){
		HttpSession session = request.getSession(false);
		String id = (String) session.getAttribute("sessionID");
		String cPage = request.getParameter("cPage");
		Map<String, Object> map = new HashMap<>();
		int begin = (Integer.parseInt(cPage) - 1) * 3 + 1;
		int end =  Integer.parseInt(cPage) * 3;
		map.put("lid", id);
		map.put("begin", begin);
		map.put("end", end);
		
		List<MyMovieDTO> list = myPageInter.movieP(map);
		totalCount = myPageInter.movieCnt(id);
		totalPage = (int) Math.ceil(totalCount / (double) perPage); // 총 페이지 수
		Map<String, Object> pmap = new HashMap<>();
		pmap.put("list", list);
		pmap.put("cPage", cPage);
		pmap.put("mvprevBtn", (Integer.parseInt(cPage) > 3));
		pmap.put("mvnextBtn", (Integer.parseInt(cPage) < totalPage));
		pmap.put("totalPage", totalPage); // 총 페이지 수
		pmap.put("totalCount", totalCount); // 총 페이지 수
		return pmap;
	}
	
	
	
	@RequestMapping(value = "/mcpage", produces = "application/json;charset=utf-8")
	public Map<String, Object> mcpage(HttpServletRequest request){
		HttpSession session = request.getSession(false);
		String id = (String) session.getAttribute("sessionID");
		String cPage = request.getParameter("cPage");
		
		Map<String, Object> map = new HashMap<>();
		map.put("lid", id);
		map.put("begin", (Integer.parseInt(cPage) - 1) * 3 + 1);
		map.put("end", Integer.parseInt(cPage) * 3);
		
		List<MovieCommDTO> list = myPageInter.moviecomm(map);
		totalCount = myPageInter.mvcommCnt(id);
		totalPage = (int) Math.ceil(totalCount / (double) perPage); // 총 페이지 수
		Map<String, Object> pmap = new HashMap<>();
		pmap.put("list", list);
		pmap.put("cPage", cPage);
		pmap.put("prevBtn", (Integer.parseInt(cPage) > 1));
		pmap.put("nextBtn", (Integer.parseInt(cPage) < totalPage));
		pmap.put("totalPage", totalPage); // 총 페이지 수
		pmap.put("totalCount", totalCount); // 총 페이지 수
		return pmap;
	}
	
	@RequestMapping(value = "/qnapage", produces = "application/json;charset=utf-8")
	public Map<String, Object> qnapage(HttpServletRequest request){
		HttpSession session = request.getSession(false);
		String id = (String) session.getAttribute("sessionID");
		String cPage = request.getParameter("cPage");
		
		Map<String, Object> map = new HashMap<>();
		map.put("lid", id);
		map.put("begin", (Integer.parseInt(cPage) - 1) * 3 + 1);
		map.put("end", Integer.parseInt(cPage) * 3);
		
		List<QnABoardDTO> list = myPageInter.qnaP(map);
		totalCount = myPageInter.qnaPCnt(id);
		totalPage = (int) Math.ceil(totalCount / (double) perPage); // 총 페이지 수
		Map<String, Object> pmap = new HashMap<>();
		pmap.put("list", list);
		pmap.put("cPage", cPage);
		pmap.put("qprevBtn", (Integer.parseInt(cPage) > 3));
		pmap.put("qnextBtn", (Integer.parseInt(cPage) < totalPage));
		pmap.put("totalPage", totalPage); // 총 페이지 수
		pmap.put("totalCount", totalCount); // 총 페이지 수
		return pmap;
	}
	
	@RequestMapping(value = "/snpage", produces = "application/json;charset=utf-8")
	public Map<String, Object> snpage(HttpServletRequest request){
		HttpSession session = request.getSession(false);
		String id = (String) session.getAttribute("sessionID");
		String cPage = request.getParameter("cPage");
		Map<String, Object> map = new HashMap<>();
		map.put("lid", id);
		map.put("begin", (Integer.parseInt(cPage) - 1) * 3 + 1);
		map.put("end", Integer.parseInt(cPage) * 3);
		List<SnackUpDTO> list = myPageInter.snackP(map);
		totalCount = myPageInter.snackCnt(id);
		totalPage = (int) Math.ceil(totalCount / (double) perPage); // 총 페이지 수
		Map<String, Object> pmap = new HashMap<>();
		pmap.put("list", list);
		pmap.put("cPage", cPage);
		pmap.put("sprevBtn", (Integer.parseInt(cPage) > 3));
		pmap.put("snextBtn", (Integer.parseInt(cPage) < totalPage));
		pmap.put("totalPage", totalPage); // 총 페이지 수
		pmap.put("totalCount", totalCount); // 총 페이지 수
		return pmap;
	}
	
	@RequestMapping(value = "/mvlpage", produces = "application/json;charset=utf-8")
	public Map<String, Object> mvlpage(HttpServletRequest request){
		HttpSession session = request.getSession(false);
		String id = (String) session.getAttribute("sessionID");
		String cPage = request.getParameter("cPage");
		Map<String, Object> map = new HashMap<>();
		map.put("lid", id);
		map.put("begin", (Integer.parseInt(cPage) - 1) * 3 + 1);
		map.put("end", Integer.parseInt(cPage) * 3);
		List<MovieUpDTO> list = myPageInter.mvlP(map);
		totalCount = myPageInter.mvlCnt(id);
		totalPage = (int) Math.ceil(totalCount / (double) perPage); // 총 페이지 수
		Map<String, Object> pmap = new HashMap<>();
		pmap.put("list", list);
		pmap.put("cPage", cPage);
		pmap.put("sprevBtn", (Integer.parseInt(cPage) > 3));
		pmap.put("snextBtn", (Integer.parseInt(cPage) < totalPage));
		pmap.put("totalPage", totalPage); // 총 페이지 수
		pmap.put("totalCount", totalCount); // 총 페이지 수
		return pmap;
	}
	
	
	// 인증번호 체크 메서드
	@RequestMapping(value = "/chkRnum", produces = "application/json;charset=utf-8")
	public int chkRnum(int rnum, String inputrnum) {
		int inputr = Integer.parseInt(inputrnum);
		if(rnum == inputr) {			
			return 1;		
		}else {
			return 0;		
		}
	}
	
	
	// 아이디체크
	@RequestMapping(value = "/idchk")
	public int idChk(String lid) {
		int cnt = loginDaoInter.idCheck(lid);
		return cnt;
		
	}
	

	
}