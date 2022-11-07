package main;

public class MainVO {
	private String ccbaMnm1; // 문화재 명칭 
	private String imageUrl; // 문화재 대표 이미지
	private int MuseumCd; // 박물관 코드 
	private String fcltyNm; // 박물관 명칭
	private String areadr; // 박물관 위치
	private String weekdayOperOpenHhmm; // 평일관람시작시간
	private String weekdayOperColseHhmm; // 평일관람종료시간
	private String holidayOperOpenHhmm; // 공휴일관람시작시간
	private String holidayCloseOpenHhmm; // 공휴일관람종료시간
	
	public MainVO() {
		super();
	}

	public MainVO(String ccbaMnm1, String imageUrl, int museumCd, String fcltyNm, String areadr,
			String weekdayOperOpenHhmm, String weekdayOperColseHhmm, String holidayOperOpenHhmm,
			String holidayCloseOpenHhmm) {
		super();
		this.ccbaMnm1 = ccbaMnm1;
		this.imageUrl = imageUrl;
		MuseumCd = museumCd;
		this.fcltyNm = fcltyNm;
		this.areadr = areadr;
		this.weekdayOperOpenHhmm = weekdayOperOpenHhmm;
		this.weekdayOperColseHhmm = weekdayOperColseHhmm;
		this.holidayOperOpenHhmm = holidayOperOpenHhmm;
		this.holidayCloseOpenHhmm = holidayCloseOpenHhmm;
	}

	@Override
	public String toString() {
		return "Main [ccbaMnm1=" + ccbaMnm1 + ", imageUrl=" + imageUrl + ", MuseumCd=" + MuseumCd + ", fcltyNm="
				+ fcltyNm + ", areadr=" + areadr + ", weekdayOperOpenHhmm=" + weekdayOperOpenHhmm
				+ ", weekdayOperColseHhmm=" + weekdayOperColseHhmm + ", holidayOperOpenHhmm=" + holidayOperOpenHhmm
				+ ", holidayCloseOpenHhmm=" + holidayCloseOpenHhmm + "]";
	}

	public String getCcbaMnm1() {
		return ccbaMnm1;
	}

	public void setCcbaMnm1(String ccbaMnm1) {
		this.ccbaMnm1 = ccbaMnm1;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
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
}
