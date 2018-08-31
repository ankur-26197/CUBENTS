package controller;

import java.io.IOException;

import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import java.util.regex.*;

import datamodel.Activity;
import datamodel.Converter;
import datamodel.Topic;
import datastore.DataManager;

/*
 * @author Akash Singh
 * Servlet to save an activity
 */

@WebServlet("/StoreActivity")
public class StoreActivity extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public StoreActivity() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String s=request.getParameter("activity");
		
		Pattern p=Pattern.compile("%u");
		
		Matcher m=p.matcher(s);
		
		s=m.replaceAll("&#x");
		
		System.out.println("Before"+s);
		
		JSONObject json=null;
		
		System.out.println(s);
		
		try {
			json=new JSONObject(s);
			
			System.out.println(json.toString());
			
			System.out.println("Came hhere");
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Topic t=new Topic((String)json.get("tname"));
		
		Activity a=Converter.getActivity(json);
		
		DataManager d=new DataManager();
		
		d.insertTopic(t);
		
		d.deleteActivity(a.getTname(),a.getName());
		
		d.insertActivity(a);
		
		d.close();
		
		System.out.println("Data Inserted successfully");
		
	}

}
