package movie.pak.test;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Membershiptest {

	@RequestMapping(value = "/test")
	public String govip() {
		
		return "membership";
	}
}
