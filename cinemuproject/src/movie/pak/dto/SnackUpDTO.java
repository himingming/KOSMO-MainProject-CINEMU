package movie.pak.dto;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class SnackUpDTO {
	// 수정완료
	private int popno;
	private int poppay;
	private String popimg;
	private String popname;
	private String usedate;
	private String country;
	private String snackdetail;
	
	private String lid; // 스낵구매내역 출력을 위한 추가
	private int rnum; // 스낵구매내역 출력을 위한 추가
	private int snacksaram; // 스낵구매내역 출력을 위한 추가
	
	// 스낵 구매 내역
	private List<SnackBuyDTO> buy;
	// spring web 제공해주는 multipart.MultipartFile
	private MultipartFile mfile;
	
	
	
	public String getLid() {
		return lid;
	}
	public void setLid(String lid) {
		this.lid = lid;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public int getSnacksaram() {
		return snacksaram;
	}
	public void setSnacksaram(int snacksaram) {
		this.snacksaram = snacksaram;
	}

	
	public int getPopno() {
		return popno;
	}
	public void setPopno(int popno) {
		this.popno = popno;
	}
	public int getPoppay() {
		return poppay;
	}
	public void setPoppay(int poppay) {
		this.poppay = poppay;
	}
	public String getPopimg() {
		return popimg;
	}
	public void setPopimg(String popimg) {
		this.popimg = popimg;
	}
	public String getPopname() {
		return popname;
	}
	public void setPopname(String popname) {
		this.popname = popname;
	}
	public String getUsedate() {
		return usedate;
	}
	public void setUsedate(String usedate) {
		this.usedate = usedate;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getSnackdetail() {
		return snackdetail;
	}
	public void setSnackdetail(String snackdetail) {
		this.snackdetail = snackdetail;
	}
	public List<SnackBuyDTO> getBuy() {
		return buy;
	}
	public void setBuy(List<SnackBuyDTO> buy) {
		this.buy = buy;
	}
	public MultipartFile getMfile() {
		return mfile;
	}
	public void setMfile(MultipartFile mfile) {
		this.mfile = mfile;
	}
	
	
}
