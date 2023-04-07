package movie.pak.dto;

public class QnACommDTO {
// 수정완료
	private int commno, mcode;
	private String mwriter, mcontent, mregdate;
	
	public int getCommno() {
		return commno;
	}
	public void setCommno(int commno) {
		this.commno = commno;
	}
	public int getMcode() {
		return mcode;
	}
	public void setMcode(int mcode) {
		this.mcode = mcode;
	}
	public String getMwriter() {
		return mwriter;
	}
	public void setMwriter(String mwriter) {
		this.mwriter = mwriter;
	}
	public String getMcontent() {
		return mcontent;
	}
	public void setMcontent(String mcontent) {
		this.mcontent = mcontent;
	}
	public String getMregdate() {
		return mregdate;
	}
	public void setMregdate(String mregdate) {
		this.mregdate = mregdate;
	}
	
}
