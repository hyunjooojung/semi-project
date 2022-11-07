package Museum;

public class Museum {
	private int    MuseumCd;
	private String fcltyNm;
	private String areadr;
	private String rdnmadr;
	private String latitude;
	private String longitude;
	private String operPhoneNumber;
	private String operInstitutionNm;
	private String homepageUrl;
	private String fcltyInfo;
	private String weekdayOperOpenHhmm;
	private String weekdayOperColseHhmm;
	private String holidayOperOpenHhmm;
	private String holidayCloseOpenHhmm;
	private String rstdeInfo;
	private String adultChrge;
	private String yngbgsChrge;
	private String childChrge;
	private String etcChrgeInfo;
	private String fcltyIntrcn;
	private String trnsportInfo;
	private String phoneNumber;
	private String institutionNm;
	private int 	cnt;

	public Museum(int museumCd, String fcltyNm, String areadr, String rdnmadr, String latitude, String longitude,
			String operPhoneNumber, String operInstitutionNm, String homepageUrl, String fcltyInfo,
			String weekdayOperOpenHhmm, String weekdayOperColseHhmm, String holidayOperOpenHhmm,
			String holidayCloseOpenHhmm, String rstdeInfo, String adultChrge, String yngbgsChrge, String childChrge,
			String etcChrgeInfo, String fcltyIntrcn, String trnsportInfo, String phoneNumber, String institutionNm,
			int cnt) {
		super();
		MuseumCd = museumCd;
		this.fcltyNm = fcltyNm;
		this.areadr = areadr;
		this.rdnmadr = rdnmadr;
		this.latitude = latitude;
		this.longitude = longitude;
		this.operPhoneNumber = operPhoneNumber;
		this.operInstitutionNm = operInstitutionNm;
		this.homepageUrl = homepageUrl;
		this.fcltyInfo = fcltyInfo;
		this.weekdayOperOpenHhmm = weekdayOperOpenHhmm;
		this.weekdayOperColseHhmm = weekdayOperColseHhmm;
		this.holidayOperOpenHhmm = holidayOperOpenHhmm;
		this.holidayCloseOpenHhmm = holidayCloseOpenHhmm;
		this.rstdeInfo = rstdeInfo;
		this.adultChrge = adultChrge;
		this.yngbgsChrge = yngbgsChrge;
		this.childChrge = childChrge;
		this.etcChrgeInfo = etcChrgeInfo;
		this.fcltyIntrcn = fcltyIntrcn;
		this.trnsportInfo = trnsportInfo;
		this.phoneNumber = phoneNumber;
		this.institutionNm = institutionNm;
		this.cnt = cnt;
	}

	@Override
	public String toString() {
		return "Museum [MuseumCd=" + MuseumCd + ", fcltyNm=" + fcltyNm + ", areadr=" + areadr + ", rdnmadr=" + rdnmadr
				+ ", latitude=" + latitude + ", longitude=" + longitude + ", operPhoneNumber=" + operPhoneNumber
				+ ", operInstitutionNm=" + operInstitutionNm + ", homepageUrl=" + homepageUrl + ", fcltyInfo="
				+ fcltyInfo + ", weekdayOperOpenHhmm=" + weekdayOperOpenHhmm + ", weekdayOperColseHhmm="
				+ weekdayOperColseHhmm + ", holidayOperOpenHhmm=" + holidayOperOpenHhmm + ", holidayCloseOpenHhmm="
				+ holidayCloseOpenHhmm + ", rstdeInfo=" + rstdeInfo + ", adultChrge=" + adultChrge + ", yngbgsChrge="
				+ yngbgsChrge + ", childChrge=" + childChrge + ", etcChrgeInfo=" + etcChrgeInfo + ", fcltyIntrcn="
				+ fcltyIntrcn + ", trnsportInfo=" + trnsportInfo + ", phoneNumber=" + phoneNumber + ", institutionNm="
				+ institutionNm + ", cnt=" + cnt + "]";
	}

	public Museum() {
		super();
	}

