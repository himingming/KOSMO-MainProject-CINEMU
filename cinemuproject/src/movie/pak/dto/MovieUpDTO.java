package movie.pak.dto;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class MovieUpDTO {
 // 수정완료
	private int mno, msaram, mage, rnum;

	private String mimg, mname, mtype, mtime, mstartday, mdirec, mstory, mactor, mendday, mmain;
	
	// 용도가 없으면 나중에 삭제하기
	private List<MovieBuyDTO> moviebuy;
	private List<ScreeningDTO> screenlist;

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public List<ScreeningDTO> getScreenlist() {
		return screenlist;
	}

	public void setScreenlist(List<ScreeningDTO> screenlist) {
		this.screenlist = screenlist;
	}

	public String getMmain() {
		return mmain;
	}

	public void setMmain(String mmain) {
		this.mmain = mmain;
	}

	private MultipartFile mfile;

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public int getMsaram() {
		return msaram;
	}

	public void setMsaram(int msaram) {
		this.msaram = msaram;
	}

	public int getMage() {
		return mage;
	}

	public void setMage(int mage) {
		this.mage = mage;
	}

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

	public String getMtype() {
		return mtype;
	}

	public void setMtype(String mtype) {
		this.mtype = mtype;
	}

	public String getMtime() {
		return mtime;
	}

	public void setMtime(String mtime) {
		this.mtime = mtime;
	}

	public String getMstartday() {
		return mstartday;
	}

	public void setMstartday(String mstartday) {
		this.mstartday = mstartday;
	}

	public String getMdirec() {
		return mdirec;
	}

	public void setMdirec(String mdirec) {
		this.mdirec = mdirec;
	}

	public String getMstory() {
		return mstory;
	}

	public void setMstory(String mstory) {
		this.mstory = mstory;
	}

	public String getMactor() {
		return mactor;
	}

	public void setMactor(String mactor) {
		this.mactor = mactor;
	}

	public String getMendday() {
		return mendday;
	}

	public void setMendday(String mendday) {
		this.mendday = mendday;
	}

	public List<MovieBuyDTO> getMoviebuy() {
		return moviebuy;
	}

	public void setMoviebuy(List<MovieBuyDTO> moviebuy) {
		this.moviebuy = moviebuy;
	}

	public MultipartFile getMfile() {
		return mfile;
	}

	public void setMfile(MultipartFile mfile) {
		this.mfile = mfile;
	}
	
	

}
