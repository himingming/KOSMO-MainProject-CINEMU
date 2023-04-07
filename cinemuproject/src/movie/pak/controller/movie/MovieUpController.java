package movie.pak.controller.movie;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import movie.pak.dao.LoginDAOInter;
import movie.pak.dao.movie.BoxDAOInter;
import movie.pak.dao.movie.MovieUpDAOInter;
import movie.pak.dto.BoxDTO;
import movie.pak.dto.MovieCommDTO;
import movie.pak.dto.MovieUpDTO;

@Controller
@RequestMapping(value = "/movies")
public class MovieUpController {
	
	@Autowired
	private MovieUpDAOInter movieUpDAOInter;
	   
	   // -----------------------------------------------
	         // Page처리를 위한 속성
	            private int nowPage = 1; // 현재 페이지 값 -> 메뉴 페이지와 연동되는 변수
	            private int nowBlock = 1; // 현재 블럭 -> [][][][][] -> 1block당 5개  배열 생성
	            private int totalRecord; // 총 게시물 수 .Dao로 부터 받음
	            private int numPerPage = 10; // 한 페이지당 보여질 게시물 수
	            private int pagePerBlock = 5; // 한 블럭당 보여질 페이지 수
	            private int totalPage;  // 전체 페이지 수 => totalRecord/numPerPage
	            private int totalBlock; // 전체 블럭수
	            private int beginPerPage; // 각 페이지별 시작 게시물의 index값
	            private int endPerPage; // 각 페이지별 마지막 게시물의 index값
	         // --------------------------------------------------
	      
	   
	   @GetMapping(value = "/movieForm")
	   public ModelAndView movieForm() {
	      ModelAndView mav = new ModelAndView("admin/ad_movieForm");
	      return mav;
	   }
	   
	   @RequestMapping(value = "/moviein")
	   public String movieUpIn(Model m, MovieUpDTO vo, HttpServletRequest request) {
	      String img_path = "resources\\imgfiles"; // 이미지 경로
	      String r_path = request.getRealPath("/");
	      
	      String oriFn = vo.getMfile().getOriginalFilename(); // 파일 이름
	      
	       long size = vo.getMfile().getSize(); //용량
	       String contentType = vo.getMfile().getContentType(); // 타입
	       
	       StringBuffer path = new StringBuffer(); // 임시 저장소
	       path.append(r_path).append(img_path).append("\\");
	       path.append(oriFn);
	       
	       File f = new File(path.toString()); //파일 객체 생성
	       try {
	         vo.getMfile().transferTo(f);
	         vo.setMimg(oriFn);
	      } catch (IllegalStateException | IOException e) {
	         e.printStackTrace();
	      }
	      
	      movieUpDAOInter.addMovieUp(vo);
	      return "redirect:/main";
	      
	   }
	   
	   
	   @RequestMapping(value = "/movielist")
	   public ModelAndView movieList() {
		 //-----------------------------------------------
		      List<MovieUpDTO> list = movieUpDAOInter.movieList();
		      ModelAndView mav = new ModelAndView("movie/allMovieList");
	
		      mav.addObject("list", list);
		   for(MovieUpDTO e : list) {
			   System.out.println("==========컨트롤러 출력 값==========");
			   System.out.println("mname"+e.getMname());
			   System.out.println("mactor"+e.getMactor());
		   }
		   
		      // 영화 예매율
		      List<Float> ratio = movieUpDAOInter.getratio();
		      mav.addObject("ratio", ratio);
		      for (Float f : ratio) {
		         System.out.println(f);
		      }
		      

		      return mav;	
		      
		      
	   }
	   
	   @RequestMapping(value = "/movielist2")
	   public ModelAndView movieList2(String cPage) {
	      //-----------------------------------------------
	      totalRecord = movieUpDAOInter.getCnt();
	      totalPage = (int) Math.ceil(totalRecord/ (double)numPerPage);
	      totalBlock = (int) Math.ceil((double)totalPage/pagePerBlock);
	      String s_page = cPage;
	      if(s_page != null) {
	         nowPage = Integer.parseInt(s_page);
	      }
	      
	      // nowPage의 값에서 SQL문의 start값(#{begin})과 , #{end}연산
	      beginPerPage = (nowPage-1) * numPerPage +1;
	      endPerPage = (beginPerPage -1) + numPerPage;
	   
	      // 임시로 데이터 전송해보기
	      Map<String, Integer> map = new HashMap<String, Integer>();
	      map.put("begin", beginPerPage);
	      map.put("end", endPerPage);
	      // 페이지 블록안에 페이지 반복 시키기 위한 startPage, endPage 를 구해서
	      // view로 전달해야함.
	      List<MovieUpDTO> list = movieUpDAOInter.listMovie(map);
	      int startPage = (int)((nowPage - 1)/ pagePerBlock) * pagePerBlock +1;
	      int endPage = startPage + pagePerBlock - 1;
	      // endPage 의 연산의 범위가 우리가 구한 totalPage값 미만이라면
	      // totalPage의 값으로 대입시킨다. 
	      if(endPage > totalPage) {
	         endPage = totalPage;
	      }
	    
	      // view에 forward로 전송할 데이터
	      ModelAndView mav = new ModelAndView("movie/allMovieList");
	      mav.addObject("list", list);
	      mav.addObject("nowPage", nowPage);
	      mav.addObject("startPage", startPage);
	      mav.addObject("endPage", endPage);
	      mav.addObject("pagePerBlock", pagePerBlock);
	      mav.addObject("totalPage", totalPage);
	      return mav;   
	   }
	   
