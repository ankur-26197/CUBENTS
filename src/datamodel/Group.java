package datamodel;

import java.util.ArrayList;

public class Group {
	
	private int groupOrder;
	
	private String event;
	
	private ArrayList<GroupComponent> components;
	
	private int delay;
	
	public Group(int groupOrder,String event,int delay,ArrayList<GroupComponent> components)
	{
		this.groupOrder=groupOrder;
		this.event=event;
		this.delay=delay;
		this.components=components;
		
	}

	public int getGroupOrder() {
		return groupOrder;
	}
	
	
	public String getEvent()
	{
		return event;
	}
	public ArrayList<GroupComponent> getComponents() {
		return components;
	}
	
	public int getDelay()
	{
		return delay;
	}
	
	
}
