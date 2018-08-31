package datastore;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import datamodel.*;
//database class all functions are self explanatory
public class DataManager {
	
	Connection connect;					//to establish connection with database
	
	PreparedStatement query;			//common query statement;
	
	public DataManager()
	{
		connect=ConnectionPool.getInstance().getConnection();
		try {
			connect.setAutoCommit(false);
		} catch (SQLException e) {
			System.out.println("Error in creating connection");
			e.printStackTrace();
		}
		
	}
	
	public void close() 
	{
		try {
			connect.commit();
			connect.close();
		} catch (SQLException e) {
			
			System.out.println("Error in closing connection");
			e.printStackTrace();
		}
	}
	public void insertActivity(Activity a)
	{
		try{
			
			query=connect.prepareStatement("insert into activity values(?,?,?,?)");
			
			query.setString(1, a.getTname());
			
			query.setString(2, a.getName());
			
			query.setString(3, a.getType());
			
			query.setString(4, a.getDesc());
			
			query.execute();
			
			insertText(a.getText(),a.getTname(),a.getName());
			
			insertEquation(a.getEquations(),a.getTname(),a.getName());
			
			insertGraphics(a.getGraphics(),a.getTname(),a.getName());
			
			insertGroup(a.getGroups(),a.getTname(),a.getName());
			
			insertHints(a.getHints(),a.getTname(),a.getName());
			
			query.close();
			
		}catch(SQLException e)
		{
			System.out.println("Error in insertActivity");
			
			e.printStackTrace();
		}
	}
	
	private void insertHints(ArrayList<Hints> hint,String tname,String aname)
	{
		try{
			
			query=connect.prepareStatement("Insert into hints values(?,?,?,?,?,?)");
			
			query.setString(1, tname);
			
			query.setString(2, aname);
			
			PreparedStatement query2=connect.prepareStatement("select * from content where tname=? and aname=? and cid=?");
			query2.setString(1, tname);
			query2.setString(2, aname);
			
			
			for(int i=0;i<hint.size();i++)
			{
				Hints h=hint.get(i);
				
				System.out.println("Hint associated with id "+hint.get(i).getCid());
				
				String id;
				if(h.getCid().charAt(0)=='e')
				id="e"+h.getCid().substring(2);
				
				else
					id=h.getCid();
				query2.setString(3, id);
				
				query2.execute();
				
				if(!query2.getResultSet().next())
					continue;
				
				query.setString(3, id);
				
				query.setString(4, h.getBigHint());
				
				query.setString(5, h.getSmallHint());
				
				query.setString(6, h.getUrl());
				
				query.addBatch();
			}
			
			query.executeBatch();
			query2.close();
			query.close();
		}catch(SQLException e)
		{
			
			System.out.println("Error in insertHints "+tname + "  "+ aname+"  ");
			
			e.printStackTrace();
		}
	}
	
	private void insertGroup(ArrayList<Group> group,String tname,String aname)
	{
		try{
			
			query=connect.prepareStatement("Insert into grouping values(?,?,?,?,?)");
			
			query.setString(1, tname);
			
			query.setString(2, aname);
			
			for(int i=0;i<group.size();i++)
			{
				Group g=group.get(i);
				
				System.out.println("Came here &&&&&"+g.getGroupOrder());
				
				query.setInt(3, g.getGroupOrder());
				
				query.setString(4, g.getEvent());
				
				query.setInt(5, g.getDelay());
				
				query.addBatch();
			}
			
			query.executeBatch();
			
			query.close();
			
			for(int i=0;i<group.size();i++)
			{
				insertGroupComponent(group.get(i).getComponents(),tname,aname,group.get(i).getGroupOrder());
			}
		}catch(SQLException e)
		{
			System.out.println("Error in insertGroup");
			e.printStackTrace();
		}
	}
	
	
	private void insertGroupComponent(ArrayList<GroupComponent> component,String tname,String aname,int groupOrder)
	{
		try{
			
			query=connect.prepareStatement("Insert into groupingDetails values(?,?,?,?,?,?,?)");
			
			query.setString(1, tname);
			
			query.setString(2,aname);
			
			query.setInt(3,groupOrder);
			
			System.out.println("Size of group component "+component.size());
			
			PreparedStatement query2=connect.prepareStatement("select * from content where tname=? and aname=? and cid=?");
			
			query2.setString(1, tname);
			
			query2.setString(2, aname);
			for(int i=0;i<component.size();i++)
			{
				System.out.println("Entered "+component.get(i).getId());
				
				query2.setString(3, component.get(i).getId());
				
				query2.execute();
				
				
				if(!query2.getResultSet().next())
					continue;
					
				query.setString(4,component.get(i).getId());
				
				query.setString(5,component.get(i).getAnimation());
				
				query.setInt(6, component.get(i).getOrder());
				
				query.setInt(7, component.get(i).getDuration());
				
				query.execute();
			}
			
			
			query.close();
			
			query2.close();
			
		}catch(SQLException e)
		{
			System.out.println("Error in insertGroupComponent"+tname+"  "+aname+"  "+groupOrder);
			
			e.printStackTrace();
		}
	}
	
