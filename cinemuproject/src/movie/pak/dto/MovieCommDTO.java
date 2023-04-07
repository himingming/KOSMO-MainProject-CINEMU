package movie.pak.dto;

public class MovieCommDTO {
	// 수정완료
	private int commno, mno, mgood, rnum;

	private float mgoodAvg;
	private String lid,comm,commdate;
	private String mimg,mname; // 후기 출력을 위한 추가
	
	
	
	public String getMimg() {
		return mimg;
	}
	public void setMimg(String mimg) {
		this.mimg = mimg;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	
	public int getCommno() {
		return commno;
	}
	public void setCommno(int commno) {
		this.commno = commno;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getMgood() {
		return mgood;
	}
	public void setMgood(int mgood) {
		this.mgood = mgood;
	}
	public float getMgoodAvg() {
		return mgoodAvg;
	}
	public void setMgoodAvg(float mgoodAvg) {
		this.mgoodAvg = mgoodAvg;
	}
	public String getLid() {
		return lid;
	}
	public void setLid(String lid) {
		this.lid = lid;
	}
	public String getComm() {
		return comm;
	}
	public void setComm(String comm) {
		this.comm = comm;
	}
	public String getCommdate() {
		return commdate;
	}
	public void setCommdate(String commdate) {
		this.commdate = commdate;
	}
	
	
}
