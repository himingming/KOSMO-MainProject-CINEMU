package movie.pak.dto;

public class BoxDTO {
	/*
	 * mu.mno, mu.mname, NVL(ratio, 0) AS ratio, mu.mimg
	 */
	// �ڽ����ǽ� ��ȭ ����Ʈ �̱� ���� dto
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