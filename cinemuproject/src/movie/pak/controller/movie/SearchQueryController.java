package movie.pak.controller.movie;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import movie.pak.dao.SearchQueryDaoInter;
import movie.pak.dto.MovieCommDTO;
import movie.pak.dto.MovieUpDTO;
import movie.pak.dto.QnABoardDTO;

@Controller
@RequestMapping(value = "/search")
public class SearchQueryController {

	@Autowired
	private SearchQueryDaoInter searchQueryInter;

//	@PostMapping(value = "/searchQuery")
	@PostMapping(value = "/searchQueryPage")
	public ModelAndView searchQuery(String searchValue) {
		if (searchValue.equals("")) {
			searchValue = searchQueryInter.rmvname();
		}
		//ModelAndView mav = new ModelAndView("movie/searchQuery");
		ModelAndView mav = new ModelAndView("movie/searchQueryPage");

		List<MovieUpDTO> mlist = searchQueryInter.getMov(searchValue);
		List<MovieCommDTO> clist = searchQueryInter.getMComm(searchValue);
		List<QnABoardDTO> qlist = searchQueryInter.getQna(searchValue);

		int rescnt = clist.size() + mlist.size() + qlist.size();
		int ccnt = clist.size();
		int mcnt = mlist.size();
		int qcnt = qlist.size();
		
		mav.addObject("searchValue", searchValue);
		mav.addObject("mlist", mlist);
		mav.addObject("clist", clist);
		mav.addObject("qlist", qlist);
		mav.addObject("rescnt", rescnt);
		mav.addObject("ccnt", ccnt);
		mav.addObject("mcnt", mcnt);
		mav.addObject("qcnt", qcnt);
		return mav;
	}
	
	//@RequestMapping(value = "/searchQueryPage")
	public ModelAndView searchQueryPage(String searchValue, String cPage) {
		ModelAndView mav = new ModelAndView("movie/searchQueryPage");
		mav.addObject("searchValue", searchValue);
		mav.addObject("cPage", cPage);		
		return mav;
	}

}
