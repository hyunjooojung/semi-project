package board;

import java.util.Date;

public class B_Comment {

	private int cnum;
	private String content;
	private Date cdate;
	private int bnum;
	private int ucode;
	private String status;
	private String id;
	
	public B_Comment() {
	}

	public B_Comment(int cnum, String content, Date cdate, int bnum, int ucode, String status, String id) {
		super();
		this.cnum = cnum;
		this.content = content;
		this.cdate = cdate;
		this.bnum = bnum;
		this.ucode = ucode;
		this.status = status;
		this.id = id;
	}

	public int getCnum() {
		return cnum;
	}

	public void setCnum(int cnum) {
		this.cnum = cnum;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCdate() {
		return cdate;
	}

	public void setCdate(Date cdate) {
		this.cdate = cdate;
	}

	public int getBnum() {
		return bnum;
	}

	public void setBnum(int bnum) {
		this.bnum = bnum;
	}

	public int getUcode() {
		return ucode;
	}

	public void setUcode(int ucode) {
		this.ucode = ucode;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getId() {
		String[] array = id.split("@");
		return array[0];
	}

	public void setId(String id) {
		this.id = id;
	}
	
	
	
}
