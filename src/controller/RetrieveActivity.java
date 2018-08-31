package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import datamodel.Activity;
import datamodel.Converter;
import datastore.DataManager;

/**
 * @author Akash Singh
 * 
 * Servlet to retrieve a given activity
 */
@WebServlet("/RetrieveActivity")
public class RetrieveActivity extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RetrieveActivity() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		DataManager d=new DataManager();
		
		//requesting activity from database
		
		Activity activity=d.getActivity(request.getParameter("tname"), request.getParameter("aname"));
		
		d.close();
		
		//converting the data received from in memory data structure to json file.
		
		JSONObject json=Converter.getJSON(activity);
		
		response.setContentType("application/json");
		
		System.out.println(json);
		
		//sending the data as a json response
		
		response.getWriter().println(json.toString());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
