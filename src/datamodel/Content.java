package datamodel;

public abstract class Content {
	

	private String id;
	
	private double x;
	
	private double y;
	
	private int groupOrder;
	
	private String animation;
	
	private int animOrder;
	
	private int duration;
	
	public Content(String id, double x, double y,int groupOrder,String animation,int animOrder,int duration) {
		this.id = id;
		this.x = x;
		this.y = y;
		this.groupOrder=groupOrder;
		this.animation=animation;
		this.animOrder=animOrder;
		this.duration=duration;
	}
	
	public int getGroupOrder(){
		
		return groupOrder;
	}
	public String getId() {
		return id;
	}

	public double getX() {
		return x;
	}

	public double getY() {
		return y;
	}

	public String getAnimation() {
		return animation;
	}

	public int getAnimOrder() {
		return animOrder;
	}

	public int getDuration() {
		return duration;
	}
	
}