package datamodel;

public class Text extends Content{
	
	private String data;
	
	public Text(String id, double x, double y,String data,int groupOrder,String animation,int animOrder,int duration)
	{
		super(id,x,y,groupOrder,animation,animOrder,duration);
		
		this.data=data;
		
	}
	
	public String getData()
	{
		return data;
	}
}
