package member;

public class MemberVo {

	private int UCode; // 회원코드
	private String UName; // 이름
	private String UTel; // 전화번호
	private String UEmail; // 이메일
	private String Id; // ID
	private String UPw; // PW
	private String gender; // 성별
	private String MembershipClass; // 등급
	private String status; // 삭제유무
	
	public int getUCode() {
		return UCode;
	}
	public void setUCode(int uCode) {
		UCode = uCode;
	}
	public String getUName() {
		return UName;
	}
	public void setUName(String uName) {
		UName = uName;
	}
	public String getUTel() {
		return UTel;
	}
	public void setUTel(String uTel) {
		UTel = uTel;
	}
	public String getUEmail() {
		return UEmail;
	}
	public void setUEmail(String uEmail) {
		UEmail = uEmail;
	}
	public String getId() {
		return Id;
	}
	public void setId(String id) {
		Id = id;
	}
	public String getUPw() {
		return UPw;
	}
	public void setUPw(String uPw) {
		UPw = uPw;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getMembershipClass() {
		return MembershipClass;
	}
	public void setMembershipClass(String membershipClass) {
		MembershipClass = membershipClass;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	public MemberVo(int uCode, String uName, String uTel, String uEmail, String id, String uPw, String gender,
			String membershipClass, String status) {
		super();
		UCode = uCode;
		UName = uName;
		UTel = uTel;
		UEmail = uEmail;
		Id = id;
		UPw = uPw;
		this.gender = gender;
		MembershipClass = membershipClass;
		this.status = status;
	}
	
	public MemberVo() {
		
	}
	
	@Override
	public String toString() {
		return "MemberVo [UCode=" + UCode + ", UName=" + UName + ", UTel=" + UTel + ", UEmail=" + UEmail + ", Id=" + Id
				+ ", UPw=" + UPw + ", gender=" + gender + ", MembershipClass=" + MembershipClass + ", status=" + status
				+ "]";
	}

	
}