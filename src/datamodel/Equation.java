package datamodel;

import java.util.ArrayList;

public class Equation extends Content{
	
	private String code;
	
	ArrayList<EquationChildren> children;
	
	public Equation(String id, double x, double y,String code
			,ArrayList<EquationChildren> children,int groupOrder,String animation,int animOrder,int duration) {
		
		super(id, x, y,groupOrder,animation,animOrder,duration);
		
		this.code=code;
		
		this.children=children;
	}
	
	public String getCode()
	{
		return code;
	}
	
	public ArrayList<EquationChildren> getChildren()
	{
		return children;
	}

}
