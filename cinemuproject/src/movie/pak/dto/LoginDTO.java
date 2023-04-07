package movie.pak.dto;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class LoginDTO {
		// 수정완료
	   private int lno;
	   private String lid;
	   private String lpwd;
	   private String lbirth;
	   private String lphone;
	   private String lgender;
	   private String lname;
	   private String laddr;
	   private String lemail;
	   private String limg;
	   private int lmileage;
	   private String lclass;
	
	   // 프로필 사진 업로드
	   private MultipartFile mfile;
	   //mypage 구매 내역
	   private List<QnABoardDTO> qnaboard;
	 //cnt =>차트에서 사람수 출력할 때 사용하는 프로퍼티
	   private int cnt;
	public int getLno() {
		return lno;
	}
	public void setLno(int lno) {
		this.lno = lno;
	}
	public String getLid() {
		return lid;
	}
	public void setLid(String lid) {
		this.lid = lid;
	}
	public String getLpwd() {
		return lpwd;
	}
	public void setLpwd(String lpwd) {
		this.lpwd = lpwd;
	}
	public String getLbirth() {
		return lbirth;
	}
	public void setLbirth(String lbirth) {
		this.lbirth = lbirth;
	}
	public String getLphone() {
		return lphone;
	}
	public void setLphone(String lphone) {
		this.lphone = lphone;
	}
	public String getLgender() {
		return lgender;
	}
	public void setLgender(String lgender) {
		this.lgender = lgender;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getLaddr() {
		return laddr;
	}
	public void setLaddr(String laddr) {
		this.laddr = laddr;
	}
	public String getLemail() {
		return lemail;
	}
	public void setLemail(String lemail) {
		this.lemail = lemail;
	}
	public String getLimg() {
		return limg;
	}
	public void setLimg(String limg) {
		this.limg = limg;
	}
	public int getLmileage() {
		return lmileage;
	}
	public void setLmileage(int lmileage) {
		this.lmileage = lmileage;
	}
	public String getLclass() {
		return lclass;
	}
	public void setLclass(String lclass) {
		this.lclass = lclass;
	}
	public MultipartFile getMfile() {
		return mfile;
	}
	public void setMfile(MultipartFile mfile) {
		this.mfile = mfile;
	}
	public List<QnABoardDTO> getQnaboard() {
		return qnaboard;
	}
	public void setQnaboard(List<QnABoardDTO> qnaboard) {
		this.qnaboard = qnaboard;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
}
