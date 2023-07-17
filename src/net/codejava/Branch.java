package net.codejava;

public class Branch {
	private int bid;
	private String bname;
	private String bstreet;
	private String bcity;
	private String bstate;
	private String bzip;
	private String bcountry;
	private boolean valid;
	
	public boolean isValid() {
		return valid;
	}
	public void setValid(boolean valid) {
		this.valid = valid;
	}
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public String getBstreet() {
		return bstreet;
	}
	public void setBstreet(String bstreet) {
		this.bstreet = bstreet;
	}
	public String getBcity() {
		return bcity;
	}
	public void setBcity(String bcity) {
		this.bcity = bcity;
	}
	public String getBstate() {
		return bstate;
	}
	public void setBstate(String bstate) {
		this.bstate = bstate;
	}
	public String getBzip() {
		return bzip;
	}
	public void setBzip(String bzip) {
		this.bzip = bzip;
	}
	public String getBcountry() {
		return bcountry;
	}
	public void setBcountry(String bcountry) {
		this.bcountry = bcountry;
	}
	
	

}
