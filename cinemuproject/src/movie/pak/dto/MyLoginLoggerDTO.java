package movie.pak.dto;

public class MyLoginLoggerDTO {
	// �����Ϸ�
	private int num;
	   private String idn;
	   private String reip,uagent; // � �������
	   private String sstime; // login �ð���
	   private String status; // ����
	   
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getIdn() {
		return idn;
	}
	public void setIdn(String idn) {
		this.idn = idn;
	}
	public String getReip() {
		return reip;
	}
	public void setReip(String reip) {
		this.reip = reip;
	}
	public String getUagent() {
		return uagent;
	}
	public void setUagent(String uagent) {
		this.uagent = uagent;
	}
	public String getSstime() {
		return sstime;
	}
	public void setSstime(String sstime) {
		this.sstime = sstime;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
}
