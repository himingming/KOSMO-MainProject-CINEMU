package movie.pak.controller.snackbuy;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import movie.pak.dao.snackbuy.SnackBuyDAOInter;
import movie.pak.dto.SnackBuyDTO;

@Controller
@RequestMapping(value = "/snackbuy")
public class SnackBuyController {
	
@Autowired
private SnackBuyDAOInter snackBuyDAOInter;

@RequestMapping(value = "/snackbuy")
public String addSnack(String[] poppay, String[] popname, String[] snacksaram, HttpSession session) {
   String lid = (String) session.getAttribute("sessionID");
   List<SnackBuyDTO> svolist = new ArrayList<SnackBuyDTO>();
   for(int i=0; i<poppay.length; i++) {
      SnackBuyDTO svo = new SnackBuyDTO();
      svo.setLid(lid);
      svo.setPoppay(Integer.parseInt(poppay[i]));
      svo.setPopname(popname[i]);
      svo.setSnacksaram(Integer.parseInt(snacksaram[i]));
      svolist.add(svo);
   }
   snackBuyDAOInter.snackBuy(svolist);
   return "redirect:/main";
}

}