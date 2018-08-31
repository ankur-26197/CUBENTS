package datamodel;

import java.text.ParseException;
import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONObject;
//class for json to activity and activity to json converter
public class Converter {
	
	public static JSONObject getJSON(Activity a)
	{
		JSONObject json=new JSONObject();
		
		json.put("tname", a.getTname());
		
		json.put("aname", a.getName());
		
		json.put("type", a.getType());
		
		json.put("desc", a.getDesc());
		
		JSONArray jarray=new JSONArray();
		
		JSONObject j;
		
		ArrayList<Text> text=a.getText();
		for(int i=0;i<text.size();i++)
		{
			Text t=text.get(i);
			j=new JSONObject();
			
			j.put("id", t.getId());
			
			j.put("data", t.getData());
			
			j.put("xPos", t.getX());
			
			j.put("yPos", t.getY());
			
			j.put("groupOrder", t.getGroupOrder());
			
			j.put("in_anim", t.getAnimation());
			
			j.put("animOrder", t.getAnimOrder());
			
			j.put("in_duration", t.getDuration());
			
			jarray.put(j);
		}
		
		json.put("text", jarray);
		
		jarray=new JSONArray();
		
		ArrayList<Graphics> graphics=a.getGraphics();
		
		for(int i=0;i<graphics.size();i++)
		{
			Graphics g=graphics.get(i);
			
			j=new JSONObject();
		
			j.put("id", g.getId());
			
			j.put("type",g.getType());
			
			j.put("originX", "left");
			
			j.put("originY", "top");
			
			j.put("left", g.getX());
			
			j.put("top", g.getY());
			
			j.put("width", g.getWidth());
			
			j.put("height", g.getHeight());
			
			j.put("effect", g.getAnimation());
			
			j.put("anim_order", g.getAnimOrder());
			
			j.put("duration", g.getDuration());
			
			if(g.getFill()==null)
				j.put("fill", JSONObject.NULL);
			
			else
				j.put("fill", g.getFill());
			
			j.put("stroke",g.getStroke());
			
			j.put("strokeWidth", g.getStrokeWidth());
			
			try {
				
				
				
				if(!g.getStrokeDashArray().equals("null"))
				{
					
					j.put("strokeDashArray", new JSONArray(g.getStrokeDashArray()));
				}
				
				else
					j.put("strokeDashArray", JSONObject.NULL);
			} catch (NullPointerException | ParseException e) {
				System.out.println("Error in strokeDashArray");
				e.printStackTrace();
			}
			
			j.put("strokeLineCap", "butt");	
			
			j.put("strokeMiterLimit", 10);
			
			j.put("scaleX", g.getScaleX());
			
			j.put("scaleY",g.getScaleY());
			
			j.put("angle", g.getAngle());
			
			j.put("flipX", false);
			
			j.put("flipY", false);
			
			j.put("opacity", 1);
			
			j.put("shadow", JSONObject.NULL);
			
			j.put("visible", g.isVisible());
			
			j.put("clipTo", JSONObject.NULL);
			
			j.put("backgroundColor", "transparent");
			
			j.put("fillRule","nonzero");
			
			j.put("globalCompositeOperation", "source-over");
			
			j.put("transformMatrix", JSONObject.NULL);
			
			j.put("skewX",0);
			
			j.put("skewY", 0);
			
			j.put("right", g.getRight());
			
			j.put("bottom", g.getBottom());
			
			j.put("easing", g.getEasing());
			
			j.put("ease_att",g.getEaseAttr());
			
			j.put("ease_value", g.getEaseValue());
			
			
			switch(g.getType())
			{
			
				case "mycircle":
					
					j.put("radius", g.getHeight()/2);
					
					j.put("startAngle", 0);
					
					j.put("endAngle", 2*Math.PI);
					
					break;
					
				case "myrect":
				case "myellipse":
					
					String s1=g.getOtherParameters();
					
					String rx=s1.substring(0,s1.indexOf(','));
					
					String ry=s1.substring(s1.indexOf(',')+1);
					
					j.put("rx", Double.parseDouble(rx));
					
					j.put("ry", Double.parseDouble(ry));
					
					break;
					
				case "myline":
					
					String s=g.getOtherParameters();
					
					String length=s.substring(0,s.indexOf(','));
					
					s=s.substring(s.indexOf(',')+1);
					
					String x1=s.substring(0,s.indexOf(','));
					
					s=s.substring(s.indexOf(',')+1);
					
					String x2=s.substring(0,s.indexOf(','));
					
					s=s.substring(s.indexOf(',')+1);
					
					String y1=s.substring(0,s.indexOf(','));
					
					s=s.substring(s.indexOf(',')+1);
					
					String y2=s.substring(0,s.indexOf(','));
					
					s=s.substring(s.indexOf(',')+1);
					
					j.put("length",length);
					
					j.put("x1",Double.parseDouble(x1));
					
					j.put("x2",Double.parseDouble(x2));
					
					j.put("y1", Double.parseDouble(y1));
					
					j.put("y2", Double.parseDouble(y2));
					
					j.put("drawType", s);
			}
			
			j.put("groupOrder", g.getGroupOrder());
			jarray.put(j);
			
		}
		
		JSONObject g1=new JSONObject();
		
		g1.put("objects", jarray);
		json.put("graphics", g1);
		
		jarray=new JSONArray();
		
		ArrayList<Equation> equation=a.getEquations();
		
		for(int i=0;i<equation.size();i++)
		{
			j=new JSONObject();
			
			Equation e=equation.get(i);
			
			j.put("id", e.getId());
			
			j.put("code", e.getCode());
			
			j.put("isdeleted", false);
			
			j.put("animation",e.getAnimation());
			
			j.put("animOrder", e.getAnimOrder());
			
			JSONArray child=new JSONArray();
			
			ArrayList<EquationChildren> c=e.getChildren();
			
			for(int k=0;k<c.size();k++)
			{
				EquationChildren ec=c.get(k);
				
				JSONObject ej=new JSONObject();
				
				ej.put("classId", ec.getClassId());
				
				ej.put("fontFamily", ec.getFontFamily());
				
				ej.put("fontStyle", ec.getFontStyle());
				
				ej.put("fontWeight", ec.getFontWeight());
				
				ej.put("color", ec.getColor());
				
				child.put(ej);
			}
			
			j.put("childArray", child);
			
			j.put("outputId", "eq"+e.getId().substring(1));
			
			j.put("top", e.getY());
			
			j.put("left", e.getX());
			
			j.put("groupOrder",e.getGroupOrder());
			
			jarray.put(j);
		}
		
	
		json.put("equation", jarray);
		
		ArrayList<Group> groups=a.getGroups();
		
		jarray=new JSONArray();
		
		for(int i=0;i<groups.size();i++)
		{
			Group g=groups.get(i);
			
			j=new JSONObject();
			
			j.put("groupOrder", g.getGroupOrder());
			
			j.put("event", g.getEvent());
			
			ArrayList<GroupComponent> c=g.getComponents();
			
			JSONArray kid=new JSONArray();
			
			for(int k=0;k<c.size();k++)
			{
				JSONObject jc=new JSONObject();
				
				jc.put("id", c.get(k).getId());
				
				jc.put("order", c.get(k).getOrder());
				
				jc.put("animation", c.get(k).getAnimation());
				
				jc.put("duration", c.get(k).getDuration());
				
				kid.put(jc);
			}
			
			j.put("kid", kid);
			
			j.put("delay", g.getDelay());
			
			jarray.put(j);
			
		}
		
		json.put("group", jarray);
		
		ArrayList<Hints> hints=a.getHints();
		
		jarray=new JSONArray();
		
		for(int i=0;i<hints.size();i++)
		{
			Hints h=hints.get(i);
			
			j=new JSONObject();
			
			String id;
			
			if(h.getCid().charAt(0)=='e')
			id="eq"+h.getCid().substring(1);
			
			else
				id=h.getCid();
			j.put("id", id);
			
			j.put("bigHint", h.getBigHint());
			
			j.put("smallHint", h.getSmallHint());
			
			j.put("url", h.getUrl());
			
			jarray.put(j);
		}
		
		json.put("hints", jarray);
		
		return json;
	}
	