	public void insertTopic(Topic t)
	{
		try{
			
			query=connect.prepareStatement("select * from topic where tname=?");
			
			query.setString(1, t.getTname());
			
			query.execute();
			
			if(query.getResultSet().next())
				return;
			
			query=connect.prepareStatement("Insert into topic values(?)");
			
			query.setString(1, t.getTname());
			
			query.execute();
			
			query.close();
			
		}catch(SQLException e)
		{
			System.out.println("Error in Insert topic");
			
			e.printStackTrace();
		}
	}
	
	public void deleteTopic(String tname)
	{
		try{
			
			query=connect.prepareStatement("delete from topic where tname=?");
			
			query.setString(1,tname);
			
			query.execute();
			
			query.close();
		}catch(SQLException e)
		{
			System.out.println("Error in deleteTopic");
			
			e.printStackTrace();
		}
	}
	
	public void deleteActivity(String tname,String aname)
	{
		try{
			
			
			query=connect.prepareStatement("delete from activity where tname=? and aname=?");
			
			query.setString(1, tname);
			
			query.setString(2, aname);
			
			query.execute();
			
			query.close();
			
		}catch(SQLException e)
		{
			
			System.out.println("Error in deleteActivity");
			
			e.printStackTrace();
		}
	}
	
	private void insertText(ArrayList<Text> text,String tname,String aname)
	{
		insertContent(text,tname,aname);
		
		try{
			
			query=connect.prepareStatement("Insert into text values (?,?,?,?)");
			
			query.setString(1, tname);
			
			query.setString(2, aname);
			
			for(int i=0;i<text.size();i++)
			{
				Text t=text.get(i);
				
				query.setString(3, t.getId());
				
				query.setString(4, t.getData());
				
				query.addBatch();
			}
			
			query.executeBatch();
			
			query.close();
		}catch(SQLException e)
		{
			System.out.println("Error in insertText");
			
			e.printStackTrace();
		}
		
	}
	
	private void insertEquation(ArrayList<Equation> equation,String tname,String aname)
	{
		insertContent(equation,tname,aname);
		
		try{
			
			query=connect.prepareStatement("Insert into equation values(?,?,?,?)");
			
			query.setString(1, tname);
			
			query.setString(2,aname);
			
			for(int i=0;i<equation.size();i++)
			{
				Equation e=equation.get(i);
				
				query.setString(3, e.getId());
				
				query.setString(4, e.getCode());
				
				query.addBatch();;
			}
			
			query.executeBatch();
			
			query.close();
			
			for(int i=0;i<equation.size();i++)
			{
				insertEquationChildren(equation.get(i).getChildren(),tname,aname,equation.get(i).getId());
			}
			
		}catch(SQLException e)
		{
			System.out.println("Error in insertEquation");
			
			e.printStackTrace();
		}
	}
	
