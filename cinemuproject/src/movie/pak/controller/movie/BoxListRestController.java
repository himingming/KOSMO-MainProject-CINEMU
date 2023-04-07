package movie.pak.controller.movie;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import movie.pak.dao.movie.BoxDAOInter;
import movie.pak.dto.BoxDTO;

@RestController
@RequestMapping(value = "/box")
public class BoxListRestController {
	
	@Autowired
	private BoxDAOInter boxDAOInter;
	
 	@RequestMapping(value = "/boxlist")
 	public Map<String,Object> boxList() {
 		List<BoxDTO> boxlist = boxDAOInter.boxList();
 		Map<String, Object> map = new HashMap<String, Object>();
 		
 		//영화평점
 		List<Float> ratio = boxDAOInter.getratio();
 		
 		map.put("boxlist", boxlist);
 		map.put("ratio", ratio);
 		
 		
 		
 		return map;
 	} 

}
