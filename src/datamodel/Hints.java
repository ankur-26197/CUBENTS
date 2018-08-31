package datamodel;

public class Hints {
	
	private String cid;
	
	private String bigHint;
	
	private String smallHint;
	
	private String url;
	
	public Hints(String cid, String bigHint, String smallHint, String url) {
		super();
		this.cid = cid;
		this.bigHint = bigHint;
		this.smallHint = smallHint;
		this.url = url;
	}

	public String getCid() {
		return cid;
	}

	public String getBigHint() {
		return bigHint;
	}

	public String getSmallHint() {
		return smallHint;
	}

	public String getUrl() {
		return url;
	}
	
	
}
