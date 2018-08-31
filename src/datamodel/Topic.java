package datamodel;

import java.util.ArrayList;

public class Topic {

	private String tname;		//topic name
	
	private ArrayList<String> activityName=new ArrayList<String>();		//names of activities related to this topics
	
	public Topic(String tname) 
	{
		
		this.tname = tname;
		
	}
	
	public String getTname() 
	{
		
		return tname;
	}
	
	public void addActivity(String name)
	{
		activityName.add(name);
	}
	
	public ArrayList<String> getActivityName()
	{
		return activityName;
	}
	
	
}
