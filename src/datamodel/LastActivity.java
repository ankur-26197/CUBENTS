package datamodel;

public class LastActivity {
	
	private String tname;
	
	private String aname;
	
	public LastActivity()
	{
		tname="Default";
		
		aname="Default";
		
	}
	public void setTname(String tname) {
		this.tname = tname;
	}

	public void setAname(String aname) {
		this.aname = aname;
	}

	public String getTname() {
		return tname;
	}

	public String getAname() {
		return aname;
	}
	
}
