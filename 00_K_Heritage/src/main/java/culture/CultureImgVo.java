package culture;

public class CultureImgVo {

	private String ccbaAsno; // 지정번호
	private int ccbaKdcd; // 종목코드
	private String ccbaCtcd; // 시도코드
	private int sn; // 순번
	private String imageNuri; // 공공누리 타입 A : 제1유형, B : 제2유형, C : 제3유형, D : 제4유형공공누리
	private String imageUrl; // 메인노출이미지URL
	private String ccimDesc; // 이미지설명

	
	
	@Override
	public String toString() {
		return "CultureImg [ccbaAsno=" + ccbaAsno + ", ccbaKdcd=" + ccbaKdcd + ", ccbaCtcd=" + ccbaCtcd + ", sn=" + sn
				+ ", imageNuri=" + imageNuri + ", imageUrl=" + imageUrl + ", ccimDesc=" + ccimDesc + "]";
	}

	public CultureImgVo() {
	}

	public CultureImgVo(String ccbaAsno, int ccbaKdcd, String ccbaCtcd, 
						int sn, String imageNuri, String imageUrl,
							String ccimDesc) {
		
		this.ccbaAsno = ccbaAsno;
		this.ccbaKdcd = ccbaKdcd;
		this.ccbaCtcd = ccbaCtcd;
		this.sn = sn;
		this.imageNuri = imageNuri;
		this.imageUrl = imageUrl;
		this.ccimDesc = ccimDesc;
	}


	public String getCcbaAsno() {
		return ccbaAsno;
	}


	public void setCcbaAsno(String ccbaAsno) {
		this.ccbaAsno = ccbaAsno;
	}


	public int getCcbaKdcd() {
		return ccbaKdcd;
	}


	public void setCcbaKdcd(int ccbaKdcd) {
		this.ccbaKdcd = ccbaKdcd;
	}


	public String getCcbaCtcd() {
		return ccbaCtcd;
	}


	public void setCcbaCtcd(String ccbaCtcd) {
		this.ccbaCtcd = ccbaCtcd;
	}


	public int getSn() {
		return sn;
	}


	public void setSn(int sn) {
		this.sn = sn;
	}


	public String getImageNuri() {
		return imageNuri;
	}


	public void setImageNuri(String imageNuri) {
		this.imageNuri = imageNuri;
	}


	public String getImageUrl() {
		return imageUrl;
	}


	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}


	public String getCcimDesc() {
		return ccimDesc;
	}


	public void setCcimDesc(String ccimDesc) {
		this.ccimDesc = ccimDesc;
	}
	
	
	
	
}