	public int getMuseumCd() {
		return MuseumCd;
	}

	public void setMuseumCd(int museumCd) {
		MuseumCd = museumCd;
	}

	public String getFcltyNm() {
		return fcltyNm;
	}

	public void setFcltyNm(String fcltyNm) {
		this.fcltyNm = fcltyNm;
	}

	public String getAreadr() {
		return areadr;
	}

	public void setAreadr(String areadr) {
		this.areadr = areadr;
	}

	public String getRdnmadr() {
		return rdnmadr;
	}

	public void setRdnmadr(String rdnmadr) {
		this.rdnmadr = rdnmadr;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	public String getOperPhoneNumber() {
		return operPhoneNumber;
	}

	public void setOperPhoneNumber(String operPhoneNumber) {
		this.operPhoneNumber = operPhoneNumber;
	}

	public String getOperInstitutionNm() {
		return operInstitutionNm;
	}

	public void setOperInstitutionNm(String operInstitutionNm) {
		this.operInstitutionNm = operInstitutionNm;
	}

	public String getHomepageUrl() {
		return homepageUrl;
	}

	public void setHomepageUrl(String homepageUrl) {
		this.homepageUrl = homepageUrl;
	}

	public String getFcltyInfo() {
		return fcltyInfo;
	}

	public void setFcltyInfo(String fcltyInfo) {
		this.fcltyInfo = fcltyInfo;
	}

	public String getWeekdayOperOpenHhmm() {
		return weekdayOperOpenHhmm;
	}

	public void setWeekdayOperOpenHhmm(String weekdayOperOpenHhmm) {
		this.weekdayOperOpenHhmm = weekdayOperOpenHhmm;
	}

	public String getWeekdayOperColseHhmm() {
		return weekdayOperColseHhmm;
	}

	public void setWeekdayOperColseHhmm(String weekdayOperColseHhmm) {
		this.weekdayOperColseHhmm = weekdayOperColseHhmm;
	}

	public String getHolidayOperOpenHhmm() {
		return holidayOperOpenHhmm;
	}

	public void setHolidayOperOpenHhmm(String holidayOperOpenHhmm) {
		this.holidayOperOpenHhmm = holidayOperOpenHhmm;
	}

	public String getHolidayCloseOpenHhmm() {
		return holidayCloseOpenHhmm;
	}

	public void setHolidayCloseOpenHhmm(String holidayCloseOpenHhmm) {
		this.holidayCloseOpenHhmm = holidayCloseOpenHhmm;
	}

	public String getRstdeInfo() {
		return rstdeInfo;
	}

	public void setRstdeInfo(String rstdeInfo) {
		this.rstdeInfo = rstdeInfo;
	}

	public String getAdultChrge() {
		return adultChrge;
	}

	public void setAdultChrge(String adultChrge) {
		this.adultChrge = adultChrge;
	}

	public String getYngbgsChrge() {
		return yngbgsChrge;
	}

	public void setYngbgsChrge(String yngbgsChrge) {
		this.yngbgsChrge = yngbgsChrge;
	}

	public String getChildChrge() {
		return childChrge;
	}

	public void setChildChrge(String childChrge) {
		this.childChrge = childChrge;
	}

	public String getEtcChrgeInfo() {
		return etcChrgeInfo;
	}

	public void setEtcChrgeInfo(String etcChrgeInfo) {
		this.etcChrgeInfo = etcChrgeInfo;
	}

	public String getFcltyIntrcn() {
		return fcltyIntrcn;
	}

	public void setFcltyIntrcn(String fcltyIntrcn) {
		this.fcltyIntrcn = fcltyIntrcn;
	}

	public String getTrnsportInfo() {
		return trnsportInfo;
	}

	public void setTrnsportInfo(String trnsportInfo) {
		this.trnsportInfo = trnsportInfo;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getInstitutionNm() {
		return institutionNm;
	}

	public void setInstitutionNm(String institutionNm) {
		this.institutionNm = institutionNm;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
}