	private void insertGraphics(ArrayList<Graphics> graphics,String tname,String aname)
	{
		insertContent(graphics,tname,aname);
		
		try{
			
			query=connect.prepareStatement("insert into graphics values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			
			query.setString(1, tname);
			
			query.setString(2, aname);
			
			for(int i=0;i<graphics.size();i++)
			{
				Graphics g=graphics.get(i);
				
				query.setString(3, g.getId());
				
				query.setString(4,g.getType());
				
				query.setDouble(5, g.getWidth());
				
				query.setDouble(6, g.getHeight());
				
				query.setString(7,g.getFill());
				
				query.setString(8, g.getStroke());
				
				query.setInt(9, g.getStrokeWidth());
				
				query.setString(10, g.getStrokeDashArray());
				
				query.setDouble(11, g.getScaleX());
				
				query.setDouble(12, g.getScaleY());
				
				query.setInt(13,g.getOpacity());
				
				query.setBoolean(14, g.isVisible());
				
				query.setDouble(15, g.getAngle());
				
				query.setDouble(16, g.getRight());
				
				query.setDouble(17,g.getBottom());
				
				query.setString(18, g.getEasing());
				
				query.setString(19, g.getEaseAttr());
				
				query.setInt(20, g.getEaseValue());
				
				query.setString(21,g.getOtherParameters());
				
				query.addBatch();
			}
			
			
			query.executeBatch();
			
			query.close();
		}catch(SQLException e)
		{
			System.out.println("Error in insert activity");
			
			e.printStackTrace();
		}
		
	}
	
	private void insertContent(ArrayList<? extends Content> content,String tname,String aname)
	{
		try{
			
			query=connect.prepareStatement("Insert into content values(?,?,?,?,?,?,?,?,?)");
			
			query.setString(1, tname);
			
			query.setString(2, aname);
			
			for(int i=0;i<content.size();i++)
			{
				Content c=content.get(i);
				
				query.setString(3, c.getId());
				
				query.setDouble(4, c.getX());
				
				query.setDouble(5, c.getY());
				
				query.setInt(6, c.getGroupOrder());
				
				query.setString(7, c.getAnimation());
				
				query.setInt(8,c.getAnimOrder());
				
				query.setInt(9, c.getDuration());
				
				query.addBatch();
				
			}
			
			query.executeBatch();
			
			query.close();
			
		}catch(SQLException e)
		{
			System.out.println("Error in insertContent");
			
			e.printStackTrace();
		}
	}
	
	private void insertEquationChildren(ArrayList<EquationChildren> children,String tname,String aname,String ename)
	{
		try{
			
			query=connect.prepareStatement("Insert into equationChildren values(?,?,?,?,?,?,?,?)");
			
			query.setString(1, tname);
			
			query.setString(2,aname);
			
			query.setString(3, ename);
			
			for(int i=0;i<children.size();i++)
			{
				EquationChildren c=children.get(i);
				
				query.setString(4, c.getClassId());
				
				query.setString(5, c.getFontStyle());
				
				query.setString(6, c.getFontWeight());
				
				query.setString(7, c.getFontFamily());
				
				query.setString(8, c.getColor());
				
				query.addBatch();
			}
			
			query.executeBatch();
			
			query.close();
			
		}catch(SQLException e)
		{
			System.out.println("Error in insertEquationChildren");
			
			e.printStackTrace();
		}
	}
	
	public LastActivity getLastActivity(String uid)
	{
		
		
		
		LastActivity a=new LastActivity();
		
		try {
			query=connect.prepareStatement("select * from lastActivity where uid=?");
			
			query.setString(1, uid);
			
			query.execute();
			
			ResultSet rs=query.getResultSet();
			
			if(rs.next())
			{
				a.setTname(rs.getString("tname"));
				a.setAname(rs.getString("aname"));
				
			}
			
			else
			{
				query=connect.prepareStatement("insert into lastActivity values(?,?,?)");
				
				query.setString(1, uid);
				
				query.setString(2, "Default");
				
				query.setString(3,"Default");
				
				query.execute();
				
			}
			
			query.close();
			
		} catch (SQLException e) {
			
			System.out.println("Error in getLastActivity");
			
			e.printStackTrace();
		}
		return a;
	}
	
	public void updateLastActivity(String uid,String tname,String aname)
	{
		try{
			query=connect.prepareStatement("update lastActivity set tname=?,aname=? where uid=?");
			
			query.setString(1,tname);
			
			query.setString(2, aname);
			
			query.setString(3, uid);
			
			query.execute();
			
			query.close();
			
			
		}catch(SQLException e)
		{
			System.out.println("Error in update lastActivity");
			
			e.printStackTrace();
		}
	}
	public ArrayList<Topic> getTopic()
	{
		ArrayList<Topic> topics=new ArrayList<Topic>();
		
		try{
			
			query=connect.prepareStatement("select * from topic");
			
			query.execute();
			
			ResultSet rs1=query.getResultSet();
			
			query=connect.prepareStatement("select aname from activity where tname=?");
			
			while(rs1.next())
			{
				Topic t=new Topic(rs1.getString("tname"));
				
				query.setString(1, t.getTname());
				
				query.execute();
				
				ResultSet rs2=query.getResultSet();
				
				while(rs2.next())
				{
					t.addActivity(rs2.getString("aname"));
				}
				
				topics.add(t);
			}
			
			query.close();
		}catch(SQLException e)
		{
			System.out.println("error in getActivity");
			
			e.printStackTrace();
		}
		
		return topics;
	}
	
	public Activity getActivity(String tname,String aname)
	{
		Activity activity=null;
		
		try{
			
			query=connect.prepareStatement("select * from activity where tname=? and aname=?");
			
			query.setString(1, tname);
			
			query.setString(2, aname);
			
			query.execute();
			
			
			
			ResultSet rs=query.getResultSet();
			
			rs.next();
			
			
			activity=new Activity(tname,
					aname,
					rs.getString("atype"),
					rs.getString("adesc"),
					getText(tname,aname),
					getGraphics(tname,aname),
					getEquation(tname,aname),
					getGroup(tname,aname),
					getHints(tname,aname));
			
			query.close();
			
		}catch(SQLException e)
		{
			System.out.println("Error in getActivity");
			
			e.printStackTrace();
		}
		
		return activity;
	}
	
	private ArrayList<Hints> getHints(String tname,String aname)
	{
		ArrayList<Hints> hints=new ArrayList<Hints>();
		
		try{
			query=connect.prepareStatement("select * from hints where tname=? and aname=?");
			
			query.setString(1, tname);
			
			query.setString(2, aname);
			
			query.execute();
			
			ResultSet rs=query.getResultSet();
			
			while(rs.next())
			{
				Hints h=new Hints(rs.getString("cid"),
						rs.getString("bigHint"),
						rs.getString("smallHint"),
						rs.getString("url"));
				
				hints.add(h);
			}
			
			query.close();
		}catch(SQLException e)
		{
			System.out.println("Error in getHints");
			e.printStackTrace();
		}
		
		return hints;
	}
	
	private ArrayList<Group> getGroup(String tname,String aname)
	{
		ArrayList<Group> group=new ArrayList<Group>();
		
		try{
			query=connect.prepareStatement("select * from grouping where tname=? and aname=? "
					+ "order by groupOrder");
			
			query.setString(1, tname);
			
			query.setString(2, aname);
			
			query.execute();
			
			ResultSet rs=query.getResultSet();
			
			while(rs.next())
			{
				Group g=new Group(rs.getInt("groupOrder"),
						rs.getString("event"),
						rs.getInt("delay"),
						getComponents(tname,aname,rs.getInt("groupOrder")));
				
				group.add(g);
			}
			
			query.close();
			
		}catch(SQLException e)
		{
			System.out.println("Error in getGroup");
			
			e.printStackTrace();
		}
		
		return group;
	}
	
	private ArrayList<GroupComponent> getComponents(String tname,String aname,int groupOrder)
	{
		ArrayList<GroupComponent> component=new ArrayList<GroupComponent>();
		
		try{
			
			query=connect.prepareStatement("select * from groupingDetails where tname=? and aname=? and groupOrder=? order by cOrder");
			
			query.setString(1, tname);
			
			query.setString(2, aname);
			
			query.setInt(3, groupOrder);
			
			query.execute();
			
			ResultSet rs=query.getResultSet();
			
			while(rs.next())
			{
				GroupComponent gc=new GroupComponent(rs.getString("cid"),
						rs.getString("animation"),
						rs.getInt("cOrder"),
						rs.getInt("duration"));
				
				component.add(gc);
			}
			
			query.close();
		}catch(SQLException e)
		{
			System.out.println("Error in getComponents");
			
			e.printStackTrace();
		}
		
		return component;
	}
	
	
	private ArrayList<Text> getText(String tname,String aname)
	{
		ArrayList<Text> text=new ArrayList<Text>();
		
		try{
		//changes made here probable reason ffor error	
			query=connect.prepareStatement("select * from content natural join text where tname=? and aname=?"
					+ " order by  CAST(SUBSTRING(cid,LOCATE('T',cid)+1) AS SIGNED);");
			
			query.setString(1, tname);
			
			query.setString(2, aname);
			
			query.execute();
			
			ResultSet rs=query.getResultSet();
			
			while(rs.next())
			{
				Text t=new Text(
						rs.getString("cid"),
						rs.getDouble("x"),
						rs.getDouble("y"),
						rs.getString("data"),
						rs.getInt("groupOrder"),
						rs.getString("animation"),
						rs.getInt("animOrder"),
						rs.getInt("duration")
						);
				text.add(t);
			}
			
			query.close();
		}catch(SQLException e)
		{
			System.out.println("Error in getText");
			e.printStackTrace();
		}
		
		return text;
	}
	
	private ArrayList<Graphics> getGraphics(String tname,String aname)
	{
		ArrayList<Graphics> graphics=new ArrayList<Graphics>();
		
		try{
			//changes made here probable reason ffor error
			query=connect.prepareStatement("select * from content natural join graphics where tname=? and aname=?"
					+ " order by  CAST(SUBSTRING(cid,LOCATE('G',cid)+1) AS SIGNED);");
			
			query.setString(1, tname);
			
			query.setString(2, aname);
			
			query.execute();
			
			ResultSet rs=query.getResultSet();
			
			while(rs.next())
			{
				Graphics g=new Graphics(rs.getString("cid"),
						rs.getDouble("x"),
						rs.getDouble("y"),
						rs.getString("type"),
						rs.getDouble("width"),
						rs.getDouble("height"),
						rs.getString("fill"),
						rs.getString("stroke"),
						rs.getInt("strokeWidth"),
						rs.getString("strokeDashArray"),
						rs.getDouble("scaleX"),
						rs.getDouble("scaleY"),
						rs.getInt("opacity"),
						rs.getBoolean("visible"),
						rs.getDouble("angle"),
						rs.getDouble("riht"),
						rs.getDouble("bottom"),
						rs.getString("easing"),
						rs.getString("easeAttr"),
						rs.getInt("easeValue"),
						rs.getString("otherParameters"),
						rs.getInt("groupOrder"),
						rs.getString("animation"),
						rs.getInt("animOrder"),
						rs.getInt("duration")
						);
				graphics.add(g);
			}
			query.close();
		}catch(SQLException e)
		{
			System.out.println("Error in getGraphics");
			e.printStackTrace();
		}
		return graphics;
	}
	
	private ArrayList<Equation> getEquation(String tname,String aname)
	{
		ArrayList<Equation> equation=new ArrayList<Equation>();
		
		try{
			
			query=connect.prepareStatement("select * from content natural join equation where tname=? and aname=?"
					+ " order by  CAST(SUBSTRING(cid,LOCATE('e',cid)+1) AS SIGNED)");
			
			query.setString(1, tname);
			
			query.setString(2, aname);
			
			query.execute();
			
			ResultSet rs=query.getResultSet();
			
			
			while(rs.next())
			{
				Equation e=new Equation(
						rs.getString("cid"),
						rs.getDouble("x"),
						rs.getDouble("y"),
						rs.getString("code"),
						getEquationChildren(tname,aname,rs.getString("cid")),
						rs.getInt("groupOrder"),
						rs.getString("animation"),
						rs.getInt("animOrder"),
						rs.getInt("duration")
						
						);
				
				equation.add(e);
			}
			
			query.close();
			
		}catch(SQLException e)
		{
			System.out.println("Error in getEquation");
			e.printStackTrace();
		}
		
		return equation;
	}
	
	private ArrayList<EquationChildren> getEquationChildren(String tname,String aname,String ename)
	{
		ArrayList<EquationChildren> children=new ArrayList<EquationChildren>();
		
		try{
			
			query=connect.prepareStatement("select * from equationChildren where tname=? and aname=? and cid=?");
			
			query.setString(1, tname);
			
			query.setString(2, aname);
			
			query.setString(3, ename);
			
			query.execute();
			
			ResultSet rs=query.getResultSet();
			
			while(rs.next())
			{
				EquationChildren c=new EquationChildren(
						rs.getString("classId"),
						rs.getString("fontStyle"),
						rs.getString("fontWeight"),
						rs.getString("fontFamily"),
						rs.getString("color")
						);
				
				children.add(c);
			}
		}catch(SQLException e)
		{
			System.out.println("Error in getEquationChildren");
			e.printStackTrace();
		}
		return children;
	}
}