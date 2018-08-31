package datamodel;

import java.util.ArrayList;


public class Activity {
	
	String tname;
	
	String name;					//for activity name
	
	String type;					//for activity type	
	
	String desc;					//for activity description
	
	ArrayList<Text> text;			//all text type contents
	
	ArrayList<Graphics> graphics;	//all graphic type contents
	
	ArrayList<Equation> equations;	//all equation type contents
	
	ArrayList<Group> groups;
	
	ArrayList<Hints> hints;
	
	public Activity(String tname,String name, String type, String desc, ArrayList<Text> text,
			ArrayList<Graphics> graphics, ArrayList<Equation> equations,ArrayList<Group> groups,
			ArrayList<Hints> hints) 
	{
		this.tname=tname;
		this.name = name;
		this.type = type;
		this.desc = desc;
		this.text = text;
		this.graphics = graphics;
		this.equations = equations;
		this.groups=groups;
		this.hints=hints;
	}
	
	// getters for all attributes
	
	public String getTname() {
		return tname;
	}
	
	public String getName() {
		return name;
	}
	
	public String getType() {
		return type;
	}
	
	public String getDesc() {
		return desc;
	}
	
	
	public ArrayList<Text> getText() {
		return text;
	}
	
	public ArrayList<Graphics> getGraphics() {
		return graphics;
	}
	
	public ArrayList<Equation> getEquations() {
		return equations;
	}

	public ArrayList<Group> getGroups() {
		return groups;
	}

	public ArrayList<Hints> getHints() {
		return hints;
	}

}
