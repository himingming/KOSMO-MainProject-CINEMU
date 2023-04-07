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
	         // Pageó���� ���� �Ӽ�
	            private int nowPage = 1; // ���� ������ �� -> �޴� �������� �����Ǵ� ����
	            private int nowBlock = 1; // ���� �� -> [][][][][] -> 1block�� 5��  �迭 ����
	            private int totalRecord; // �� �Խù� �� .Dao�� ���� ����
	            private int numPerPage = 10; // �� �������� ������ �Խù� ��
	            private int pagePerBlock = 5; // �� ���� ������ ������ ��
	            private int totalPage;  // ��ü ������ �� => totalRecord/numPerPage
	            private int totalBlock; // ��ü ����
	            private int beginPerPage; // �� �������� ���� �Խù��� index��
	            private int endPerPage; // �� �������� ������ �Խù��� index��
	         // --------------------------------------------------
	      
	   
	   @GetMapping(value = "/movieForm")
	   public ModelAndView movieForm() {
	      ModelAndView mav = new ModelAndView("admin/ad_movieForm");
	      return mav;
	   }
	   
	   @RequestMapping(value = "/moviein")
	   public String movieUpIn(Model m, MovieUpDTO vo, HttpServletRequest request) {
	      String img_path = "resources\\imgfiles"; // �̹��� ���
	      String r_path = request.getRealPath("/");
	      
	      String oriFn = vo.getMfile().getOriginalFilename(); // ���� �̸�
	      
	       long size = vo.getMfile().getSize(); //�뷮
	       String contentType = vo.getMfile().getContentType(); // Ÿ��
	       
	       StringBuffer path = new StringBuffer(); // �ӽ� �����
	       path.append(r_path).append(img_path).append("\\");
	       path.append(oriFn);
	       
	       File f = new File(path.toString()); //���� ��ü ����
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
			   System.out.println("==========��Ʈ�ѷ� ��� ��==========");
			   System.out.println("mname"+e.getMname());
			   System.out.println("mactor"+e.getMactor());
		   }
		   
		      // ��ȭ ������
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
	      
	      // nowPage�� ������ SQL���� start��(#{begin})�� , #{end}����
	      beginPerPage = (nowPage-1) * numPerPage +1;
	      endPerPage = (beginPerPage -1) + numPerPage;
	   
	      // �ӽ÷� ������ �����غ���
	      Map<String, Integer> map = new HashMap<String, Integer>();
	      map.put("begin", beginPerPage);
	      map.put("end", endPerPage);
	      // ������ ��Ͼȿ� ������ �ݺ� ��Ű�� ���� startPage, endPage �� ���ؼ�
	      // view�� �����ؾ���.
	      List<MovieUpDTO> list = movieUpDAOInter.listMovie(map);
	      int startPage = (int)((nowPage - 1)/ pagePerBlock) * pagePerBlock +1;
	      int endPage = startPage + pagePerBlock - 1;
	      // endPage �� ������ ������ �츮�� ���� totalPage�� �̸��̶��
	      // totalPage�� ������ ���Խ�Ų��. 
	      if(endPage > totalPage) {
	         endPage = totalPage;
	      }
	    
	      // view�� forward�� ������ ������
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
	         List<MovieCommDTO> listmoviecomm = movieUpDAOInter.listMovieComm(no); // �ı� �� ���� ���� ���
	        mav.addObject("listmoviecomm", listmoviecomm);  // �ı� �� ���� ���� ���
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
	      String img_path = "resources\\imgfiles"; // �̹��� ���
	      String r_path = request.getRealPath("/");
	      
	      String oriFn = vo.getMfile().getOriginalFilename(); // ���� �̸�
	      
	       long size = vo.getMfile().getSize(); //�뷮
	       String contentType = vo.getMfile().getContentType(); // Ÿ��
	       
	       StringBuffer path = new StringBuffer(); // �ӽ� �����
	       path.append(r_path).append(img_path).append("\\");
	       path.append(oriFn);
	       
	       File f = new File(path.toString()); //���� ��ü ����
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
	   
	     // ���� ����
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
	        int num = movieUpDAOInter.delmovie(no);// ������ �̵��� ���� ������ �ѹ� �̱� 
	        movieUpDAOInter.delcomm(no); //���⼭ ������
	        return "redirect:/movies/moviedetail?no=" + num;
	     }
	
	 	//��ü �˻�
	 	@RequestMapping(value = "/searchMov")
	 	public String searchMv(Model model, String searchValue) {		
	 		List<MovieUpDTO> svlist = movieUpDAOInter.searchMv(searchValue);
	 		model.addAttribute("svlist", svlist);
	 		return "movie/searchList";
	 	}	
}
