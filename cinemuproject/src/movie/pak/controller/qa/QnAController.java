package movie.pak.controller.qa;

import java.util.List;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import movie.pak.dao.QnABoardDAOInter;
import movie.pak.dto.LoginDTO;
import movie.pak.dto.PageSearchDTO;
import movie.pak.dto.QnABoardDTO;
import movie.pak.dto.QnACommDTO;

@Controller
@RequestMapping(value = "/qaboard")
public class QnAController {

	@Autowired
	private QnABoardDAOInter qnABoardDAOInter;
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	
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
	
	@GetMapping(value = "/qaform")
	public ModelAndView qnaForm() {
		ModelAndView mav = new ModelAndView("qna/qnaForm");
		return mav;
	}
	@PostMapping(value = "/qainsert")
	public String qnaIn(QnABoardDTO vo) {
		qnABoardDAOInter.addBoard(vo);
		return "redirect:/qaboard/qalist";
	}
	
	@RequestMapping(value = "/qalist")
public String listBoard(Model model, String cPage,String searchType,String searchValue) {
		
		PageSearchDTO vo = new PageSearchDTO();
		vo.setSearchType(searchType);
		vo.setSearchValue(searchValue);
		
		// --------------Page ó���ϱ�
		// �� �Խù� �� �������� => ������ TotalRecord :21
		totalRecord = qnABoardDAOInter.getCnt(vo);
		
		// ��ü ������ ����غ��� => totalPage :2.1
		// double totalPage2 = totalRecord/(double)numPerPage;
		
		//  ������ �ø� => 2.1 => 3
		totalPage = (int) Math.ceil(totalRecord / (double) numPerPage);
	
		// totalBlock = totalPage/5;
		totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock);
		
		// ���� �������� ��û�� �� �Ķ���ͷ� ���� ���������� �޴´�. 1 ~~~~~~~ n
		String s_page = cPage;
		if (s_page != null) {
			nowPage = Integer.parseInt(s_page);
		}

		// nowPage�� ������ SQL���� #{begin} , #{end} ����
		beginPerPage = (nowPage - 1) * numPerPage + 1; // 11
		endPerPage = (beginPerPage - 1) + numPerPage; //20
		
		// ������ �����غ���
		//Map<String, Integer> map = new HashMap<String, Integer>();
		//map.put("begin", beginPerPage);
		//map.put("end", endPerPage);
		vo.setBegin(beginPerPage);
		vo.setEnd(endPerPage);
		List<QnABoardDTO> list = qnABoardDAOInter.getSearchList(vo);
		
