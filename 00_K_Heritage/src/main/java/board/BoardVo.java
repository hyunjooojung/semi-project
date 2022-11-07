package board;

import java.util.Date;

public class BoardVo {

	private int 	Rnum;
	private int 	bnum;
	private String 	title;
	private String 	content;
	private Date 	bdate;
	private int 	cid;
	private int 	ucode;
	private int 	readcount;
	private String 	status;
	private String  id;
	
	public int getRnum() {
		return Rnum;
	}

	public void setRnum(int rnum) {
		Rnum = rnum;
	}

	public String getId() {
		String[] array = id.split("@");
		return array[0];
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public int getBnum() {
		return bnum;
	}
	public void setBnum(int bnum) {
		this.bnum = bnum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getBdate() {
		return bdate;
	}
	public void setBdate(Date bdate) {
		this.bdate = bdate;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public int getUcode() {
		return ucode;
	}
	public void setUcode(int ucode) {
		this.ucode = ucode;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

	public BoardVo(int bnum, String title, String content, Date bdate, int cid, int ucode, int readcount, String status,
			String id) {
		super();
		this.bnum = bnum;
		this.title = title;
		this.content = content;
		this.bdate = bdate;
		this.cid = cid;
		this.ucode = ucode;
		this.readcount = readcount;
		this.status = status;
		this.id = id;
	}

	public BoardVo() {
	}

	@Override
	public String toString() {
		return "BoardVo [bnum=" + bnum + ", title=" + title + ", content=" + content + ", bdate=" + bdate + ", cid="
				+ cid + ", ucode=" + ucode + ", readcount=" + readcount + ", status=" + status + ", id=" + id + "]";
	}
	
}
