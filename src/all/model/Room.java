package all.model;

public class Room 
{
	private int rmId;
	private String id;
	private String rmCap;
	private String rmName;
	private String rmDesc;
	
	public int getId() {
		return rmId;
	}
	public void setId(int rmId) {
		this.rmId = rmId;
	}
	
	public String getAid() {
		return id;
	}
	public void setAid(String id) {
		this.id = id;
	}
	
	public String getName()
	{
		return rmName;
	}
	public void setName(String rmName) {
		this.rmName = rmName;
	}
	
	public String getCap()
	{
		return rmCap;
	}
	public void setCap(String rmCap) {
		this.rmCap = rmCap;
	}
	
	public String getDesc()
	{
		return rmDesc;
	}
	public void setDesc(String rmDesc) {
		this.rmDesc = rmDesc;
	}
	
}
