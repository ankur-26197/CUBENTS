package datamodel;

public class GroupComponent {
	
	
	private String id;
	
	private String animation;
	
	private int order;

	private int duration;
	
	public GroupComponent(String id, String animation, int order,int duration) {
		super();
		this.id = id;
		this.animation = animation;
		this.order = order;
		this.duration=duration;
	}

	
	public String getId() {
		return id;
	}

	public String getAnimation() {
		return animation;
	}

	public int getOrder() {
		return order;
	}
	
	public int getDuration(){
		return duration;
	}
	
}
