package movie.pak.dto;

public class BoxDTO {
	/*
	 * mu.mno, mu.mname, NVL(ratio, 0) AS ratio, mu.mimg
	 */
	// 박스오피스 영화 리스트 뽑기 위한 dto
	private String mno, mname, mimg, ratio;

	public String getMno() {
		return mno;
	}

	public void setMno(String mno) {
		this.mno = mno;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getMimg() {
		return mimg;
	}

	public void setMimg(String mimg) {
		this.mimg = mimg;
	}

	public String getRatio() {
		return ratio;
	}

	public void setRatio(String ratio) {
		this.ratio = ratio;
	}

}