	   	@GetMapping(value = "/moviedetail")
	      public ModelAndView detailmovie(int no) {
	         ModelAndView mav = new ModelAndView("movie/detailMovie");
	         List<MovieCommDTO> listmoviecomm = movieUpDAOInter.listMovieComm(no); // 후기 및 평점 내역 출력
	        mav.addObject("listmoviecomm", listmoviecomm);  // 후기 및 평점 내역 출력
	         MovieUpDTO vo = movieUpDAOInter.detailMovie(no);
	         mav.addObject("vo", vo);
	         return mav;
	      }
	   
	   @GetMapping(value = "/movieupForm")
	   public ModelAndView upForm(int mno) {
	      ModelAndView mav = new ModelAndView("admin/ad_movieUpForm");
	      MovieUpDTO vo = movieUpDAOInter.detailMovie(mno);
	      mav.addObject("vo", vo);
	     
	      
	      return mav;
	   }
	   
	   @RequestMapping(value = "/movieupdate")
	   public String updatemovie(Model m, MovieUpDTO vo, HttpServletRequest request) {
	      String img_path = "resources\\imgfiles"; // 이미지 경로
	      String r_path = request.getRealPath("/");
	      
	      String oriFn = vo.getMfile().getOriginalFilename(); // 파일 이름
	      
	       long size = vo.getMfile().getSize(); //용량
	       String contentType = vo.getMfile().getContentType(); // 타입
	       
	       StringBuffer path = new StringBuffer(); // 임시 저장소
	       path.append(r_path).append(img_path).append("\\");
	       path.append(oriFn);
	       
	       File f = new File(path.toString()); //파일 객체 생성
	       try {
	         vo.getMfile().transferTo(f);
	         vo.setMimg(oriFn);
	      } catch (IllegalStateException | IOException e) {
	         e.printStackTrace();
	      }
	      
	      movieUpDAOInter.updateMovie(vo);
	      return "redirect:/movies/movielist";
	   }
	   
	   @GetMapping(value = "/moviedelete")
	   public String deleteMovie(int mno) {
	      movieUpDAOInter.delete(mno);
	      
	      return "redirect:/movies/movielist";
	      
	   }
	   
	     // 평점 시작
	     @PostMapping(value = "/moviecomminsert")
	     public ModelAndView addMovieComm(MovieCommDTO mcvo) {
	    	 System.out.println("mcvo"+mcvo.getComm());
	        movieUpDAOInter.addMovieComm(mcvo);
	        ModelAndView mav = new ModelAndView("redirect:/movies/moviedetail?no="+mcvo.getMno());
	        return mav;
	     }

	     @RequestMapping(value = "/upmoviecomm")
	     public String upMovieComm(MovieCommDTO mcvo) {
	        int num = mcvo.getMno();
	        movieUpDAOInter.upMovieComm(mcvo);
	        return "redirect:/movies/moviedetail?no="+ num;
	     }
	     
	     @RequestMapping(value = "/delmoviecomm")
	     public String delMovieComm(int no) {
	        int num = movieUpDAOInter.delmovie(no);// 페이지 이동을 위한 페이지 넘버 뽑기 
	        movieUpDAOInter.delcomm(no); //여기서 삭제됨
	        return "redirect:/movies/moviedetail?no=" + num;
	     }
	
	 	//전체 검색
	 	@RequestMapping(value = "/searchMov")
	 	public String searchMv(Model model, String searchValue) {		
	 		List<MovieUpDTO> svlist = movieUpDAOInter.searchMv(searchValue);
	 		model.addAttribute("svlist", svlist);
	 		return "movie/searchList";
	 	}	
}