	public static Activity getActivity(JSONObject json)
	{
		ArrayList<Text> text=new ArrayList<Text>();
		
		JSONArray jtext=json.getJSONArray("text");
		
		for(int i=0;i<jtext.length();i++)
		{
			JSONObject jt=jtext.getJSONObject(i);
			
			Text t=new Text(jt.getString("id"),jt.getDouble("xPos"),jt.getDouble("yPos"),
					jt.getString("Data"),
					jt.getInt("groupOrder"),
					jt.getString("in_anim"),
					jt.getInt("animOrder"),
					jt.getInt("in_duration"));
			//Text t=new Text(jt.getString("id"),jt.getDouble("xPos"),jt.getDouble("yPos"),jt.getString("Data"));
			text.add(t);
		}
		
		ArrayList<Equation> equation=new ArrayList<Equation>();
		
		jtext=json.getJSONArray("equation");
		
		for(int i=0;i<jtext.length();i++)
		{
			JSONObject jt=jtext.getJSONObject(i);
			JSONArray jchild=jt.getJSONArray("childArray");
			
			ArrayList<EquationChildren> children=new ArrayList<EquationChildren>();
			
			for(int j=0;j<jchild.length();j++)
			{
				JSONObject jc=jchild.getJSONObject(j);
				EquationChildren ec=new EquationChildren(jc.getString("id"),jc.getString("fontStyle"),
						jc.getString("fontWeight"),jc.getString("fontFamily"),jc.getString("color"));
				
				children.add(ec);
			}
			
			Equation e=new Equation(jt.getString("id"),jt.getDouble("left"),jt.getDouble("top"),
					jt.getString("code"),children,
					jt.getInt("groupOrder"),
					jt.getString("animation"),
					jt.getInt("animOrder"),
					1000);
			//Equation e=new Equation(jt.getString("id"),jt.getDouble("left"),jt.getDouble("top"),jt.getString("code"),children);
			
			equation.add(e);
		}
		
		jtext=json.getJSONObject("graphics").getJSONArray("objects");
		
		ArrayList<Graphics> graphics=new ArrayList<Graphics>();
		
		for(int i=0;i<jtext.length();i++)
		{
			JSONObject jt=jtext.getJSONObject(i);
			
			
			
			
			String type=jt.getString("type");
			
			String otherParameters="";
			
			if(type.equals("myline"))
				otherParameters+=jt.getDouble("length")+","+jt.getDouble("x1")+","+jt.getDouble("x2")+","+jt.getDouble("y1")+","+jt.getDouble("y2")+","
				+jt.getString("drawType");
			
			else if(type.equals("myellipse")||type.equals("myrect"))
				otherParameters+=jt.getDouble("rx")+","+jt.getDouble("ry");
			
			String fill=jt.getString("fill");
			if(fill==null)
				fill="";
			
			String strokeDashArray=jt.getString("strokeDashArray");
			
			if(strokeDashArray.equals("null"))
				strokeDashArray="[]";
			else 
				strokeDashArray=jt.getJSONArray("strokeDashArray").toString();
			
			Graphics g=new Graphics(jt.getString("id"),
					jt.getDouble("left"),
					jt.getDouble("top"),
					jt.getString("type"),
					jt.getDouble("width"),
					jt.getDouble("height"),
					fill,
					jt.getString("stroke"),
					jt.getInt("strokeWidth"),
					strokeDashArray,
					jt.getDouble("scaleX"),
					jt.getDouble("scaleY"),
					jt.getInt("opacity"),
					jt.getBoolean("visible"),
					jt.getDouble("angle"),
					jt.getDouble("right"),
					jt.getDouble("bottom"),
					jt.getString("easing"),
					jt.getString("ease_att"),
					jt.getInt("ease_value"),
					otherParameters,
					jt.getInt("groupOrder"),
					jt.getString("effect"),
					jt.getInt("anim_order"),
					jt.getInt("duration"));
			
			
			graphics.add(g);
				
		}
		
		jtext=json.getJSONArray("group");
		
		ArrayList<Group> groups=new ArrayList<Group>();
		
		for(int i=0;i<jtext.length();i++)
		{
			JSONObject jt=jtext.getJSONObject(i);
			
			JSONArray comp=jt.getJSONArray("kid");
			
			ArrayList<GroupComponent> components=new ArrayList<GroupComponent>();
			
			for(int j=0;j<comp.length();j++)
			{
				JSONObject t=comp.getJSONObject(j);
				
				GroupComponent gc=new GroupComponent(t.getString("id"),t.getString("animation"),t.getInt("order"),t.getInt("duration"));
				
				components.add(gc);
			}
			
			Group g=new Group(jt.getInt("groupOrder"),
					jt.getString("event"),jt.getInt("delay"),
					components);
			
			groups.add(g);
			
		}
		
		jtext=json.getJSONArray("hints");
		
		ArrayList<Hints> hints=new ArrayList<Hints>();
		
		for(int i=0;i<jtext.length();i++)
		{
			JSONObject jt=jtext.getJSONObject(i);
			
			Hints h=new Hints(jt.getString("id")
					,jt.getString("bigHint")
					,jt.getString("smallHint")
					,jt.getString("url"));
			
			hints.add(h);
		}
		
		return new Activity(json.getString("tname"),json.getString("aname"),json.getString("type"),json.getString("desc"),
				text,graphics,equation,groups,hints);
		
	}
}
