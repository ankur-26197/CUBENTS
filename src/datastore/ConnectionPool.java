package datastore;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.naming.InitialContext;

import javax.sql.DataSource;



public class ConnectionPool {
 
	public static ConnectionPool connect=null;
	public static DataSource dataSource=null;
	
	private ConnectionPool()
	{
		try{
		//InitialContext ctx = new InitialContext();
		//dataSource = (DataSource)ctx.lookup("java:comp/env/jdbc/database");
		//System.out.println("Successful");
		}
		catch(Exception e){e.printStackTrace();
		System.out.println("Enetered askdjask");
		}
	}
	
	public static ConnectionPool getInstance()
	{
		if(connect==null)
		{
			connect=new ConnectionPool();
		}
		return connect;
	}
	
	public Connection getConnection()
	{
		try{
			Class.forName("com.mysql.jdbc.Driver");
		return DriverManager.getConnection("jdbc:mysql://localhost:3306/Mathematics","akash","akash123");
		}catch(SQLException e){e.printStackTrace(); return null;}
		catch(ClassNotFoundException c){
			c.printStackTrace();
			return null;
		}
		
	}
}
