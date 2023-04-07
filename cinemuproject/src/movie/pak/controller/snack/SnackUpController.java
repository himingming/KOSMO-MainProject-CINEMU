package movie.pak.controller.snack;

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

import movie.pak.dao.SnackUpDaoInter;
import movie.pak.dto.QnABoardDTO;
import movie.pak.dto.SnackUpDTO;

@Controller
@RequestMapping(value = "/snack")
public class SnackUpController {

	@Autowired SnackUpDaoInter snackUpDaoInter;
	
	//-------------------------------------------------------------
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
	//-------------------------------------------------------------
	   
	
	@GetMapping(value = "/snackUpform")
	public String snackform() {
		return "snack/snackupload";
	}
	@RequestMapping(value = "/snackUpload")
	public String upload(Model m, SnackUpDTO dto, HttpServletRequest request) {
		
		String img_path= "resources\\imgfiles"; //�̹��� ���
		String r_path = request.getRealPath("/"); 
		
		String oriFn = dto.getMfile().getOriginalFilename(); // ���� �̸�
		
		
		long size = dto.getMfile().getSize(); //�뷮
		String contentType = dto.getMfile().getContentType(); // Ÿ��
		

		
		StringBuffer path = new StringBuffer(); // �ӽ� �����
		path.append(r_path).append(img_path).append("\\");
		path.append(oriFn);
		
	
		
		File f = new File(path.toString()); // ���� ��ü ����
		try {
			dto.getMfile().transferTo(f);
			dto.setPopimg(oriFn);
			System.out.println("oriFn????? => "+oriFn);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		snackUpDaoInter.addSnack(dto);
	
		return "redirect:/main";
	}
	@RequestMapping("/snackUplist")
	public String upBoardList(Model model,String cPage) {
		 // �� �Խù� �� ��������
        totalRecord = snackUpDaoInter.getCnt();
        System.out.println("1.TotalRecord :"+totalRecord);
        // ��ü ������ ����غ��� =>  totalPage : 2.1
     //double totalPage2 = totalRecord/(double)numPerPage;
        
        // ceil �ø� => 2.1 => 3
        totalPage = (int) Math.ceil(totalRecord/(double)numPerPage);
        System.out.println("2.totalPage :"+totalPage);
        
        // totalBlock = totalPage/5;
        totalBlock = (int) Math.ceil((double)totalPage/pagePerBlock);
        System.out.println("3.totalBlock :" + totalBlock);
        
        // ���� �������� ��û�� �� �Ķ���ͷ� ���� ���������� �޴´�. 1~~~~~~n
        String s_page = cPage;
        if(s_page != null) {
           nowPage = Integer.parseInt(s_page);
        }
        System.out.println("4.nowPage => "+nowPage);
        
        // nowPage�� ������ SQL���� start��(#{begin})�� , #{end}����
        beginPerPage = (nowPage-1) * numPerPage +1;
        endPerPage = (beginPerPage -1) + numPerPage;
        System.out.println("5. beginPerPage = "+beginPerPage);
        System.out.println("5. endPerPage = "+endPerPage);
        
        // �ӽ÷� ������ �����غ���
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("begin", beginPerPage);
        map.put("end", endPerPage);
        
        List<SnackUpDTO> list = snackUpDaoInter.getList(map);
        
        // ������ ��Ͼȿ� ������ �ݺ� ��Ű�� ���� startPage, endPage �� ���ؼ�
        // view�� �����ؾ���.
        int startPage = (int)((nowPage - 1)/ pagePerBlock) * pagePerBlock +1;
        int endPage = startPage + pagePerBlock - 1;
        // endPage �� ������ ������ �츮�� ���� totalPage�� �̸��̶��
        // totalPage�� ������ ���Խ�Ų��. 
        if(endPage > totalPage) {
           endPage = totalPage;
        }
        System.out.println("6. startPage = "+startPage);
        System.out.println("6. endPage = "+endPage);
        // view�� forward�� ������ ������
        model.addAttribute("list", list);
        model.addAttribute("nowPage", nowPage);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);
        model.addAttribute("pagePerBlock", pagePerBlock); // ������ 5
        model.addAttribute("totalPage", totalPage);
        
		return "snack/snackUpList";
	}
	@GetMapping(value = "/snackdetail")
	public ModelAndView detail(int popno) {
		ModelAndView mav = new ModelAndView("snack/snackdetail");
		SnackUpDTO vo = snackUpDaoInter.getDetail(popno);
		mav.addObject("vo",vo);
		return mav;
	}
	@GetMapping(value = "/snackdelete")
	public String deleteBoard(int popno) {
		snackUpDaoInter.snackDelete(popno);
		return "redirect:/snack/snackUplist";
	}
}
