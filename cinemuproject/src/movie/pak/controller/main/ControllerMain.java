package movie.pak.controller.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import movie.pak.dao.movie.MovieUpDAOInter;
import movie.pak.dto.BoxDTO;

@Controller
public class ControllerMain {
	@Autowired
	private MovieUpDAOInter movieupdaointer;
	// (value = {"/","/main"}) => project run시 바로 해당 메서드를 실행한다. 
	@RequestMapping(value = {"/","/main"})
	public ModelAndView main() {
		ModelAndView mav = new ModelAndView("index/index");
		List<BoxDTO> boxlist = movieupdaointer.boxList();
		mav.addObject("boxlist",boxlist);
		
		return mav;	
	}
	
	@GetMapping(value = "/vip")
	public String membership() {
	      return "membership/membership";
	   }

}
