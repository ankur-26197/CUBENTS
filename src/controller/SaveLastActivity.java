package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import datastore.DataManager;

/**
 * Servlet implementation class SaveLastActivity
 * 
 * @author Akash Singh
 * 
 * servlet for saving the user information on the server side;
 * 
 *not used presently
 */
@WebServlet("/SaveLastActivity")
public class SaveLastActivity extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveLastActivity() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		DataManager a=new DataManager();
		
		a.updateLastActivity((String)request.getParameter("uid"), (String)request.getParameter("tname"),
				(String)request.getParameter("aname"));
		
		a.close();
		System.out.println("Successfully updates lastActivity");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
