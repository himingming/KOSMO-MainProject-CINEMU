package movie.pak.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/about")
public class AboutCinemu {
	
	 @GetMapping(value = "/map")
	   public String theaterMap() {
	      return "theater/map";
	   }

@GetMapping(value = "/greeting")
public String greeting(){
	return "theater/greeting";
	
}
	 
}