		// ������ ��Ͼȿ� ������ �ݺ� ��Ű�� ���� startPage , endPage�� ���ؼ�
				// view�� �����ؾ� ��.
				int startPage = (int) ((nowPage - 1) / pagePerBlock) * pagePerBlock + 1; // 
				int endPage = startPage + pagePerBlock - 1;
				// endPage�� ������ ������ �츮�� ���� totalPage�� �̸��̶��
				// totalPage�� ������ ���Խ�Ų��.
				if (endPage > totalPage) {
					endPage = totalPage;
				}
		// View�� forward�� ������ ������		
		model.addAttribute("list", list);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("pagePerBlock", pagePerBlock); // ������ 5
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("searchType", vo.getSearchType());
		model.addAttribute("searchValue", vo.getSearchValue());
		// --------------------------
		model.addAttribute("totalRecord", totalRecord);
		return "qna/qnaList";
	}
	
	@GetMapping(value = "/qadetail")
    public ModelAndView detail(int no) {
		ModelAndView mav = new ModelAndView("qna/qnaDetail");
		System.out.println(no);
		QnABoardDTO vo = qnABoardDAOInter.detailBoard(no);
		// ���-------------
		List<QnACommDTO> listcomm = qnABoardDAOInter.listQAComm(no);
		mav.addObject("listcomm", listcomm);
		// ���-------------
		
		System.out.println(vo);
		mav.addObject("vo", vo);
		return mav;
	}
	@GetMapping(value = "/qadelete")
	public String deleteBoard(int no) {
	qnABoardDAOInter.delete(no);
	return "redirect:/qaboard/qalist";
	
	}
	@GetMapping(value = "/qaupform")
	public ModelAndView upForm(int no) {
		ModelAndView mav = new ModelAndView("qna/qnaUpdate");
		QnABoardDTO vo = qnABoardDAOInter.detailBoard(no);
		mav.addObject("vo", vo);
		return mav;
		
	}
	@RequestMapping(value = "/qaupdate")
	public String updateForm(QnABoardDTO vo) {
		qnABoardDAOInter.upBoard(vo);
		return "redirect:/qaboard/qadetail?no="+vo.getNo();
	}
	
	// ���
	@RequestMapping(value = "/qcomminsert2")
	public ModelAndView addQaComm2(QnACommDTO qcvo) {
		qnABoardDAOInter.addQAComm(qcvo);
		ModelAndView mav = new ModelAndView("redirect:/qaboard/qadetail?no="+qcvo.getMcode());
		return mav;
	}
	
	// ���+�̸���
	@RequestMapping(value = "/qcomminsert")
	public ModelAndView addQaComm(QnACommDTO qcvo) {
		qnABoardDAOInter.addQAComm(qcvo);
		int no = qcvo.getMcode();
		ModelAndView mav = new ModelAndView("redirect:/qaboard/qadetail?no=" + no);
		// --------------

		String id = qcvo.getMwriter();

//		if (id.equals("admin")) {
		if (id.equals("xman")) {
			// QnA�� �ۼ��� ������ �ҷ�����1. �۾��� �α�������
			// loginVO�� qnavo�� ����Ʈ�� getter/setter����
			LoginDTO lvo = qnABoardDAOInter.linkdEmail(no);

			// QnA�� �ۼ��� ������ �ҷ�����2. QnA�Խñ� ���� ����Ʈ�� ���
			List<QnABoardDTO> qlist = lvo.getQnaboard();
			// QnA ����
			String suject = qlist.get(0).getSubject();
			// QnA ����
			String content = qlist.get(0).getContent();
			// admin�����ּ�
			String emailFromRecipient = "modnar159@naver.com";
			// �̸��� ����
			String emailSubject = lvo.getLname() + "���� ���ǿ� ���� ������� �亯�� ��ϵǾ����ϴ�.";
			// QnA�� �ۼ��� ��
			String bar = "\n-----------------------------------\n";
			// admin�����ּ�
			String aa = "\n\n\n �����Ͻ� ���� " +  bar + "���� :\t" + suject + "\n" + content+"\n\n\n";
			String emailMessage = "�亯 \n" + qcvo.getMcontent() + aa;
			String emailToRecipient = lvo.getLemail();

			mailSender.send(new MimeMessagePreparator() {
				public void prepare(MimeMessage mimeMessage) throws Exception {
					MimeMessageHelper mimeMsgHelperObj = new MimeMessageHelper(mimeMessage, true, "UTF-8");
					mimeMsgHelperObj.setTo(emailToRecipient);
					mimeMsgHelperObj.setFrom(emailFromRecipient);
					mimeMsgHelperObj.setText(emailMessage);
					mimeMsgHelperObj.setSubject(emailSubject);
				}
			});
		}
		// --------------

		return mav;
	}
	
	
	@RequestMapping(value = "/upcomm")
	public String upComm(QnACommDTO qcvo) {
		int num= qcvo.getMcode();
		qnABoardDAOInter.upQaComm(qcvo);
		return "redirect:/qaboard/qadetail?no="+num;
	}
	@RequestMapping(value = "/delcomm")
	public String delComm(int no) {
		int num = qnABoardDAOInter.delNo(no);
		qnABoardDAOInter.delQAComm(no);
		return "redirect:/qaboard/qadetail?no="+num;
	}
}
